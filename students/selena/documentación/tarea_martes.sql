Mostrar el nombre completo del estudiante y cuántas clases tiene asignadas
select (s.name || ' ' || s.lastname1) as fullname,
    count (sc.id_class)
from students_classes as sc
inner join students as s on sc.id_student = s.id
group by (s.name || ' ' || s.lastname1)

/*
Nota 8/10
Retroalimentación: No la entregaste a tiempo
*/