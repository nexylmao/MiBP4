# Koristi bazu
USE hr;

# Napisati upit za prikaz imena i datuma zaposlenja za sve
# zaposlene u izmeu '1987-06-01' i '1987-07-30'.
SELECT FIRST_NAME as 'Ime', LAST_NAME as 'Prezime' FROM employees
WHERE HIRE_DATE BETWEEN '1987-06-01' AND '1987-07-30';

# Napisati upit za prikaz imena i prezimena svih zaposlenih u
# junu mesecu.
SELECT FIRST_NAME as 'Ime', LAST_NAME as 'Prezime' FROM employees
WHERE MONTH(HIRE_DATE) = 7;

# Napisati upit za prikaz godina u kojima se zaposlilo vi2e od 10
# radnika.
SELECT YEAR(HIRE_DATE) FROM employees
GROUP BY YEAR(HIRE_DATE)
HAVING COUNT(HIRE_DATE) > 10;

# Napisati upit za prikaz imena i datuma zaposlenja svih
# zaposlenih u 1987. godini.
# Napomena: koristiti funkciju YEAR ili probati sa like i dooker
# znakom %
SELECT FIRST_NAME as 'Ime', HIRE_DATE as 'Datum zaposlenja' FROM employees
WHERE YEAR(HIRE_DATE) = 1987;

# Napisati upit za prikaz imena, datuma zaposlenja i godina
# iskustva za sve zaposlene.
# Napomena: Koristiti funkcije NOW i DATEDIFF
SELECT FIRST_NAME as 'Ime', HIRE_DATE as 'Datum Zaposlenja', TRUNCATE(DATEDIFF(NOW(), HIRE_DATE) / 365, 0) as 'Godine iskustva' FROM employees;

# Napisati upit za prikaz identikatora departmana, godine
# zaposlenja i broja zaposlenih po departmanima i godinama
# sortirano u rastu¢em redosledu po identikatoru departmana.
# Napomena: Koristiti funkciju YEAR ili DATE_FORMAT
SELECT DEPARTMENT_ID as 'Identifikator departmana', SUM(TRUNCATE(DATEDIFF(NOW(), HIRE_DATE) / 365, 0)) as 'Ukupne godine iskustva', COUNT(HIRE_DATE) as 'Broj radnika' FROM employees
GROUP BY DEPARTMENT_ID;