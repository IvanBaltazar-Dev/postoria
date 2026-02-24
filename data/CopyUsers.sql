--VERIFICAR LOS ELEMENTOS DE CADA BASE DE DATOS
SELECT pg_ls_dir('/data');

--COPIAR USUARIOS A BASE DE DATOS
COPY usuarios(username, nombre, apellido, descripcion, correo, edad, estado)
FROM '/data/usuarios.csv'
DELIMITER ','
CSV HEADER;

--VERIFICAR TABLA USUARIOS
SELECT * FROM usuarios

--EXPORTAR CVS ID_USUARIOS 
COPY 
(
    SELECT usuario_id 
    FROM usuarios 
    ORDER BY usuario_id
)
TO '/data/usuarios_ids.csv' 
CSV HEADER;


--COPIAR ARTICULOS EN LA BASE DE DATOS
COPY articulos(titulo, contenido, fecha_publicacion, vistas, usuario_id)
FROM '/data/articulos.csv'
DELIMITER ','
CSV HEADER;

--VERIFICAR TABLA ARTICULOS
SELECT * FROM articulos

--COPIAR ARTICULOS EN LA BASE DE DATOS
COPY categorias(nombre,descripcion)
FROM '/data/categorias.csv'
DELIMITER ','
CSV HEADER;

--VERIFICAR TABLA CATEGORIAS
SELECT * FROM categorias

--EXPORTAR CVS ID_ARTICULOS
COPY 
(
    SELECT articulo_id 
    FROM articulos 
    ORDER BY articulo_id
)
TO '/data/articulos_ids.csv' 
CSV HEADER;

--COPIAR COMENTARIOS EN LA BASE DE DATOS
COPY comentarios(texto,usuario_id,articulo_id)
FROM '/data/comentarios.csv'
DELIMITER ','
CSV HEADER

--VER TABLA COMENTARIOS
SELECT *
FROM comentarios

--EXPORTAR CVS ID_CATEGORIAS
COPY 
(
    SELECT categoria_id
    FROM categorias 
    ORDER BY categoria_id
)
TO '/data/categoria_ids.csv' 
CSV HEADER;

--QUITAR VALORES DUPLICADOS PARA COPIAR
--CREAMOS UNA TABLA TEMPORAL
CREATE TEMP TABLE temp_categorias_articulo (
    articulo_id INTEGER,
    categoria_id INTEGER
);

--COPIAR ARTICULOS_CATEGORIAS EN LA TABLA TEMPORAL
COPY temp_categorias_articulo (articulo_id, categoria_id)
FROM '/data/articulo_categoria.csv'
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

