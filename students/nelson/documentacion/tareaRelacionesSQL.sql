/*tarea 1 sql*/

select (t.name||' '||t.lastname1||' '||t.lastname2) as fullname,
case
when t.sexo = 'M' then 'Mujer'
when t.sexo = 'H' then 'Hombre'
end genero, 
t.id_departament, cl.name, count (sc.id_student) as students
from teachers as t
inner join classes as cl on cl.id_teacher = t.id
inner join students_classes as sc on sc.id_class = cl.id
inner join students as s on s.id = sc.id_student
group by (t.name||' '||t.lastname1||' '||t.lastname2),t.sexo,
t.id_departament, cl.name
order by t.id_departament 

/*tarea 2 sql*/

select (s.name||' '||s.lastname1||' '||s.lastname2) as fullname, s.document,
case
when s.sexo = 'M' then 'Femenino'
when s.sexo = 'H' then 'Masculino'
end genero,sum(n.points),
case
when sum(n.points) < 3 then 'No pasa el año'
when sum(n.points) >= 3 then 'si pasa el año'
end performance
from students as s
inner join notes as n on n.id_student = s.id
group by (s.name||' '||s.lastname1||' '||s.lastname2), s.document,
case
when s.sexo = 'M' then 'Femenino'
when s.sexo = 'H' then 'Masculino'
end
order by sum(n.points) asc