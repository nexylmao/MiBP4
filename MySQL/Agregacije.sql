# Koristi bazu podataka
USE hr;

# Napisati upit za dobijanje ukupne koli£ine novca datih na plate
# svih zaposlenih.
SELECT SUM(SALARY) AS 'Suma plati' FROM employees;

# Napisati upit za prikaz najve¢e i najmanje plate zaposlenih.
SELECT MIN(SALARY) AS 'Minimalna plata', MAX(SALARY) AS 'Maksimalna plata' FROM employees;

# Napisati upit za prikaz prose£ne plate i broja zaposlenih.
SELECT AVG(SALARY) AS 'Prosecna plata', COUNT(SALARY) AS 'Broj zaposlenih' FROM employees;

# Napisati upit za prikaz broja zaposlenih.
SELECT COUNT(*) AS 'Broj zaposlenih' FROM employees;

# Napisati upit za prikaz broja razli£itih poslova (JOB_ID) na
# kojima su radnici zaposleni.
SELECT JOB_ID AS 'Identifikacije pozicija' FROM employees
GROUP BY JOB_ID;

# Napisati upit za prikaz najve¢e plate zaposlenih za posao
# Programmer (JOB_ID = 'IT_PROG').
SELECT MAX(SALARY) FROM employees
GROUP BY JOB_ID
HAVING JOB_ID = 'IT_PROG';

# Napisati upit za prikaz prose£ne plate i broja zaposlenih na
# departmanu sa identikatorom 90.
SELECT AVG(SALARY), COUNT(*) FROM employees
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID = 90;

# Napisati upit za prikaz najve¢e, najmanje i prose£ne plate
# zaposlenih.
SELECT MAX(SALARY) AS 'Maksimalna plata', MIN(SALARY) AS 'Minimalna plata', AVG(SALARY) AS 'Prosecna plata' FROM employees;

# Napisati upit za prikaz broja zaposlenih po pozicijama
# (JOB_ID).
SELECT JOB_ID AS 'Pozicija', COUNT(*) AS 'Broj zaposlenih' FROM employees
GROUP BY JOB_ID;

# Napisati upit za prikaz razlike izmeu najve¢e i najmanje plate
# svih zaposlenih.
SELECT (MAX(SALARY) - MIN(SALARY)) AS 'Razlika najvece i najmanje plate' FROM employees;

# Napisati upit za prikaz najnioe plate zaposlenih po
# menadoerima za koje rade (MANAGER_ID).
SELECT MANAGER_ID, MIN(SALARY) FROM employees
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

# Napisati upit za prikaz ukupne koli£ine novca za plate po
# departmanima.
SELECT DEPARTMENT_ID, SUM(SALARY) FROM employees
GROUP BY DEPARTMENT_ID;

# Napisati upit za prikaz prose£ne plate po pozicijama
# (JOB_ID) izuzimaju¢i programere (JOB_ID = 'IT_PROG').
SELECT JOB_ID, AVG(SALARY) FROM employees
GROUP BY JOB_ID
HAVING JOB_ID != 'IT_PROG';

# Napisati upit za prikaz ukupne koli£ine novca za plate, najve¢e,
# najmanje i prose£ne plate po pozicijama (JOB_ID) zaposlenih
# na departmanu sa identikatorom 90.
SELECT JOB_ID, SUM(SALARY) AS 'Ukupna kolicina', MAX(SALARY) AS 'Najveca plata', MIN(SALARY) AS 'Najmanja plata', AVG(SALARY) AS 'Prosecna plata' FROM employees
WHERE DEPARTMENT_ID = 90
GROUP BY JOB_ID;

# Napisati upit za prikaz najve¢e plate po pozicijama (JOB_ID)
# samo za pozicije gde je najve¢a plata ve¢a ili jednaka 4.000.
SELECT JOB_ID, MAX(SALARY) FROM employees
GROUP BY JOB_ID
HAVING MAX(SALARY) >= 4000;

# Napisati upit za prikaz prose£ne plate zaposlenih po
# departmanima koji imaju vi2e od 10 zaposlenih.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM employees
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 10;