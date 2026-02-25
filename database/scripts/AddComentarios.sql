--COPIAR COMENTARIOS EN LA BASE DE DATOS
COPY comentarios(texto,usuario_id,articulo_id)
FROM '/csv/comentarios.csv'
DELIMITER ','
CSV HEADER

--INSERTAR 2 COMENTARIOS MANUALMENTE
INSERT INTO comentarios (texto, usuario_id, articulo_id)
VALUES
('Me pareció muy interesante el enfoque del artículo.', 1, 1),
('Excelente redacción, espero más contenido así.', 2, 1);

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

