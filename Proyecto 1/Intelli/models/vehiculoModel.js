'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var vehiculoSchema = new Schema({
    "_id": Number,
    "placa": String,
    "chofer":{
        "nombre": String,
        "foto": String
    },
    "ubicacionActual": {
        "coordinates": [Number],
        "type": {type: String, default: "Point"}
    },
    "proveedores":[{
        "nombre": String,
        "location":{
            "coordinates": [Number],
            "type": {type: String, default: "Point"}
        },
        "horario":{
            "apertura": Date,
            "clausura": Date
        },
        "articulos":[{
            "nombre": String,
            "descripcion": String,
            "tamanno": String,
            "tipo": String,
            "cantidad": Number,
            "precio":{
                "valor": Number,
                "moneda": String
            },
            "enabled": Boolean,
            "fotos":[String]
        }]
    }],

    "ruta":[{
        "location":{
            "coordinates":[Number],
            "type": {type: String, default: "Point"}
        },
        "lugar": String,
        "pedidos": [{
            "articulo": String,
            "cliente": String
        }],
        "historial":[{
        "llegada": Date,
        "salida": Date,
        "detalle": String,
        "comentario": String
    }],
        "radio": Number
    }]
}, {collection: 'vehiculos'});

module.exports = mongoose.model('Vehiculo', vehiculoSchema);