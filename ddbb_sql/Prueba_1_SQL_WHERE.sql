USE prueba1;

SELECT * FROM CLIENTE;
SELECT * FROM ARTICULO;
SELECT * FROM COMPRA;


SELECT * from COMPRA where FecCompra between '2025-10-01' and '2025-10-04' order by FecCompra;


USE prueba1;

-- IMPORTANTE, PORQUÉ PONER LAS CONDICIONES DE RELACIÓN ENTRE TABLAS...

describe cliente;
describe articulo;
describe compra;


SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades 
FROM compra as c, cliente as cl, articulo as a 
WHERE cl.CodCliente=c.IdCliente AND a.CodArticulo=c.IdArticulo ORDER BY FecCompra;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo ORDER BY cl.NombreC;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo ORDER BY c.FecCompra ASC;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo ORDER BY c.FecCompra DESC;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo ORDER BY c.NumUnidades ASC;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo ORDER BY c.NumUnidades DESC;

SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo GROUP BY cl.NombreC;

SELECT cl.NombreC, cl.Telefono, sum(c.NumUnidades) from compra c, cliente cl, articulo a 
where cl.CodCliente=c.IdCliente and a.CodArticulo=c.IdArticulo GROUP BY cl.NombreC ORDER BY cl.NombreC;


SELECT cl.NombreC FROM prueba1.cliente as cl;


-- 'a%' comienza con la letra a
-- '%a' terminar con la letra a
-- '%a%' contiene la letra a

SELECT * FROM CLIENTE WHERE NombreC LIKE 'A%';

USE prueba1;

SELECT * FROM compra;

SELECT * FROM compra WHERE FecCompra='2025-10-01' AND IdArticulo='0001';

SELECT * FROM compra;

describe compra;


SELECT * from cliente;

UPDATE cliente SET Direccion='Nueva Dirección', Telefono='N. Telefono' WHERE CodCliente='011';


SELECT * FROM CLIENTE;
DESCRIBE CLIENTE;


INSERT INTO CLIENTE (CodCliente, NombreC, Direccion, Telefono) 
			VALUES ('016', 'Ana Pérez', 'Alcalá, 330', '914849304');

select * from cliente;

DELETE FROM cliente WHERE CodCliente='016';


SELECT * FROM cliente;

TRUNCATE TABLE cliente; 


CREATE DATABASE empresa2;

USE empresa2;

CREATE TABLE CLIENTE (
					CodCliente varchar(3),
                    NombreC varchar(50),
                    Direccion varchar(100),
                    Telefono varchar(12),
                    primary key (CodCliente)

);

CREATE TABLE ARTICULO (
					CodArticulo varchar(4),
                    Denom varchar(45),
                    Precio float,
                    Unidades int,
                    primary key (CodArticulo)

);

CREATE TABLE COMPRA (
				IdCliente varchar(3),
                IdArticulo varchar(4),
                FecCompra date,
                NumUnidades int,
                primary key (IdCliente, IdArticulo, FecCompra),
                FOREIGN KEY (IdCliente) REFERENCES cliente(CodCliente),
                FOREIGN KEY (IdArticulo) REFERENCES articulo(CodArticulo)
                
);


DESCRIBE COMPRA;


USE PRUEBA1;


SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c 
											INNER JOIN cliente cl ON cl.CodCliente=c.IdCliente 
                                            INNER JOIN articulo a ON a.CodArticulo=c.IdArticulo ORDER BY FecCompra;


SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades 
FROM compra as c, cliente as cl, articulo as a 
WHERE cl.CodCliente=c.IdCliente AND a.CodArticulo=c.IdArticulo ORDER BY FecCompra;



CREATE VIEW SELECCION_COMPRA AS SELECT cl.NombreC, cl.Telefono, a.Denom, c.FecCompra, c.NumUnidades from compra c 
											INNER JOIN cliente cl ON cl.CodCliente=c.IdCliente 
                                            INNER JOIN articulo a ON a.CodArticulo=c.IdArticulo;


SELECT * FROM SELECCION_COMPRA;


SELECT * FROM CLIENTE;

DELIMITER  //
CREATE PROCEDURE pa_mostrararticulos ()
BEGIN
	SELECT * FROM articulo;
END //

call pa_mostrararticulos(); 