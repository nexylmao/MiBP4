# Koristiti bazu podatak
USE hr;

# Napisati upit za prikaz deset zaposlenih (prvih deset u tabeli,
# ne po datumu zaposlenja).
SELECT * FROM employees
LIMIT 10;

# Napisati upit za prikaz imena, prezimena i plate za sve
# zaposlene £ija plata nije u opsegu (10.000;15.000].
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE SALARY <= 10000 OR SALARY > 15000;

# Napisati upit za prikaz svih podataka o zaposlenima
# (employees) sortiranih po imenu (FIRST_NAME) u
# opadaju¢em redosledu.
SELECT * FROM employees
ORDER BY FIRST_NAME DESC;

# Napisati upit za dobijanje identikatora zaposlenih, imena i
# prezimena, plate sortiranih po plati u rastu¢em redosledu.
SELECT EMPLOYEE_ID AS 'Identifikator', FIRST_NAME AS 'Ime', LAST_NAME as 'Prezime', SALARY as 'Plata' FROM employees
ORDER BY SALARY ASC;

# Napisati upit za prikaz imena, prezimena i identikatora
# departmana sortirano u rastu¢em redosledu po identikatoru
# departmana svih zaposlenih na departmanima sa
# identikatorima 30 i 100.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', DEPARTMENT_ID AS 'Identifikator Departmana' FROM employees
WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 100
ORDER BY DEPARTMENT_ID ASC;

# Napisati upit za prikaz imena, prezimena i plate svih
# zaposlenih na departmanima sa identiaktorima 30 i 100 £ija
# plata nije u opsegu (10.000;15.000].
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE (DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 100)
AND (SALARY <= 10000 OR SALARY > 15000);

# Napisati upit za prikaz prezimena, identikatora posla
# (JOB_ID) i plate zaposlenih za poslove Programmer
# (JOB_ID = 'IT_PROG') i Shipping Clerk (JOB_ID =
# 'SH_CLERK') £ija plata nije 4.500, 10.000, ili 15.000.
SELECT LAST_NAME as 'Prezime', JOB_ID AS 'Identifikator Posla', SALARY AS 'Plata' FROM employees
WHERE JOB_ID IN ('IT_PROG', 'SH_CLERK')
AND SALARY NOT IN (4500, 10000, 15000);

# Napisati upit za prikaz zaposlenih £ije prezime je 'BLAKE',
# 'SCOTT', 'KING' ili 'FORD'.
SELECT * FROM employees
WHERE LAST_NAME IN ('Blake', 'Scott', 'King', 'Ford');