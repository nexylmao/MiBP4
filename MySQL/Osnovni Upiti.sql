# Osnovni upiti
# Koristi bazu
USE hr;

# Napisati upit za prikaz imena i prezimena (FIRST_NAME,
# LAST_NAME) zaposlenih (employees) pod aliasima 'First
# Name', 'Last Name'.
SELECT FIRST_NAME as "First Name", LAST_NAME as "Last Name" FROM employees;

# Napisati upit za prikaz svih razli£itih identikatora
# departmana(unique department ID) iz tabele zaposlenih
# (employees).
SELECT DEPARTMENT_ID FROM employees
GROUP BY DEPARTMENT_ID;

# Napisati upit za dobijanje imena, prezimena, plate i PF-a (PF
# se ra£una kao 15% od plate) svih zaposlenih.
SELECT FIRST_NAME as 'Ime', LAST_NAME as 'Prezime', SALARY as 'Plata', (SALARY * 0.15) as 'PF' FROM employees;

# Napisati upit za prikaz imena, prezimena i mese£ne plate
# zaokruoene na 2 decimale za sve zaposlene
# Napomena: Pretpostaviti da je u polju SALARY godi2nja plata
# zaposlenog.
SELECT FIRST_NAME as 'Ime', LAST_NAME as 'Prezime', ROUND(SALARY / 12, 2) as 'Mesecna plata' FROM employees;