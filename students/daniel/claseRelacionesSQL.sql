/*Primer punto*/
select
    t.name || ' ' || t.lastname1 as profesor,
    c.name as clase,
    count(s.id) as cantidad_de_estudiantes
from students_classes as sc
inner join students as s on sc.id_student = s.id
inner join classes as c on sc.id_class = c.id
inner join teachers as t on c.id_teacher = t.id
group by t.name, t.lastname1, c.name