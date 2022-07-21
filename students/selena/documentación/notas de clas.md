# insertar registro
INSERT INTO public.roles(
	 name)
	VALUES ('selena');
# borrar un registro
DELETE FROM public.roles
	WHERE id=1;
# crear un registro con texto
insert into roles 
(name) 
values ('administrador')
# buscar un registro 
select * from roles
# actualizar dato de la tabla
update roles 
set name = 'admin'
where id = '2'
# crear una tabla con relación
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
# uso de varchar
se usa cuando se va a usar un tipo de dato como texto tambien se puede CHAR el cual solo guarda un caracter
problema: sexo ENUM('H', 'M') NOT NULL 
solución: sexo VARCHAR not null default ('H' , 'M')
defaut: se usa cuando se quiere poner una opción por defecto
int + autoincremento= serial --> CUANDO HAY ID SE PONE SERIAL SOLO PUEDE HABER UNA SERIAL

CREATE TABLE id students_class (
    id serial primary key,
    id_student INT NOT NULL,
    id_class INT NOT NULL,
    id_school_year INT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES students(id),
    FOREIGN KEY (id_class) REFERENCES classes(id),
    FOREIGN KEY (id_school_year) REFERENCES school_years(id)
);

Siempre tiene que tener id serial primary key y solo puede haber una. 
# para cambiar de un caracter a otro
where birtday = '2022-05-06':: date
// like solo busca en mayusculas o minusculas
// ilike busca en mayusculas o minusculas
// ilike es lo mismo que igual

# joins de sql 
# inner join 
es una mezcla entre las dos tablas 
# as 
alias/ cambiar el nombre momentaneamente por uno mas corto
# on 
esta llave es 
# //
select sc.id as student, (s.name || ' es feo ' || s.lastname1) as fullname, c.name as class, 
substring(sy.start_year:: varchar, 1, 4) as year

from students_classes as sc
inner join students as s on sc.id_student = s.id
inner join classes as c on sc.id_class = c.id 
inner join school_years as sy on sc.id_school_year = sy.id
where s.name = 'Pedro' and substring(sy.start_year:: varchar, 1, 4) = '2015'/ para parametrizarlo en el año 2015 y en el nombre pedro/


# ejemplo de inner join  
select sc.id as student, (s.name || ' es feo ' || s.lastname1) as fullname, c.name as class, 
substring(sy.start_year:: varchar, 1, 4) as year
# ejemplo de join con as // as es para renombrar
from students_classes as sc
inner join students as s on sc.id_student = s.id // inner join renombramos student
inner join classes as c on sc.id_class = c.id // inner join renombramos class
inner join school_years as sy on sc.id_school_year = sy.id // inner join renombramos id_school_year
where sy.id = 2 and s.id = 4  // buscar en la tabla de datos por id y el nuevo nombre

select * from departaments
# actividad en clase id del profesor, full name y departamento

select t.id as teachers, (t.name || ' ' || t.lastname1) as fullname, d.id, d.name as departaments
from teachers as t
inner join departaments as d on t.id_departament = d.id
id del profesor, full name y departamento
# ejercicio
tabla de clases nombre, tipo, curso  
teachers (full name) del profesor 
en la tabla de degrees el nombre del grado.
## solucion 
select c.name,c.type,c.course, (t.name || ' ' || t.lastname1) as fullname,d.name
from classes as c
inner join teachers as t on c.id_teacher = t.id 
inner join degrees as d on c.id_degree = d.id
# inner join// se usa para traer mas de dos tablas y conbiarlas. traer los campos donde existe la relación
# left join // se fusiona aunque falten campos en las tablas o sea aunque sea null  
# limit// limita los registros que queremos ver
# orden// order by se puede por ascendente y descendente
select, from,join,order by, limit, 
# case// es para poner que una opcion se convierta en otra es decir h se vuelve hombre y m se vuelve mujer
select 
    name as nombre, lastname1,
        case 
            when sexo = 'M'
                then 'mujer'
            when sexo =  'H'
                then 'hombre'
        end genero        
        
from teachers 
# group by 
select 
    t.name,
        COUNT (c.id) as cantidad
            from classes as c inner join teachers as t on c.id_teacher = t.id
                group by  t.name
# sum= suma, 
# Count= cuantas veces sale en la lista, registros
# group by= en que lo agrupa