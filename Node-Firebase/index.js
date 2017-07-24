var http = require('http');
var path = require('path');
var express = require('express');

var admin = require("firebase-admin");
var firebase = require("firebase")

var app = express();
var options = { root: __dirname + "/"} ;
app.set('port', 8080);
app.set('case sensitive routing', false);



app.get('/', function(req, res) {

    res.send('<h1>Hello World</h1>');
});

// todo - make this secure
var serviceAccount = require("./keys.json");

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
	databaseURL: 'https://fir-test-bbcbe.firebaseio.com/'
});

var FirebaseApp = admin.app();
var FirebaseDB  = admin.database(FirebaseApp);


// Listen to Port
var server = app.listen(process.env.PORT || app.get('port'), function(){
    console.log("Server started on port " + server.address().port);
});