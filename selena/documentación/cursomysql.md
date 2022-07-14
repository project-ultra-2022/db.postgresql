# uso de show
mostrar las tablas que ya existen 
ejemplo:
show tables
# uso de describe
se usa para ver el detalle de una tabla 
ejemplo: 
describe usuario
# eliminar una tabla--> drop
se usa para eliminar una tabla con comando usando la palabra drop table seguida del nombre de la tabla que se desea eliminar 
ejemplo drop table usuario
# crear tabla --> created
created table alumnos (
nombre varchar (50)
apellido varchar (50)
edad int (100)
) 

# insertar datos --> insert / values---> para insertar valores 
ejemplo:
insert into alumnos(nombre,apellido,direccion, telefono,edad) 
 values ('selena','merchan','eucalipto','3507192589','20');

# si solo quiero insertar datos en ALGUNAS casillas 
insert into alumnos (nombre,telefono,edad) 
values ('Daniel','3507192591','22')
# insertar datos por el orden de los datos que tengamos sin necesidad de especificarlos
insert into alumnos values ('juan','maldonado','santander','3112997659','16');

# mostrar la tabla 
mostrar toda la tabla de alumnos 
select * from alumnos 

mostrar algunos campos
select nombre, direccion from alumnos