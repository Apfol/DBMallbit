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
    Fecha date not null,
    IDCliente int(11),
    IDPago int(11),
    IDProducto int(11), 
    IDVendedor int(11),
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
alter table compra add foreign key(IDVendedor) references vendedor(IDVendedor) ON DELETE CASCADE;
alter table envio add foreign key(IDEstado) references estado(IDEstado) ON DELETE CASCADE;
alter table envio add foreign key(IDCompra) references compra(IDCompra) ON DELETE CASCADE;
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
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Ana","Mendoza","1957-03-22","anme@gmail.com",1076658991, 3139254652, "AnaMe", "1244", 2);
insert into vendedor(Nombre, Apellido, FechaNacimiento, Correo, Identificacion, Telefono, Usuario, Password, IDGenero)
    values ("Andres","Quintanilla","1976-02-25","anqu@hotmail.com",10712550829, 3200490362, "AndresQu", "1245", 1);

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
    
--Insert categoría;
insert into categoria (TipoCategoria) values ('Entretenimiento');
insert into categoria (TipoCategoria) values ('Tecnología');
insert into categoria (TipoCategoria) values ('Hogar');
insert into categoria (TipoCategoria) values ('Belleza');
insert into categoria (TipoCategoria) values ('Infantil');
insert into categoria (TipoCategoria) values ('Comida');

--Insert local;
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Rokacho",2,"Tienda de música",1);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("TV Novedades",5,"Tienda de variedades",1);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Wartzila",1,"Tienda de tecnologia",2);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Microsoft",9,"Tienda de tecnologia",2);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Zara",6,"Tienda de Ropa",3);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Arturo Calle",7,"Tienda de Ropa",3);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Avon",8,"Tienda de maquillaje",4);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("OBoticário",3,"Tienda de perfumes",4);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Baby Ganga",4,"Tienda de variedades para bebés",5);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Lego",10,"Tienda de juguetes",5);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("McDonalds",11,"Cadena de Comidas Rápidas",6);
INSERT INTO local(Nombre, IDVendedor, Descripcion, IDCategoria) VALUES("Taco Bell",11,"Cadena de Comida Mexicana",6);

--Insert producto;
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Guitarra Eléctrica', 649000, 1, 'Guitarra Eléctrica marca Frico 6 cuerdas color variado' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Teclado Yamaha', 950000, 1, 'Teclado de 61 claves con Auriculares' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Quita Callos', 49000, 2, 'Removedor quita callos Pedipro' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Billetera Aluma Wallet', 6000, 2, 'Billetera de aluminio indestructible' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Televisor Samsung 43"', 1400000, 3, 'Televisor de 43" 4K UHD Smart TV' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Blu Ray Panasonic', 250000, 3, 'Reproductor Blu Ray Full HD 1080p' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Consola X-BOX One', 950000, 4, 'Consola X-BOX ONE CON 500 GB de memoria, un control más cable HDMI' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Surface Pro 3', 2000000, 4, 'Laptop híbrida Intel Core i3 con Windows 10' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Vestido Largo', 179900, 5, 'Vestido Largo en variación Color Pato y Negro' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Conjunto Traje para Mujer', 449900, 5, 'Incluye Blasier y Pantalón Color Negro');
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Vestido Largo', 179900, 6, 'Vestido Largo en variación Color Pato y Negro' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Zapatos Cuero de Temporada', 649000, 6, 'Zapatos 100% hechos en cuero Color Marrón' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Camisa Brave', 129900 , 7, 'Camisa del conjunto Brave a cuadros' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('A Box', 33500, 7, 'Selección de cremas y aceites' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Skin So Soft', 71900, 8, 'Jabón Líquido con aroma de Lavanda' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('MalBec Supremo', 169900, 8, 'Perfume Deluxe de 100ml con Fragancia de Chocolate' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('My Lili Eau', 149900, 9, 'Perfume Deluxe de 75ml con Fragancia de Rosas' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Coche Armadillo', 432900, 9, 'Coche Armadillo desmarmable Lemon Drop' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Tetero', 12000, 9, 'Tetero marca Ruby 250 ml' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Alcancía Cerdito Lego', 69900, 10, 'Construye la alcancía icónica del cerdito de LEGO® y guarda tu dinero adentro' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Aeropuerto Espectáculo Aéreo', 563900, 10, 'Set de 670 Piezas, construye el aeropuerto de tus sueños' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('McCombo BigMac', 17900, 11, 'Pide tu combo a domilicio, incluye papas y gaseosa' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('McFlurry Oreo con Chocolate', 7500, 11, 'Helado de vainilla con salsa de chocolate y trozos de Oreo' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Nacho Queso Doritos', 5000, 12, 'Taco de Doritos rellenos de vegetales y salsa de queso' );
insert into producto (Nombre, Precio, IDLocal, Descripcion) values ('Crunchy Taco Supremo', 7900, 12, 'Taco de tamaño grande con extra salsa, carnes y vegetales' );

--Insert compra FALTA IDVENDEDOR
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-10-02",1,1,14,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-10-22",2,2,13,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-03-14",3,3,1,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)  
VALUES ("2017-02-12",4,4,2,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-05-31",5,5,3,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)  
VALUES ("2017-06-30",6,6,5,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)   
VALUES ("2017-09-02",7,7,6,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)  
VALUES ("2017-08-22",8,8,10,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)  
VALUES ("2017-01-23",9,9,11,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor)  
VALUES ("2017-02-12",10,10,12,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-05-13",1,1,20,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-07-28",9,9,6,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-04-16",1,1,1,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-12-22",2,2,7,);
INSERT INTO compra (Fecha, IDPago, IDCliente, IDProducto, IDVendedor) 
VALUES ("2017-10-05",5,5,8,);
	
	--Insert pago;	
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 445840501244, 652, 1);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 491840001234, 678, 2);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 491110501344, 677, 3);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 461950031434, 320, 4);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 521740401534, 338, 5);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 471847501774, 478, 6);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 491440601784, 448, 7);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 411770441454, 645, 8);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 481710501374, 154, 9);
insert into pago( NumTarjeta, CVV, IDCliente)
    values ( 421845501234, 354, 10);

--Insert envio;
INSERT INTO envio (FechaEnvio, IDEstado, IDComprar) VALUES ("2017-09-30", 1,1);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-07-16", 2,2);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-07-09", 2,3);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-10-15", 1,4);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-02-01", 1,5);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-05-31", 1,6);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-09-01", 2,7);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-03-31", 2,8);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-02-15", 2,9);
INSERT INTO envio (FechaEnvio, IDEstado, IDCompra) VALUES ("2017-11-30", 1,10);
