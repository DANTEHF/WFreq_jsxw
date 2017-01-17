import json
import os
import mysql.connector
import datetime

cnx=mysql.connector.connect(user='root',password='',host='localhost',database='jsxwx')
cnr=cnx.cursor(buffered=True)

os.chdir(r'C:/Users/hf876/Desktop/Demo/server/nlptxt/')
        d =datetime.datetime.now()
        riqi=""
        print d.weekday()
        if d.weekday()==1 :
                riqi="yi"   
        elif d.weekday()==2:
                riqi="er"
        elif d.weekday()==3:
                riqi="san"
        elif d.weekday()==4:
                riqi="si"
        elif d.weekday()==5:
                riqi="wu"
        elif d.weekday()==6:
                riqi="liu"
        elif d.weekday()==0:
                riqi="ri"    
        print riqi            
        with open(args.output_file,'r') as fo :
            print "test2"
            data=json.load(fo)
            lenth =len(data)
            thisdict={}
            for i in range(0,20):
                word = data[i]['name']
                value =data[i]['value']
                thisdict[word]=value
                cnr.execute("SELECT * FROM dict WHERE name='%s' " %(word))
                res=cnr.fetchall()
                if len(res)==1 :
                    sql="UPDATE dict SET %s = %s +'%d' WHERE name='%s' " %(riqi,riqi,value,word)
                    print sql
                    cnr.execute(sql)
                    cnx.commit()
                    print "update"
                elif len(res)==0:
                    sql="INSERT INTO dict(name,%s) VALUES('%s','%d')" %(riqi,word,value)
                    print sql
                    cnr.execute(sql)
                    cnx.commit()
                    print "insert"
            print thisdict,"--------------"
            sql="UPDATE dict SET total = yi + er + san + si + wu + liu + ri"
            cnr.execute(sql)
            cnx.commit()
            cnx.close()    
