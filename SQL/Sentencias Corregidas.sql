create database mallbit;
use mallbit;

create table cliente(
    IDCliente int(11) not null auto_increment, 
    Nombre varchar(50) not null, 
    Apellido varchar(50) not null,
    FechaNacimiento date not null,
    Correo varchar(100) not null, 
    Identificacion bigint(11) not null unique,
    Telefono bigint(10) not null, 
    Usuario varchar(50) not null, 
    Password varchar(50),
    Puntos int(10) default 0,
    IDGenero int(11),
    Primary Key(IDCliente)
);
create table genero(
    IDGenero int(11) not null, 
    TipoGenero varchar(100) not null, 
    Primary Key(IDGenero)
);
create table compra(
    IDCompra int(11) not null auto_increment, 
    Fecha date not null,
    IDCliente int(11),
    IDPago int(11),
    IDProducto int(11), 
    IDVendedor int(11),
    Primary Key(IDCompra)
);
create table pago(
    IDPago int(11) not null auto_increment,
    NumeroTarjeta int(11) not null,
    CVV int(3) not null,
    Primary Key(IDPago)
);
create table producto(
    IDProducto int(11) not null auto_increment, 
    Nombre varchar(100) not null,
    Precio int not null, 
    Marca varchar(30) not null,
    IDLocal int(11), 
    Descripcion varchar(500) not null,
    NombreImagen varchar(100) not null,
    Stock int(11) not null,
    Puntos int(10) default 0,
    Primary Key(IDProducto)
);
create table categoria(
    IDCategoria int(11) not null auto_increment, 
    TipoCategoria varchar(100) not null, 
    Primary Key(IDCategoria)
);
create table local(
    IDLocal int(11) not null auto_increment, 
    Nombre varchar(100) not null, 
    IDVendedor int(11), 
    Descripcion varchar(500) not null,
    NombreImagen1 varchar(100),
    NombreImagen2 varchar(100),
    IDCategoria int(11),
    Primary Key(IDLocal)
);
create table vendedor(
    IDVendedor int(11) not null auto_increment, 
    Nombre varchar(100) not null,
    Apellido varchar(100) not null, 
    FechaNacimiento date not null, 
    Correo varchar(100) not null, 
    Identificacion bigint(11) not null unique, 
    Telefono bigint(10) not null, 
    Usuario varchar(50) not null, 
    Password varchar(50) not null,
    IDGenero int(11),
    Primary Key(IDVendedor)
);
create table envio(
    IDEnvio int(11) not null auto_increment, 
    FechaEnvio date not null,  
    IDEstado int(11), 
    IDCompra int(11), 
    IDVendedor int(11), 
    Primary Key(IDEnvio)
);
create table estado(
    IDEstado int(11) not null auto_increment, 
    TipoEstado varchar(100) not null, 
    Primary Key(IDEstado)
);
create table administrador(
    IDAdministrador int(11) not null auto_increment, 
    Nombre varchar(100) not null,
    Apellido varchar(100) not null, 
    FechaNacimiento date not null, 
    Correo varchar(100) not null, 
    Identificacion bigint(11) not null unique, 
    Telefono bigint(10) not null, 
    Usuario varchar(50) not null, 
    Password varchar(50) not null,
    IDGenero int(11),
    Primary Key(IDAdministrador)
);
create table premio(
    IDPremio int(11) not null auto_increment, 
    Nombre varchar(100) not null, 
    Descripcion varchar(500) not null,
    NombreImagen varchar(100) not null,
    Puntos int(10) not null,
    IDAdministrador int(11), 
    Primary Key(IDPremio)
);
create table cliente_premio(
    IDPremio int(11), 
    IDCliente int(11), 
    Primary Key(IDPremio, IDCliente)
);

--Insert Generos;
insert into genero(IDGenero, TipoGenero) 
    values(1, "Masculino");
insert into genero(IDGenero, TipoGenero)
    values(2, "Femenino");

--Insert estados;
insert into estado(TipoEstado) 
values("Despachado");
insert into estado(TipoEstado) 
values("Entregado");
    
--Insert categoría;
insert into categoria (TipoCategoria) values ('Entretenimiento');
insert into categoria (TipoCategoria) values ('Tecnología');
insert into categoria (TipoCategoria) values ('Hogar');
insert into categoria (TipoCategoria) values ('Belleza');
insert into categoria (TipoCategoria) values ('Infantil');
insert into categoria (TipoCategoria) values ('Comida');

	--Insert local;
	INSERT INTO local (Nombre, IDVendedor, Descripcion, NombreImagen1, IDCategoria) VALUES
		("Sony", 1, "Empresa multinacional y uno de los fabricantes más importantes a nivel mundial en electrónica", "images/Locales/prueba.png", 1),
		("Microsoft", 2, "Empresa multinacional dedicada al sector del software y el hardware", "images/Locales/prueba.png", 1),
		("Panamericána", 3, "Cadena de almacenes especializada en la venta de libros, papelería y artículos tecnológicos", "images/Locales/prueba.png", 1),
		("Samsung", 4, "Empresa Multinacional", "images/Locales/prueba.png", 2),
		("Nikon", 4, "Empresa multinacional dedicada al sector de la fotografía y de la óptica.", "images/Locales/prueba.png", 2),
		("Genius", 5, "Empresa multinacional dedicada a la fabrica de periféricos para computadora", "images/Locales/prueba.png", 2),
		("Homecenter", 5, "Empresa multinacional dedicada al comercio de la construcción, ferretería y mejoramiento del hogar", "images/Locales/prueba.png", 3),
		("Konfort", 6, "Empresa dedicada al comercio de muebles, tapeteria y carpinteria del Hogar", "images/Locales/prueba.png", 3),
		("Nivea", 7, "Empresa de productos cosméticos", "images/Locales/prueba.png", 4),
		("Yanbal", 8, "Empresa multinacional de fabricación y venta de productos de belleza y cosméticos", "images/Locales/prueba.png", 4),
		("Lego", 9, "Empresa y marca de juguetes", "images/Locales/prueba.png", 5),
		("Hasbro", 10, "Empresa de Jugueteria", "images/Locales/prueba.png", 5),
		("McDonald´s", 11, "Cadena de restaurantes de comida rápida", "images/Locales/prueba.png", 6),
		("WOK", 11, "Cadena de restaurantes dedicado a la comida asiática", "images/Locales/prueba.png", 6);
	COMMIT;


	--Insert producto;
	INSERT INTO producto (Nombre, Precio, Marca, IDLocal, Descripcion, NombreImagen, Stock) VALUES
		("Samsung Galaxy Note 7", 2000000, "Samsung", 4, "Explota.","images/Productos/prueba.png", 10),
		("Consola PS4 Pro", 1400000, "Sony", 1, "Consola Videojuegos.","images/Productos/prueba.png", 3),
		("Televisor X94E", 4000000, "Sony", 1, "Televisión 4K.","images/Productos/prueba.png", 0),
		("Consola Xbox One X", 1800000, "Microsoft", 2, "Consola Videojuegos.","images/Productos/prueba.png", 1000),
		("Office 365", 200000, "Microsoft", 2, "Licencia Office.","images/Productos/prueba.png", 10),
		("Wigetta", 20000, "Editorial", 3, "Libro para Mkas.","images/Productos/prueba.png", 100),
		("Joycon", 300000, "Nintendo", 3, "Control Nintendo Switch.","images/Productos/prueba.png", 1),
		("Samsung Galaxy J7", 850000, "Sony", 4, "Celular Samsung.","images/Productos/prueba.png", 0),
		("D3400", 1200000, "Nikon", 5, "Cámara Profesional.","images/Productos/prueba.png", 34),
		("Lente 35mm", 620000, "Nikon", 5, "Lente Cámaras.","images/Productos/prueba.png", 22),
		("Mouse DX-110", 20000, "Genius", 6, "Mouse Inalámbrico.","images/Productos/prueba.png", 12),
		("Teclado K220", 42000, "Genius", 6, "Teclado Gamer.","images/Productos/prueba.png", 8),
		("Puerta", 88000, "Homecenter", 7, "Puerta de Madera.","images/Productos/prueba.png", 4),
		("Madera Pino", 20000, "Homecenter", 7, "Madera de Pino de 2x2.","images/Productos/prueba.png", 19),
		("Silla de Ruedas", 1100000, "Konfort", 8, "Silla de Ruedas Reclinable.","images/Productos/prueba.png", 12),
		("Sanitario", 127000, "Konfort", 8, "Eleva Sanitario con COnfort.","images/Productos/prueba.png", 11),
		("Bloqueador Fps 60", 25000, "Nivea", 9, "Bloqueador Sun Fps 60.","images/Productos/prueba.png", 7),
		("Crema Anti-Arrugas", 13000, "Nivea", 9, "Crema cuidado de la Piel.","images/Productos/prueba.png", 5),
		("Perfume", 57000, "Yanbal", 10, "Perfume para Hombre.","images/Productos/prueba.png", 16),
		("Bloqueador Total Block Fps 100", 33000, "Yanbal", 10, "Bloqueador Solar.","images/Productos/prueba.png", 6),
		("Torre Eiffel Lego", 190000, "Lego", 11, "Torre Eiffel para Montar en Lego.","images/Productos/prueba.png", 4),
		("Ladrillos Creativos Lego", 90000, "Lego", 11, "Conjunto Ladrillos Lego.","images/Productos/prueba.png", 12),
		("Que dijo", 118000, "Hasbro", 12, "Juego de Mesa.","images/Productos/prueba.png", 7),
		("Reloj Yo-Kai Watch", 149000, "Hasbro", 12, "Reloj con Motivo de Yo-Kai Watch.","images/Productos/prueba.png", 120),
		("Hamburguesa Doble Carnes", 10000, "McDonald´s", 13, "Hamburguesa McDonald´s.","images/Productos/prueba.png", 1000),
		("Cajita Feliz Pokemon", 13000, "McDonald´s", 13, "Cajita Feliz con Motivo de Pokemon.","images/Productos/prueba.png", 1000),
		("Ramen", 20000, "WOK", 14, "Ramen con Carne de Cerdo.","images/Productos/prueba.png", 1),
		("Arroz Chino", 27000, "WOK", 14, "Arroz Chino con Verduras.","images/Productos/prueba.png", 4);
	COMMIT;

	--Insert Vendedor;
	INSERT INTO vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero) VALUES
		("Robinson","Muñoz","1979-10-31","Romu@gmail.com",1078097326, 3123352714, "RoMuñoz", "1234", 1),
		("Bryan","Rovira","1995-01-21","ElBrayan@gmail.com",1054097421, 3133451298, "Brianxhito", "Yurani", 1),
		("Pablina","Escobar","1989-04-22","Pabli@unisabana.edu.co",1078095326, 3123352714, "PabliEsco", "Coca", 2),
		("Anaximandro","Cubiculos","1999-03-16","AnaxiCu@gmail.com",1054367410, 3112345678, "Dunkleosteus", "SienMishas", 1),
		("James","Rodríguez","1950-12-03","CalvoHpta@yopmail.com",108567345, 3102340100, "Yeimz", "Zizu", 1),
		("Amparo","Grisales","1720-02-29","Inmortal@hotmail.com", 1, 3156054328, "Amparito", "SoyInmortal", 2),
		("Cristiano","Ronaldo","1999-12-31","ElBixho@gmailcom", 1066666567, 3114546500, "ElBixho", "Pichichi", 1),
		("Alexandra","Morganela","2012-08-14","Alexitha@yahoo.com.co", 1034223456, 3156574345, "Alexa", "Bliss", 2),
		("Barack","Obama","1965-05-13","MrPresident@yahoo.com.us", 1067959453, 3144093021, "DelaCasaBlanca", "Ste_Trump", 1),
		("Manola","Uribita","1993-01-01","LaManola@hotmail.com", 1027845666, 3177727475, "#SoyManolaaaa", "Bibaeldotoruribe", 2),
		("Donald","Trump","1930-06-09","BestPresident@trump.mx", 1099845631, 3124322212, "ElPatoDonald", "JodeteObamaVivaelMuro", 1);
	COMMIT;


--Relación llaves foráneas;
alter table producto add foreign key(IDLocal) references local(IDLocal) ON DELETE CASCADE;
alter table local add foreign key(IDCategoria) references categoria(IDCategoria) ON DELETE CASCADE;
alter table local add foreign key(IDVendedor) references vendedor(IDVendedor) ON DELETE CASCADE;
alter table compra add foreign key(IDPago) references pago(IDPago) ON DELETE CASCADE;
alter table compra add foreign key(IDCliente) references cliente(IDCliente) ON DELETE CASCADE;
alter table compra add foreign key(IDProducto) references producto(IDProducto) ON DELETE CASCADE;
alter table compra add foreign key(IDVendedor) references vendedor(IDVendedor) ON DELETE CASCADE;
alter table envio add foreign key(IDEstado) references estado(IDEstado) ON DELETE CASCADE;
alter table envio add foreign key(IDCompra) references compra(IDCompra) ON DELETE CASCADE;
alter table cliente add foreign key(IDGenero) references genero(IDGenero) ON DELETE CASCADE;
alter table Vendedor add foreign key(IDGenero) references genero(IDGenero) ON DELETE CASCADE;
alter table premio add foreign key(IDAdministrador) references administrador(IDAdministrador) ON DELETE CASCADE;
alter table cliente_premio add foreign key(IDCliente) references cliente(IDCliente);
alter table cliente_premio add foreign key(IDPremio) references premio(IDPremio);
