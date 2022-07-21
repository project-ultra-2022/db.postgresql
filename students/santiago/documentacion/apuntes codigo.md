# como crear una tabla

create table personas-nombre de la tabla (
  idpersona int not null,      /* NOT NULL significa que el campo nunca puede estar vacio*/
  nombre varchar (20),
  cedula varchar (10)
);

Tambien se puede crear dandole click derecho encima de tables luego darle create y table y asi podremos crear una tabla mas rapido, luego se pone el nombre que uno quiero luego se va a columnas, y en la parte que dice inherited from table(s) ese espacio sirve para traer campos de otra tabla como por ejemplo la tabla de personas entonces nos va a traer los campos que son idpersona, nombre, y cedula y podriamos agregarles otra cosa si queremos pero si se hace esto no nos podemos echar para atras y ya la unica forma de salir es reseteando toda la tabla y tendriamos que volver a comenzar de nuevo.

Para agregar un nuevo campo tenemos que darle en el mas y nos va a crear un campo que le podemos poner el nombre que queramos, el tipo de dato y not null osea que el campo no puede estar vacio.

# insertar datos a una tabla 

insert into persona values ('1','Nelson','1030540666') 

insert into persona (idpersona,nombre)values ('1','Nelson')

Depende de que columnas hallamos agregado a la tabla podemos agregar los insert los valores