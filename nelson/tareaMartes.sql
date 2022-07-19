select (s.name ||' '|| s.lastname1 ||' '|| s.lastname2) as fullname,
count (sc.id_class) as clases_asignadas
from students as s
left join students_classes as sc on s.id = sc.id_student
group by fullname
order by clases_asignadas desc