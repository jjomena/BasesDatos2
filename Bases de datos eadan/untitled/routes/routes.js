'use strict';

var MongoClient = require('mongodb').MongoClient,
    cassandra = require('cassandra-driver'),
    url = "mongodb://localhost:27017/";
var cassClient = new cassandra.Client({contactPoints: ['localhost'], keyspace: 'proyecto1'});

module.exports = function (app) {
    //var patron = require('../controllers/patronController');

    /* todoList Routes
    app.route('/tasks')
        .get(todoList.list_all_tasks)
        .post(todoList.create_a_task);


    app.route('/tasks/:taskId')
        .get(todoList.read_a_task)
        .put(todoList.update_a_task)
        .delete(todoList.delete_a_task);*/

    app.route('/mongo1').get(
        function (req, res) {
            MongoClient.connect(url, function (err, db) {
                if (err) throw err;
                var dbo = db.db("tc2");
                var query = {
                    location: {
                        $near: {
                            $geometry: {
                                type: "Point",
                                coordinates: [-73.856077, 40.848447] //Esta coordenada se deberia sacar del dispositivo, o del ip del request
                            },
                            $maxDistance: 50000
                        }
                    }
                };

                dbo.collection("batches").find(query, {projection: {patterns: 1}}).sort({popularity: 1}).limit(1).toArray(function (err, result) {
                    if (err) res.send(err);
                    res.json(result);
                    db.close();
                });
            });
        });

    app.route('/mongo2').get(function (req, res) {
            MongoClient.connect(url, function (err, db) {
                if (err) throw err;
                var dbo = db.db("tc2");
                var query = {
                    "trending.isTrending": false //Para filtrar si es trending
                    , "trending.regions": "China" //region se debe obtener con el ip o algo asi
                };

                dbo.collection("patterns").find(query, {
                    projection: {
                        "angulars.familias": 0,
                        "regions": 0,
                        "tags": 0
                    }
                }).limit(7).toArray(function (err, result) {
                    if (err) res.send(err);
                    res.json(result);
                    db.close();
                });
            });
        }
    );

    app.route('/cass1').get(function (req, res) {
            var cquery = "select json * from services where batch_id = " + 0;

            cassClient.execute(cquery, function (err, result) {

                    if (typeof result === 'undefined')
                        res.send('No service found.');
                    eelse
                    {
                        var respuesta = '[';

                        for (var i = 0; i < result.rows.length; i++) {

                            var service = result.rows[i];


                            respuesta = respuesta + service;
                        }
                        respuesta = respuesta + "]";

                        res.send(respuesta);
                    }
                }
            );
        }
    );
};

