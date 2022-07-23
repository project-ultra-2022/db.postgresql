Mostrar:
    Nombre completo del profesor,
    Departamento al que pertenece el profesor,
    Nombre de las clases que dicta el profesor,
    Cantidad de estudiantes que estan inscritos en esa clase,
    mostrar genero del profesor, si es 'H', mostrar 'Profesor genero masculino', si es 'M' mostrar 'Profesor genero Femenino'
select 
(t.name || ' ' || t.lastname1 || ' ' || t.lastname2) as fullname,  
t.id_departament, 
c.name,
case
    when t.sexo = 'M' then 'Femenino'
    when t.sexo = 'H' then 'Masculino'
    end genero, 
count (sc.id_student)   
from teachers as t 
inner join classes as c on c.id_teacher = t.id
inner join students_classes as sc on sc.id_class = c.id 
inner join students as s on s.id = sc.id_student
group by (t.name || ' ' || t.lastname1 || ' ' || t.lastname2),  
t.id_departament, 
c.name,
case
    when t.sexo = 'M' then 'Femenino'
    when t.sexo = 'H' then 'Masculino'
    end
    


Mostrar:
    1. Nombre completo del estudiante,
    2. Documento del estudiante,
    3. mostrar genero del estudiante, si es 'H', mostrar 'Estudiante genero masculino', si es 'M' mostrar 'Estudiante genero Femenino'
    4. Mostrar la sumatoria de puntos que tiene asignados el estudiante. Esos puntos estan en la última tabla (notes) que agregamos el domingo
    5. Si la sumatoria de puntos es inferior a 3, mostrar 'No pasa el año', si es mayor a 3, mostrar 'Si pasa el año'
select  
(s.name || ' ' || s.lastname1 || ' ' || s.lastname2) as fullname, 
s.document,
case
    when s.sexo = 'H' then 'Male'
    when s.sexo = 'M' then 'Feminine'
    end gender,
sum (n.points) as points,
case 
    when sum (n.points) < 3 then 'the year does not pass' 
    when sum (n.points) >= 3 then 'the year passes'
    end bulletin
from students as s  
inner join notes as n on n.id_student = s.id

group by (s.name || ' ' || s.lastname1 || ' ' || s.lastname2), 
s.document,
case 
    when s.sexo = 'H' then 'Male'
    when s.sexo = 'M' then 'Feminine'
    end