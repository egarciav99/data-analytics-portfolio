--1) Muestra los clientes cuya persona de contacto posee un nombre que comience con "Mar".
select
	*
from customers
where contactname ilike 'mar%';
--2) Muestra el nombre de los productos cuyo precio unitario sea 15, 20 o 25, o que su forma de empaquetamiento sea en cajas.
select
	productname
from products
where (quantityperunit ilike '%box%') or (unitprice in ('15', '20', '25'));
--3) Devuelve la suma de todos los años de nacimiento de los empleados.
select 
	sum(extract(year from birthdate))
	from employees;
--4) Devuelve dos filas, una que muestre la cantidad de productos cuyo precio unitario es mayor o igual a 30, y otra que muestre el resto.
select
	case
	when unitprice >= 30 then 'mayor_30'
	else 'otros'
	end as price_category,
	count (unitsinstock) as cantidad
from products
group by 1;
--5) Muestra los nombres de los clientes que tienen pedidos pendientes.
select distinct
	customers.companyname
from orders
left join customers on (customers.customerid = orders.customerid)
where orders.shippeddate is null;
--6) Muestra, para cada nombre de categoría, la cantidad total de productos vendidos.
select 
	categoryname as categoria,
	sum(quantity) as productos_vendidos
from orderdetails
left join products using (productid)
left join categories using (categoryid)
group by categoryname
order by categoryname;
--7) Muestra el nombre de los productos que no fueron entregados en 1996.
select distinct
	products.productname
from orderdetails
left join orders using (orderid)
left join products using (productid)
where (extract(year from orders.shippeddate) != 1996);
--8) Muestra al empleado con más pedidos registrados.
select
	firstname || ' ' || lastname as nombre_completo, count(*)
from orders
left join employees using (employeeid)
group by 1
order by count(*) desc
limit 1;
--9) Calcula el promedio de tiempo de envío de los pedidos.
select
 avg((shippeddate - orderdate)*24) || ' horas' as promedio
from orders;
--10) Muestra al transportista con mayor cantidad de pedidos entregados.
select 
	shippers.companyname,
	sum(orderdetails.quantity)
from orderdetails
left join orders using (orderid)
left join shippers on (shippers.shipperid = orders.shipvia)
group by 1
order by 2 desc
limit 1;
