use [bdventas]

select * from [Northwind].dbo.customers;

-- Consulta los datos de la tabla cliente
select * from  Cliente;

-- Elimina los datos de la tabla cliente
delete from Cliente

-- Comando para reiniciar el identity de una tabla
DBCC CHECKIDENT (cliente, RESEED, 0)

-- Crea una tabla apartir de una consulta
select top 0 EmployeeID as 'EmpleadoId', LastName as 'Apellido', FirstName as 'PrimerNombre', BirthDate as 'FechaNacimieto', HireDate as 'FechaContratacion', [address] as 'Direccion', city as 'Ciudad', region, PostalCode as 'CodigoPostal', Country as 'Pais' 
into Empleado2 from [Northwind].dbo.Employees

-- Consulta la tabla 
select *from Empleado2

-- Agraga la llave primaria la tabla empleado
alter table Empleado2 add Constraint pk_empleadoId primary key(EmpleadoId)

-- Consulta los ultimos 5 registros 
select top 5 * from [Northwind].dbo.[Order Details]
order by OrderID desc

-- Insertar datos
insert into Empleado2(EmpleadoId, Apellido, PrimerNombre, FechaNacimieto, FechaContratacion, Direccion, Ciudad, region, CodigoPostal, Pais)
select EmployeeID as 'EmpleadoId', LastName as 'Apellido', FirstName as 'PrimerNombre', BirthDate as 'FechaNacimieto', HireDate as 'FechaContratacion', [address] as 'Direccion', city as 'Ciudad', region, PostalCode as 'CodigoPostal', Country as 'Pais' from [Northwind].dbo.Employees

select * from Empleado2 

select * from Empleado

select * from Cliente

select * from  OrdenCompra

insert into Empleado(Nombre, Apellido1, Apellido2, CURP, RFC, numeroExterno, calle, Salario, NumeroNomina) values 
('Alan','Sntiago','Molina','ALM456789','ALMN3435',23,'Calle del infierno', 67890.9,1234),
('Yamileth','Mejia','Rangel','YMR456789','YMRN3435',null,'Calle del hambre', 77890.17,23456),
('Moises','Santiago','Isidro','MSI456789','MSIN3435',null,'Calle de la gordura', 20000,98765);

select * from Producto;

select * from Northwind.dbo.Products;

select * from Proveedor;

select * from Northwind.dbo.Suppliers;

insert into Proveedor select supplierID, CompanyName,PostalCode,'Calle de la sol',City,2345 as CP,'www.prueba.com.mx' as 'PaginaWeb' from Northwind.dbo.Suppliers;

select * from Producto;

insert into Producto select ProductID, ProductName,UnitPrice,Discontinued,UnitsInStock,SupplierID from Northwind.dbo.Products;

-- Fecha actual del Sistema
select getdate();

insert into OrdenCompra values 
(getdate(),'2024-06-10',1,1),
(getdate(),'2024-06-10',2,2),
(getdate(),'2024-07-11',3,3);

select * from OrdenCompra ;

insert into DetalleCompra values
(1,1,30,(select precio from Producto where NumeroControl=1)),
(1,3,30,(select precio from Producto where NumeroControl=1)),
(2,2,10,(select precio from Producto where NumeroControl=2));

select * from DetalleCompra;

update Producto set Precio=20.2 where NumeroControl=1;

-- Seleccionar las ordenes de compra realizadas al producto 1
select *,(cantidad*preciocompra) as Importe from DetalleCompra where ProductoId=1;

-- seleccione el total a pagarde las ordenes que contienen el producto 1
select sum(cantidad*preciocompra) as Total from DetalleCompra where ProductoId=1

