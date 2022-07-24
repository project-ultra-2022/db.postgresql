# uso de show
mostrar las tablas que ya existen 
ejemplo:
show tables
# uso de describe
se usa para ver el detalle de una tabla 
ejemplo: 
describe usuario
# eliminar una tabla--> drop
se usa para eliminar una tabla con comando usando la palabra drop table seguida del nombre de la tabla que se desea eliminar 
ejemplo drop table usuario
# crear tabla --> created
create table alumnos (
nombre varchar (50)
apellido varchar (50)
edad int (100)
) 

# insertar datos --> insert / values---> para insertar valores 
ejemplo:
insert into alumnos(nombre,apellido,direccion, telefono,edad) 
 values ('selena','merchan','eucalipto','3507192589','20');

# si solo quiero insertar datos en ALGUNAS casillas 
insert into alumnos (nombre,telefono,edad) 
values ('Daniel','3507192591','22')

# insertar datos por el orden de los datos que tengamos sin necesidad de especificarlos
insert into alumnos values ('juan','maldonado','santander','3112997659','16');

# mostrar la tabla 
mostrar toda la tabla de alumnos 
select * from alumnos 

mostrar algunos campos
select nombre, direccion from alumnos

# recuperar datos con where 
traer todos los datos de la tabla alumnos que tengan en su contenido de nombre selena, es una condición 
ejemplo: select * from alumnos where nombre = 'selena' ;

si queremos traer solo dos campos de la tabla de un valor en especifico es decir todas las personas que tengan 20 años pero con su respectivo nombre se usa este comando 
select nombre, edad from alumnos where edad = '20' ;

# operadores relacionales 
# = igual
# <> diferente
# > mayor que
# < menor que
# >= mayor o igual que
# <= menor o igual que 

select * from alumnos where nombre = 'selena'
select * from alumnos where nombre <> 'selena'
select nombre, apellido from alumnos where edad > 20
select * from alumnos where edad < 40 
select * from alumnos where edad >= 20
select * from alumnos where edad >= 35

# borrar algunos registros de la tabla
delete from alumnos where nombre = 'Daniel'

# actualizar datos de la tabla 
// actualizar algunos datos 
update alumnos set edad = 15 where nombre = 'diana' 
// actualizar todos los datos
update alumnos set edad = 38
// actualizar varios campos pero no todos de una misma persona 
update alumnos set telefono = '3108966543', direccion = 'paloquemado' where nombre = 'romina' 

# eliminar la base datos ya existente 
drop database if exists practica // practica es el nombre de la base de datos

# crear una base de datos 
DROP DATABASE IF EXISTS practica;
CREATE DATABASE practica;

# crear una tabla con llave primaria // en este caso la llave primaria es nombre
create table usuario (
nombre varchar(50),
apellido varchar(50),
correo varchar, 
primary key(nombre)
); 

# describe usuario
describe la tabla completa
Select * from information_schema.columns where table_name = 'usuario';

# zerofill 
llena las casillas de ceros para que todas tengan el id en la misma cantidad

# creamos una tabla de productos con un id
create table productos(
id serial not null,
nombre varchar(50),
proveedor varchar(50),
descripcion text,
precio decimal(5,2),
cantidad smallint,
primary key(id)
);

# columnas calculadas// multiplica las casillas de precio y cantidad y crea otra con el total 
select nombre, precio, cantidad, precio*cantidad from productos 
# calcular el 10% del precio del producto
select nombre, precio, precio*0.1, precio-(precio*0.1) from productos

# funciones de manejo de cadenas 

# concatenar texto
select concat('Hola,',' ','como estas?')// concat
select concat_ws('-','Daniel','Valencia','Luis')// El resultado de este codigo es Daniel-Valencia-Luis 
select concat_ws('/','Daniel','Valencia','Luis')// El resultado de este codigo es Daniel/Valencia/Luis
# length
select length('hola, mi amorcito')// cuenta el numero de caracteres que hay entre el parentesis incluyendo los espacios en blanco. 
# trim
select trim('    Udemy    ');// elimina los espacios, es el mas usado. 

# replace
select replace('xxx.udemy.com','x','w'); // primero se pone la frase, luego lo que quieres reemplazar y despues con que lo quieres reemplazar
# repeat
select repeat('SQL', 5); // el primer valor es el que se repite y el segundo es el numero de veces
# reverse
select reverse('Hola'); // pone al revez la palabra 
# lower// pone todo el texto en minuscula
select lower('Hola, CoMO EsTaN?');

# upper// pone todo el texto en mayuscula
select upper('Hola, CoMO EsTaN?');

# // divide nombre y precio entre un /
select concat_ws('/', nombre, precio) from productos;

# // selecciona 5 caracteres de la casilla nombre
select left(nombre, 5) from productos; 

# // pone en minuscula los nombres y en mayusculas las descripciones 
select lower(nombre), upper(descripcion) from productos; 

# Funciones Matematicas

select nombre, precio from productos;
# ceiling // redondea el precio hacia arriba 
select ceiling(precio) from productos;
# floor // redondea hacia abajo
select floor(precio) from productos;
# mod // devuelve el residuo de una división
select mod(10, 3);
select mod(10, 2);
# powe // eleva un numero ejemplo 2 a la 3 
select power(2,3);
# round // redondea hacia arriba cuando es mayor de 50 
select round(20.60);
# round // redondea hacia abajo cuando es menor de 50
select round(20.12);

# Order By
select nombre, precio from productos;
# ordena alfabeticamente el nombre
select nombre, descripcion, precio, cantidad from productos order by nombre;
# ordena en orden descendente/ al revez z-a
select nombre, precio, cantidad from productos order by nombre desc;
# ordena en orden ascendente/ nombre z-a, precio a-z
select nombre, precio, descripcion, cantidad from productos order by nombre desc, precio asc;

# Operadores Logicos
select * from productos;
# and = "y"// deben cumplirse las dos condiciones
select * from productos where (proveedor = 'HP') and (precio <= 200);
# or = "y/o" // debe cumplirse una de las dos condiciones o las dos condiciones 
select * from productos where (proveedor = 'H') or (descripcion = 'Las mejores laptop');
# xor "o" // no cumple las dos condiciones, cumple una o la otra 
select * from productos where (proveedor = 'HP') xor (precio <= 200);
# not = "not"// no cumple la condicion, es decir trae todos los diferentes a logitech
select * from productos where not (proveedor = 'Logitech');

# Operadores Relacionales Between - in
# // precio mayor igual que 100 y menor o igual que 160
select * from productos where precio>=100 and precio<=160;
# // between reemplaza los <> y los =. Between=entre. pero aqui pedimos los que no esten entre 100 y 160
select * from productos where not precio between 100 and 160;

# // nos trae la condicion una o la otra (or)
select * from productos where proveedor = 'HP' or descripcion = 'La mejor laptop';
# // in reemplaza el (or)
select * from productos where proveedor in('HP', 'La mejor laptop');

# Busqueda de patrones like- not like// ayuda a comparar trozos de la cadena 
select * from productos;
select * from productos where descripcion = 'laptop';// no trae nada porque la descripcion no solo dice laptop
# solo busca en productos en descripción laptop
select * from productos where descripcion like '%laptop%'; 
# trae todo lo que no contenga laptop en la casilla de descripcion 
select * from productos where descripcion not like '%laptop%'; 
# trae todo lo que no tiene L en nombre 
select * from productos where nombre not like 'L%';
# trae todo lo que tiene L en nombre
select * from productos where nombre not like 'L%';
# lo que sea que comience con l lo busca 
select * from productos where nombre not like 'l%';

# Patron de busqueda Regexp- not Regexp// en este caso no es necesario poner el signo de porcentaje

| denota alternancia (cualquiera de las dos alternativas).

* denota la repetición del elemento anterior cero o más veces.

+ denota la repetición del elemento anterior una o más veces.

? denota la repetición del elemento anterior cero o una vez.

{ m } denota la repetición del elemento anterior exactamente m veces.

{ m ,} denota repetición del elemento anterior m o más veces.

{ m , n } denota la repetición del elemento anterior al menos m y no más de n veces.

Los paréntesis () se pueden utilizar para agrupar elementos en un solo elemento lógico.

Una expresión entre corchetes [...] especifica una clase de carácter, al igual que en las expresiones regulares POSIX.

select * from productos where nombre similar to '%(b|d)%'
'abc' SIMILAR TO 'abc'          
'abc' SIMILAR TO 'a'            
'abc' SIMILAR TO '%(b|d)%'      
'abc' SIMILAR TO '(b|c)%'  
'-abc-' SIMILAR TO '%\mabc\M%' 
'xabcy' SIMILAR TO '%\mabc\M%' 


# Funcion count

select * from productos;
## cuenta los productos que hay
select count(*) from productos;
## cuenta los productos hp que hay
select count(*) from productos where proveedor = 'HP';
## cuenta los productos que contienen laptop
select count(*) from productos where descripcion like '%laptop%';
# Funciones de Agrupamientos
suma los valores de un campo especifico
select sum(cantidad) from productos;
## suma la cantidad de productos cuando el proveedor es hp
select sum(cantidad) from productos where proveedor = 'HP';
## selecciona el precio maximo de la tabla productos 
select max(precio) from productos;
## selecciona el precio minimo de la tabla productos 
select min(precio) from productos;
## selecciona el precio minimo de la tabla productos los nombres que contienen laptop
select min(precio) from productos where nombre like '%Laptop%';
## selecciona el precio maximo de la tabla productos los nombres que contienen laptop
select max(precio) from productos where nombre like '%Laptop%';
## selecciona el promedio de los productos del precio en laptops
select avg(precio) from productos where nombre like '%Laptop%';

# count// cuantas personas hay de la ciudad x
select count(*) from visitantes where ciudad='Cordoba';
select count(*) from visitantes where ciudad = 'Alta Gracia';
# selecciona la ciudad, cuentalos y muestra los visitantes agrupados por cada ciudad en total
select ciudad, count(*) from visitantes group by ciudad;
# selecciona el campo sexo y suma el monto de la compra de los visitantes segun el sexo 
select sexo, sum(montocompra) from visitantes group by sexo;
# selecciona el sexo y el max y minimo de compra segun su grupo de sexo
select sexo, max(montocompra), min(montocompra) from visitantes group by sexo;
# selecciona ciudad, sexo y cuenta todos los visitantes y agrupalos por ciudad y sexo. 
select ciudad, sexo, count(*) from visitantes group by ciudad, sexo;
# selecciona ciudad y cuenta todos los visitantes cuando la ciudad es diferente a cordoba y agrupalos en ciudad
select ciudad, count(*) from visitantes where ciudad<>'Cordoba' group by ciudad;

# registros duplicados distinct
select * from productos;
select proveedor from productos;
# muestra los registros sin duplicar de productos
select distinct proveedor from productos;
 
# indice se usa para campos 

## Primary// solo uno, es la llave primaria, se crea solo. numerico o varchar
## index // mas de un campo, permite null o numeros. 
## unique // el valor debe ser unico ejemplo en correos o telefono

# subconsultas
una subconsulta es una instrucción select anidada dentro de otra instrucción select, select into, delte o update, incluso dentro de otra subconsulta. 
## tipos de subconsultas
1. las que retornan un solo valor y se utilizan con un solo valor de comparación o en lugar de una expresión 
2. las que retornan una lista de valores y se combinan con 'in', o los operadores 'any','some' y 'all'
3. los que testean la existencia con 'exists'
