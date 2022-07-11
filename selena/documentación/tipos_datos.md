# texto
Tipos de datos
String, text,varchar--> text
decimal,float,int-->
boolean-->si o no
Arrays-->conjunto 
Objetos-->llave y valor

Como crear tablas usando pg Admin 
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
#insertar registro
INSERT INTO public.roles(
	 name)
	VALUES ('selena');
