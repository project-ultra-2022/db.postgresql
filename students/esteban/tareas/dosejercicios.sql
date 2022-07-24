/*
Primer ejercicio:

Mostrar:
    Nombre completo del profesor,
    Departamento al que pertenece el profesor,
    Nombre de las clases que dicta el profesor,
    Cantidad de estudiantes que estan inscritos en esa clase,
    mostrar genero del profesor, si es 'H', mostrar 'Profesor genero masculino', si es 'M' mostrar 'Profesor genero Femenino'

Condiciones: No traer los registros donde la clase no tenga estudiantes inscritos

*/

SELECT 
    (t.name||' '||t.lastname1||' '||t.lastname2) AS fullname,
    d.name AS department,
    c.name AS subject,
    COUNT(sc.id_student) AS enrolled_students,
    CASE
        WHEN t.sexo = 'M' then 'Femenino'
        WHEN t.sexo = 'H' then 'Masculino'
    END genre
FROM teachers AS t
    INNER JOIN departaments AS d ON t.id_departament = d.id
    INNER JOIN classes AS c ON c.id_teacher = t.id
    INNER JOIN students_classes AS sc ON sc.id_class = c.id
    INNER JOIN students AS s ON sc.id_student = s.id
    
    GROUP BY (t.name||' '||t.lastname1||' '||t.lastname2),d.name,c.name,t.sexo


/*
Segundo ejercicio:
Mostrar:
    1. Nombre completo del estudiante,
    2. Documento del estudiante,
    3. mostrar genero del estudiante, si es 'H', mostrar 'Estudiante genero masculino', si es 'M' mostrar 'Estudiante genero Femenino'
    4. Mostrar la sumatoria de puntos que tiene asignados el estudiante. Esos puntos estan en la última tabla (notes) que agregamos el domingo
    5. Si la sumatoria de puntos es inferior a 3, mostrar 'No pasa el año', si es mayor a 3, mostrar 'Si pasa el año'
    
Condiciones: No traer los registros donde el estudiante no tengas notas asignadas
*/

SELECT 
    (s.name ||' '|| s.lastname1 ||' '|| s.lastname2) AS fullname,
    s.id AS document,
    CASE
        WHEN s.sexo = 'M' then 'Femenino'
        WHEN s.sexo = 'H' then 'Masculino'
    END genre,
    SUM (n.points) AS grade,
    CASE 
        WHEN SUM (n.points) < 3 THEN 'No pasó'
        WHEN SUM (n.points) >= 3 THEN 'Sí pasó'
    END result
FROM students AS s
    INNER JOIN notes AS n ON n.id_student = s.id
    GROUP BY (s.name ||' '|| s.lastname1 ||' '|| s.lastname2), s.id


        

