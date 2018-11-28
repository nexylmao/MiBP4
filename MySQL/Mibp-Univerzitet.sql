CREATE DATABASE IF NOT EXISTS UNS
	CHARACTER SET = 'utf8';

USE UNS;

CREATE TABLE IF NOT EXISTS StudijskiProgram (
	id integer NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    ime varchar(255) NOT NULL,
    brojBodova integer NOT NULL,
    godinaPocetka integer NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
	id integer NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    ime varchar(255) NOT NULL,
    prezime varchar(255) NOT NULL,
    datumRodjenja date NOT NULL,
    godinaUpisa int NOT NULL,
    program integer NOT NULL,
    FOREIGN KEY(program) REFERENCES StudijskiProgram(id)
);

CREATE TABLE IF NOT EXISTS Kurs (
	id integer NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    ime varchar(255) NOT NULL,
    brojBodova integer NOT NULL,
    godina int NOT NULL
);

CREATE TABLE IF NOT EXISTS Ima (
	godina int NOT NULL,
    semestar varchar(255) NOT NULL,	
    program integer NOT NULL,
    kurs integer NOT NULL,
    PRIMARY KEY(kurs, program),
    FOREIGN KEY(program) REFERENCES StudijskiProgram(id),
    FOREIGN KEY(kurs) REFERENCES Kurs(id)
);

CREATE TABLE IF NOT EXISTS Polaganje (
	id integer NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    brojBodova integer NOT NULL,
    ocena integer NOT NULL,
    student integer NOT NULL,
    kurs integer NOT NULL,
    program integer NOT NULL,
    FOREIGN KEY(student) REFERENCES Student(id),
    FOREIGN KEY(kurs, program) REFERENCES Ima(kurs, program)
);

CREATE USER 'UNSAdmin'@'localhost' IDENTIFIED BY 'UnSaDmIn9!';
GRANT ALL PRIVILEGES ON UNS.* TO 'UNSAdmin'@'localhost';
