select *
from Products
select *
from Categories

select CategoryID, count(*)
from Products
group by CategoryID

-- Selecciona cuantos Productos tiene cada categoria
Select c.CategoryName as 'Categoria', p.ProductName as 'Nombre del producto'
from Categories as c inner join Products as p on c.CategoryID=p.CategoryID
order by c.CategoryName asc

Select c.CategoryName as 'Categoria', count(*) as 'Total de productos'
from Categories as c inner join Products as p on c.CategoryID=p.CategoryID
group by c.CategoryName

-- Consultar para mostrar todos los productos con sus categorias y sus precios 
Select p.ProductName as 'Nombre del producto', p.UnitPrice as 'Precio del producto', c.CategoryName as 'Categoria'
from Categories as c inner join Products as p on c.CategoryID=p.CategoryID
order by c.CategoryName asc

-- Consutlta para mostrar los nombres de los productos y los nombres de su proveedores 
Select p.ProductName as 'Nombre del producto', s.CompanyName as 'Proveedor'
from Suppliers as s inner join Products as p on s.SupplierID=p.SupplierID
order by p.ProductName asc

-- Seleccionar las ordenes de compra mostrando los nombres de lo productos y sus importes 
Select o.OrderID as 'Id de la Orden', p.ProductName as 'Nombre del producto' , (o.UnitPrice*o.Quantity) as 'Importe'
from [Order Details] as o inner join Products as p on o.ProductID=p.ProductID
order by Importe desc

-- Seleccionar las ordenes de compra mostrando los nombres de lo productos y sus importes 
Select o.OrderID as 'Id de la Orden', p.ProductName as 'Nombre del producto' , (o.UnitPrice*o.Quantity) as 'Importe'
from [Order Details] as o inner join Products as p on o.ProductID=p.ProductID
order by Importe desc

Select o.OrderID as 'Id de la Orden', p.ProductName as 'Nombre del producto' , (o.UnitPrice*o.Quantity) as 'Importe'
from [Order Details] as o inner join Products as p on o.ProductID=p.ProductID
WHERE (o.UnitPrice*o.Quantity)<=15000
order by Importe desc

-- Mostrar las ordens de compro y los nombres de los empleados que las realizaron 
Select concat(e.FirstName,' ',e.LastName) as Nombre, count(*) as 'Ordenes Realizadas'
from [Orders] as o inner join Employees as e on o.EmployeeID=e.EmployeeID where year(o.OrderDate) in ('1996','1999')
group by Nombre;

-- seleccionar las ordenes mostrando los clientes a las que se les hicieron las cantidades vendidas y los nombres de los productos 
select c.CompanyName, p.ProductName, od.Quantity
from [Orders] as o
    join [Order Details] as od on o.OrderID=od.OrderID
    join Customers as c on o.CustomerID= c.CustomerID
    join Products as p on od.ProductID= p.ProductID


