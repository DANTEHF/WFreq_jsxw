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


var filePath="C:/Users/hf876/Desktop/Demo/";

app.use(helmet());
app.use(express.static(__dirname+'/public'));

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

app.listen(8082);


console.log("Server running at http://127.0.0.1:8082/");

/*function connect(){

var connection=mysql.createConnection({
      host:'localhost',
      uses :'root',
      password: '',
      port:'3306',
});
connection.connect(function(err){
  if(err){
    console.log("err :" +err);
    return;
  }
  
console.log('connect success!');
})
}
connect();*/