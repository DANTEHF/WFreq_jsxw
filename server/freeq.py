#!/usr/bin/env python3

import re
import string
import sys
import os
import argparse
import json
from collections import Counter
import mysql.connector
import datetime

__all__ = ['WordFinder', 'Book']

lemmas = {}
with open('lemmas.txt') as fin:
    for line in fin:
        line = line.strip()
        headword = line.split('\t')[0]
        try:
            related = line.split('\t')[1]
        except IndexError:
            related = None
        lemmas[headword] = related


valid_words = set()
for headword, related in lemmas.items():
    valid_words.add(headword)
    if related:
        valid_words.update(set(related.split()))


class WordFinder(object):
    '''A compound structure of dictionary and set to store word mapping'''
    def __init__(self):
        """Initialize lame containers for 'quick' search

        Structure of main_table
        {
            'a':{
                     # All related words and the headword start with same letter
                     'abandon': {'abandons', 'abandoned', 'abandoning'},

                     'apply': {'applies', 'applied', 'applying'},

                     # headword with no related word
                     'abeam': None,
                     ...
                },
            'b': {...},
            'c': {...},
            ...
        }

        Structure of special_table
        {

            # 1+ related words does not share the same starting letter
            # with heasdword
            'although': {'altho', 'tho', 'though'},
            'bad': {'badder', 'baddest', 'badly', 'badness', 'worse', 'worst'},
            ...
        }

        """
        self.main_table = {}
        for char in string.ascii_lowercase:
            self.main_table[char] = {}
        self.special_table = {}

        for headword, related in lemmas.items():
            # Only 3 occurrences of uppercase in lemmas.txt, which include 'I'
            # Trading precision for simplicity
            headword = headword.lower()
            try:
                related = related.lower()
            except AttributeError:
                related = None
            if related:
                for word in related.split():
                    if word[0] != headword[0]:
                        self.special_table[headword] = set(related.split())
                        break
                else:
                    self.main_table[headword[0]][headword] = set(related.split())
            else:
                self.main_table[headword[0]][headword] = None

    def find_headword(self, word):
        """Search the 'table' and return the original form of a word"""
        word = word.lower()
        alpha_table = self.main_table[word[0]]
        if word in alpha_table:
            return word

        for headword, related in alpha_table.items():
            if related and (word in related):
                return headword

        for headword, related in self.special_table.items():
            if word == headword:
                return word
            if word in related:
                return headword
        # This should never happen after the removal of words not in valid_words
        # in Book.__init__()
        return None

    # TODO
    def find_related(self, headword):
        pass


def is_dirt(word):
    return word not in valid_words


def list_dedup(list_object):
    """Return the deduplicated copy of given list"""
    temp_list = []
    for item in list_object:
        if item not in temp_list:
            temp_list.append(item)
    return temp_list


class Book(object):
    def __init__(self, filepath):
        with open(filepath) as bookfile:
            content = bookfile.read().lower()
            self.temp_list = re.split(r'\b([a-zA-Z-]+)\b', content)
            self.temp_list = [item for item in self.temp_list if not is_dirt(item)]
            finder = WordFinder()
            self.temp_list = [finder.find_headword(item) for item in self.temp_list]

    def freq(self):
        """Count word frequencies and return a collections.Counter object"""
        cnt = Counter()
        for word in self.temp_list:
            cnt[word] += 1
        return cnt

    # TODO
    def stat(self):
        pass


if __name__ == '__main__':
    if sys.platform == 'nt':
        sys.stderr.write("I haven't tested the code on Windows. Feedback is welcome.\n")

    LINE_SEP = os.linesep

    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', dest='input_file')
    parser.add_argument('-o', '--output', dest='output_file')
    args = parser.parse_args()

    book = Book(args.input_file)
    result = book.freq()
    # Maximum width of the ocurrence column
    max_width = max(len(str(v)) for v in result.values())

    report = []
    index = 0
    for word in sorted(result, key=lambda x: result[x], reverse=True):
        data={"value":result[word],"name":word}
        report.append(data)
        index=index+1
        if index > 30:
            break
    in_json=json.dumps(report)
    print(in_json)

      
 
    if args.output_file:
        with open(args.output_file, 'w') as output:
            
            output.write(in_json)
            print "xieruchenggong"

        rdate=(args.output_file).split('_')[1]
        ryear=rdate[0:4]
        rmonth=str(rdate[4:6])
        print ryear
        print rmonth
        if rmonth=='01':
            dmonth="month1"
        elif rmonth=='02':
            dmonth="month2"
        elif rmonth=='03':
            dmonth="month3"
        elif rmonth=='04':
            dmonth="month4"
        elif rmonth=='05':
            dmonth="month5"
        elif rmonth=='06':
            dmonth="month6"
        elif rmonth=='07':
            dmonth="month7"
        elif rmonth=='08':
            dmonth="month8"
        elif rmonth=='09':
            dmonth="month9"
        elif rmonth=='10':
            dmonth="month10"
        elif rmonth=='11':
            dmonth="month11"
        elif rmonth=='12':
            dmonth="month12"                                

        print "connect mysql"
        cnx=mysql.connector.connect(user='root',password='',host='localhost',database='jsxwx')
        cnr=cnx.cursor(buffered=True)
        print "test1" 

        with open(args.output_file,'r') as fo :
            print "test2"
            data=json.load(fo)
            lenth =len(data)
            thisdict={}
            for i in range(0,20):
                word = data[i]['name']
                value =data[i]['value']
                thisdict[word]=value
                cnr.execute("SELECT * FROM %s WHERE word='%s' and year='%s' " %(dmonth,word,ryear))
                res=cnr.fetchall()
                if len(res)==1 :
                    sql="UPDATE %s SET freq = freq + %d WHERE word='%s'and year='%s' " %(dmonth,value,word,ryear)
                    print sql
                    cnr.execute(sql)
                    cnx.commit()
                    print "update"
                elif len(res)==0:
                    sql="INSERT INTO %s(word,freq,year) VALUES('%s','%d','%s')" %(dmonth,word,value,ryear)
                    print sql
                    cnr.execute(sql)
                    cnx.commit()
                    print "insert"
        
        sql1="SELECT * FROM docfreq WHERE year='%s' " %(ryear)
        cnr.execute(sql1)
        res=cnr.fetchall()
        if len(res)==1:
            sql2="UPDATE docfreq SET %s = %s + 1 WHERE year='%s'" %(dmonth,dmonth,ryear)
            cnr.execute(sql2)
            cnx.commit()
            print "-----update doc freq-----"
        elif len(res)==0:
            sql3="INSERT INTO docfreq(year,%s) VALUES('%s',1)" %(dmonth,ryear)
            cnr.execute(sql3)
            cnx.commit()
            print "-----insert new year-----"
        cnx.close()        
          
    else:
        print(LINE_SEP.join(report))











