-- Crear base de datos parade mostrar el uso de left join
create database PruebaJoins;

-- Utilizar la base de datos
use PruebaJoins;

-- Crear la tabla categoria 
create table Categoria
(
    CategoriaId int not null identity,
    Nombre varchar(50) not null default 'No categoria',
    constraint pk_categoria primary key(CategoriaId)
);

-- Crear la tabla producto 
create table Producto
(
    ProductoId int not null identity(1,1),
    Nombre varchar(50) not null,
    Existencia int not null,
    Precio money not null,
    CategoriaId int,
    constraint pk_producto primary key(ProductoId),
    constraint unico_nombreP unique(nombre),
    constraint fk_categoria foreign key (CategoriaId)  references categoria(CategoriaId),
);

-- Insertar Registros a la tabla Categoria
insert into Categoria
    (Nombre)
values
    ('LB'),
    ('Lacteos'),
    ('Ropa'),
    ('Carnes frias'),
    ('Bebidas')


-- Insertar Registros a la tabla productos
insert into Producto
    (Nombre,existencia,Precio, CategoriaId)
values
    ('Refrigerador', 3, 10000, 1),
    ('Estufa', 3, 9000, 1),
    ('Creama', 2, 10.5, 2),
    ('Yugurt', 3, 12.45, 2)

-- Consulta utilzando un Inner join 
Select *
from Categoria as c join Producto as p on p.CategoriaId = c.CategoriaId

-- Consulta utilzando un left join
Select *
from Categoria as c left join Producto as p on p.CategoriaId = c.CategoriaId

-- Seleccionar todas las categoias que no tiene asiganado nu producto
select c.CategoriaId, c.Nombre
from Categoria as c left join Producto as p on p.CategoriaId = c.CategoriaId
where p.ProductoId is null

-- Seleccionar todas las categoias que no tiene asiganado nu producto
select *
from Producto as p right join Categoria as c on p.CategoriaId = c.CategoriaId
where p.ProductoId is null

select *
from Producto as p left join Categoria as c on p.CategoriaId = c.CategoriaId
where p.ProductoId is null

select *
from Producto as p full join Categoria as c on p.CategoriaId = c.CategoriaId
where p.ProductoId is null

-- Ejercicio

-- 1.- Crear una base de datos llamada EjerciciosJoins
Create database EjerciciosJoins;

-- 2.- Crear una tabla empleados tomando como base la tabla employees de nortwin no tomar en cuenta todos los datos
select [EmployeeID] as 'EmpleadoID',
    concat([LastName],' ',
    [FirstName]) as 'NombreCompleto',
    [Title] as 'Titulo',
    [BirthDate] as 'FechaNacimiento',
    [HireDate] as 'FechaContratacion',
    concat([Address] ,', ',[City],', ', [Region],', ', [PostalCode] ,', ', [Country]) as 'Direccion'
into EjerciciosJoins.dbo.Empleado
from [Northwind].dbo.Employees

Select *
from EjerciciosJoins.dbo.Empleado;

-- 3.- Llenar la tabla con una consulta a la tabla employees 

select *
from EjerciciosJoins.dbo.dimEmpleado;
select*
from EjerciciosJoins.dbo.Empleado as e left join EjerciciosJoins.dbo.dimEmpleado as d on e.EmpleadoID=d.eEmpleadoID;

insert into EjerciciosJoins.dbo.Empleado
    (EmpleadoID,NombreCompleto,Titulo,FechaNacimiento,FechaContratacion, Direccion)
select [EmployeeID] as 'EmpleadoID',
    concat([LastName],' ',
    [FirstName]) as 'NombreCompleto',
    [Title] as 'Titulo',
    [BirthDate] as 'FechaNacimiento',
    [HireDate] as 'FechaContratacion',
    concat([Address] ,', ',[City],', ', [Region],', ', [PostalCode] ,', ', [Country]) as 'Direccion'
from [Northwind].dbo.Employees

Select top 0
    *
into EjerciciosJoins.dbo.dimEmpleado
from EjerciciosJoins.dbo.Empleado

-- 4.- Agregar nuevos datos a la tabla empleados por lo menos dos
insert into EjerciciosJoins.dbo.Empleado
    (EmpleadoID,NombreCompleto,Titulo,FechaNacimiento,FechaContratacion, Direccion)

select *
from EjerciciosJoins.dbo.Empleado as e join EjerciciosJoins.dbo.dimEmpleado as ed on e.EmpleadoID=ed.EmpleadoID

-- 5.- Actualizar la tabla empleados con los nuevos registros, la cual se llenara en una nueva tabla llamada dim_Producto


