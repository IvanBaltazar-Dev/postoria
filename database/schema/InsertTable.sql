
--CREACION DE TABLA USUARIOS
CREATE TABLE usuarios (
  usuario_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  descripcion TEXT,
  correo VARCHAR(150) NOT NULL,
  edad INTEGER NOT NULL,
  estado BOOLEAN NOT NULL
);

--CREACION DE TABLA CATEGORIAS
CREATE TABLE categorias (
  categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT
);

--CREACION DE TABLA ARTICULOS
CREATE TABLE articulos (
  articulo_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  titulo VARCHAR(200),
  contenido TEXT,
  fecha_publicacion DATE,
  vistas INTEGER DEFAULT 0,
  usuario_id INTEGER NOT NULL,
  CONSTRAINT fk_articulo_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(usuario_id)
);

--CREACION DE TABLA CATEGORIAS_X_ARTICULO
CREATE TABLE categorias_articulo (
  articulo_id INTEGER NOT NULL,
  categoria_id INTEGER NOT NULL,
  PRIMARY KEY (articulo_id, categoria_id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

--CREACION DE TABLA COMENTARIOS
CREATE TABLE comentarios (
  comentario_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  texto TEXT NOT NULL,
  usuario_id INTEGER NOT NULL,
  articulo_id INTEGER NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id)
);

--CREACION DE TABLA REACCIONES_ARTICULO
CREATE TABLE reacciones_articulo (
  usuario_id INTEGER NOT NULL,
  articulo_id INTEGER NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (usuario_id, articulo_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id)
);

-- CREACION DE TABLA SEGUIDORES
CREATE TABLE seguidores (
  seguidor_id INTEGER NOT NULL,
  seguido_id INTEGER NOT NULL,
  fecha_seguimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (seguidor_id, seguido_id),
  FOREIGN KEY (seguidor_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (seguido_id) REFERENCES usuarios(usuario_id),
  CONSTRAINT chk_no_autoseguimiento CHECK (seguidor_id <> seguido_id)
);

--MODIFICACION DE TABLAS
--Convertir a TIMESTAMP
ALTER TABLE articulos
ALTER COLUMN fecha_publicacion TYPE TIMESTAMP
USING fecha_publicacion::timestamp;

-- Agregar valor por defecto a fecha_publicacion
ALTER TABLE articulos
ALTER COLUMN fecha_publicacion SET DEFAULT CURRENT_TIMESTAMP;

-- Agregar timestamp a comentarios (con valor por defecto)
ALTER TABLE comentarios
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Agregar estado a tabla seguidores (boolean siendo TRUE sigue, FALSE dejo de seguir)
ALTER TABLE seguidores
ADD COLUMN estado BOOLEAN NOT NULL DEFAULT TRUE;