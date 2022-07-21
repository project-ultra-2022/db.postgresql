## /CLASE N1/%
# Texto

string, text, varchar

# Numero

Decimal, float, int

# boolean

si o no

# arrays

conjunto [22, "dani", true]

# objeto

{ nombre: Dani; edad: 22}   


commit de prueba


# /CLASE N2/%

# intesrtar registro

INSERT INTO public.roles(name)
	VALUES ('felipe');

 # eliminar registro 
DELETE FROM public.roles
	WHERE id=1;

 # Buscar un registro 
 Select * from  ej;roles

# Actualizar un registro 
UPDATE roles set name= 'admin'
where id =2 /*esto solamente es un ejemplo del una tabla para actualizar el registro usa el nombre y las propiedades de tu tabla*/

# crear una tabla con relacion
CREATE TABLE public.users
(
    id serial NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    date_created date NOT NULL,
    role_id integer,
    PRIMARY KEY (id),
    CONSTRAINT role_id FOREIGN KEY (role_id)
        REFERENCES public.roles (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
); 

# Atajo 
iNT +  AUTO_INCREMENT= SERIAL 

# tabla pgAdmin 
CREATE TABLE public.users
(
    id integer NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    date_create date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;


# /CLASE N3/%
# busqueda
si queremos buscar por ejemplo las transacciones de una persona ponemos lo siguiente  

select (name, age, id) 
from transactions 
Where name ilike "% ANTI %"  % el porcentaje sirve para poner cualquier cosa adelante o atras osea puede poner SantiAGO o FantiSA por ejemplo. 

ilike sirve para poner mayusculas y minusculas 
Para ello disponemos del operador Like, que permite distinguir entre mayúsculas y minúsculas, por lo que es case sensitive. Es decir, debemos indicar en el patrón de nuestras consultas, los caracteres en mayúscula o minúscula. En cambio con el operador iLike es indiferente, ya que no es case sensitive

where sirve para buscar:

y este seria el codigo -

 select  name, birthday     
from transactions 
where birthday= '2022-05-06
 casteo=convertir un tipo de dato a otro ej: varchar a date y los compara 

'2022-05-06' :: date - varchar

where  birthday = '2022-05-05' :: Date 
/*podemos cambiar el = por el ilike el ilike si*/

select * from students where sexo ilike 'm' and name ilike 'son%' /*Aqui el comando va a buscar en la tabla studiantes cualquier 

# join inner
si tenemos dos tablas y queremos ver algo parecido entre las dos tablas ponemos join inner o inner join y este seria el codigo:

select * from students_classes as sc /*sc seria students_classes pero con alias*/
inner join students as s on sc.id_student = s.id 

# as
si queremos sinmplificar alguna alabra ponemos as que es como un alias 

# on
on sirve para que sea igual  o para ser mas especificos traducido al español es la palabra "como" ej: 

# Ejercisio 
select sc.id as student, s.name, s.lastname1, c.name as class, sy.start_year 
from students_classes as sc
inner join students as s on sc.id_student = s.id 
inner join classes as c on sc.id_class = c.id 
inner join school_years as sy on sc.id_school_year = sy.id

# que es ||?
sirve para fucionar 

# segundo ejercicio 
select sc.id as student, (s.name || ' y ' || s.lastname1) as fullname, c.name as class, sy.start_year 
from students_classes as sc
inner join students as s on sc.id_student = s.id 
inner join classes as c on sc.id_class = c.id 
inner join school_years as sy on sc.id_school_year = sy.id 

# tercer ejercicio 
select 
t.id, 
(t.name || ' ' || t.lastname1) as fullname 

from teachers as t /* esto sirve para cambiarle el nombre y poder ponerle una abreviatura

select * from teachers

# cuarto ejercicio 
select 
t.id,
(t.name || ' ' || t.lastname1) as fullname,
d.* /* el d.* sirve para tarer todo lo que tenga  
from teachers as t
inner join departaments as d on t.id_departament = d.id


de la tabla classes vamos a traer los campos nombre ,tipo y curso 
teachers nombre completo
degress vamos a traer el nombre del grado 

# repaso
select /*significa mostrar*/
    c.name,
    c.type,
    c.course,
    (t.name || ' ' || t.lastname1) as fullname,
    d.name
from classes as c 
inner join teachers as t on c.id_teacher = t.id
inner join degrees as d on c.id_degree = d.id


Nos pedian traer de la tabla classes los campos nombre,tipo y curso para esto primero tenemos que poner 
"FROM classes as c" que quiere decir que c es classes ahora ya creado esta parte del codigo tenemos que empezar a traer los campos de classes que son nombre, tipo y curos para esto ponemos depues de SELECT c.name, c.type, c.course
Ya en esta parte habremos traido el nombre,tipo y curso a nustra tabla. Lo siguiente que nos pide es traer el nombre del profesor 


# limit
es para limitar la cantidad de registros que tenemos
select* 
from students 
limit 5;

# ejercicio 
buscar en classes nombre,ciudad y direccion y vamos a mostrar solo 7 registros 

# respuesta 
select 
name, 
city,
address

from students
limit 7

# *
el * sirve para traer todo 

# left join 
left join sirve para traer todo los datos seleccionados 

# ejercicio
de la tabla de classes vmos a traer todas las clases con su profesor asignado tenga o no tenga profesor y el departamento  del profesor 


# order by
signidica ordenar por 'name'  un ejemplo asi que va a empezar a ordenarlo alfabeticamnete a,b,c,d
 select *
 from students 
 order by name, lastname1 
 pero si queremos que sea de la Z a la A ponemos Desc

# case
Es una condicion sirve para definir cualquier campo 

select
    name,
    lastname1,
    case
    when sexo = 'M' 
    then 'Mujer'
    when sexo = 'H'
    then 'Hombre'
    end genero
from teachers

# group_by 
select
    t.name,
    count (c.id)
  
from classes as c 
inner join teachers as t on c.id_teacher = t.id
group by t.name
 
 count= contar cuantos registros tiene 
 sum = sumar la cantidad de puntos 
 group by /*s.name*/= agrupe por nombre

# ej
select 
    s.name, 
    sum (n.points),
    count(n.id)
    
 from notes as n
 inner join students as s on n.id_student = s.id 
 group by s.name 

 # ejercicios 
 buscar los profesores que son muejeres y vamos a contar cuantas classes tienen asociadas 
 select
    count (c.id),
    t.name
   
from teachers as t  
inner join classes as c on c.id_teacher = t.id 
where t.sexo = 'M'
group by t.name