
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

