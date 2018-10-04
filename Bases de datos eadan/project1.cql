CREATE KEYSPACE project1 WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};
USE project1;

// Q1:
CREATE TABLE Batches (batch_id BIGINT, regiones LIST<TEXT>, tags LIST<TEXT>, nombre TEXT, thumbnail TEXT, angular_id INT, x INT, y INT, angulo FLOAT, PRIMARY KEY (batch_id,nombre,angular_id)) WITH CLUSTERING ORDER BY (nombre ASC);

/* SELECT nombre, thumbnail, x, y, angulo FROM Batches WHERE region=? and batch_id=?; */

