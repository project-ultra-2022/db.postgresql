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