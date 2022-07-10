# insertar registro

INSERT INTO public.roles(
	id, name)
	VALUES ();;

# borrar registro

DELETE FROM public.roles
	WHERE id=1;

# buscar registro

SELECT * from roles

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