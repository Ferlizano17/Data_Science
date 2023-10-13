USE prueba1;

DELIMITER //

CREATE PROCEDURE pa_mostrararticulos ()
BEGIN
	SELECT * FROM articulo;
END //



CREATE PROCEDURE pa_insertarticulo (in a_Articulo varchar(4), 
									in a_Denom varchar(45),
                                    in a_Precio float,
                                    in a_Unidades int)
BEGIN									
	INSERT INTO articulo (CodArticulo, Denom, Precio, Unidades)
			VALUES (a_Articulo, a_Denom, a_Precio, a_Unidades);
END //

DELIMITER ; 

CALL pa_insertarticulo ('0021', 'Prueba PA_1', 2000, 5);
CALL pa_mostrararticulos;
log_transacciones

-- TRIGGERS 

DELIMITER //

USE PRUEBA1;
CREATE TABLE Log_Transacciones (
				IdLog INT AUTO_INCREMENT,
                FecCompra date,
                NumUnidades int,
                primary key (IdLog)
);
DELIMITER //

CREATE TRIGGER LogATrigger AFTER INSERT ON compra 
FOR EACH ROW 
BEGIN
	INSERT INTO Log_Transacciones(FecCompra, NumUnidades) VALUE (NEW.FecCompra, NEW.NumUnidades);
END //


select * from compra;

INSERT INTO COMPRA (IdCliente, IdArticulo, FecCompra, NumUnidades)
		VALUES ('011', '0001', '2030-10-07', 50);
        
SELECT * FROM Log_Transacciones;