create database vistasPracticas;

use vistasPracticas;

-- create or alter view view_Categorias_Productos
-- as
--     select c.CategoryName as 'Categoria', p.ProductName as 'Nombre del Producto', p.UnitPrice as 'Precio', p.UnitsInStock as 'Existencia'
--     from
--         northwind.dbo.Categories as c join
--         northwind.dbo.Products as p on c.CategoryID=p.CategoryID;

-- Seleccionar el importe del inventario
select *,(v.Existencia*v.Precio) as 'Importe del inventario'
from view_Categorias_Productos as v where Categoria in('Beverages',' Condiments') order by v.Categoria desc

-- Seleccionar la suma el importe del inventario agripado por categoria
select v.Categoria,sum(v.Existencia*v.Precio) as 'Importe del inventario'
from view_Categorias_Productos as v  group by v.Categoria 
        


