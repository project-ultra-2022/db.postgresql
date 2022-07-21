select (s.name ||' '|| s.lastname1 ||' '|| s.lastname2) as fullname,
count (sc.id_class) 
from students as s
left join students_classes as sc on s.id = sc.id_student
group by  (s.name ||' '|| s.lastname1 ||' '|| s.lastname2) 
order by count (sc.id_class) desc