DROP DATABASE prueba1;

CREATE DATABASE prueba1;
USE prueba1;

CREATE TABLE CLIENTE (
					CodCliente varchar(25),
                    NombreC varchar(50),
                    Direccion varchar(100),
                    Telefono varchar(12),
                    primary key (CodCliente)

);

DESCRIBE CLIENTE;

CREATE TABLE ARTICULO (
					CodArticulo varchar(4),
                    Denom varchar(45),
                    Precio float,
                    Unidades int,
                    primary key (CodArticulo)

);

DESCRIBE ARTICULO;

CREATE TABLE COMPRA (
				IdCliente varchar(3),
                IdArticulo varchar(4),
                FecCompra date,
                NumUnidades int,
                primary key (IdCliente, IdArticulo, FecCompra)
);


DESCRIBE COMPRA; 

SELECT * FROM COMPRA; 

ALTER TABLE CLIENTE CHANGE COLUMN CodCliente CodCliente VARCHAR(3) NOT NULL;

# UTILIZAREMOS ALTER TABLE PARA INCLUIR LAS RELACIONES ENTRE TABLAS

ALTER TABLE COMPRA
ADD FOREIGN KEY (IdCliente) REFERENCES CLIENTE(CodCliente);



ALTER TABLE COMPRA
ADD FOREIGN KEY (IdArticulo) REFERENCES ARTICULO(CodArticulo);


DESCRIBE CLIENTE;
DESCRIBE ARTICULO;
DESCRIBE COMPRA;

SHOW tables;