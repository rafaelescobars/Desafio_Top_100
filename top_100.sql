-- Create a new database called 'peliculas'
CREATE DATABASE peliculas;

--Conexión a la bas peliculas
\c peliculas;

--Crear tabla peliculas
CREATE TABLE peliculas(
  id INT NOT NULL,
  pelicula VARCHAR(60) NOT NULL,
  año_estreno SMALLINT NOT NULL,
  director VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);

--Crear tabla reparto sin encabezados!!
CREATE TABLE reparto(
  id INT NOT NULL,
  actor VARCHAR(30) NOT NULL,
  FOREIGN KEY (id) REFERENCES peliculas (id)
);

--Importar datos peliculas
\copy peliculas FROM 'C:\\Users\\rafae\\OneDrive - usach.cl\\Cursos\\Desarrollador FullStack Javascript\\3 -Lenguaje De Consultas A Una Base De Datos PostgreSQL\\Desafio_Top_100\\CSV\\peliculas.csv'  CSV HEADER;

--Importar datos reparto
\copy reparto FROM 'C:\\Users\\rafae\\OneDrive - usach.cl\\Cursos\\Desarrollador FullStack Javascript\\3 -Lenguaje De Consultas A Una Base De Datos PostgreSQL\\Desafio_Top_100\\CSV\\reparto.csv'  CSV;

--Obtener id de pelicula Titanic
SELECT id AS id_titanic FROM peliculas WHERE pelicula='Titanic';

--Listar actores que aparecen en Titanic
SELECT actor as actores_en_titanic FROM reparto WHERE id=2;

--Contar en cuántas películas aparece Harrison Ford
SELECT COUNT (id) as numero_peliculas_harrison_ford FROM reparto WHERE actor='Harrison Ford';

--Consultar peliculas entre 1990 y 1999
SELECT año_estreno, pelicula FROM peliculas WHERE año_estreno >=1990 AND año_estreno <=1999 ORDER BY pelicula ASC;

--Consultar titulos y su longitud, con longitud como longitud_titulo
SELECT pelicula, LENGTH(pelicula) as longitud_titulo FROM peliculas;

--Consulta mayor longitud de caracateres en titulos
SELECT MAX(LENGTH(pelicula)) AS maxima_longitud_titulo FROM peliculas;