--QUITAR VALORES DUPLICADOS PARA COPIAR
--CREAMOS UNA TABLA TEMPORAL
CREATE TEMP TABLE temp_categorias_articulo (
    articulo_id INTEGER,
    categoria_id INTEGER
);

--COPIAR ARTICULOS_CATEGORIAS EN LA TABLA TEMPORAL
COPY temp_categorias_articulo (articulo_id, categoria_id)
FROM '/csv/articulo_categoria.csv'
DELIMITER ','
CSV HEADER;

--INSERT LIMPIO A LA TABLA REAL
INSERT INTO categorias_articulo (articulo_id, categoria_id)
SELECT DISTINCT articulo_id, categoria_id
FROM temp_categorias_articulo;

--VERIFICAR INSERSION
SELECT * FROM categorias_articulo
ORDER BY articulo_id, categoria_id;

--ELIMINAR TABLA TEMPORAL
DELETE FROM temp_categorias_articulo;

--FORMA DIRECTA DE INSERTAR VALORES QUE NO SON DUPLICADOS
INSERT INTO categorias_articulo (articulo_id, categoria_id)
SELECT DISTINCT articulo_id, categoria_id
FROM temp_categorias_articulo
ON CONFLICT DO NOTHING;