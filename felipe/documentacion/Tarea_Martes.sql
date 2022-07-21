Mostrar el nombre completo del estudiante y cuántas clases tiene asignadas

select
(s.name || ' ' || s.lastname1 || ' ' || s.lastname2) as fullname,
count (sc.id_class) as clases
from students as s
left join students_classes as sc on sc.id_class = sc.id
group by s.name, s.lastname1, s.lastname2

/*
Nota 8/10 -> No puede ser 10 porque la relación está mal escrita.

Retroalimentación

1.  La relación debía ser: "sc.id_student con el s.id"
    Explicación: El campo "id_student" de la tabla "students_classes", debe ser igual al "id" de la tabla "students".
2.  Te falto poner este archivo como tarea_martes.sql, pero no hay problema
*/