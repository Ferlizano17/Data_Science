use prueba1;

show tables;
describe articulo;
describe cliente;
describe compra;


INSERT INTO ARTICULO (CodArticulo, Denom, Precio, Unidades)
		VALUES ('0001', 'Ord. Sobremesa', 600.00, 12);

SELECT * FROM ARTICULO;

INSERT INTO `prueba1`.`ARTICULO` (`CodArticulo`, `Denom`, `Precio`, `Unidades`) VALUES ('0003', 'Tarjeta Red', '20', '25');
INSERT INTO `prueba1`.`ARTICULO` (`CodArticulo`, `Denom`, `Precio`, `Unidades`) VALUES ('0004', 'Impresora Láser', '200', '4');
INSERT INTO `prueba1`.`ARTICULO` (`CodArticulo`, `Denom`, `Precio`, `Unidades`) VALUES ('0005', 'Ratón USB', '7', '50');
INSERT INTO `prueba1`.`ARTICULO` (`CodArticulo`, `Denom`, `Precio`, `Unidades`) VALUES ('0006', 'Monitor TFT', '250', '10');
INSERT INTO `prueba1`.`ARTICULO` (`CodArticulo`, `Denom`, `Precio`, `Unidades`) VALUES ('0007', 'Router Inalámbrico', '100', '30');

SELECT * FROM ARTICULO;


INSERT INTO CLIENTE (CodCliente, NombreC, Direccion, Telefono) 
			VALUES ('011', 'Ana García', 'Alcalá, 330', '914849303');
            
INSERT INTO `prueba1`.`CLIENTE` (`CodCliente`, `NombreC`, `Direccion`, `Telefono`) VALUES ('012', 'Luis Ramos', 'Castellana, 110', '914394943');
INSERT INTO `prueba1`.`CLIENTE` (`CodCliente`, `NombreC`, `Direccion`, `Telefono`) VALUES ('013', 'Juan García', 'Ulises, 21', '915656501');
INSERT INTO `prueba1`.`CLIENTE` (`CodCliente`, `NombreC`, `Direccion`, `Telefono`) VALUES ('014', 'Marga Fdez.', 'Puentelarra, 57', '913389307');
INSERT INTO `prueba1`.`CLIENTE` (`CodCliente`, `NombreC`, `Direccion`, `Telefono`) VALUES ('015', 'Pedro Glez.', 'Gerona, 14', '917845308');


SELECT * FROM CLIENTE;

USE PRUEBA1;

INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('011', '0001', '2025-10-01', 1);
        
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('012', '0001', '2025-10-02', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('011', '0003', '2025-10-03', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('012', '0004', '2025-10-04', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('013', '0005', '2025-10-05', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('014', '0004', '2025-10-06', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('013', '0005', '2025-10-07', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('015', '0001', '2025-10-08', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('015', '0004', '2025-10-09', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('012', '0003', '2025-10-10', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('012', '0005', '2025-10-11', 1);
INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('014', '0004', '2025-10-12', 1);
        
        
SELECT * FROM COMPRA;
