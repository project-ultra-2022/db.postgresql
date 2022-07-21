
SELECT 
    (s.name ||' '|| s.lastname1 ||' '|| lastname2) as fullname,
    c.name AS materia,
    COUNT (c.id) AS materia_asignada_tantasveces
    
FROM students_classes AS cs
    INNER JOIN classes AS c ON cs.id_class = c.id
    INNER JOIN students AS s ON cs.id_student = s.id

    GROUP BY c.name, fullname
    ORDER BY fullname

/*Hola, hermano. No encontré la forma de que el nombre del estudiante saliera una sola vez,
porfa retroalimentación :D*/