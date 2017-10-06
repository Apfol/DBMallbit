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
    IDGenero int(11),
    Primary Key(IDCliente)
);
create table genero(
    IDGenero int(11) not null, 
    Tipo varchar(100) not null, 
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
    IDCategoria int(11),
    Descripcion varchar(100) not null, 
    Primary Key(IDProducto)
);
create table categoria(
    IDCategoria int(11) not null auto_increment, 
    Categoria varchar(100) not null, 
    Primary Key(IDCategoria)
);
create table local(
    IDLocal int(11) not null auto_increment, 
    Nombre varchar(100) not null, 
    IDVendedor int(11), 
    Descripcion varchar(100) not null, 
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
    Estado varchar(100) not null, 
    Primary Key(IDEstado)
);
create table pago(
    IDPago int(11) not null auto_increment, 
    FechaPago date not null, 
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
    Descripcion varchar(100) not null, 
    IDAdministrador int(11), 
    Primary Key(IDPremio)
);
create table clientepremio(
    IDPremio int(11), 
    IDCliente int(11), 
    Primary Key(IDPremio, IDCliente)
);

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

insert into genero(IDGenero, Tipo) 
values(1, "Masculino");
insert into genero(IDGenero, Tipo)
values(2, "Femenino");

insert into estado(IDEstado, Estado) 
values(1, "Despachado");
insert into estado(IDEstado, Estado) 
values(2, "Entregado");

alter table producto add foreign key(IDLocal) references local(IDLocal) ON DELETE CASCADE;
alter table producto add foreign key(IDCategoria) references categoria(IDCategoria) ON DELETE CASCADE;
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
alter table clientepremio add foreign key(IDCliente) references cliente(IDCliente);
alter table clientepremio add foreign key(IDPremio) references premio(IDPremio);
