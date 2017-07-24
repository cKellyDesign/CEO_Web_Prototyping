var http = require('http');
var path = require('path');
var express = require('express');

var admin = require("firebase-admin");
var firebase = require("firebase")

var app = express();
var options = { root: __dirname + "/"} ;
app.set('port', 8080);
app.set('case sensitive routing', false);

var DEBUG = true;

// Routes Setup
app.get('/', function(req, res) {
    res.sendFile('public/index.html', options, function (err) {
    	if (err) {
    		if (DEBUG) console.log(err);
    		res.send(err.status);
    	}
    });
});

// Static Routes
app.use('/scripts', express.static(path.join(__dirname, '/public/scripts')));

// todo - make this secure
var serviceAccount = require("./keys.json");

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
	databaseURL: 'https://fir-test-bbcbe.firebaseio.com/'
});

var FirebaseApp = admin.app();
var FirebaseDB  = admin.database(FirebaseApp);

var ref = FirebaseDB.ref();
ref.once("value").then(function (snapshot) {
	if (DEBUG) console.log(snapshot.val());	

	// var newVal = (Math.floor(Math.random() * 100));
	// ref.set({ sliderValue : newVal });
	// if (DEBUG) console.log('new Value ', newVal);
});



// Listen to Port
var server = app.listen(process.env.PORT || app.get('port'), function(){
    console.log("Server started on port " + server.address().port);
});