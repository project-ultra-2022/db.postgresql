# crear tabla 

CREATE TABLE public.users
(
    id integer NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    date_created date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;

# insertar registro

INSERT INTO public.roles(
	 name)
	VALUES ('esteban');

# eliminar registro

DELETE FROM public.roles
	WHERE <condition>;

# consulta registro
 select * from tabla

 # update 
 update roles 
set (cualquier campo) = 'la data que quieras cambiar'
where id = numero de id
