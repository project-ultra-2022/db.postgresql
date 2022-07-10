Script Base
DROP DATABASE IF EXISTS university;
CREATE DATABASE university CHARACTER SET utf8mb4;
USE university;

CREATE TABLE departaments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    document VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    lastname1 VARCHAR(50) NOT NULL,
    lastname2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    cellphone VARCHAR(9),
    date_born DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL
);

CREATE TABLE teachers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    document VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    lastname1 VARCHAR(50) NOT NULL,
    lastname2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    cellphone VARCHAR(9),
    date_born DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    id_departament INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_departament) REFERENCES departaments(id)
);

 CREATE TABLE degrees (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE classes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits FLOAT UNSIGNED NOT NULL,
    type ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    course TINYINT UNSIGNED NOT NULL,
    semester TINYINT UNSIGNED NOT NULL,
    id_teacher INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_teacher) REFERENCES teachers(id),
    FOREIGN KEY(id_grado) REFERENCES degrees(id)
);

CREATE TABLE school_years (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    start_year YEAR NOT NULL,
    end_year YEAR NOT NULL
);

CREATE TABLE students_classes (
    id_student INT UNSIGNED NOT NULL,
    id_class INT UNSIGNED NOT NULL,
    id_school_year INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_student, id_class, id_school_year),
    FOREIGN KEY (id_student) REFERENCES students(id),
    FOREIGN KEY (id_class) REFERENCES classes(id),
    FOREIGN KEY (id_school_year) REFERENCES school_years(id)
);

 /* departaments */
INSERT INTO departaments VALUES (1, 'Informática');
INSERT INTO departaments VALUES (2, 'Matemáticas');
INSERT INTO departaments VALUES (3, 'Economía y Empresa');
INSERT INTO departaments VALUES (4, 'Educación');
INSERT INTO departaments VALUES (5, 'Agronomía');
INSERT INTO departaments VALUES (6, 'Química y Física');
INSERT INTO departaments VALUES (7, 'Filología');
INSERT INTO departaments VALUES (8, 'Derecho');
INSERT INTO departaments VALUES (9, 'Biología y Geología');

 /* Students */
INSERT INTO students VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
INSERT INTO students VALUES (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H');
INSERT INTO students VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
INSERT INTO students VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H');
INSERT INTO students VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H');
INSERT INTO students VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H');
INSERT INTO students VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H');
INSERT INTO students VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M');
INSERT INTO students VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H');
INSERT INTO students VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H');
INSERT INTO students VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M');
INSERT INTO students VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M');


/* teachers */
INSERT INTO teachers VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
INSERT INTO teachers VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 2);
INSERT INTO teachers VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 3);
INSERT INTO teachers VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 4);
INSERT INTO teachers VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4);
INSERT INTO teachers VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 6);
INSERT INTO teachers VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 1);
INSERT INTO teachers VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 2);
INSERT INTO teachers VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 3);
INSERT INTO teachers VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 4);
INSERT INTO teachers VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 5);
INSERT INTO teachers VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 6);
INSERT INTO teachers VALUES (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 1);
INSERT INTO teachers VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980/11/21', 'H', 1);
INSERT INTO teachers VALUES (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980/12/13', 'M', 2);

/* degrees */
INSERT INTO degrees VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO degrees VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO degrees VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO degrees VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO degrees VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO degrees VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO degrees VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO degrees VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO degrees VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO degrees VALUES (10, 'Grado en Química (Plan 2009)');

/* classes */
INSERT INTO classes VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO classes VALUES (2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO classes VALUES (3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO classes VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO classes VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO classes VALUES (6, 'Estadística', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO classes VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO classes VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO classes VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO classes VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO classes VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO classes VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO classes VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO classes VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO classes VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO classes VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO classes VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO classes VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO classes VALUES (19, 'Pladocumenticación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO classes VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO classes VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO classes VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO classes VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO classes VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO classes VALUES (46, 'Análisis y pladocumenticación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO classes VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO classes VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO classes VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO classes VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO classes VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO classes VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO classes VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO classes VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO classes VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO classes VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO classes VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO classes VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO classes VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO classes VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO classes VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO classes VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO classes VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO classes VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO classes VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO classes VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO classes VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO classes VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO classes VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO classes VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO classes VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO classes VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO classes VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* course escolar */
INSERT INTO school_years VALUES (1, 2014, 2015);
INSERT INTO school_years VALUES (2, 2015, 2016);
INSERT INTO school_years VALUES (3, 2016, 2017);
INSERT INTO school_years VALUES (4, 2017, 2018);

/* students se matricula en classes */
INSERT INTO students_classes VALUES (1, 1, 1);
INSERT INTO students_classes VALUES (1, 2, 1);
INSERT INTO students_classes VALUES (1, 3, 1);
INSERT INTO students_classes VALUES (1, 4, 1);
INSERT INTO students_classes VALUES (1, 5, 1);
INSERT INTO students_classes VALUES (1, 6, 1);
INSERT INTO students_classes VALUES (1, 7, 1);
INSERT INTO students_classes VALUES (1, 8, 1);
INSERT INTO students_classes VALUES (1, 9, 1);
INSERT INTO students_classes VALUES (1, 10, 1);
INSERT INTO students_classes VALUES (1, 1, 2);
INSERT INTO students_classes VALUES (1, 2, 2);
INSERT INTO students_classes VALUES (1, 3, 2);
INSERT INTO students_classes VALUES (1, 1, 3);
INSERT INTO students_classes VALUES (1, 2, 3);
INSERT INTO students_classes VALUES (1, 3, 3);
INSERT INTO students_classes VALUES (1, 1, 4);
INSERT INTO students_classes VALUES (1, 2, 4);
INSERT INTO students_classes VALUES (1, 3, 4);
INSERT INTO students_classes VALUES (2, 1, 1);
INSERT INTO students_classes VALUES (2, 2, 1);
INSERT INTO students_classes VALUES (2, 3, 1);
INSERT INTO students_classes VALUES (4, 1, 1);
INSERT INTO students_classes VALUES (4, 2, 1);
INSERT INTO students_classes VALUES (4, 3, 1);
INSERT INTO students_classes VALUES (4, 1, 2);
INSERT INTO students_classes VALUES (4, 2, 2);
INSERT INTO students_classes VALUES (4, 3, 2);
INSERT INTO students_classes VALUES (4, 4, 2);
INSERT INTO students_classes VALUES (4, 5, 2);
INSERT INTO students_classes VALUES (4, 6, 2);
INSERT INTO students_classes VALUES (4, 7, 2);
INSERT INTO students_classes VALUES (4, 8, 2);
INSERT INTO students_classes VALUES (4, 9, 2);
INSERT INTO students_classes VALUES (4, 10, 2);