--COPIAR ARTICULOS EN LA BASE DE DATOS
COPY articulos(titulo, contenido, fecha_publicacion, vistas, usuario_id)
FROM '/csv/articulos.csv'
DELIMITER ','
CSV HEADER;

--INSERTAR 2 ARTICULOS MANUALMENTE
INSERT INTO articulos (titulo, contenido, fecha_publicacion, vistas, usuario_id)
VALUES
(
'La importancia del pensamiento crítico en la era digital',
'En un mundo saturado de información, desarrollar pensamiento crítico se ha convertido en una habilidad esencial. No solo permite analizar datos con objetividad, sino también tomar decisiones fundamentadas y responsables.',
NOW(),
0,
213
),
(
'Cómo construir hábitos sólidos para el crecimiento personal',
'El crecimiento personal no ocurre por casualidad. Se basa en hábitos consistentes y disciplina diaria. Identificar objetivos claros y trabajar progresivamente hacia ellos es la clave para resultados sostenibles.',
NOW(),
0,
341
);

--VERIFICAR TABLA ARTICULOS
SELECT * FROM articulos

--EXPORTAR CVS ID_ARTICULOS
COPY 
(
    SELECT articulo_id 
    FROM articulos 
    ORDER BY articulo_id
)
TO '/data/articulos_ids.csv' 
CSV HEADER;

TRUNCATE TABLE articulos RESTART IDENTITY CASCADE;