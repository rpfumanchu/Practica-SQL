

--------------------------------------DDL----------------------------

create schema flotacoches authorization fouxprfs;

-- 1 Tabla vehículos y sus referéncias

-- TABLA GRUPO MARCAS
create table flotacoches.grupo(
idgrupo varchar(30) not null,   --PK
nombre varchar(200) not null,
descripción varchar(500) null
);

--PK
alter table flotacoches.grupo
add constraint grupo_PK primary key (idgrupo);


-- TABLA MARCA
create table flotacoches.marca(
idmarca varchar(30) not null,   --PK
nombre varchar(200) not null,
idgrupo varchar(30) not null   --FK
);

--PK
alter table flotacoches.marca
add constraint marca_PK primary key (idmarca);

--FK
alter table flotacoches.marca
add constraint marca_grupo_FK foreign key (idgrupo)
references flotacoches.grupo(idgrupo);


-- TABLA MODELO
create table flotacoches.modelo(
idmodelo varchar(30) not null,   --PK
nombre varchar(200) not null,
idmarca varchar(200) not null,   --FK
descripcion varchar(512) null
);

--PK
alter table flotacoches.modelo
add constraint modelo_PK primary key (idmodelo);

--FK
alter table flotacoches.modelo
add constraint modelo_marca_FK foreign key (idmarca)
references flotacoches.marca(idmarca);



-- TABLA COLOR-VEHICULO
create table flotacoches.color_coche(
idcolor varchar(30) not null,   --PK
nombre varchar(200) not null
);

--PK
alter table flotacoches.color_coche
add constraint color_pk primary key (idcolor);


-- TABLA COMPAÑIAS
create table flotacoches.companias(
idcompania varchar(30) not null,   --PK
empresa varchar(200) not null,
descripcion varchar(512) null
);

--PK
alter table flotacoches.companias
add constraint companias_PK primary key (idcompania);



-- TABLA VEHICULOS
create table flotacoches.vehiculos(
idvehiculo varchar(30) not null,   --PK
fecha_compra date not null,
idmodelo varchar(30) not null,   --FK
idcolor varchar(30) not null,   --FK
matricula varchar(200) not null,
idcompania varchar(200) not null,   --FK
km_totales numeric not null,
poliza varchar(200) not null,
fecha_baja date  null default '4000-01-01',
descripcion varchar(512) null
);

--PK
alter table flotacoches.vehiculos
add constraint vehiculos_PK primary key (idvehiculo);

--FK
alter table flotacoches.vehiculos
add constraint vehiculos_modelo_FK foreign key (idmodelo)
references flotacoches.modelo(idmodelo);

alter table flotacoches.vehiculos
add constraint vehiculos_color_FK foreign key (idcolor)
references flotacoches.color_coche(idcolor);

alter table flotacoches.vehiculos
add constraint vehiculos_companias_FK foreign key (idcompania)
references flotacoches.companias(idcompania);




--TABLA TIPO MONEDA
create table flotacoches.tipo_moneda(
idmoneda varchar(30) not null,   --PK
nombre varchar(200) not null default 'EUR'
);

--PK
alter table flotacoches.tipo_moneda
add constraint tipo_moneda_PK primary key (idmoneda);



-- TABLA VEHICULO-REVISION
create table flotacoches.vehículo_revision(
idvehiculo varchar(30) not null,--PK,FK1
idrevision varchar(30) not null,   --PK
fecha_revision date not null,   
km_actual numeric not null,
importe numeric not null,
idmoneda varchar(30) not null,  --FK
descripcion varchar(512) null
);

--PK
alter table flotacoches.vehículo_revision
add constraint vehículo_revision_PK primary key (idrevision, idvehiculo);

--FK1
alter table flotacoches.vehículo_revision
add constraint vehiculo_revision_FK foreign key (idvehiculo)
references flotacoches.vehiculos(idvehiculo);

--FK
alter table flotacoches.vehículo_revision
add constraint revision_tipo_moneda_FK foreign key (idmoneda)
references flotacoches.tipo_moneda(idmoneda);




-------------------------------------------DML----------------------------

-- Introdución de datos



-- DATOS GRUPO MARCA

insert into flotacoches.grupo
(idgrupo,nombre,descripción)
values ('01', 'Grupo PSA', 'Citroën, Peugeot, Opel');

insert into flotacoches.grupo
(idgrupo,nombre,descripción)
values ('02', 'Grupo Volkswagen', 'Audi, Seat, Skoda');

insert into flotacoches.grupo
(idgrupo,nombre,descripción)
values ('03', 'Grupo Toyota', 'Toyota, Lexus');


-- DATOS MARCA

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('01', 'Citroën', '01');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('02', 'Peugeot', '01');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('03', 'Opel', '01');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('04', 'Audi', '02');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('05', 'Seat', '02');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('06', 'Skoda', '02');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('07', 'Toyota', '03');

insert into flotacoches.marca
(idmarca, nombre, idgrupo)
values ('08', 'Lexus', '03');


-- DATOS MODELO

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('01', 'DS 4', '01', '');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('02', '2008', '02', 'SUV');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('03', 'Astra', '03', 'Hibrido');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('04', 'A5', '04', 'Gama alta');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('05', 'Ateca', '05', '5 puertas');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('06', 'Kodiak', '06', 'SUV electrico');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('07', 'C-HR', '07', '3 puertas');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('08', 'LS', '08', 'coche directivo');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('09', 'Leon', '05', 'Comercial zona sur');

insert into flotacoches.modelo
(idmodelo, nombre, idmarca, descripcion)
values ('10', 'Octavia', '06', 'Comercial zona norte');


--DATOS COLOR

insert into flotacoches.color_coche
(idcolor, nombre)
values ('01', 'Azul');

insert into flotacoches.color_coche
(idcolor, nombre)
values ('02', 'Rojo');

insert into flotacoches.color_coche
(idcolor, nombre)
values ('03', 'Verde');

insert into flotacoches.color_coche
(idcolor, nombre)
values ('04', 'Negro');

insert into flotacoches.color_coche
(idcolor, nombre)
values ('05', 'Blanco');

--DATOS COMPAÑIAS

insert into flotacoches.companias
(idcompania, empresa)
values ('01', 'Mapfre');

insert into flotacoches.companias
(idcompania, empresa)
values ('02', 'Axa');

insert into flotacoches.companias
(idcompania, empresa)
values ('03', 'Mutua');



--DATOS VEHICULOS

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza,  km_totales)
values ('01', '2013/01/15', '10', '01', 'HJH-1524', '01', 'P0123', 392050 );

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales )
values ('02', '2021/05/08', '09', '03', 'LKH-1884', '01', 'P5566', 150120 );

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('03', '2015/06/15', '03', '05', 'FLO-3698', '02', 'P6652', 425210);

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales, descripcion)
values ('04', '2018/12/25', '05', '02', 'KGB-3698', '03', 'P5886', 80250, 'coche presidente');

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('05', '2020/07/25', '06', '04', 'LJO-8746', '03', 'P4676', 50250);

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('06', '2020/08/25', '01', '02', 'PDF-4589', '02', 'P5974', 110250);

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('07', '2022/11/02', '07', '02', 'PLI-0025', '01', 'P5992', 40250);

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales, descripcion)
values ('08', '2022/09/10', '02', '03', 'JUT-2687', '01', 'P2526', 20250, 'coche de vicepresidente');

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('09', '2022/02/05', '08', '05', 'KLL-1285', '02', 'P2686', 10250);

insert into flotacoches.vehiculos
(idvehiculo, fecha_compra, idmodelo, idcolor, matricula, idcompania, poliza, km_totales)
values ('10', '2021/03/30', '04', '05', 'JPL-7250', '01', 'P4488', 120548);


--DATOS BALAS VEHICULO

update flotacoches.vehiculos 
set fecha_baja  = '2018/05/22'
where idvehiculo  = '01';

update flotacoches.vehiculos 
set fecha_baja  = '2020/05/22'
where idvehiculo  = '03';


--DATOS MONEDAS

insert into flotacoches.tipo_moneda 
(idmoneda, nombre)
values ('01', 'EUR');

insert into flotacoches.tipo_moneda 
(idmoneda, nombre)
values ('02', 'DOLAR');


--DATOS REVISION-VEHICULO

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('01', 'rv-01', '2014/06/21', 80800, 140, '01', 'aceite y filtros');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('01', 'rv-02', '2016/07/15', 160780, 600.84, '01', 'ruedas' );

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('01', 'rv-03', '2017/06/21', 298800, 1800.24, '01', 'culata');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('02', 'rv-01', '2022/03/10', 120548, 180.81, '01', 'pre-itv' );

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('03', 'rv-01', '2014/01/25', 140800, 160, '01', 'aceite y filtros');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('03', 'rv-02', '2016/07/15', 205780, 540.84, '01', 'ruedas' );

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('03', 'rv-03', '2017/06/10', 280560, 180.81, '01', 'pre-itv' );

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('03', 'rv-04', '2019/08/13', 380880, 1500, '01', 'turbo');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('04', 'rv-01', '2019/08/25', 62010, 172, '01', 'aceite y filtros');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('05', 'rv-01', '2021/03/12', 30010, 158, '01', 'aceite y filtros');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('06', '02', '2016/01/25', 60800, 65, '01', 'carga aire');

insert into flotacoches.vehículo_revision 
(idvehiculo, idrevision, fecha_revision, km_actual, importe, idmoneda, descripcion)
values ('10', '01', '2022/06/25', 95100, 170.65, '01', 'correa servicios');















