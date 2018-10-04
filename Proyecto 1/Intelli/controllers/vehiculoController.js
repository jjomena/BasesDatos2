'use strict';
var mongoose = require('mongoose'),
    Vehiculo = mongoose.model('Vehiculo');

exports.agregarArticuloEnParada = function(req, res){
    var body = req.body;
    // Validate Request
    if(!body.content) {
        return res.status(400).send({
            message: "Note content can not be empty"
        });
    }

    Vehiculo.findOneAndUpdate({placa: body.placa, 'lugar': body.lugar}, {
        $push : {'lugar.$.pedidos': {
                "articulo": body.articulo,
                "cliente": body.cliente
            }}
    }, {upsert: true},function (err, doc) {
        if(err) {
            console.log(err);
        } else {
            console.log("Documento updeteado")
        }
    });
};

exports.listar7patrones = function(req, res) {
    Vehiculo.find({},"-familias -tags -_id", {limit: 7}, function(err, task) {
        if (err)
            res.send(err);
        res.json(task);
    });
};
