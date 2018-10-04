var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000,
    //mongoose = require('mongoose'),
    bodyParser = require('body-parser');
    //Patron=require("./models/patronModel");

//mongoose.Promise = global.Promise;
//mongoose.connect('mongodb://localhost:32768/admin');


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


var routes = require('./routes/routes'); //importing route
routes(app);

app.listen(port);

console.log('Node2Mongo2 RESTful API server started on: ' + port);