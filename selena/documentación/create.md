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
