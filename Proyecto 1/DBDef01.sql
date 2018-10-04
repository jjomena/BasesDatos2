CREATE TABLE Ciudad ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdEstado" INT NOT NULL , 
  "Nombre" NVARCHAR(40) NOT NULL , 
  "NombreAlterno" NVARCHAR(40) NULL , CONSTRAINT "Ciudad_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Cliente ( 
  "IdUsuario" INT NOT NULL , 
  "Correo" VARCHAR(30) NOT NULL , 
  "Telefono" NUMERIC(11) NULL , 
  "Direccion" INT NULL , CONSTRAINT "Cliente_PK" PRIMARY KEY ( "IdUsuario" ) );

CREATE TABLE Estado ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdPais" INT NOT NULL , 
  "Nombre" NVARCHAR(40) NOT NULL , 
  "NombreAlterno" NVARCHAR(40) NULL , CONSTRAINT "Estado_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Factura ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdCliente" INT NULL , 
  "Fecha" DATETIME2 NOT NULL DEFAULT GETDATE() , 
  "IdPago" INT NOT NULL , 
  "Checksum" INT NOT NULL DEFAULT CHECKSUM(*) , 
  "Computer" VARCHAR(20) NOT NULL , 
  "DateAdded" DATETIME2 NOT NULL DEFAULT GetDate() , CONSTRAINT "Factura_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE FacturaLinea ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdFactrura" INT NOT NULL , 
  "Detalle" VARCHAR(MAX) NOT NULL , 
  "NombreTienda" VARCHAR(40) NULL , 
  "NombreArticulo" VARCHAR(40) NOT NULL , 
  "Precio" INT NOT NULL , 
  "Cantidad" SMALLINT NOT NULL DEFAULT 1 , 
  "Checksum" INT NOT NULL DEFAULT CHECKSUM(*) , 
  "Computer" VARCHAR(20) NOT NULL , 
  "DateAdded" DATETIME2 NOT NULL DEFAULT GetDate() , CONSTRAINT "FacturaLinea_PK" PRIMARY KEY ( "Id", "IdFactrura" ) );

CREATE TABLE Location ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdCiudad" INT NOT NULL , 
  "Direccion1" NVARCHAR(MAX) NOT NULL , 
  "Direccion2" NVARCHAR(MAX) NULL , 
  "Geography" GEOGRAPHY NOT NULL , 
  "ZipCode" VARCHAR(10) NULL , CONSTRAINT "Location_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Log ( 
  "Id" BIGINT IDENTITY NOT NULL , 
  "IdType" INT NOT NULL , 
  "IdSource" INT NOT NULL , 
  "IdLevel" INT NOT NULL , 
  "Descripcion" VARCHAR(MAX) NOT NULL , 
  "Computer" VARCHAR(128) NOT NULL DEFAULT HOST_NAME() , 
  "User" VARCHAR(30) NOT NULL , 
  "IP" VARCHAR(40) NOT NULL , 
  "Checksum" VARCHAR(MAX) NOT NULL , 
  "Details" NVARCHAR(MAX) NOT NULL , 
  "ReferenceId1" NUMERIC(11) NULL , 
  "ReferenceId2" NUMERIC(11) NULL , CONSTRAINT "Log_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE LogLevel ( 
  "Id" INT IDENTITY NOT NULL , 
  "Name" VARCHAR(20) NOT NULL , CONSTRAINT "LogLevel_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE LogSource ( 
  "Id" INT IDENTITY NOT NULL , 
  "Name" VARCHAR(40) NOT NULL , CONSTRAINT "LogSource_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE LogType ( 
  "Id" INT IDENTITY NOT NULL , 
  "Name" VARCHAR(10) NOT NULL , CONSTRAINT "LogType_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Login ( 
  "IdUsuario" INT IDENTITY NOT NULL , 
  "Username" VARCHAR(30) NOT NULL , 
  "Password" VARCHAR(MAX) NOT NULL , CONSTRAINT "Login_PK" PRIMARY KEY ( "IdUsuario" )
, CONSTRAINT "Login_UK1" UNIQUE ( "Username" ) );

CREATE TABLE LoginRol ( 
  "IdUsuario" INT NOT NULL , 
  "IdRol" INT NOT NULL , 
  "FechaModificacion" DATETIME2 NOT NULL DEFAULT GETDATE() , 
  "Enabled" BIT NOT NULL DEFAULT 1 , CONSTRAINT "LoginRol_PK" PRIMARY KEY ( "IdUsuario", "IdRol" ) );

CREATE TABLE Merchant ( 
  "Id" INT IDENTITY NOT NULL , 
  "Name" VARCHAR(20) NOT NULL , 
  "Api" VARCHAR(MAX) NULL , 
  "Key1" VARCHAR(MAX) NULL , 
  "Key2" VARCHAR(MAX) NULL , CONSTRAINT "Merchant_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Pago ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdTransaccion" INT NULL , 
  "IdTipo" INT NOT NULL , 
  "Cantidad" NUMERIC(11, 2) NOT NULL , 
  "Detalle" VARCHAR(MAX) NOT NULL , 
  "Checksum" INT NOT NULL DEFAULT CHECKSUM(*) , 
  "Computer" VARCHAR(20) NOT NULL , 
  "DateAdded" DATETIME2 NOT NULL DEFAULT GetDate() , CONSTRAINT "Pago_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE PagoTipo ( 
  "Id" INT IDENTITY NOT NULL , 
  "Nombre" VARCHAR(20) NOT NULL , 
  "Detalle" VARCHAR(MAX) NULL , CONSTRAINT "PagoTipo_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Pais ( 
  "Id" INT IDENTITY NOT NULL , 
  "Nombre" NVARCHAR(40) NOT NULL , 
  "NombreAlterno" NVARCHAR(40) NULL , CONSTRAINT "Pais_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Permiso ( 
  "Id" INT IDENTITY NOT NULL , 
  "Nombre" VARCHAR(15) NOT NULL , 
  "Descripcion" VARCHAR(MAX) NOT NULL , CONSTRAINT "Permiso_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE PermisoRol ( 
  "IdPermiso" INT NOT NULL , 
  "IdRol" INT NOT NULL , 
  "FechaModificacion" DATETIME2 NOT NULL DEFAULT GETDATE() , 
  "Enabled" BIT NOT NULL DEFAULT 1 , CONSTRAINT "PermisoRol_PK" PRIMARY KEY ( "IdPermiso", "IdRol" ) );

CREATE TABLE PermisoUser ( 
  "IdPermiso" INT NOT NULL , 
  "IdUser" INT NOT NULL , 
  "FechaModificacion" DATETIME2 NOT NULL DEFAULT GETDATE() , 
  "Enabled" BIT NOT NULL DEFAULT 1 , CONSTRAINT "PermisoUser_PK" PRIMARY KEY ( "IdPermiso", "IdUser" ) );

CREATE TABLE Rol ( 
  "Id" INT IDENTITY NOT NULL , 
  "Nombre" VARCHAR(20) NOT NULL , CONSTRAINT "Rol_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Tarjeta ( 
  "Numero" NUMERIC(16) NOT NULL , 
  "Mes" NUMERIC NOT NULL , 
  "Anno" NUMERIC NOT NULL , 
  "Nombre" VARCHAR(25) NOT NULL , 
  "CVV" NUMERIC(4) NOT NULL , CONSTRAINT "Tarjeta_PK" PRIMARY KEY ( "Numero" ) );

CREATE TABLE TarjetaxCliente ( 
  "IdCliente" INT NOT NULL , 
  "IdTarjeta" NUMERIC(16) NOT NULL , CONSTRAINT "TarjetaxCliente_PK" PRIMARY KEY ( "IdCliente", "IdTarjeta" ) );

CREATE TABLE Transaccion ( 
  "Id" INT IDENTITY NOT NULL , 
  "IdMerchant" INT NOT NULL , 
  "Mensaje" VARCHAR(100) NOT NULL DEFAULT 200 OK , 
  "Detalles" VARCHAR(MAX) NULL , CONSTRAINT "Transaccion_PK" PRIMARY KEY ( "Id" ) );

CREATE TABLE Usuario ( 
  "Id" INT IDENTITY NOT NULL , 
  "Nombre" VARCHAR(15) NOT NULL , 
  "Apellido" VARCHAR(15) NOT NULL , 
  "Correo" VARCHAR(50) NOT NULL , CONSTRAINT "Usuario_PK" PRIMARY KEY ( "Id" ) );

ALTER TABLE Ciudad ADD CONSTRAINT "Ciudad_FK1" FOREIGN KEY ( "IdEstado" )
 REFERENCES Estado ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Cliente ADD CONSTRAINT "Cliente_FK1" FOREIGN KEY ( "IdUsuario" )
 REFERENCES Usuario ( "Id" );

ALTER TABLE Cliente ADD CONSTRAINT "Cliente_FK2" FOREIGN KEY ( "Direccion" )
 REFERENCES Location ( "Id" );

ALTER TABLE Estado ADD CONSTRAINT "Estado_FK1" FOREIGN KEY ( "IdPais" )
 REFERENCES Pais ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Factura ADD CONSTRAINT "Factura_FK1" FOREIGN KEY ( "IdCliente" )
 REFERENCES Cliente ( "IdUsuario" );

ALTER TABLE Factura ADD CONSTRAINT "Factura_FK2" FOREIGN KEY ( "IdPago" )
 REFERENCES Pago ( "Id" );

ALTER TABLE FacturaLinea ADD CONSTRAINT "FacturaLinea_FK1" FOREIGN KEY ( "IdFactrura" )
 REFERENCES Factura ( "Id" );

ALTER TABLE Location ADD CONSTRAINT "Location_FK1" FOREIGN KEY ( "IdCiudad" )
 REFERENCES Ciudad ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Log ADD CONSTRAINT "Log_FK1" FOREIGN KEY ( "IdLevel" )
 REFERENCES LogLevel ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Log ADD CONSTRAINT "Log_FK2" FOREIGN KEY ( "IdSource" )
 REFERENCES LogSource ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Log ADD CONSTRAINT "Log_FK3" FOREIGN KEY ( "IdType" )
 REFERENCES LogType ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE Login ADD CONSTRAINT "Login_FK1" FOREIGN KEY ( "IdUsuario" )
 REFERENCES Usuario ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE LoginRol ADD CONSTRAINT "LoginRol_FK1" FOREIGN KEY ( "IdUsuario" )
 REFERENCES Usuario ( "Id" );

ALTER TABLE LoginRol ADD CONSTRAINT "LoginRol_FK2" FOREIGN KEY ( "IdRol" )
 REFERENCES Rol ( "Id" );

ALTER TABLE Pago ADD CONSTRAINT "Pago_FK1" FOREIGN KEY ( "IdTransaccion" )
 REFERENCES Transaccion ( "Id" );

ALTER TABLE Pago ADD CONSTRAINT "Pago_FK2" FOREIGN KEY ( "IdTipo" )
 REFERENCES PagoTipo ( "Id" );

ALTER TABLE PermisoRol ADD CONSTRAINT "PermisoRol_FK1" FOREIGN KEY ( "IdPermiso" )
 REFERENCES Permiso ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE PermisoRol ADD CONSTRAINT "PermisoRol_FK2" FOREIGN KEY ( "IdRol" )
 REFERENCES Rol ( "Id" );

ALTER TABLE PermisoUser ADD CONSTRAINT "PermisoUser_FK1" FOREIGN KEY ( "IdPermiso" )
 REFERENCES Permiso ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE PermisoUser ADD CONSTRAINT "PermisoUser_FK2" FOREIGN KEY ( "IdUser" )
 REFERENCES Usuario ( "Id" )
 ON DELETE CASCADE;

ALTER TABLE TarjetaxCliente ADD CONSTRAINT "TarjetaxCliente_FK1" FOREIGN KEY ( "IdCliente" )
 REFERENCES Cliente ( "IdUsuario" );

ALTER TABLE TarjetaxCliente ADD CONSTRAINT "TarjetaxCliente_FK2" FOREIGN KEY ( "IdTarjeta" )
 REFERENCES Tarjeta ( "Numero" );

ALTER TABLE Transaccion ADD CONSTRAINT "Transaccion_FK1" FOREIGN KEY ( "IdMerchant" )
 REFERENCES Merchant ( "Id" );

CREATE INDEX Ciudad_INDEX1 ON Ciudad ( Id);

CREATE INDEX Cliente_INDEX1 ON Cliente ( IdUsuario);

CREATE INDEX Estado_INDEX1 ON Estado ( Id);

CREATE INDEX Factura_INDEX1 ON Factura ( Id);

CREATE INDEX FacturaLinea_INDEX1 ON FacturaLinea ( Id);

CREATE INDEX FacturaLinea_INDEX2 ON FacturaLinea ( IdFactrura);

CREATE INDEX FacturaLinea_INDEX3 ON FacturaLinea ( Id,  IdFactrura);

CREATE INDEX Location_INDEX1 ON Location ( Id);

CREATE INDEX Log_INDEX1 ON Log ( Id);

CREATE INDEX Log_INDEX2 ON Log ( IdType);

CREATE INDEX Log_INDEX3 ON Log ( IdSource);

CREATE INDEX Log_INDEX4 ON Log ( IdLevel);

CREATE INDEX LogLevel_INDEX1 ON LogLevel ( Id);

CREATE INDEX LogSource_INDEX1 ON LogSource ( Id);

CREATE INDEX LogType_INDEX1 ON LogType ( Id);

CREATE INDEX Login_INDEX1 ON Login ( IdUsuario);

CREATE INDEX Login_INDEX2 ON Login ( Username);

CREATE INDEX LoginRol_INDEX1 ON LoginRol ( IdUsuario);

CREATE INDEX LoginRol_INDEX2 ON LoginRol ( IdRol);

CREATE INDEX LoginRol_INDEX3 ON LoginRol ( IdUsuario,  IdRol);

CREATE INDEX PagoTipo_INDEX1 ON PagoTipo ( Id);

CREATE INDEX Pais_INDEX1 ON Pais ( Id);

CREATE INDEX Permiso_INDEX1 ON Permiso ( Id);

CREATE INDEX PermisoRol_INDEX1 ON PermisoRol ( IdPermiso);

CREATE INDEX PermisoRol_INDEX2 ON PermisoRol ( IdRol);

CREATE INDEX PermisoRol_INDEX3 ON PermisoRol ( IdPermiso,  IdRol);

CREATE INDEX PermisoUser_INDEX1 ON PermisoUser ( IdPermiso);

CREATE INDEX PermisoUser_INDEX2 ON PermisoUser ( IdUser);

CREATE INDEX PermisoUser_INDEX3 ON PermisoUser ( IdPermiso,  IdUser);

CREATE INDEX Rol_INDEX1 ON Rol ( Id);

CREATE INDEX Tarjeta_INDEX1 ON Tarjeta ( Numero);

CREATE INDEX Transaccion_INDEX1 ON Transaccion ( Id);

CREATE INDEX Usuario_INDEX1 ON Usuario ( Id);
