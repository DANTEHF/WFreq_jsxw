/*
  write by dante 
*/

var express =require('express');
var app =express();
var multer =require('multer');
var helmet =require('helmet');
var fs=require('fs');
var formidable =require('formidable');
var childprocess=require('child_process');
var mysql=require('mysql');
var bodyParser = require('body-parser');




app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.use(helmet());
app.use(express.static(__dirname+'/public'));

var filePath="C:/Users/hf876/Desktop/Demo/";

app.get('/',function(req,res){
    res.sendFile(filePath+"client/index.html");
    
});

var outputfilepath;
app.post('/upload',function(req,res){
  var form =new formidable.IncomingForm();
  form.parse(req, function(err, fields, files) {
    if(files.upfile){

      console.log(files.upfile.name +" uploading");
      fs.readFile(files.upfile.path, function(err, data){
        var newPath =  'upload/'+ files.upfile.name;
        fs.writeFile(newPath, data, function(err){
        if(err)console.log(err);
        else{
         // var cmd ='java -cp ".;*" StanfordCoreNlpDemo ../upload/'+files.upfile.name+' ../nlptxt/'+files.upfile.name+' '+files.upfile.name+'.xml';
            var cmd2 ='python freeq.py -i upload/'+files.upfile.name+' -o nlptxt/'+files.upfile.name;
             outputfilepath= "C:/Users/hf876/Desktop/Demo/server/nlptxt/"+ files.upfile.name;
          childprocess.exec(cmd2,{cwd:'C:\\Users\\hf876\\Desktop\\Demo\\server\\'}, (error, stdout, stderr) => {
             if (error) {
                 console.error(`exec error: ${error}`);
                 return;
             }else{
                 var result ="C:/Users/hf876/Desktop/Demo/client/result.html";
                
                  res.set('Content-Type', 'text/html');
                  res.sendFile(result);
          
             }

          });
        
          console.log("success");
        };

      });
      });
    }
});

});


app.get('/ciyun',function(req,res){

 var jdata=fs.readFileSync(outputfilepath,"utf-8");
 console.log ( typeof(jdata) );
 console.log(jdata);
 
  res.send(jdata);

});

app.get('/reqtotal',function(req,res){
  res.sendFile(filePath+"client/exp.html");
})

app.post('/monthlytop10',function(req,res){
  var year =req.body.year;
  var month="month"+req.body.month;
  
  console.log(year+month);
  var sql="select * from "+month+" where year="+year+" order by freq desc limit 10";
  connection.query(sql,function(err,result){
      if(err){

          console.log('[SELECT ERROR] - ',err.message);

          return;

        }       

       console.log('---------------SELECT----------------');

       console.log(result); 
      // var jsdata=JSON.stringify(result);
       res.send(result);
       
  })

})

app.get('/docfreq',function(req,res){
  var sqldoc="select * from docfreq";
  connection.query(sqldoc,function(err,result){
          if(err){

          console.log('[SELECT ERROR] - ',err.message);

          return;

        }       

       console.log('---------------SELECT----------------');

       console.log(result); 
      // var jsdata=JSON.stringify(result);
       res.send(result);
       

  });
});

app.listen(8082);


console.log("Server running at http://127.0.0.1:8082/");


var connection=mysql.createConnection({
      host:'localhost',
      user:'root',
      password: '',
      port:'3306',
      database:'jsxwx',
});
connection.connect(function(err){
  if(err){
    console.log("err :" +err);
    return;
  }
  
console.log('connect success!');
})
//获取top10
var sql1 ='select * from dict  order by total desc limit 10';
var sql2 ='select * from dict  order by total desc limit 20';

