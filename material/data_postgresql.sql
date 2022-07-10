CREATE TABLE departaments (
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    id serial PRIMARY KEY,
    document VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    lastname1 VARCHAR(50) NOT NULL,
    lastname2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    cellphone VARCHAR(9),
    date_born DATE NOT NULL,
    sexo CHAR DEFAULT('H', 'M') NOT NULL
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    document VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    lastname1 VARCHAR(50) NOT NULL,
    lastname2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    cellphone VARCHAR(9),
    date_born DATE NOT NULL,
    sexo CHAR DEFAULT('H', 'M') NOT NULL,
    id_departament INTEGER NOT NULL,
    FOREIGN KEY (id_departament) REFERENCES departaments(id)
);

CREATE TABLE degrees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits FLOAT NOT NULL,
    type VARCHAR DEFAULT('básica', 'obligatoria', 'optativa') NOT NULL,
    course INT NOT NULL,
    semester INT NOT NULL,
    id_teacher INT,
    id_degree INT NOT NULL,
    FOREIGN KEY(id_teacher) REFERENCES teachers(id),
    FOREIGN KEY(id_degree) REFERENCES degrees(id)
);

CREATE TABLE school_years (
    id SERIAL PRIMARY KEY,
    start_year YEAR NOT NULL,
    end_year YEAR NOT NULL
);

CREATE TABLE students_classes (
    id SERIAL PRIMARY KEY,
    id_student INT NOT NULL,
    id_class INT NOT NULL,
    id_school_year INT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES students(id),
    FOREIGN KEY (id_class) REFERENCES classes(id),
    FOREIGN KEY (id_school_year) REFERENCES school_years(id)
);