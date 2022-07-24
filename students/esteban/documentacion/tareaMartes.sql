
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

/*
Nota 5/10 -> Debes tener más cuidado con la sintaxis y solo devolver la información que se te pide.

Retroalimentación

1.  El ejercicio solo indicaba que mostrara la cantidad de materias que tiene asociadas un estudiante, por lo tanto
    la relación con "classes" no es necesario y daña el resultado
2.  En el "select" donde esta los campos a mostrar, el campo lastname2 no esta referenciado por la tabla, debería ser
    "s.lastname2"
3.  En el "group by" no se aceptan apodos, solamente el nombre de los campos originales, para eso se puede hacer de dos
    formas: "group by s.name, s.lastname1, s.lastname2" o "group by (s.name ||' '|| s.lastname1 ||' '|| lastname2) as fullname"
4.  Para el "order by" sucede lo mismo, no aplica apodo
*/

Corrección

SELECT
    (s.name ||' '|| s.lastname1 ||' '|| s.lastname2) as fullname,
    COUNT (sc.id_class) AS clasesasignadas

FROM students_classes AS sc
    INNER JOIN students AS s ON sc.id_student = s.id

    GROUP BY (s.name ||' '|| s.lastname1 ||' '|| s.lastname2)