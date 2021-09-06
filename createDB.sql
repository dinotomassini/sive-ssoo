CREATE DATABASE bd_sive;

use bd_sive;

CREATE TABLE Usuario (
	correo varchar(40) NOT NULL,
  Password varchar(20) NOT NULL,
  Nombre varchar(20) NOT NULL,
  Apellido varchar(20) NOT NULL,
  Fecha_Nac date NOT NULL,
  Documento varchar(20) NOT NULL,
  Calle varchar(15) NOT NULL,
  Numero int NOT NULL,
  Esquina varchar(15) NOT NULL,
  PRIMARY KEY(correo),
  UNIQUE(Documento)
);

CREATE TABLE Telefono (
	correo varchar(40) NOT NULL,
  Telefono varchar(10) NOT NULL,
  PRIMARY KEY(correo, Telefono),
  FOREIGN KEY(correo) REFERENCES Usuario(correo)
);

CREATE TABLE Cliente(
  correo varchar(40) NOT NULL,
  Reputacion int NOT NULL,
  PRIMARY KEY(correo), 
  FOREIGN KEY(correo) REFERENCES Usuario(correo)
);

CREATE TABLE vendedor(
  correo varchar(40) NOT NULL,
  IdVendedor int NOT NULL,
  PRIMARY KEY(correo),
  UNIQUE(IdVendedor), 
  FOREIGN KEY(correo) REFERENCES Usuario(correo)
);

CREATE TABLE Administrador(
  correo varchar(40) NOT NULL,
  IdAdministrador int NOT NULL,
  PRIMARY KEY(correo),
  UNIQUE(IdAdministrador), 
  FOREIGN KEY(correo) REFERENCES Usuario(correo)
);

CREATE TABLE Catalogo(
  IdCatalogo int NOT NULL, 
  Nombre varchar(20) NOT NULL,
  PRIMARY KEY(IdCatalogo)
);

CREATE TABLE Categoria(
  IdCategoria int NOT NULL, 
  Nombre varchar(20) NOT NULL,
  PRIMARY KEY(IdCategoria)
);

CREATE TABLE Producto(
  CodProducto int NOT NULL, 
  Nombre varchar(20) NOT NULL, 
  Precio int NOT NULL, 
  Stock int NOT NULL,
  Estado_Producto varchar(10) NOT NULL,
  Procedencia varchar(15) NOT NULL,
  Descripcion varchar(70) NOT NULL, 
  Detalle varchar(60) NOT NULL,
  PRIMARY KEY(CodProducto)
);

CREATE TABLE Compras(
  IdOrden int NOT NULL, 
  Fecha_Compra date NOT NULL, 
  pagoAprobado boolean NOT NULL, 
  Total int NOT NULL, 
  correo varchar(40) NOT NULL, 
  CodProducto int NOT NULL,
  PRIMARY KEY(IdOrden),
  FOREIGN KEY(correo) REFERENCES Cliente(correo),
  FOREIGN KEY(CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE MetodoDePago(
  IdMetodoPago int NOT NULL, 
  Nombre varchar(20) NOT NULL,
  PRIMARY KEY(IdMetodoPago)
);

CREATE TABLE Tarjeta(
  IdMetodoPago int NOT NULL, 
  IdTarjeta int NOT NULL, 
  PRIMARY KEY(IdMetodoPago),
  UNIQUE(IdTarjeta),
  FOREIGN KEY(IdMetodoPago) REFERENCES MetodoDePago(IdMetodoPago)
);

CREATE TABLE PayPal(
  IdMetodoPago int NOT NULL, 
  confirmacion boolean NOT NULL,
  PRIMARY KEY(IdMetodoPago),
  FOREIGN KEY(IdMetodoPago) REFERENCES MetodoDePago(IdMetodoPago)
);

CREATE TABLE CentroDePagos(
  IdMetodoPago int NOT NULL, 
  IdCentroDePago int NOT NULL,
  PRIMARY KEY(IdMetodoPago),
  UNIQUE(IdCentroDePago),
  FOREIGN KEY(IdMetodoPago) REFERENCES MetodoDePago(IdMetodoPago)
);

CREATE TABLE Despacho(
  IdEntrega int NOT NULL, 
  Estado_Entrega varchar(20) NOT NULL, 
  Fecha_Entrega date NOT NULL, 
  Lugar varchar(10) NOT NULL,
  PRIMARY KEY(IdEntrega)
);

CREATE TABLE Esta(
  IdCatalogo int NOT NULL, 
  CodProducto int NOT NULL,
  PRIMARY KEY(IdCatalogo, CodProducto),
  FOREIGN KEY(IdCatalogo) REFERENCES Catalogo(IdCatalogo),
  FOREIGN KEY(CodProducto) REFERENCES Producto(CodProducto)
);

CREATE TABLE Administra(
  correo varchar(40) NOT NULL, 
  IdCatalogo int NOT NULL,
  PRIMARY KEY(correo, IdCatalogo),
  FOREIGN KEY(correo) REFERENCES vendedor(correo),
  FOREIGN KEY(IdCatalogo) REFERENCES Catalogo(IdCatalogo)
);

CREATE TABLE Gestiona(
  IdCategoria int NOT NULL, 
  correo varchar(40) NOT NULL,
  PRIMARY KEY(IdCategoria),
  FOREIGN KEY(IdCategoria) REFERENCES Categoria(IdCategoria),
  FOREIGN KEY(correo) REFERENCES Administrador(correo)
);

CREATE TABLE Tiene(
  CodProducto int NOT NULL, 
  IdCategoria int NOT NULL, 
  PRIMARY KEY(CodProducto), 
  FOREIGN KEY(CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY(IdCategoria) REFERENCES Categoria(IdCategoria)
);

CREATE TABLE Surge(
  IdOrden int NOT NULL, 
  IdEntrega int NOT NULL,
  PRIMARY KEY(IdOrden), 
  FOREIGN KEY(IdOrden) REFERENCES Compras(IdOrden),
  FOREIGN KEY(IdEntrega) REFERENCES Despacho(IdEntrega)
);

CREATE TABLE Utiliza(
  IdOrden int NOT NULL, 
  IdMetodoPago int NOT NULL,
  PRIMARY KEY(IdOrden),
  FOREIGN KEY(IdOrden) REFERENCES Compras(IdOrden),
  FOREIGN KEY(IdMetodoPago) REFERENCES MetodoDePago(IdMetodoPago)
);

CREATE TABLE Carrito(
  CodProducto int NOT NULL, 
  correo varchar(40) NOT NULL, 
  IdOrden int NOT NULL, 
  IdCarrito int NOT NULL, 
  Cantidad int NOT NULL, 
  SubTotal int NOT NULL,
  PRIMARY KEY(CodProducto, IdCarrito),
  FOREIGN KEY(CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY(correo) REFERENCES Cliente(correo),
  FOREIGN KEY(IdOrden) REFERENCES Compras(IdOrden)
);

CREATE TABLE Vende(
  IdCarrito int NOT NULL, 
  CodProducto int NOT NULL, 
  correo varchar(40) NOT NULL,
  PRIMARY KEY(IdCarrito, CodProducto),
  FOREIGN KEY(CodProducto) REFERENCES Producto(CodProducto),
  FOREIGN KEY(correo) REFERENCES vendedor(correo)
);

  FOREIGN KEY(IdCarrito) REFERENCES Carrito(IdCarrito),
