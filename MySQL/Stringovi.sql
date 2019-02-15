# Koristiti bazu podataka
USE hr;

# Napisati upit za prikaz imena zaposlenih velikim slovima.
SELECT UPPER(FIRST_NAME) as 'Ime' FROM employees;

# Napisati upiz za prikaz prva tri slova imena zaposlenih.
SELECT LEFT(FIRST_NAME, 3) as 'Ime' FROM employees;

# Napisati upit za prikaz imena i prezimena u jednoj koloni pod
# aliasom 'Ime i prezime' svih zaposlenih.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'Ime i prezime' from employees;

# Napisati upit za prikaz imena zaposlenih bez whitespace
# karaktera pre ili nakon imena.
SELECT TRIM(FIRST_NAME) AS 'Ime' FROM employees;

# Napisati upit za prikaz duoine imena i prezimena zaposlenih.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', LENGTH(FIRST_NAME) AS 'Duzina imena', LENGTH(LAST_NAME) AS 'Duzina prezimena' FROM employees;

# Napisati upit za prikaz imena svih zaposlenih £ija imena sadroe
# i slovo "b" i slovo "c".
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees
WHERE FIRST_NAME LiKE "%b%" OR FIRST_NAME LIKE "%c%";

# Napisati upit za prikaz prezimena zaposlenih £ije prezime ima 6
# karaktera.
SELECT LAST_NAME AS 'Prezime' FROM employees
WHERE LENGTH(LAST_NAME) = 6;

# Napisati upit za prikaz prezimena zaposlenih £ije prezime ima
# slovo 'e' na tre¢em mestu.
SELECT LAST_NAME AS 'Prezime' FROM employees
WHERE SUBSTR(LAST_NAME, 3, 1) = 'e';

# Napisati upit za prikaz identikatora pozicije (JOB_ID) i
# identikatora zaposlenih na toj poziciji.
# Napomena: Koristiti GROUP_CONCAT
SELECT GROUP_CONCAT(EMPLOYEE_ID), JOB_ID FROM employees
GROUP BY JOB_ID;

# Napisati upit za prikaz podataka o zaposlenim £ije ime ima 8
# ili vi2e karaktera.
SELECT * FROM employees
WHERE LENGTH(FIRST_NAME) >= 8;

# Napisati upit za prikaz najve¢e i najmanje plate sa prikazom
# vode¢ih nula tako da je duoina obe plate 7.
# Napomena: Koristiti funkciju LPAD
SELECT JOB_ID AS 'Pozicija', LPAD(MAX_SALARY, 7, 0) AS 'Najveca plata', LPAD(MIN_SALARY, 7, 0) AS 'Najmanja plata' FROM jobs;

# Napisati upit koji prikazuje identikator zaposlenog i email bez
# poslednja tri karaktera.
# Napomena: Probati sa REVERSE i SUBSTRING; sa LENGTH
# i SUBSTRING, sa LENGTH i LEFT

# 1. REVERSE I SUBSTRING
SELECT EMPLOYEE_ID AS 'Identifikator zaposlenog', EMAIL, REVERSE(SUBSTR(REVERSE(EMAIL), 4)) AS 'Email bez tri karaktera' FROM employees;

# 2. LENGTH I SUBSTRING
SELECT EMPLOYEE_ID AS 'Identifikator zaposlenog', EMAIL, SUBSTR(EMAIL, 1, LENGTH(EMAIL) - 3) AS 'Email bez tri karaktera' FROM employees;

# 3. LENGTH I LEFT
SELECT EMPLOYEE_ID AS 'Identifikator zaposlenog', EMAIL, LEFT(EMAIL, LENGTH(EMAIL) - 3) AS 'Email bez tri karaktera' FROM employees;

# Napisati upit za prikaz podataka o zaposlenim £ije ime je
# napisano svim velikim slovima.
SELECT * FROM employees
WHERE FIRST_NAME = UPPER(FIRST_NAME);

# Napisati upit za prikaz poslednja £etiri karaktera broja telefona
# svih zaposlenih.
# Napomena: probati i sa RIGHT i sa LENGTH i SUBSTRING

# 1. SA RIGHT
SELECT EMPLOYEE_ID AS 'Identifikator zaposlenog', RIGHT(PHONE_NUMBER, 4) AS 'Poslednja cetiri karaktera broja telefona' FROM employees;

# 2. SA LENGTH I SUBSTIRNG
SELECT EMPLOYEE_ID AS 'Identifikator zaposlenog', SUBSTR(PHONE_NUMBER, LENGTH(PHONE_NUMBER) - 3) AS 'Poslednja cetiri karaktera broja telefona' FROM employees;

# Napisati upit koji prikazuje ime i prezime svih zaposlenih koji i
# prezimenu imaju slovo 'c' posle druge pozicije.
# Napomena: probati i sa INSTR i sa dooker znacima _%

# 1. SA INSTR
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees
WHERE INSTR(LAST_NAME, 'c') > 2;

# 2. SA ZNACIMA
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees
WHERE LAST_NAME LIKE '__%c%';

# Napisati upit za prikaz imena i duoine imena za sve zaposlene
# £ije ime po£inje sa slovima 'A', 'J' or 'M'. Sortirati rezultat po
# imenima zaposlenih.
SELECT FIRST_NAME AS 'Ime', LENGTH(FIRST_NAME) AS 'Duzina imena' FROM employees
WHERE LEFT(FIRST_NAME, 1) IN ('A', 'J', 'M')
ORDER BY FIRST_NAME;

# Napisati upit za prikaz imena i plate svih zaposlenih. Format
# plate treba da bude 10 karaktera duga£ak pri £emu su na
# po£etku odreeni broj simbola '$'.
SELECT FIRST_NAME AS 'Ime', CONCAT('$', LPAD(SALARY, 9, ' ')) AS 'Plata' FROM employees;
