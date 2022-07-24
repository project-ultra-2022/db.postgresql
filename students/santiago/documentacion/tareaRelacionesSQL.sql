
/*Primer ejercicio*/

select (t.name ||' '|| t.lastname1 ||' '|| t.lastname2) as fullname,
case
when t.sexo = 'M' then 'Femenino'
when t.sexo = 'H' then 'Masculino'
end genero,
t.id_departament,
c.name,
count (sc.id_student) as cantidad_estudiantes
from teachers as t
inner join classes as c on c.id_teacher = t.id
inner join students_classes as sc on sc.id_class = c.id
inner join students as s on s.id = sc.id_student
group by (t.name ||' '|| t.lastname1 ||' '|| t.lastname2),
case
when t.sexo = 'M' then 'Femenino'
when t.sexo = 'H' then 'Masculino'
end,
t.id_departament,
c.name

/**
    Nota: 10/10 Excelente trabajo
    Retroalimentación: En el group by era mejor poner directamente t.sexo y no el case - end completo.
*/

/* Segundo Ejercicio*/

select (s.name||' '|| s.lastname1||' '|| s.lastname2) as nombre_completo,
s.document as documento,
case
when s.sexo = 'H' then 'Masculino'
when s.sexo = 'M' then 'Femenino'
end genero,
sum (n.points) as puntos,
case
when sum (n.points) < 3 then 'No pasa el año'
when sum (n.points) >= 3 then 'Si pasa el año'
end definitiva
from students as s
inner join notes as n on n.id_student = s.id
group by (s.name||' '|| s.lastname1||' '|| s.lastname2),
s.document,
case
when s.sexo = 'H' then 'Masculino'
when s.sexo = 'M' then 'Femenino'
end

/**
    Nota: 10/10 Excelente trabajo
    Retroalimentación: En el group by era mejor poner directamente t.sexo y no el case - end completo.
*/