# PostgreSQL

Para interactuar con las bases de datos se puede trabajar tanto desde la Query Tool, como desde la interfaz gráfica.df

# Query Tool

poner las palabras clave en mayus y los datos en minus.

# creando tabla. CREATE

CREATE TABLE empleados(
numempleado INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),   
fechanacimiento DATE,
sueldo DECIMAL (7,2),
puesto VARCHAR (45)   
);

# para visualizar o consultar una tabla. SELECT

SELECT *(asterisco significa todo) FROM empleados(nombredetabla)

# insertando registros en la tabla. INSERT

INSERT INTO empleados(numempleado, nombre, apellidopaterno, apellidomaterno, fechanacimiento, sueldo, puesto)
VALUES (1, 'Alan', 'Luis', 'Sosa', '2021-12-08', 4250.8, 'Ajedrecista'),
(2, 'esteban', 'Luis', 'Valencia', '2005-05-29', 5000.1, 'Psicólogo'),
(3, 'Daniel', 'Luis', 'Valencia', '2000-04-15', 9000.5, 'Programador')

# consultas especificas

ponemos el nombre de la columna o columnas que queramos ver

SELECT nombre,apellidopaterno,apellidomaterno,sueldo FROM empleados

# clausula WHERE

where es un condicional para busquedas. "Buscar en la tabla tal donde (condición)"
SELECT *FROM alumnos WHERE promedio>=90

 # WHERE NOT

"Buscar en la tabla tal a todos, EXCEPTO a los que cumplan esta condicion"
SELECT * FROM alumnos WHERE NOT carrera= 'Ingenieria de Sistemas'

# poner un nombre a un conjunto de columnas

a veces, cuando SELECT muchas columnas repetidamente, como por ejemplo el nombre, el apellido paterno y el apellido materno. Podemos concatenar estos tres campos y darle un nombre. Para concatenar las columnas utilizamos:
nomcolumna||' '||nomcolumna

Ejemplo:

SELECT nombre||' '||apellidopaterno||' '||apellidopaterno (y para ponerle un nombre a estas tres columnas, escribimos: AS nombre que le queramos poner) AS nombrecompleto

# operadores lógicos AND y OR

sirven para agregarle más condiciones a nuestras consultas.

ejemplos: 

SELECT * FROM alumnos WHERE promedio >= 90 AND carrera= 'Mercadotecnia'

SELECT * FROM alumnos WHERE promedio <= 90 AND carrera= 'Ingenieria en Sistemas' OR promedio <= 90 AND carrera = Psicologia

SELECT * FROM alumnos WHERE promedio >= 90 OR carrera = 'Psicologia' 

# Borrar Registros de una tabla. DELETE

si no le agregamos ninguna condicion, entonces borrara todos los registros de la tabla: DELETE FROM nombredetabla

Podemos utilizar la condicion WHERE, WHERE NOT, AND, y/u OR para consultar y borrar con exactitud el registro que queramos

# borrar una tabla DROP

sirve para borrar una tabla completa, no los registros, sino la tabla.
 
DROP TABLE nombretabla.

 podemos borrar varias tablas a la vez
DROP TABLE nombretabla1,nombretabla2

 podemos darle una condicion sencilla para verficar si existe: IF EXISTS.
DROP TABLE IF EXISTS nombretabla

# UPDATE actualizar un registro 

UPDATE nombredetabla SET nombredecampo = 'valordecampo' WHERE condicion que identifique lo que queramos buscar, id=1 por ejemplo;

# ORDER BY
para ordenar alfabeticamente o por numero de menor a mayor
SELECT * FROM clientes ORDER BY totaldeuda DESC


# LIKE and ILIKE

LIKE reconoce mayus y minus, mientras que ILIKE busca toda coincidencia con los caracteres seleccionados.

SELECT * FROM clientes WHERE nombre ILIKE '%ber%'

que contenga estos caracteres, lo que esta entre los porcentajes.

# Cambio de tipo de datos
WHERE birthday = '2022-05-29' :: date

SELECT * FROM students WHERE birthday :: VARCHAR ILIKE '199%'

# JOINS TEMA IMPORTANTE
Left join trae toda la tabla, sin importar que haya campos nulos
SELECT 
    c.*,
    t.id_departament
    
FROM  classes as c

left join teachers as t on c.id_teacher = t.id
left join departaments AS d on t.id_departament = d.id 

SELECT * FROM teachers
inner join trae los campos completos 
SELECT 
    t.id,
    t.name||' '||lastname1 as completename,
    t.id_departament,
    d.*

FROM teachers as t
inner join departaments as d on t.id_departament = d.id


otro ejemplo
select 
    sc.id as student, 
    (s.name ||' '|| s.lastname1) as fullname, 
    c.name as class, 
    substring(sy.start_year:: VARCHAR, 1,4) as year
    
from students_classes as sc 
inner join students as s on sc.id_student = s.id
inner join classes as c on sc.id_class = c.id 
inner join school_years as sy on sc.id_school_year = sy.id
where s.name = 'Pedro' 

# CLAUSULA DISTINCT
Trae los valores de tal campo, PERO que no se repitan

SELECT DISTINCT totaldeuda FROM clientes

# CLAUSULA LIMIT
Nos sirve para traer solo la cantidad de registros que le asignemos
SELECT name, city, address 
FROM students LIMIT 10

# SENTENCIA CASE
SELECT 
    name,
    lastname1,
    CASE
        when sexo = 'M'
        then 'Mujer'
        when sexo = 'H'
        then 'Hombre'
    
    END genero
FROM teachers 

# GROUP BY

SELECT  
    s.name,
    SUM (n.points),
    COUNT (n.id)


FROM notes AS n

INNER JOIN students as s ON n.id_student = s.id
GROUP BY s.name


buscar profesores  que son mujeres. contar cuantas clases tienen asociadas

Mostrar el nombre completo del estudiante y cuántas clases tiene asignadas

Cuando terminen el ejercicio lo suben al repositorio, dentro de su carpeta con el nombre "tareaMartes.sql"