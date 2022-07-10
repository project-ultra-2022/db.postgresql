# intesrtar registro

INSERT INTO public.roles(name)
	VALUES ('felipe');

 # eliminar registro 
DELETE FROM public.roles
	WHERE id=1;

 # Buscar un registro 
 Select *
from roles

# Actualizar un registro 
UPDATE roles
set name= 'admin'
where id =2

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