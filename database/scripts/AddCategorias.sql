--COPIAR CATEGORIAS EN LA BASE DE DATOS
COPY categorias(nombre,descripcion)
FROM '/csv/categorias.csv'
DELIMITER ','
CSV HEADER;

--VERIFICAR TABLA CATEGORIAS
SELECT * FROM categorias
