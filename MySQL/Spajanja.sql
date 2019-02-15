# Koristi bazu
USE hr;

# Napisati upit za prikaz adrese (LOCATION_ID,
# STREET_ADDRESS, CITY, STATE_PROVINCE,
# COUNTRY_NAME) svih departmana.

# Pritom, ovaj query kod profesora nije tacan, jer samo pokazuje lokacije, ne lokacije svih departmana

SELECT d.LOCATION_ID, l.STREET_ADDRESS, l.CITY, l.STATE_PROVINCE, c.COUNTRY_NAME FROM departments d
      INNER JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID
      INNER JOIN countries c ON l.COUNTRY_ID = c.COUNTRY_ID;

# Napisati upit za prikaz imena, prezimena zaposlenih,
# identikatora i imena departmana na kojem su zaposleni.
SELECT e.FIRST_NAME AS 'Ime', e.LAST_NAME AS 'Prezime', e.EMPLOYEE_ID AS 'Identifikator', d.DEPARTMENT_NAME AS 'Ime odeljenja' FROM employees e
      INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

# Napisati upit za prikaz imena, prezimena, identikatora
# pozicije (JOB_ID), identikatora i imena departmana svih
# zaposlenih na departmanima u Londonu.
SELECT e.FIRST_NAME as 'Ime', e.LAST_NAME as 'Prezime', EMPLOYEE_ID as 'Identifikator', JOB_ID as 'Pozicija', d.DEPARTMENT_NAME as 'Ime departmana' FROM employees e
      INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
      WHERE (SELECT CITY FROM locations
            WHERE locations.LOCATION_ID = d.LOCATION_ID) = 'London';

# Napisati upit za prikaz identikatora i prezimena zaposlenog,
# kao i identikatora i prezimena njegovog menadoera.

# 1. PREKO MANAGER ID-A
SELECT e1.EMPLOYEE_ID AS 'Identifikator radnika', e1.LAST_NAME AS 'Prezime radnika', e2.EMPLOYEE_ID AS 'Identifikator menadzera', e2.LAST_NAME AS 'Prezime menadzera' FROM employees e1
INNER JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID;

# 2. PREKO DEPARTMANA
SELECT e1.EMPLOYEE_ID AS 'Identifikator radnika', e1.LAST_NAME AS 'Prezime radnika', e2.EMPLOYEE_ID AS 'Identifikator menadzera', e2.LAST_NAME AS 'Prezime menadzera' FROM employees e1
INNER JOIN departments d ON e1.DEPARTMENT_ID = d.DEPARTMENT_ID
INNER JOIN employees e2 ON d.MANAGER_ID = e2.EMPLOYEE_ID;

# Napisati upit za prikaz imena, prezimena i datuma zaposlenja
# (HIRE_DATE) svih zaposlenih koji su zaposleni nakon
# zaposlenja osobe koja se preziva 'Jones'.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', HIRE_DATE AS 'Datum zaposlenja' FROM employees
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM employees e2
                  WHERE e2.LAST_NAME = 'Jones'
                  LIMIT 1);

# Napisati upit za prikaz naziva departmana i broja zaposlenih za
# sve departmane sortirano po nazivu departmana u rastu¢em
# redosledu.
SELECT d.DEPARTMENT_NAME as 'Ime departmana', COUNT(*) as 'Broj zaposlenih' FROM employees e
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID
ORDER BY d.DEPARTMENT_NAME ASC;

# Napisati upit za prikaz naziva pozicije i prose£ne plate za sve
# pozicije.
SELECT j.JOB_TITLE AS 'Pozicija', AVG(e.SALARY) AS 'Prosecna plata' FROM employees e
INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID
GROUP BY j.JOB_ID;

# Napisati upit za prikaz naziva departmana, imena, prezimena,
# datuma zaposlenja i plate za sve menadoere koji imaju 15 ili
# vi2e godina radnog staoa.
SELECT d.DEPARTMENT_NAME as 'Naziv departmana', e.FIRST_NAME AS 'Ime menadzera', e.LAST_NAME AS 'Prezime menadzera', e.HIRE_DATE AS 'Datum zaposlenja menadzera' FROM employees e
INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE DATEDIFF(NOW(), e.HIRE_DATE) > (15 * 365);
