CREATE DATABASE EJEMPLO4;

USE EJEMPLO4;

CREATE TABLE SUCURSAL
(
  CODIGO    CHAR(4),
  DIRECCION VARCHAR(40),
  TELEFONO  CHAR(12),
  PRIMARY KEY (CODIGO)
);

DESCRIBE SUCURSAL;


CREATE TABLE PERIODISTA
(
  DNI          CHAR(9),
  NOMBRE       VARCHAR(50) NOT NULL,
  DIRECCION    VARCHAR(40),
  TELEFONO     CHAR(12),
  ESPECIALISTA VARCHAR(40),
  PRIMARY KEY (DNI)
);

DESCRIBE PERIODISTA;


CREATE TABLE EMPLEADO
(
  DNI       CHAR(9),
  NOMBRE    VARCHAR(50) NOT NULL,
  DIRECCION VARCHAR(40),
  TELEFONO  CHAR(12),
  SUCURSAL  CHAR(4),
  PRIMARY KEY (DNI),
  FOREIGN KEY (SUCURSAL) REFERENCES SUCURSAL(CODIGO)
);

DESCRIBE EMPLEADO;


CREATE TABLE REVISTA
(
  NUMREG       CHAR(8),
  TITULO       VARCHAR(50) NOT NULL,
  PERIODICIDAD VARCHAR(40) DEFAULT 'MENSUAL',
  TIPO         VARCHAR(20),
  SUCURSAL     CHAR(4),      
PRIMARY KEY (NUMREG),
FOREIGN KEY (SUCURSAL) REFERENCES SUCURSAL(CODIGO),
  CONSTRAINT CK_PERIODICIDAD
    CHECK (PERIODICIDAD IN 
      ('SEMANAL', 'QUINCENAL', 'MENSUAL', 'TRIMESTRAL', 'ANUAL'))
);

DESCRIBE REVISTA;


CREATE TABLE NUMREVISTA
(
  NUMREG       CHAR(8),
  NUMERO       INT,
  NUMPAGINAS   INT,
  FECHA        DATE,
  CANTVENDIDAS INT,
  PRIMARY KEY (NUMREG, NUMERO),
  FOREIGN KEY (NUMREG) REFERENCES REVISTA(NUMREG),
  CONSTRAINT CK_NUMPAGINAS CHECK (NUMPAGINAS > 0)
);

DESCRIBE NUMREVISTA;


CREATE TABLE ESCRIBE
(
  NUMREG         CHAR(8),
  DNI_PERIODISTA CHAR(9),
  PRIMARY KEY (NUMREG, DNI_PERIODISTA),
  CONSTRAINT FK1_ESCRIBE FOREIGN KEY(NUMREG) 
    REFERENCES REVISTA(NUMREG),
  CONSTRAINT FK2_ESCRIBE FOREIGN KEY(DNI_PERIODISTA) 
    REFERENCES PERIODISTA(DNI)
);

DESCRIBE ESCRIBE;