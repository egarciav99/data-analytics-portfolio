# SQL sobre Northwind (PostgreSQL)

Ejercicios sobre la base de ejemplo **Northwind** (clientes, pedidos, productos, empleados y transportistas).

| Archivo | Contenido |
|---|---|
| `01_basicos.sql` | `SELECT`, `DISTINCT`, `WHERE`, `ORDER BY`, `GROUP BY` y agregaciones |
| `02_intermedios.sql` | `ILIKE`, `IN`, `CASE`, `EXTRACT`, `JOIN` entre varias tablas, fechas y `LIMIT` |
| `03_avanzados.sql` | El producto más caro de cada categoría resuelto de dos formas: con **subconsulta** y con **CTE + `ROW_NUMBER()`** |

**Qué cambió al revisarlo:**
- El filtro "nombre que empieza por Mar" usaba `'%mar%'` y ahora usa `'mar%'`.
- La subconsulta de `03` unía por el campo equivocado.
- Se quitaron los enunciados que no tenían respuesta.
