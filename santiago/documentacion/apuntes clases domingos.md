# insertar registro

INSERT INTO public.roles(
	id, name)
	VALUES ();;

# borrar registro

DELETE FROM public.roles
	WHERE id=1;

# buscar registro

SELECT * from 

# actualizar registro

UPDATE roles
SET name='Admin'
where <condition>

# crear tabla con relacion

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

# like y ilike

Para ello disponemos del operador Like, que permite distinguir entre mayúsculas y minúsculas, por lo que es case sensitive. Es decir, debemos indicar en el patrón de nuestras consultas, los caracteres en mayúscula o minúscula. En cambio con el operador iLike es indiferente, ya que no es case sensitive.

# busqueda
si queremos buscar por ejemplo las transacciones de una persona ponemos lo siguiente  
select (name, age, id) 
from transactions 
Where name ilike "% ANTI %"  % el porcentaje sirve para poner cualquier cosa adelante o atras osea puede poner SantiAGO o FantiSA por ejemplo. 
ilike sirve para poner mayusculas y minusculas 
Para ello disponemos del operador Like, que permite distinguir entre mayúsculas y minúsculas, por lo que es case sensitive. Es decir, debemos indicar en el patrón de nuestras consultas, los caracteres en mayúscula o minúscula. En cambio con el operador iLike es indiferente, ya que no es case sensitive
where sirve para buscar

y este seria el codigo:

 select  name, birthday     
from transactions 
where birthday= '2022-05-06
casteo=convertir un tipo de dato a otro ej: varchar a date y los compara 

'2022-05-06' :: date - varchar

where  birthday = '2022-05-05' :: Date 
/podemos cambiar el = por el ilike el ilike si/

select * from students where sexo ilike 'm' and name ilike 'son%' /*Aqui el comando va a buscar en la tabla studiantes cualquier 

# join inner
si tenemos dos tablas y queremos ver algo parecido entre las dos tablas ponemos join inner o inner join y este seria el codigo:

select * from students_classes as sc /sc seria students_classes pero con alias/
inner join students as s on sc.id_student = s.id 

# as
si queremos simplificar alguna palabra ponemos as que es como un alias 

# on
on sirve para hacer la union con la otra tabla o tambien sirve para decir con osea unir esto 'con'

# que es ||?

sirve para abrir campos por ejemplo en el nombre y apellido 

# Ejercicio

En la tabla de clases van a traer los campos nombre, tipo y curso y el nombre del profesor completo
y en la tabla de degrees van a traer el nombre del grado.

select
    c.name,
    c.type,
    c.course,
    d.name,
    (t.name || ' ' || t.lastname1) as fullname
from classes as c 
inner join teachers as t on c.id_teacher = t.id
inner join degrees as d on c.id_degree = d.id 

# Limit
Sirve para poner un limite a la cantidad de registro que queremos ejemplo

select 
name,
city,
address

from students
limit 7   

# Left join
 
 Es lo mismo que el inner join solo que el left join trae todo tambien los campos not null

 ejemplo:

 select *
from classes as 
left join teachers as t
on c.id_teacher = t.id

# order by

Order by sirve para ordenar por lo que uno pida

Ejemplo:

select *
from students
order by id

ejemplo 2:

order by name, lastname  

