# Data Analytics Portfolio · Elier Garcia

Trabajos de análisis de datos del **Máster en Business Analytics & IA (INESDI, 2026)**: limpieza y transformación con pandas, ETL a un data warehouse y SQL.

*Data analytics work from my Master's in Business Analytics & AI: data cleaning with pandas, ETL into a data warehouse, and SQL.*

| # | Proyecto | Qué demuestra | Stack |
|---|---|---|---|
| 01 | [Consumo energético de edificios municipales de Madrid](01-consumo-energetico-madrid/) | Limpieza de datos abiertos reales (35.000 lecturas), normalización z-score por distrito y año, y clasificación de eficiencia por percentiles | pandas, matplotlib |
| 02 | [ETL a un data warehouse en PostgreSQL](02-etl-data-warehouse/) | De JSON a la tabla de hechos: nulos con códigos indeterminados, **integridad referencial** contra las dimensiones y verificación de la carga | pandas, SQLAlchemy, PostgreSQL |
| 03 | [SQL sobre Northwind](03-sql-northwind/) | Consultas básicas, `JOIN`, agregaciones, `CASE`, subconsultas, CTE y **funciones de ventana** | PostgreSQL |

También hice dashboards de BI en Looker Studio (conectado a Firestore) y en Power BI. Están en mi portafolio: **[egarciav99.github.io](https://egarciav99.github.io/#portfolio)**.

## Cómo ejecutarlo
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
jupyter lab
```
- **01** incluye el CSV de datos abiertos del Ayuntamiento de Madrid. Si lo borras, lo descarga del portal.
- **02** necesita una base PostgreSQL con el esquema `dw_aero`, que no se incluye. Las credenciales se leen de las variables de entorno `PGUSER`, `PGPASSWORD`, `PGHOST`, `PGPORT` y `PGDATABASE`.
- **03** usa la base de ejemplo Northwind en PostgreSQL.

## Notas
- 01 y 02 son trabajos individuales; 03 son ejercicios de SQL de clase.
- Antes de publicarlos se revisaron y corrigieron. En cada carpeta se indica qué cambió.
