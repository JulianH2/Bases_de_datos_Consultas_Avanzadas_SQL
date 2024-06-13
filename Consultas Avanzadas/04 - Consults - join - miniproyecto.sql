create database repasoJoins

use repasoJoins

create table proveedor
(
    ProvId int not null identity(1,1),
    Nombre varchar(50) not null,
    limiteCredito money not null,
    constraint pk_Prov primary key(ProvId),
);

create table producto
(
    ProdId int not null identity(1,1),
    Nombre varchar(59) not null,
    Precio money not null,
    Existencia int not null,
    ProvId int,
    constraint pk_Prod primary key(ProdId),
    constraint fk_Prod foreign key(ProvId) references proveedor(ProvId),
);

insert into proveedor
values
    ('proveedor1', 10000),
    ('proveedor1', 20000),
    ('proveedor2', 30000),
    ('proveedor3', 40000),
    ('proveedor4', 50000),
    ('proveedor5', 60000)

insert into producto
values
    ('producto1', 54, 45.6, 1),
    ('producto2', 54, 45.6, 1),
    ('producto3', 54, 45.6, 2),
    ('producto4', 54, 45.6, 3)


select *
from proveedor

select *
from producto

-- Consultar Inner join

-- Sleccioner todos los productos que tengan proveedro

select pr.nombre as 'Nombre_Producto', pr.precio as 'precio',
    pr.existencia as 'existencia', p.nombre as 'proveedor'
from proveedor as p
    inner join producto as pr
    on p.ProvId=pr.ProvId

-- Consult con left join

-- Mostrar todos los proveedores y sus respectivos productos

select pr.nombre as 'Nombre_Producto', pr.precio as 'precio',
    pr.existencia as 'existencia', p.nombre as 'proveedor'
from proveedor as p
    left join producto as pr
    on p.ProvId=pr.ProvId

update proveedor
      set nombre = 'proveedor6'
      where provid = 5;

select *
from proveedor

update proveedor
      set nombre = 'proveedor5'
      where provid = 5;

insert into proveedor
    (nombre,limiteCredito)
values('proveedor6', 45000)

select *
from proveedor

delete from proveedor
      where provid = 7

update proveedor
      set nombre = 'proveedor6'
      where provid = 6;

-- Utilizando right join

select pr.nombre as 'Nombre_Producto', pr.precio as 'precio',
    pr.existencia as 'existencia', p.nombre as 'proveedor'
from proveedor as p
    right join producto as pr
    on p.ProvId=pr.ProvId

insert into producto
values
    ('producto3', 78.8, 22, null);

-- Selecciona todos los proveedores que no tienen asiganado producto 
select p.ProvId as 'Numero de proveedor', p.nombre as 'proveedor'
from proveedor as p
    left join producto as pr
    on p.ProvId=pr.ProvId
WHERE pr.ProdId is null

-- Selecciona todos los proveedores que tienen asiganado producto 
select p.ProvId as 'Numero de proveedor', p.nombre as 'proveedor'
from proveedor as p
    left join producto as pr
    on p.ProvId=pr.ProvId
WHERE pr.ProdId is not null


-- Selecciona todos los productos que no tienen asiganado proveedor
select pr.ProdId as 'Numero de proveedor', pr.Nombre as 'proveedor',pr.Precio as 'Precio'
from proveedor as p
    right join producto as pr
    on p.ProvId=pr.ProvId
WHERE p.ProvId is  null