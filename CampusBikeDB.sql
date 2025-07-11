create database campusbikedb;
use campusbikedb;
create table cliente (
    id_cliente int primary key,
    primer_nombre varchar(15),
    primer_apellido varchar(20),
    tel_cliente int unique,
    correo varchar(50) unique
);
create table proveedor (
    id_proveedor int primary key,
    nombre_proveedor varchar(40) unique,
    tel_proveedor int unique,
    suministros varchar(100)
);
create table repuesto (
    id_repuesto int primary key,
    nombre varchar(50),
    marca varchar(20),
    color varchar(20),
    cantidad int,
    precio double(10,2)
);
create table bicicleta (
    id_bicicleta int primary key,
    nombre varchar(50),
    marca varchar(20),
    color varchar(20),
    cantidad int,
    precio double(10,2)
);
create table accesorio (
    id_accesorio int primary key,
    nombre varchar(50),
    marca varchar(20),
    color varchar(20),
    cantidad int,
    precio double(10,2)
);
create table inventario (
    id_inventario int primary key,
    fecha_ult_act date,
    total_bic int,
    total_acc int,
    total_rep int,
    precio_total double(100,2),
    id_bicicleta_fk int,
    id_repuesto_fk int,
    id_accesorio_fk int,
    foreign key (id_accesorio_fk) references accesorio(id_accesorio),
    foreign key (id_bicicleta_fk) references bicicleta(id_bicicleta),
    foreign key (id_repuesto_fk) references repuesto(id_repuesto)
);
create table producto (
    id_producto int primary key,
    id_repuesto_fk int null,
    id_bicicleta_fk int null,
    id_accesorio_fk int null,
    cantidad int,
    precio double(10,2),
    foreign key (id_accesorio_fk) references accesorio(id_accesorio),
    foreign key (id_bicicleta_fk) references bicicleta(id_bicicleta),
    foreign key (id_repuesto_fk) references repuesto(id_repuesto)
);
create table compra (
    id_compra int,
    fecha date,
    descripcion varchar(100),
    precio double(10,2),
    id_cliente_fk int,
    id_producto_fk int,
    primary key (id_compra, id_cliente_fk, id_producto_fk),
    foreign key (id_cliente_fk) references cliente(id_cliente),
    foreign key (id_producto_fk) references producto(id_producto)
);
create table venta (
    id_venta int,
    fecha date,
    descripcion varchar(100),
    precio double(10,2),
    id_proveedor_fk int,
    id_producto_fk int,
    primary key (id_venta, id_proveedor_fk, id_producto_fk),
    foreign key (id_proveedor_fk) references proveedor(id_proveedor),
    foreign key (id_producto_fk) references producto(id_producto)
);