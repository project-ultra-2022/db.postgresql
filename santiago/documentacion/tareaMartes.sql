select (s.name ||' '|| lastname1 ||' '|| lastname2) as fullname,
count (sc.id_class) as clases
from students as s
left join students_classes as sc on s.id = sc.id_student
where sc.id_class != 0
group by (s.name ||' '|| lastname1 ||' '|| lastname2)

/*
Nota 10/10 -> Excelente tarea

Retroalimentación

1.  El where es una forma de limitar que no muestre las clases que tienen 0 registros, pero hubieras podido lograr lo mismo haciendo
    una relación inner join, ya que de esta forma, no trae los estudiantes que no tengan clases asignadas.
*/