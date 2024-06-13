-- Consutas Simples (Consultas a una sola tabla)
use Northwind;

-- Seleccionar todos los Customers (Clientes)
select *
from Customers;

-- Proyeccion
select CustomerID, CompanyName, City, Country
from Customers;

-- Sellecciona los 10 registros de los Clientes 
select top 10
    CustomerID, CompanyName, City, Country
from Customers;

/* Alias de columnas 
Country as Pais
Country Pais
Country 'Pais'
Country as 'Pais'
Country 'Pais de las marrabillas' */

-- Proyecci�n
select CustomerID as 'Numero Cliente', CompanyName NombreEmpresa, City as 'Ciudad', Country 'Pais'
from Customers;

-- Alias de tablas
select Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
from Customers;

select c.CustomerID, c.CompanyName, c.City, c.Country
from Customers as c;

select c.CustomerID, c.CompanyName, c.City, c.Country
from Customers c;

-- Campo calculado 
select *, (p.UnitPrice * p.UnitsInStock) as 'Costo Inventario'
from Products as p;

select ProductName as 'Nombre Producto', UnitsInStock as 'Existencia', UnitPrice as 'Precio Unitario', (p.UnitPrice * p.UnitsInStock) as 'Costo Inventario'
from Products as p;

/* Filtar datos 
clausala where y Operadores Relacionales
>   - Mayor que 
<   - Menor que
>=  - Mayor o igual
<=  - Menor o igual
<>  - Diferente
!=  - Diferente
=   - Igual  */

-- Selecionar todos los clientes de alemania
select *
from Customers
where Country='Germany';

-- Selecionar todos los Productos que tengan un stock mayor a 20 mostrando solamente el nombre del producto, precion y la existencia 
select p.ProductName as 'Nombre del Producto', p.UnitPrice  as 'Precio', p.UnitsInStock  as 'Existencia'
from Products as p
where UnitsInStock>=20
order by 2 desc;

select p.ProductName as 'Nombre del Producto', p.UnitPrice  as 'Precio', p.UnitsInStock  as 'Existencia'
from Products as p
where UnitsInStock>=20
order by p.ProductName desc;

-- Seleccionar todos los clientes ordenados de forma acendente por pais y dentro del pais ordenados de forma decendente por ciudad
select c.CompanyName, c.Country, c.City
from Customers as c
order by c.Country,c.city desc;

/* Valores repetidos en un a consulta
Seleccionar los paises de lis clientes*/
select distinct c.Country
from Customers as c
order by 1 asc;

-- Seleccionar todos lo productos cunado el precio es mayor o igual a 18
select *
from Products as p
where p.UnitPrice>=18.0;

-- Seleccionar todos lo productos cunado el precio es mayor o igual a 18
select *
from Products as p
where p.UnitPrice <> 18.0;

-- Seleccionar todos lo productos cunado el precio es mayor o igual a 18
select count(*)
from Products as p
where p.UnitPrice != 18.0;

-- Seleccionar todos los productos que tengan un precio entre 18  y 25
select *
from Products as p
where p.UnitPrice between 18 and 25
order by UnitPrice asc;
select *
from Products as p
where p.UnitPrice >= 18.0 and p.UnitPrice <=25.0
order by UnitPrice asc;

-- Seleccionar todos los productos que no tengan un precio entre 18  y 25
select *
from Products as p
where p.UnitPrice not between 18 and 25
order by UnitPrice asc;
select *
from Products as p
where not(p.UnitPrice >= 18.0 and p.UnitPrice <=25.0)
order by p.UnitPrice asc;

-- Seleccionar todos los productos donde el precio sea mayor a 38 y su existencia sea mayor o igual a 22
select *
from Products as p
where p.UnitPrice > 38.0 and p.UnitsInStock >=22.0
order by p.UnitPrice asc;

-- Seleccionar los clientes de mexico, alemania y francia
select *
from Customers as c
where c.Country = 'Germany' or c.Country= 'Mexico' or c.Country='France'
order by c.Country asc;
select *
from Customers as c
where c.Country in( 'Germany','Mexico' ,'France')
order by c.Country asc;

-- Seleccionar los clientes que su region sea nula
select *
from Customers as c
where c.Region is NULL;

-- Seleccionar los clientes que su region no sea nula
select *
from Customers as c
where c.Region is not NULL;

-- Seleccionar todas las ordenes enviadas de julio de 1996 a abril de 1998 para los empleado
select *
from Orders as o
where (o.ShippedDate between '1996-07-01' and '1998-04-30') and (ShipCity in ('Buchanan','Leverling','Davolio'));

select e.LastName as 'Empleado', o.ShippedDate as 'Fecha de entrega'
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
where o.ShippedDate between '1996-07-01' and '1998-04-30' and e.LastName in ('Davolio','Leverling','Buchanan');

-- Selecionar solo los años de las ordenes de compra
select year(OrderDate) as Año
from Orders;

-- Selecionar todas las ordenes de compra donde para 1996
select OrderID, OrderDate as Fecha, year(OrderDate) as Año
from Orders
where year(OrderDate)='1996';
select OrderID, OrderDate as Fecha, year(OrderDate) as Año
from Orders
where OrderDate between '1996-01-01' and '1996-12-31'

-- Selecionar todas las ordenes de compra mostrando el numero de orden, fecha de orden, año mes, dia de 1996 y 1998
select OrderID as 'Numero de Orden', OrderDate as 'Fecha', year(OrderDate) as Año, month(OrderDate) as Mes, day(OrderDate) as Dia
from Orders
where year(OrderDate)='1996' or year(OrderDate)='1998';

select OrderID as 'Numero de Orden', OrderDate as 'Fecha', year(OrderDate) as Año, month(OrderDate) as Mes, day(OrderDate) as Dia
from Orders
where year(OrderDate) in ('1996' ,'1998');

-- Seleccionar todos los empleados con apellido que empiecen con d
Select *
from Employees
where (LastName) like 'D%';

-- Seleccionar todos los empleados con apellido que empiecen con Da
Select *
from Employees
where (LastName) like 'Da%';

-- Seleccionar todos los empleados con apellido que termine con a
Select *
from Employees
where (LastName) like '%a';

-- Seleccionar todos los empleados con apellido contenga la letra a
Select *
from Employees
where (LastName) like '%a%';

-- Seleccionar todos los empleados con apellido que no contenga la letra a
Select *
from Employees
where (LastName)not like '%a%';

-- Seleccionar todos los empleados con apellido que contenga cualquier letra y una i
Select *
from Employees
where (LastName) like '%__i%';

-- Seleccionar todos los empleados con nombre que contenga tres caracteres antes de la palabra li despues un caractrer y Finalmente la letra d
Select *
from Employees
where (LastName) like '%___li_%g';

-- Seleccionar todos los apellidos que comiencen con d o l de los empleados
Select *
from Employees
where (LastName) like '[DL]%';

-- Seleccionar todos los empleados que en su apellidos comiencen con una H o una A
Select *
from Employees
where (LastName) like '[SC]%';

-- Seleccionar todos los empleados que en su apellidos contengan una D o L
Select *
from Employees
where (LastName) like '%[dl]%';

-- Seleccionar todos los empleados que en su apellidos contengan una A o F
Select *
from Employees
where (LastName) like '%[a-f]%';

-- Seleccionar cuantos empleados en su apellidos contengan entre la A o F
Select count(*) as 'Total de empleados'
from Employees
where (LastName) like '%[a-f]%';

-- Seleccionar todos los empleados en donde su apellidos no termine con CB
Select *
from Employees
where (LastName) like '%[^cb]';

-- Funciones de agregado
/*  sum
    count(*)
    count(campo)
    avg()
    min()
    max()*/

-- Selecciona el numero total de ordenes realizadas
select count(*) as 'Total de ordenes'
from Orders;

select count(ShipRegion)
from Orders;

-- Selecciona el numero de paises a los que le he enviado ordenes
select count(distinct ShippedDate) as 'Total de paises enviados'
from Orders;

-- Selecciona el total de ornedes enviado a francia entre 1996 y 1998
select count(*) as 'Numero de orndenes'
from Orders
where year(ShippedDate) BETWEEN '1996' and '1998' and ShipCountry in('germany');

--Selecciona el precio minimo de los productos
select min(UnitPrice) as 'Precio minimo'
from Products;

--Selecciona el nombre, precio del producto mas caro
select top 1
    ProductName, (UnitPrice) as 'Precio maximo'
from Products
order by UnitPrice desc;

-- Seleccionar el monto de todas las ordenes
select sum(UnitPrice*Quantity) as 'Total de importes'
from [Order Details];

-- Seleccionar el total del las ventas realizadas a los productos que no tiene descuento
select sum(UnitPrice*Quantity) as 'Total'
from [Order Details] as o
where   o.Discount =0;

-- Seleccionaer le promedio de ventas para los productos de singaporean hokjien fired mee y mozzarella di giovannu
select avg(UnitPrice*Quantity)
from [Order Details]
where ProductID in (72,42);

select avg(UnitPrice*Quantity)
from [Order Details]
where ProductID = 72 or ProductID= 42;

-- Seleccionar le total de ventas para el cliete chop_suet chinese de 1996 a 1998
select COUNT(*)
from [Orders]
where CustomerID = 'CHOPS' and Year(OrderDate) between '1996' and '1998'

select sum(UnitPrice*Quantity), cOUNT(*)
from [Order Details] as Od inner join orders as O on od.OrderID= o.OrderID
where CustomerID = 'CHOPS' and Year(OrderDate) between '1996' and '1998'

-- Selecciona los datops de las tablas de categoria y productos
select *
from Products as P inner join Categories as C on P.CategoryID=C.CategoryID

select C.CategoryName as 'Categoria', P.ProductName as 'Producto', P.UnitPrice as 'Precio unitario', P.UnitsInStock as 'Existencia', (P.UnitsInStock*P.UnitPrice) as 'Precio del Inventario'
from Products as P inner join Categories as C on P.CategoryID=C.CategoryID

-- Seleccioanr los productoa de la ctegoria beverages
select C.CategoryName as 'Categoria', P.ProductName as 'Producto', P.UnitPrice as 'Precio unitario', P.UnitsInStock as 'Existencia', (P.UnitsInStock*P.UnitPrice) as 'Precio del Inventario'
from Products as P inner join Categories as C on P.CategoryID=C.CategoryID
where C.CategoryName = 'Beverages' 

select avg(P.UnitsInStock*P.UnitPrice)
from Products as P inner join Categories as C on P.CategoryID=C.CategoryID
where C.CategoryName = 'Beverages' and P.UnitPrice>20

