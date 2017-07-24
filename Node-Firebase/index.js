var http = require('http');
var path = require('path');
var express = require('express');

var app = express();
var options = { root: __dirname + "/"} ;
app.set('port', 8080);
app.set('case sensitive routing', false);



app.get('/', function(req, res) {

    res.send('<h1>Hello World</h1>');
});





// Listen to Port
var server = app.listen(process.env.PORT || app.get('port'), function(){
    console.log("Server started on port " + server.address().port);
});