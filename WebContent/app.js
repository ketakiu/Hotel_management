var express=require("express");
var bodyParser=require("body-parser");

const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/hotel');
var db=mongoose.connection;
db.on('error', console.log.bind(console, "connection error"));
db.once('open', function(callback){
    console.log("connection succeeded");
})

var app = express()


app.use(bodyParser.json());
// app.use(express.static('public'));
app.use(express.static(__dirname));
app.use(bodyParser.urlencoded({
    extended: true
}));

app.post('/sign_up', function(req,res){
    var firstname = req.body.firstname;
    var lastname = req.body.lastname;
    var email =req.body.email;
    var username= req.body.username;
    var pass = req.body.password;
    var phone =req.body.phone;
    var dob = req.body.dob;


    var data = {
        "firstname": firstname,
        "lastname": lastname,
        "email":email,
        "username": username,
        "password":pass,
        "phone":phone,
        "dob":dob

    }
    db.collection('customer').insertOne(data,function(err, collection){
        if (err) throw err;
        console.log("Record inserted Successfully");

    });

    return res.redirect('http://localhost:63342/Sign-in-Page-master/signup_success.html');
})


app.get('/',function(req,res){
    res.set({
        'Access-control-Allow-Origin': '*'
    });
    return res.redirect('index.html');
}).listen(3000)


console.log("server listening at port 3000");