# ETL de rutas aéreas a un data warehouse en PostgreSQL

Evaluación del máster. El objetivo es cargar `rutas.json` en la tabla de hechos `dw_aero.hc_rutas` garantizando la calidad del dato.

1. De JSON a un DataFrame de pandas.
2. **Nulos:** se sustituyen por códigos indeterminados (`Z99`…) ajustados a la longitud del campo. La columna que no existe en el destino se descarta, tras consultar `information_schema`.
3. **Integridad referencial:** los aeropuertos de origen y destino se validan contra `dm_aeropuertos` (`Z999`) y las aerolíneas contra `dm_aerolineas` (`Z9999`), con `merge` de tipo left.
4. **Carga** en `hc_rutas` y comprobación de que coinciden las filas del DataFrame y las de la tabla.
5. Ranking de rutas por aeropuerto de origen.

**Requisitos:** una base PostgreSQL con el esquema `dw_aero` (no incluida). Las credenciales se leen de variables de entorno. La carga (`to_sql`) está comentada para no duplicar datos al volver a ejecutarlo.

**Qué cambió al revisarlo:** las credenciales se leen de variables de entorno en lugar de estar en el código, y se quitaron celdas vacías.
