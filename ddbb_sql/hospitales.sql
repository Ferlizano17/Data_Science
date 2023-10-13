CREATE DATABASE HOSPITALES2;
USE HOSPITALES2;

-- HOSPITAL
-- INSTRUCCIONES CRUD 

CREATE TABLE HOSPITAL
(
  ID_HOSPITAL   INT(2) NOT NULL,
  NOMBRE    	VARCHAR(10),
  DIRECCION 	VARCHAR(20),
  TELEFONO   	VARCHAR(12),
  NUM_CAMA		INT(3),
  PRIMARY KEY (ID_HOSPITAL)
);

DESCRIBE HOSPITAL;

-- SALAS DEL HOSPITAL

insert into HOSPITAL (id_hospital, nombre, direccion, telefono, num_cama) VALUES (1, 'Hospital 1' ,'C/ Povedilla, 33','918319932.', 100);
insert into HOSPITAL (id_hospital, nombre, direccion, telefono, num_cama) VALUES (2, 'Hospital 2' ,'C/ Maldonado, 48','918319933.', 200);
insert into HOSPITAL (id_hospital, nombre, direccion, telefono, num_cama) VALUES (3, 'Hospital 3' ,'C/ Bodeguilla, 25','918319934.', 300);
SELECT * FROM HOSPITAL;

UPDATE HOSPITAL SET telefono = '918319932' where id_hospital = 1;
UPDATE HOSPITAL SET telefono = '918319933' where id_hospital = 2;
UPDATE HOSPITAL SET telefono = '918319934' where id_hospital = 3;


CREATE TABLE SALA
(
  ID_HOSPITAL   INT(2) NOT NULL,
  ID_SALA    	INT(2) NOT NULL,
  NOMBRE	 	VARCHAR(20),
  NUM_CAMA		INT(3),
  PRIMARY KEY (ID_HOSPITAL, ID_SALA),
  FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(ID_HOSPITAL)
);

insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (1, 1 ,'Sala 1', 10);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (1, 2 ,'Sala 2', 15);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (1, 3 ,'Sala 3', 20);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (2, 1 ,'Sala 1', 10);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (2, 2 ,'Sala 2', 15);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (2, 3 ,'Sala 3', 20);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (3, 1 ,'Sala 1', 10);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (3, 2 ,'Sala 2', 15);
insert into SALA (id_hospital, id_sala, nombre, num_cama) VALUES (3, 3 ,'Sala 3', 20);

SELECT * FROM SALA;

DESCRIBE SALA;

-- PLANTILLA DEL HOSPITAL

CREATE TABLE PLANTILLA
(
  ID_HOSPITAL   INT(2) NOT NULL,
  ID_SALA    	INT(2) NOT NULL,
  ID_EMPLEADO 	INT(2) NOT NULL,
  APELLIDO   	VARCHAR(15),
  FUNCION   	VARCHAR(10),
  TURNO			VARCHAR(1),
  SALARIO		FLOAT(10),
  PRIMARY KEY (ID_HOSPITAL, ID_SALA, ID_EMPLEADO),
  FOREIGN KEY (ID_HOSPITAL, ID_SALA) REFERENCES SALA(ID_HOSPITAL, ID_SALA)
);



DESCRIBE PLANTILLA;
SELECT * FROM PLANTILLA;

insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (1, 1 ,1, 'Marín', 'Jefecillo', 'M', 50000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (1, 2 ,2, 'Álvarez', 'Jefazo', 'M', 60000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (1, 3 ,3, 'Rufián', 'enfermero', 'M', 40000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (2, 1 ,1, 'Alegre', 'Jefecillo', 'M', 40000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (2, 2 ,2, 'Homero', 'Currito', 'M', 50000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (2, 3 ,3, 'Mediopensio', 'Jefecillo', 'M', 30000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (3, 1 ,1, 'Atontado', 'Jefecillo', 'M', 30000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (3, 2 ,2, 'Mediogili', 'Currito', 'M', 30000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (3, 3 ,3, 'Casigili', 'Currito', 'M', 30000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (3, 3 ,4, 'Gilidelto', 'Currito', 'M', 30000.00);
insert into PLANTILLA (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (3, 3 ,5, 'Unpocogili', 'Currito', 'M', 30000.00);

SELECT * FROM PLANTILLA;

-- ENFERMOS

CREATE TABLE ENFERMO
(
  ID_INSCRIPCION	INT(5) NOT NULL,
  APELLIDO    	VARCHAR(15),
  DIRECCION   	VARCHAR(20),
  FECHA_NAC	   	DATE,
  SEXO			VARCHAR(1),
  NSS			INT(9),
  PRIMARY KEY (ID_INSCRIPCION)
 );

DESCRIBE ENFERMO;

insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (1, 'Román' ,'C/ Uno', '2006-01-01', 'V', '10203040');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (2, 'Romero' ,'C/ Dos', '2006-02-01', 'V', '10203041');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (3, 'Pepiño' ,'C/ Uno', '2006-03-01', 'V', '10203042');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (4, 'Jiménez' ,'C/ Dos', '2006-04-01', 'V', '10203043');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (5, 'Marín' ,'C/ Dos', '2006-05-01', 'V', '10203044');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (6, 'Atapuerca' ,'C/ Dos', '2006-06-01', 'V', '10203045');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (7, 'Rufio' ,'C/ Uno', '2006-07-01', 'V', '10203046');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (8, 'Olgazán' ,'C/ Uno', '2006-08-01', 'M', '10203047');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (9, 'Pelmazo' ,'C/ Uno', '2006-09-01', 'M', '10203048');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (10, 'Unoque' ,'C/ Uno', '2006-10-01', 'M', '10203049');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (11, 'Dosque' ,'C/ Uno', '2006-11-01', 'V', '10203050');
insert into ENFERMO (id_inscripcion, apellido, direccion, fecha_nac, sexo, nss) VALUES (12, 'Tresque' ,'C/ Uno', '2006-12-01', 'V', '10203051');

SELECT * FROM ENFERMO;

-- OCUPACIÓN DEL HOSPITAL

CREATE TABLE OCUPACION
(
  ID_INSCRIPCION	INT(5) NOT NULL,
  ID_HOSPITAL   	INT(2) NOT NULL,
  ID_SALA    		INT(2) NOT NULL,
  CAMA   			INT(4),
  PRIMARY KEY (ID_INSCRIPCION, ID_HOSPITAL, ID_SALA),
  FOREIGN KEY (ID_HOSPITAL, ID_SALA) REFERENCES SALA(ID_HOSPITAL, ID_SALA),
  FOREIGN KEY (ID_INSCRIPCION) REFERENCES ENFERMO(ID_INSCRIPCION)
);

insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (1, 1, 1, 10);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (2, 1, 1, 11);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (3, 2, 1, 12);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (4, 3, 1, 13);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (5, 1, 1, 114);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (6, 2, 1, 14);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (7, 2, 1, 15);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (8, 2, 1, 16);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (9, 3, 1, 12);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (10, 1, 1, 20);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (11, 3, 1, 21);
insert into OCUPACION (id_inscripcion, id_hospital, id_sala, cama) VALUES (12, 2, 1, 22);

SELECT * FROM OCUPACION;

DESCRIBE OCUPACION;

-- DOCTORES
CREATE TABLE DOCTOR
(
  ID_HOSPITAL		INT(2) NOT NULL,
  ID_DOCTOR   		INT(3) NOT NULL,
  APELLIDO    		VARCHAR(15),
  ESPECIALIDAD   	VARCHAR(16),
  PRIMARY KEY (ID_HOSPITAL, ID_DOCTOR),
  FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(ID_HOSPITAL)
);

insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (1, 1, 'Morán', 'Cirujano');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (1, 2, 'Alipio', 'Traumatólogo');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (1, 3, 'Zurbano', 'Cardiólogo');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (2, 3, 'Pedro', 'Podólogo');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (2, 1, 'El Mejor', 'Cirujano');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (2, 2, 'Bueno', 'Pediatra');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (3, 1, 'Regular', 'Urólogo');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (3, 2, 'Fernando', 'Ginecólogo');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (3, 3, 'Rufino', 'Alquimista');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (3, 4, 'Modesta', 'Veterinario');
insert into DOCTOR (id_hospital, id_doctor, apellido, especialidad) VALUES (3, 5, 'Elvira', 'Nosabe');

SELECT * FROM DOCTOR;

CREATE TABLE HOSPITALES2 AS SELECT * FROM HOSPITAL;
ALTER TABLE HOSPITALES2 MODIFY NUM_CAMA INT(4);
ALTER TABLE PLANTILLA RENAME COLUMN SALRIO TO SALARIO;
DESCRIBE PLANTILLA;

DESCRIBE HOSPITAL;
DESCRIBE HOSPITALES2;


-- PREGUNTA #3 - Encuentra todos los miembros del personal cuyo nombre comience por ‘H’.
select apellido from plantilla where upper(apellido) like 'H%';

-- PREGUNTA #4 - ¿Quiénes son las enfermeras y enfermeros que trabajan en turnos de tarde o mañana? 
select apellido from plantilla where upper(funcion) in ('ENFERMERO' ,'ENFERMERA') and upper(turno) in ('T','M');
select * from plantilla;

-- PREGUNTA #5 - Hacer un listado del personal de enfermería cuyo salario está comprendido entre 25.000 y 35.000 € al año.
-- Se ha corregido un paréntesis final en relación al video (upper(funcion)= 'ENFERMERA' OR upper(funcion))='ENFERMERO' se ha cambiado por
-- (upper(funcion)= 'ENFERMERA' OR upper(funcion)='ENFERMERO') y para ver resultado el límite se ha puesto en 40000, ya que el único enfermero
-- dispone de un salario de 40000
select apellido, funcion, salario from plantilla where (salario >= 25000 and salario <= 40000) and (upper(funcion)= 'ENFERMERA' OR upper(funcion)='ENFERMERO');

-- PREGUNTA #6 - Mostrar, para todos los hospitales, el código de hospital, el nombre completo del hospital y su nombre abreviado de tres letras (a esto podemos llamarlo ABR). Ordenar el resultado por esta abreviatura.
select substr(nombre,1,3) abr, id_hospital, nombre from hospital order by abr;

-- PREGUNTA #7 - Encontrar a todas las enfermeras y enfermeros con indicación del salario mensual de cada uno.
select apellido, salario, salario/12 "SALARIO MENSUAL" from plantilla where upper(funcion) in ('ENFERMERA', 'ENFERMERO');

-- PREGUNTA #8 - Recuperar el número de empleado y nombre de las personas que perciban un salario > que la media de su hospital.
select apellido, id_empleado from plantilla p where salario > (select avg(salario) from plantilla p2 where p2.id_hospital = p.id_hospital);

-- PREGUNTA #9 - Insertar en la tabla PLANTILLA a “Pedro Elguapo” con un salario anual de 30.000 €, número de empleado 1234. Trabaja en el hospital 22, sala2.
insert into plantilla (id_hospital, id_sala, id_empleado, apellido, funcion, turno, salario) VALUES (22,2,1234,'Garcia J.','Enfermero', 'M',30000);

-- OJO!!! Que el id_empleado es un int(2)

-- PREGUNTA #10 - Actualizar al paciente número 74835 la dirección a la calle Alcalá, 411. 
update enfermo set direccion = 'Alcala 411' where id_inscripcion = 12;

select * from enfermo;

-- PREGUNTA #11 - Poner todas las direcciones de la tabla ENFERMO a null. 
update enfermo set direccion = null;

-- PREGUNTA #12 - Igualar la dirección y fecha de nacimiento del paciente 1 a los valores de las columnas correspondientes almacenadas para el paciente 2. 
select direccion, fecha_nac from enfermo where id_inscripcion = 1;

drop table if exists enfermo_new;
create table if not exists enfermo_new like enfermo;
insert into enfermo_new select * from enfermo;

select * from enfermo_new;

update enfermo_new
    set direccion = (select direccion from enfermo where id_inscripcion = 1), fecha_nac = (select fecha_nac from enfermo where id_inscripcion = 1)
    where id_inscripcion = 2;

select direccion, fecha_nac from enfermo where id_inscripcion = 2;


-- PREGUNTA #13 - En todos los hospitales del país se ha recibido un aumento del presupuesto, por lo que se incrementará el número de camas disponibles en un 10%.) 
-- ¿Cómo se haría en SQL? Analizar si es necesario cambiar la estructura de la tabla de HOSPITAL, y en ese caso crear una copia de seguridad de esta, además de hacer el correspondiente ajuste en el número de camas.
create table hospitales2 as select * from hospital;
describe hospitales2;
alter table hospitales2 modify num_cama int(4);
update hospitales2 set num_cama = num_cama + (num_cama*0.1);

-- PREGUNTA #14 - Se va a realizar un programa de consulta de la información sobre enfermos. Los datos por mostrar serán sus apellidos, dirección, fecha de nacimiento y hospital en el que se encuentran. 
-- ¿Qué vista se definirá? ¿Es posible modificar datos a través de la vista anterior?
create view enferm as select e.apellido, e.direccion, e.fecha_nac, h.nombre from enfermo e, hospital h, ocupacion o where e.id_inscripcion = o.id_inscripcion and o.id_hospital = h.id_hospital;
DESCRIBE enferm;

-- PREGUNTA #15 - Obtener un listado que incluya el nombre de cada hospital, las salas, los empleados que trabajan en cada sala, agrupados por categorías profesionales y salarios.
select h.nombre, s.nombre, p.apellido from hospital h, sala s, plantilla p where h.id_hospital = s.id_hospital and h.id_hospital = p.id_hospital and s.id_sala = p.id_sala group by p.funcion, p.salario;

-- PREGUNTA #16 - Obtener el grado de ocupación de cada hospital, es decir, el número de enfermos que hay en cada uno de los hospitales, analizar la ocupación actual por salas 
-- y obtener la diferencia entre la ocupación actual y la ocupación máxima por sala.
select h.nombre, s.nombre, count(o.cama), (h.num_cama - count(o.cama)) from hospital h, sala s, ocupacion o where h.id_hospital = s.id_hospital and o.id_hospital = h.id_hospital and o.id_sala = s.id_sala GROUP BY h.nombre, s.nombre;

-- PREGUNTA #17 - Seleccionar todos los doctores por cada hospital, en el informe deberá aparecer el nombre del hospital y la correspondiente lista de doctores asociados.
select h.nombre, d.apellido from hospital h, doctor d where h.id_hospital = d.id_hospital group by h.nombre, d.apellido;

-- PREGUNTA #18 - Revisad el diagrama relacional planteado y proponed mejoras que repercutan en un mayor conocimiento de doctores asignados a salas y a enfermos:
-- a.	Un doctor podrá pertenecer no solo a uno, a varios hospitales.
-- OK, en la relación definida un doctor puede pertenecer a varios hospitales.

-- b.	Un doctor debe tener asignada una sala (área de especialidad) del hospital.
-- Habría que incluir en la tabla de doctores además del hospital, las salas a las que dan cobertura.

-- c.	Un doctor debe tener asignados enfermos. 
-- Habría que establecer una tabla intermedia entre doctores y enfermos.

-- d.	Un doctor deberá pertenecer a la plantilla del hospital.
-- Habría que ampliar las categorías profesionales, incluyendo la de doctor.

-- PREGUNTA #19 - Sobre el nuevo diagrama relacional planteado y mediante instrucciones SQL plantead las modificaciones en las tablas correspondientes
-- Siguiendo las consideraciones anteriores, TRIVIAL

-- PREGUNTA #20 - Modificar de nuevo, mediante instrucción SQL, de forma que podamos consultar la fecha de incorporación de personal al hospital.
-- TRIVIAL, incluir la fecha de incorporación como campo adicional a la tabla de plantilla. (ALTER TABLE)
