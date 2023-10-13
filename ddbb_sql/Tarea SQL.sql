-- 1. Crear mediante instrucciones SQL las entidades de acuerdo con el modelo relacional definido

Create database Tarea;
use Tarea;

Create Table Categorias (
					  Categoria varchar(20),
                      VolCompra int,
                      Descuento float,
                      Primary key (Categoria)
);
Create Table Tienda (
                      IDTienda varchar(25),
                      LimCredito int,
                      Nombre varchar(50),
                      Categoria varchar(20),
                      Primary key (IDTienda),
                      foreign key (Categoria) References Categorias(Categoria)
);

Create Table Direcciones (
					   Direccion varchar(60),
                       Poblacion varchar(30),
                       Ciudad varchar(30),
                       Telefono varchar(10),
                       email varchar(30),
                       IDTienda varchar(25),
                       Primary key (Direccion),
                       Foreign key (IDTienda) References Tienda(IDTienda)
);

Create table Proveedores (
						IDProveedor varchar(20),
                        DireccionP varchar(60),
                        Poblacion varchar(30),
                        Ciudad varchar(30),
                        Telefono varchar(10),
                        email varchar(30),
                        primary key (IDProveedor)
);
Create table Pedidos (
					   CodPedido varchar(20),
                       Fecha Datetime,
                       Mayorista varchar(50),
                       DireccionEntrega varchar(60),
                       IDTienda varchar(25),
                       IDProveedor varchar(20),
                       Primary key (CodPedido),
                       Foreign key (DireccionEntrega) References Direcciones(Direccion),
                       Foreign key (IDTienda) References Tienda(IDTienda),
                       Foreign key (IDProveedor) references Proveedores(IDProveedor)
);

Create Table Articulos (
					   IDArticulo varchar(20),
                       Precio float,
                       Descripcion varchar(50),
                       primary key(IDArticulo)
);

Create table LineasDePedido (
                       CantidadUnidades int,
                       Importe float, 
                       Articulo varchar(20),
                       CodPedido varchar(20),
                       Primary key(CodPedido, Articulo),
                       foreign key (Articulo) references Articulos(IDArticulo),
                       foreign key (CodPedido) references Pedidos(CodPedido)
);

Describe articulos;
Describe categorias;
Describe direcciones;
Describe pedidos;
Describe lineasdepedido;
Describe proveedores;
Describe tienda;

-- 2. Utilizar la instrucción SQL de inserción de datos para insertar una fila en la tabla de pedidos

insert into Categorias values("C1", 50000, 0.2);
insert into Categorias values("C2", 25000, 0.15);
insert into Categorias values("C3", 15000, 0.07);
select * From Categorias;
insert into Tienda values("007", 24999.99, "Agencia 007", "C1");
insert into Tienda values("028", 20000.05, "La Tiendita", "C2");
insert into Tienda values("102", 19500.00, "Zapatitos", "C3");
select * From Tienda;
insert into Direcciones values("Calle Maria de Molina 42", "Barrio de Salamanca", "Madrid", "630008107", "ag007@tiendas.com", "007");
insert into Direcciones values("Calle Ros de Olano 42", "Chamartin", "Madrid", "920563545", "ag007@tiendas.com", "007");
insert into Direcciones values("Calle de Torija", "Centro", "Madrid", "930508307", "Tiendita@tiendas.com", "028");
insert into Direcciones values("Calle de Lagasca", "Castellana", "Madrid", "950868307", "Zapatitos@tiendas.com", "102");
select * From Direcciones;
insert into Proveedores values("M-37", "Calle San Eugenio, 10", "Getafe", "Madrid", "660642185", "Merk@proveedor.com");
insert into Proveedores values("M-43", "Calle la Huerta, 12", "Alcoron", "Madrid", "963642185", "Info@dhl.com");
Select * From Proveedores;

insert into Pedidos (CodPedido, Fecha, Mayorista, DireccionEntrega, IDTienda, IDProveedor)
		values ("MF17", "2022-07-19 07:30:00", "FLC S.A", "Calle Maria de Molina 42", "007", "M-37");
insert into Pedidos values ("MF19", "2022-03-12 10:32:00", "FLC S.A", "Calle Ros de Olano 42", "007", "M-43");
insert into Pedidos values ("MF06", "2021-04-15 09:12:50", "FLC S.A", "Calle Ros de Olano 42", "007", "M-37");
insert into Pedidos values ("MF15", "2022-10-18 14:15:00", "FLC S.A", "Calle de Torija", "028", "M-43");
insert into Pedidos values ("MF37", "2022-09-22 14:15:00", "FLC S.A", "Calle de Torija", "028", "M-37");
insert into Pedidos values ("MF18", "2022-10-25 15:25:10", "FLC S.A", "Calle de Lagasca", "102", "M-43");
insert into Pedidos values ("MF05", "2021-09-23 10:05:00", "FLC S.A", "Calle de Lagasca", "102", "M-43");
Select * from Pedidos;
insert into Articulos values("8107", 57.5, "Zapatillas negras");
insert into Articulos values("8119", 63, "Zapatillas verdes");
insert into Articulos values("8216", 27, "Sandalias Rosa");
insert into Articulos values("8300", 37, "Botines Satin");
select * from Articulos;
insert into LineasDePedido values(5, 287.5, "8107", "MF17");
insert into LineasDePedido values(7, 441.0, "8119", "MF17");
insert into LineasDePedido values(2, 54.0, "8216", "MF17");
insert into LineasDePedido values(16, 592.0, "8300", "MF15");
insert into LineasDePedido values(7, 441.0, "8119", "MF15");
insert into LineasDePedido values(9, 567.1, "8119", "MF19");
insert into LineasDePedido values(12, 690.0, "8107", "MF37");
insert into LineasDePedido values(17, 629.0, "8300", "MF06");
insert into LineasDePedido values(10, 270, "8216", "MF18");
insert into LineasDePedido values(13, 747.5, "8107", "MF05");
select * from LineasDePedido;

-- 3. Visualizar mediante una instrucción SQL todas las tiendas que componen la red de distribución de la fábrica

Select Tienda.Nombre as Nombre, concat(Direccion, ", ", Poblacion, ", ",Ciudad) as Direccion, 
	   Tienda.Categoria, Tienda.LimCredito as LimCredito, Categorias.Descuento as Descuento
From Tienda
Join Direcciones on Direcciones.IDTienda = Tienda.IDTienda
Join Categorias on Categorias.Categoria = Tienda.Categoria; 

 -- 4. Visualizar mediante una instrucción SQL los pedidos suministrados a cada una de las tiendas en un período determinado
 
 Select Tienda.Nombre as NombreDeTienda, Pedidos.CodPedido, Pedidos.Fecha as Fecha, concat(DireccionEntrega, ", ", Poblacion, ", ", ciudad) as DireccionEntrega, 
 truncate(sum(LineasDePedido.Importe),1) as ImporteTotal
 From Pedidos
 Join LineasDePedido on LineasDePedido.CodPedido = Pedidos.CodPedido
 Join Tienda on Tienda.IDTienda = Pedidos.IDTienda
 Join Direcciones on Direcciones.Direccion = Pedidos.Direccionentrega
 Where Fecha > now() - interval 12 month
 Group by CodPedido;
 
 -- 5. Identificar los repartos realizados por cada uno de los proveedores destinados a ello
 
 Select Proveedores.IDProveedor, concat(DireccionP, ", ", Poblacion, ", ", Ciudad), Pedidos.CodPedido, group_concat(LineasDepedido.Articulo) as Articulos
 From Proveedores
 Join Pedidos on Pedidos.IDProveedor = Proveedores.IDProveedor
 Join Lineasdepedido on Lineasdepedido.CodPedido = Pedidos.CodPedido
 Group by Pedidos.CodPedido
 Order by IDProveedor;
 
 -- 6. Totalizar los repartos anuales realizados por cada proveedor de reparto.
 
Select Proveedores.IDProveedor, extract(year from Fecha) as Year, count(Pedidos.CodPedido) as PedidosAnuales, truncate(sum(importe),1) as ImporteAnual
From Proveedores
Join Pedidos on Pedidos.IDProveedor = Proveedores.IDProveedor
Join Lineasdepedido on Lineasdepedido.CodPedido = Pedidos.CodPedido
Group by IDProveedor, year;

-- 7. Identificar los cambios a realizar en el modelo relacional y en BBDD para clasificar a los proveedores de reparto en categorías

Create table CategoriasProveedor (
								CategoriaP varchar(20),
								VolVenta int,
								Descuento float,
								Primary key (CategoriaP)
);

Alter table Proveedores 
Add column Categoria varchar(20);
Alter table Proveedores
Add foreign key (Categoria) references CategoriasProveedor (CategoriaP); 
Describe Proveedores;

Insert into CategoriasProveedor values ("CP1", 50000, 0.25);
Insert into CategoriasProveedor values ("CP2", 25000, 0.10);
select * from CategoriasProveedor;

Update proveedores Set Categoria = "CP1"
where IDProveedor = "M-37";
Update Proveedores Set Categoria = "CP2" 
where IDProveedor = "M-43";
Select * from proveedores;


-- 8. Introducir nuevos atributos en la tabla de artículos, la fábrica ha descubierto que puede comprar un artículo de parecidas características al nuestro y distribuirlo como marca blanca.

Alter table Articulos
Add column MarcaBlanca varchar(3); 

Insert into Articulos values ("6350", 43, "Zapatillas negrasB", "Yes"),
							 ("6319", 46.8, "Zapatillas Olivo", "Yes"),
                             ("6300", 23, "Botines Beige", "Yes"),
                             ("6316", 18, "Sandalias Mosqueta", "Yes");

Update Articulos set MarcaBlanca = "No"
where MarcaBlanca is Null; 

Select * from Articulos;


-- 9. Queremos ampliar la información del proveedor de suministro, para ello necesitaríamos incorporar los datos relativos a las zonas de cobertura de este

Create Table ZonasProveedores (
							ZonaCobertura varchar(20),
                            Pais varchar(50),
                            Region varchar(50),
                            Primary key(ZonaCobertura)
);
Describe zonasproveedores;

Alter table Proveedores
Add column ZonaCobertura varchar(20);
Alter table Proveedores
Add foreign key(ZonaCobertura) references ZonasProveedores(Zonacobertura);
Describe Proveedores;

insert into ZonasProveedores values ("Centro-España", "España", "Comunidad de Madrid"),
									("Este-España", "España", "Cataluña"),
                                    ("Centro-Italia", "Italia","Roma");
Select * from ZonasProveedores;

insert into Proveedores values("M-71", "Calle Cervantes, 22", "Badalona", "Barcelona", "972642785", "pedidos@entregas.com","CP1","Este-España"),
							  ("M-18", "Via Angelo Poliziano, 16", "San Lorenzo", "Roma", "26164185", "ayuda@UPS.com","CP2","Centro-Italia");
Update Proveedores set ZonaCobertura = "Centro-España"
where ZonaCobertura is Null;

Select * from proveedores;

-- 10. ¿Qué podríamos hacer para realizar un backup de la tabla de pedidos / líneas de pedido? Hacer todos los días un proceso de backup a otra Base de Datos para pedidos, líneas de pedido.

Create database Backup; 

create table Backup.Backup_Pedidos like pedidos;
create table backup.Backup_LineasPedido like lineasdepedido;

Describe backup.backup_pedidos;
Describe backup.backup_lineaspedido;

insert into backup.backup_pedidos select * from pedidos;
insert into backup.backup_lineaspedido select * from lineasdepedido;
select * from backup.backup_pedidos;
select * from backup.backup_lineaspedido;

insert into Pedidos values 
	("MF71", "2022-10-26 12:05:00", "FLC S.A", "Calle Ros de Olano 42", "007", "M-37");
insert into LineasDePedido values(7, 189, "8216", "MF71");
insert into Pedidos values 
	("MF91", "2022-10-26 12:27:00", "FLC S.A", "Calle Ros de Olano 42", "007", "M-43");
insert into LineasDePedido values(7, 189, "8216", "MF91");

Create event backup.Backup_diario on schedule every 1 day
Starts now()
do
insert into backup.backup_pedidos select * from tarea.pedidos
where date_format(tarea.pedidos.fecha, "%y-%m-%d") = current_date();

Create event backup.Backup_LP_Diario on schedule every 1 day
starts now()
do
insert into backup.backup_lineaspedido
select CantidadUnidades, Importe, Articulo, lineasdepedido.CodPedido from tarea.lineasdepedido
join tarea.pedidos on tarea.lineasdepedido.codpedido = tarea.pedidos.codpedido
where date_format(tarea.pedidos.fecha, "%y-%m-%d") = current_date();

select * from backup.backup_lineaspedido;
select * from backup.backup_pedidos;
