select (s.name ||' '|| lastname1 ||' '|| lastname2) as fullname,
count (sc.id_class) as clases
from students as s 
left join students_classes as sc on s.id = sc.id_student
where sc.id_class != 0
group by (s.name ||' '|| lastname1 ||' '|| lastname2)