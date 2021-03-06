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
    Puntos int(10),
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
    IDPago int(11), 
    IDCliente int(11),
    IDProducto int(11), 
    Primary Key(IDCompra)
);
create table producto(
    IDProducto int(11) not null auto_increment, 
    Nombre varchar(100) not null,
    Precio int not null, 
    IDLocal int(11), 
    Descripcion varchar(100) not null,
    NombreImagenPrimaria varchar(100),
    NombreImagenSecundaria varchar(100),
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
    Descripcion varchar(100) not null,
    NombreImagenPrimaria varchar(100),
    NombreImagenSecundaria varchar(100),
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
    Descripcion varchar(100) not null, 
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
create table pago(
    IDPago int(11) not null auto_increment,
    NumTarjeta bigint(16) not null, 
    FechaPago date not null, 
    CVV int(3) not null,
    Nombre varchar(100) not null,
    Apellido varchar(100) not null,
    Primary Key(IDPago)
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
    Puntos int(10) not null,
    IDAdministrador int(11), 
    Primary Key(IDPremio)
);
create table cliente_premio(
    IDPremio int(11), 
    IDCliente int(11), 
    Primary Key(IDPremio, IDCliente)
);

--Relación llaves foráneas;
alter table producto add foreign key(IDLocal) references local(IDLocal) ON DELETE CASCADE;
alter table local add foreign key(IDCategoria) references categoria(IDCategoria) ON DELETE CASCADE;
alter table local add foreign key(IDVendedor) references vendedor(IDVendedor) ON DELETE CASCADE;
alter table compra add foreign key(IDPago) references pago(IDPago) ON DELETE CASCADE;
alter table compra add foreign key(IDCliente) references cliente(IDCliente) ON DELETE CASCADE;
alter table compra add foreign key(IDProducto) references producto(IDProducto) ON DELETE CASCADE;
alter table envio add foreign key(IDEstado) references estado(IDEstado) ON DELETE CASCADE;
alter table envio add foreign key(IDCompra) references compra(IDCompra) ON DELETE CASCADE;
alter table envio add foreign key(IDVendedor) references vendedor(IDVendedor) ON DELETE CASCADE;
alter table cliente add foreign key(IDGenero) references genero(IDGenero) ON DELETE CASCADE;
alter table Vendedor add foreign key(IDGenero) references genero(IDGenero) ON DELETE CASCADE;
alter table premio add foreign key(IDAdministrador) references administrador(IDAdministrador) ON DELETE CASCADE;
alter table cliente_premio add foreign key(IDCliente) references cliente(IDCliente);
alter table cliente_premio add foreign key(IDPremio) references premio(IDPremio);

--Insert Generos;
insert into genero(IDGenero, TipoGenero) 
    values(1, "Masculino");
insert into genero(IDGenero, TipoGenero)
    values(2, "Femenino");

--Insert clientes;
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Carlos","Casas","1940-9-29","campas@gmail.com",10657389915, 3023545271, "CarlosCA", "5687", 1);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Sandra","Cardenas","1968-10-30","sara@gmail.com",10357339925, 3213585231, "SandraCA", "5847", 2);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Pedro","Bromfman","1987-1-15","pedrobr@gmail.com",10725379324, 3223555471, "PedroBr", "1367", 1);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Valeria","Ferreira","1981-7-20","valers@gmail.com",14725373324, 3222545731, "ValeFE", "6717", 2);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Juaquin","Sanchez","1952-1-15","juaquinsa@gmail.com",52161683, 3127293628, "JuaquinSan", "6182", 1);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Ana","Cordoba","1961-10-26","anaco@hotmail.com",10371369227, 3243687481, "AnaCO", "5967", 2);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Sara","Pedroza","1952-8-16","sarape@gmail.com",35536982, 3173535911, "SaraPe", "7592", 2);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Camilo","Bustos","1989-2-23","camilobu@gmail.com",1073525507, 3140373291, "CamiloBu", "8620", 1);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Cristofer","Hernandez","1948-9-8","cristoferhe@gmail.com",1073467829, 3140373291, "CristoferHe", "1660", 1);
insert into cliente(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Sandra","Cristancho","1950-11-30","sandracr@gmail.com",1078205462, 319748294, "SandraCri", "7167", 2);

--Insert Vendedores;
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Fabian","Perez","1969-10-31","fape@gmail.com",1078097326, 3123352714, "FabianPe", "1234", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Cesar","Sanchez","1980-12-22","cesa@hotmail.com",1077954878, 3188963537, "CesarSa", "1235", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Cristina","Ochoa","1973-11-01","croc@hotmail.com",1070384676, 3186352611, "CristinaOc", "1236", 2);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Melanie","Velandia","1950-02-28","meve@hotmail.com",1076014610, 3168815381, "MelanieVe", "1237", 2);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Marina","Martinez","1978-01-01","mama@gmail.com",1078123039, 3190156246, "MarinaVe", "1238", 2);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Rodrigo","Buitrago","1972-03-13","robu@gmail.com",1073202423, 3100276490, "RodrigoBu", "1239", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Jairo","Quintero","1990-04-21","jaqu@hotmail.com",1070241968, 3121708606, "JairoQu", "1240", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("David","Beltran","1981-06-11","dave@hotmail.com",1078462991, 3140600423, "DavidBe", "1241", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Nicolas","Wills","1967-09-21","niwi@gmail.com",1073451971, 3169895465, "NicolasWi", "1242", 1);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Bernarda","Leon","1988-08-07","bewe@hotmail.com",1074245022, 3130990362, "BernardaLe", "1243", 2);

--Insert Administradores;
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Heidy","Leon","1989-11-21","hele@gmail.com",1078097321, 3121352714, "HeidyLe", "2234", 2);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Carlos","Ramos","1960-02-02","cara@gmail.com",1077954872, 3182963537, "CarlosRa", "2235", 1);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Gabriel","Montoya","1983-05-27","gamo@hotmail.com",1070384673, 3183352611, "GabrielMo", "2236", 1);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Adriana","Otalora","1989-06-13","adot@hotmail.com",1076014614, 3164815381, "AdrianaOt", "2237", 2);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Jhonatan","Cubillos","1990-12-25","jhcu@gmail.com",1078123035, 3195156246, "JhonatanCu", "2238", 1);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Vivian","Cetina","1991-03-16","vice@gmail.com",1073202426, 3106276490, "VivianCe", "2239", 2);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Ulises","Gacharna","1986-10-22","ulga@hotmail.com",1070241967, 3127708606, "UlisesGa", "2240", 1);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Pedro","Cortes","1979-07-06","peco@hotmail.com",1078462998, 3148600423, "PedroCo", "2241", 1);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Yamile","Moreno","1990-01-31","yamo@hotmail.com",1073451979, 3169995465, "YamileMo", "2242", 2);
insert into administrador(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Emilio","Bernal","1987-02-12","embe@gmail.com",1074245020, 3130090362, "EmilioBe", "2243", 1);


--Insert premios;
insert into premio(Nombre, Descripcion, Puntos) values(
    'Ford Ecosport 2.0 L Mt 2000cc 4x2', 
    'La Ford EcoSport resulta muy ágil en condiciones 
    de manejo exigente dentro y fuera de la ciudad. Lo 
    anterior se da gracias a su acertada combinación entre 
    un tamaño exterior compacto y un excelente rendimiento.',
    100000
);
insert into premio(Nombre, Descripcion, Puntos) values(
    'Moto Harley-davidson Dyna Street Bob Modelo 2017', 
    'La Harley-Davidson Dyna Street Bob es el modelo más 
    esencial de la Dyna, lo que la convierte en la bobber 
    por excelencia de la firma de Milwaukee. ', 
    90000
);
insert into premio(Nombre, Descripcion, Puntos) values(
    'Viaje San Andrés', 
    'Disfruta de un viaje a la hermosa isla de San Andrés, 
    un paraiso en tierras Colombianas, rodeada por una formación 
    coralina y un collar de arrecifes de una belleza incomparable ', 
    80000
);
insert into premio(Nombre, Descripcion, Puntos) values(
    'Alienware - Aurora R6 Desktop', 
    'Alienware Aurora desktop computer. Its 1TB hard 
    drive is preloaded with Windows 10 Home for 
    compatibility with popular programs, and it includes
    an NVIDIA GeForce GTX 1070 graphics card for detailed
    images. This Dell Alienware Aurora desktop computer 
    has a quad-core Intel i7 processor and 16GB of DDR4 
    RAM for fast operation.', 
    70000
);

--Insert estados;
insert into estado(TipoEstado) 
values("Despachado");
insert into estado(TipoEstado) 
values("Entregado");

--Insert cliente_premio;
insert into cliente_premio(IDCliente, IDPremio) values(1,4);
insert into cliente_premio(IDCliente, IDPremio) values(1,1);
insert into cliente_premio(IDCliente, IDPremio) values(7,2);
insert into cliente_premio(IDCliente, IDPremio) values(3,3);
insert into cliente_premio(IDCliente, IDPremio) values(6,4);

--Insert estados;
insert into estado(TipoEstado) 
values("Despachado");
insert into estado(TipoEstado) 
values("Entregado");

--Insert compra;
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 1, 10, 4);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 2, 9, 3);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 3, 8, 2);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 4, 7, 1);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 5, 6, 10);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 6, 5, 9);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 7, 4, 8);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 8, 3, 7);
--Nuevos registros de compra;
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 6, 1, 4);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 7, 9, 2);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 5, 1, 9);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 7, 3, 4);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 7, 7, 7);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 4, 7, 1);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 3, 3, 3);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 1, 1, 1);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 2, 8, 3);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 4, 8, 3);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 3, 8, 3);
		
--Insert pago;	
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 445840501244, "2016-05-04", 652,"Sandra","Cristancho");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 491840001234, "2016-05-10", 678,"Cristofer","Hernandez");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 491110501344, "2016-05-09", 677,"Camilo","Bustos");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 461950031434, "2015-05-09", 320,"Jose","Hernandez");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 521740401534, "2016-04-10", 338,"Ana","Cordoba");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 471847501774, "2016-03-08", 478,"Juaquin","Sanchez");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 491440601784, "2017-07-17", 448,"Valeria","Ferreira");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 411770441454, "2017-05-01", 645,"Hector","Gaviria");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 481710501374, "2017-04-14", 154,"Juan","Cremades");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 421845501234, "2016-12-31", 354,"Diego","Acosta");
insert into pago( NumTarjeta, FechaPago, CVV, Nombre, Apellido)
    values ( 477740548124, "2016-11-11", 369,"Carlos","Casas");
    
--Insert categoría;
insert into categoria (TipoCategoria) values ('Entretenimiento');
insert into categoria (TipoCategoria) values ('Tecnología');
insert into categoria (TipoCategoria) values ('Hogar');
insert into categoria (TipoCategoria) values ('Belleza');
insert into categoria (TipoCategoria) values ('Infantil');
insert into categoria (TipoCategoria) values ('Comida');

--Insert local;
<<<<<<< HEAD
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Exxo",1,"Tienda de Variedades",1);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Wartzila",2,"Tienda de Tecnologia",2);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Rockacho",3,"Tienda de Musica",5);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Andres Carne de Res",4,"Tienda de Comida",3);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Microsoft",5,"Tienda de Tecnologia",4);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Zara",6,"Tienda de Ropa",2);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Arturo Calle",7,"Tienda de Ropa",4);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Adidas",8,"Tienda de Calzado",6);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("KFC",9,"Tienda de Comida",6);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Presto",10,"Tienda de Comida",1);
=======
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Exxo",1,"Tienda de Variedades");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Wartzila",2,"Tienda de Tecnologia");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Rockacho",3,"Tienda de Musica");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Andres Carne de Res",4,"Tienda de Comida");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Matel",5,"Tienda de Tecnologia");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Zara",6,"Tienda de Ropa");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Arturo Calle",7,"Tienda de Ropa");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("Adidas",8,"Tienda de Calzado");
INSERT INTO local(Nombre, IDVendedor, Descripcion) VALUES("KFC",9,"Tienda de Comida")
>>>>>>> registro-consulta-sql

--Insert producto;
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Televisor', '450000', 1, 'Televisor marca Sony con pantalla led de alta definición' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Secador para cabello', '82000', 2,'Secador para cabello marca Nova, grande con reductor de consumo de energía' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Consola X-BOX One', '950000', 3,'Consola X-BOX ONE CON 500 GB de memoria, un control más cable HDMI' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Comedor', '1250000', 4, 'Comedor para 5 personas en pino' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Set de lego', '35000', 5,'Set de lego 450 piezas' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Smartphone', '622000', 6, 'Teléfono inteligente marca samsumg con última versión Android' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Esmalte', '20000', 7, 'Esmalte Amarillo pequeño' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Alfombra', '200000', 8,'Alfombra persa grande color Rojo' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Tetero', '12000', 9, 'Tetero marca Ruby 250 ml' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Guitarra Eléctrica', '649000', 10, 'Guitarra Eléctrica marca Frico 6 cuerdas color variado' );

--Insert compra;
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 1, 10, 4);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 2, 9, 3);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 3, 8, 2);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 4, 7, 1);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 5, 6, 10);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 6, 5, 9);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 7, 4, 0);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 8, 3, 7);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 9, 2, 6);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 10, 1, 5);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 10, 1, 5);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 10, 1, 7);
insert into compra( IDPago, IDCliente, IDProducto)
    values ( 10, 1, 5);
	


--Insert envio;
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-09-30","Producto de Limpieza de Ultima Generación", 1, 1, 1);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-07-16","Producto Inflamable Marca Acme",2,2,2);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-07-09","Consola de Sobremesa",2,3,3);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-10-15","Equipo de Computación Cuántica",1,4,4);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2016-02-01","Soldadora Industrial",1,5,5);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-05-31","Ropa Deportiva",1,6,6);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-09-01","Producto de Aseo",2,7,7);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-03-31","Equipo de Gimnasia",2,8,8);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-02-15","Consola de Videojuegos",2,9,9);
INSERT INTO envio (FechaEnvio, Descripcion, IDEstado, IDCompra, IDVendedor) VALUES ("2017-11-30","Equipo de Sonido Stereo",1,10,10);
