--VERIFICAR LOS ELEMENTOS DE CADA BASE DE DATOS
SELECT pg_ls_dir('/csv');

--COPIAR USUARIOS A BASE DE DATOS
COPY usuarios(username, nombre, apellido, descripcion, correo, edad, estado)
FROM '/csv/usuarios.csv'
DELIMITER ','
CSV HEADER;

--INSERTAR 2 USUARIOS MANUALMENTE
INSERT INTO usuarios (username, nombre, apellido, descripcion, correo, edad, estado)
VALUES
('andrea01', 'Andrea', 'Gutierrez', 'Amante del marketing y la tecnología', 'andrea01@gmail.com', 22, true),
('carlos_dev', 'Carlos', 'Ramirez', 'Backend developer en formación', 'carlos.dev@gmail.com', 25, true);

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
