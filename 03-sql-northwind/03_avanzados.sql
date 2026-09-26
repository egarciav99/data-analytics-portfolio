--EJEMPLO: “Para cada categoría de producto, muestra el nombre del producto más caro.”
--Utilizando Subqueries
SELECT
 products.productname,
 products.categoryid,
 products.unitprice
	from products
left join (
SELECT 
	categoryid, 
	max(unitprice) as max_precio_por_categoria
from products
group by categoryid
) as max_precio_por_cat on products.categoryid = max_precio_por_cat.categoryid
where products.unitprice = max_precio_por_cat.max_precio_por_categoria;

--Utilizando CTEs (Common Table Expressions) y Window Functions
with ranked_products as (
	select
	productname,
	categoryid,
	unitprice,

	row_number() over(
		partition by categoryid
		order by unitprice desc, productname
		) as mi_ranking_de_precios

		from products
		)

select
	categoryname,
	productname

from ranked_products
left join categories using (categoryid)
where mi_ranking_de_precios = 1;
