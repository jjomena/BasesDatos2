var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000,
    mongoose = require('mongoose'),
    bodyParser = require('body-parser'),
    Vehiculo = require("./models/vehiculoModel"),
    cassandra = require('cassandra-driver'),
    Connection = require('mssql').Connection;

mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost:27017/proyecto');

var config = {
    userName: 'notAdmin',
    password: 'greencarrot18*',
    server: 'gc01.database.windows.net',
    // If you are on Azure SQL Database, you need these next options.
    options: {encrypt: true, database: 'Proyecto'}
};

var connection = new Connection(config);
connection.on('connect', function(err) {
    // If no error, then good to proceed.
    console.log("Connected to SQL");
});


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());


var routes = require('./routes/routes'); //importing route
routes(app);

app.listen(port);

console.log('GreenCarrot RESTful API server started on: ' + port);

// Cassandra Reads

var cassClient = new cassandra.Client({contactPoints: ['localhost'], keyspace: 'test'});


// Esto es así xq no hay una implementacion de algun socket o listener, cassandra si los tiene, pero varian con las versiones y no hay para js (node)
function procesarCassandra() {
    cassClient.eachRow('SELECT * FROM productoxCamion where done = false allow filtering;', [], function (n, row) {
        if (row.tipo_mov === "Pedido") {
            console.log('Procesando pedido del cliente', row.cliente);

            Vehiculo.findOneAndUpdate({placa: row.placa, 'ruta.lugar': row.lugar_destino}, {
                $push : {'ruta.$.pedidos': {
                        "articulo": row.producto_nombre,
                        "cliente": row.cliente
                    }}
            }, {upsert: true},function (err, doc) {
                if(err) {
                    console.log(err);
                } else {
                    console.log("Documento updeteado")
                }
            });

            Vehiculo.findOneAndUpdate({placa: row.placa, 'ruta.lugar': row.tienda}, {
                $push : {'ruta.$.pedidos': {
                        "articulo": row.producto_nombre,
                        "cliente": row.cliente
                    }}
            }, {upsert: true},function (err, doc) {
                if(err) {
                    console.log(err);
                } else {
                    console.log("Documento updeteado")
                }
            });

            cassClient.execute("update productoxCamion set done = true where producto_nombre = '"+ row.producto_nombre +
                "' AND cliente = '"+row.cliente+"' and tipo_mov = '" + row.tipo_mov+ "'", function (err, result) {
                if (err)
                    console.log(err);
            });

        } else if (row.tipo_mov === "Checkout") {
            console.log('Procesando checkout del cliente', row.cliente);

            //LLAMADA(S) AL MERCHANT
            //LLAMADA A SQL





            cassClient.execute('update productoxCamion set done=true where producto_nombre = "'+ row.producto_nombre +
                '"and cliente = "'+row.cliente+'" and tipo_mov = "' + row.tipo_mov+ '"', function (err, result) {
                if (err)
                    console.log(err);
            });
        }


    }, function (err) {
        if (err)
            console.log(err);
    });
}

async function llamarProceso() {
    setInterval(() => {
        procesarCassandra();
    }, 3000);

}

llamarProceso();