--Muestra todos los nombres de las distintas categorías de productos.
select 
	categoryname
from categories;
--Muestra los países en los que hay clientes, ordenados alfabéticamente y sin repetir.
select 
	distinct country
from customers
order by country asc;
--Muestra el nombre, la compañía para la que trabajan y el puesto de los clientes de USA.
select 
	contactname,
	companyname,
	contacttitle
from customers
where country = 'USA';
--Muestra el nombre de la ciudad y el total de clientes en cada ciudad.
select 
	city, 
	count (*) as cantidad_de_clientes
from customers
group by city;

--Muestra el apellido y título de todos los empleados.
select
	lastname, title
from employees;
--Muestra los nombres de los puestos de los empleados de la empresa (sin repetir).
select
	title
from employees
group by 1;
--Muestra el nombre y el título de los 2 empleados más viejos de la compañía.
select 
	firstname, lastname, title
from employees
order by birthdate
limit 2;
--Muestra el nombre y la fecha de contratación de las empleadas de UK.
select
	firstname, hiredate
from employees
where country = 'UK' and titleofcourtesy in ('Ms.', 'Mrs.');
--Muestra el nombre y el número de teléfono de los transportistas.
select
	companyname, phone
from shippers;
--Muestra el nombre y la dirección de aquellas empresas proveedoras que poseen fax.
select 
	companyname, address, fax
from suppliers
where fax IS NOT NULL;
--Muestra los países de los cuales provienen los proveedores.
select distinct
	city
from suppliers
order by city;
--Muestra las ciudades de las cuales provienen los proveedores cuyo contacto ocupa el puesto de "Marketing Manager", ordenadas alfabéticamente.
select 
	city 
from suppliers 
where contacttitle = 'Marketing Manager'
order by city;
--Muestra el número total de productos.
select 
	count (*)
from products;
--Muestra la cantidad de unidades en stock para todos los nombres de producto.
select
		productname, unitsinstock
from products;
--Muestra el nombre y el stock de los productos que tienen un precio mayor a $30.
select
		productname, unitsinstock
from products
where unitprice > 30;
--Muestra el nombre y la cantidad por unidad de los productos que tienen entre 20 y 30 unidades en stock.
select
	productname, unitsinstock
from products
where unitsinstock >= 20 and unitsinstock <= 30
order by unitsinstock;
--Muestra el nombre y el precio los top 5 productos no discontinuados más caros.
select
	productname, unitprice
from products
where discontinued = 1
order by unitprice desc
limit 5;
--Muestra el precio más bajo de los productos discontinuados y de los no discontinuados. Pista: el output debe tener dos registros, uno para los discontinuados y otro para los no.
select
	discontinued,
	min(unitprice)
from products
group by 1;
--Muestra el precio unitario que más veces se repite en productos cuyo valor total sea menor a 500.
select
	unitprice,
	count(*)
from products
where (unitprice * unitsinstock) < 500
group by 1
order by 2 desc
limit 1;
--Muestra la cantidad total de pedidos.
select 
	count(*)
from orders;
--Muestra la cantidad total y el peso promedio de los pedidos despachados en 1997.
select
	count(*), avg(freight)
from orders
where extract(year from shippeddate) = 1997;
--Muestra las 10 ciudades con mayor cantidad de pedidos, SIN mostrar cuántos pedidos tuvo.
select
	shipcity
from orders
group by 1
order by count (*) desc
limit 10;
--Muestra el nombre del destino, la dirección y la fecha de solicitud de los 10 pedidos más pesados entregados en 1996.
select 
	shipname, shipaddress, orderdate
from orders
where extract(year from shippeddate) = 1996
order by freight desc
limit 10;
--Muestra los ingresos totales por ventas (sin tener en cuenta los descuentos).
select
	sum(unitprice * quantity)
from orderdetails;
--Muestra a los top 3 países con mayor cantidad de órdenes solicitadas antes del 15 de mayo de 1997 pero que su peso total despachado en ese periodo no supere los 1000 kilos.
select
	shipcountry,
	count(*)
from orders
where requireddate < '1997/05/15'
group by shipcountry
having sum(freight) < 1000
order by count(*) desc
limit 3