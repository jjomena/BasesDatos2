CREATE KEYSPACE proyecto WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};
USE proyecto;

// Q1:
CREATE TABLE productoXcamion (
    placa TEXT,
    cliente TEXT,
    lugar_destino TEXT,
    tipo_mov TEXT,
    producto_nombre TEXT,
    tienda TEXT,
    detalles TEXT,
    cantidad INT,
    vueltas_restantes INT,
    ubicacion TEXT,
    tiempo TIMESTAMP,
    done BOOLEAN,
    PRIMARY KEY ((producto_nombre, cliente, tipo_mov)));



/* SELECT producto_nombre, detalles, cantidad, vueltasrestantes, ubicacion FROM productoXcamion WHERE placa=?; */

/* Q2:
CREATE TABLE Movimiento (
    producto_nombre TEXT,
    fecha TIMESTAMP,
    fuente TEXT,
    objetivo TEXT,
    detalle TEXT,
    PRIMARY KEY (producto_nombre, fecha));*/

/* SELECT fecha, fuente, objetivo FROM log WHERE producto_nombre=?; */

