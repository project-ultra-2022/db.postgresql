# como crear una base de datos 
para eso oprimimos click derecho sobre "database" luego presionamos "create" o usando el siguiente codigo: create database (nombre). Luego presionamos click derecho sobre database y le damos refresh  

# como elminiar una base de datos 
para elminiar una base de datos simplemente presionamos click derecho sobre la base de datos que queramos eliminar y le damos drop o usamos el siguiente codigo (antes de usar  el codigo recuerda desconectar la base de datos dandole click derecho y luego disconnect) 
Drop database if exists "nombre de la base de datos" /* no se te olvide poner las comillas*/

# crear una tabla 
para crear una tabla ponemos el siguiente codigo:
create table persona(
  idpersona int not null, /* Not null quiere decir que el campo nunca debe estar vacio*/
  nombre varchar (20),
  cedula varchar (10) 
); 

tambien se puede crear una tabla de otra forma: nos vamos a tables=create=table y alli ponemos el nombre de la tabla y las especificaciones que queremos que tenga sin embargo los datos tipo caracteres se escriben de distinta forma. Int = Integer, y varhcar = character varying 

# eliminar tabla 
Podemos elimianr una tabla de la misma manera que eliminamos una base de datos poder darle clik derecho sobre la tabla que queremos eliminar y le damos "drop"  o podemos poner el siguiente codigo 

Drop table "Tabla" /*NO SE TE OLVIDE PONER LAS COMILLAS"

# Inserta y buscar datos en una tabla 
para agregar datos a una tabla ponemos el siguiente codigo 
  insert into persona values ('1','Jose','1028480824')= y los datos que queremos agregar 
        "el nombre de la tabla" 

si queremos agregar solamente dos datos o un solo dato a la tabla ponemos el siguiente codigo
  insert into persona (id_persona,nombre) values ('1','Juan')

