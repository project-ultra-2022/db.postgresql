    Mostrar: Nombre completo del profesor,
    Departamento al que pertenece el profesor,
    Nombre de las clases que dicta el profesor,
    Cantidad de estudiantes que estan inscritos en esa clase,
    mostrar genero del profesor, si es 'H', mostrar 'Profesor genero masculino', si es 'M' mostrar 'Profesor genero Femenino'

select * from classes
# primera parte
select (c.name) as name_class, t.name as fullname
from classes as c
inner join teachers as t on c.id_teacher = t.id

# segunda parte
select (c.name) as full_class,
    count (sc.id_student)
from students_classes as sc
inner join classes as c on sc.id_class = c.id
group by (c.name)

# tercera parte
select
    (t.name||' '||t.lastname1) as fullname,
    case
        when t.sexo = 'M' then 'Profesore genero femenino'
        when t.sexo =  'H' then 'Profesore genero masculino'
    end genero,
    t.id_departament,
    c.name,
    count (sc.id_student)
from teachers as t
inner join classes as c on c.id_teacher = t.id
inner join students_classes as sc on sc.id_class = c.id
group by (t.name||' '||t.lastname1), t.sexo, t.id_departament,
    c.name

/*
Nota 10/10 -> Excelente tarea
*/

Condiciones: No traer los registros donde la clase no tenga estudiantes inscritos
     Mostrar:
    1. Nombre completo del estudiante,
    2. Documento del estudiante,
    3. mostrar genero del estudiante, si es 'H', mostrar 'Estudiante genero masculino', si es 'M' mostrar 'Estudiante genero Femenino'
    4. Mostrar la sumatoria de puntos que tiene asignados el estudiante. Esos puntos estan en la última tabla (notes) que agregamos el domingo
    5. Si la sumatoria de puntos es inferior a 3, mostrar 'No pasa el año', si es mayor a 3, mostrar 'Si pasa el año'

Condiciones: No traer los registros donde el estudiante no tengas notas asignadas
select * from students
select * from notes

select
    (s.name||' '||s.lastname1) as fullname,
        case
            when s.sexo = 'M' then 'Estudiante genero femenino'
            when s.sexo =  'H' then 'Estudiante genero masculino'
        end genero,

        case
            when sum (n.points) <= 2 then 'No pasa el año'
            when sum (n.points) >= 3 then 'Si pasa el año'
        end puntos,
        s.document, sum (n.points)
from students as s
inner join notes as n on n.id_student = s.id
group by (s.name||' '||s.lastname1), s.sexo, s.document

/*
Nota 10/10 -> Excelente tarea
*/