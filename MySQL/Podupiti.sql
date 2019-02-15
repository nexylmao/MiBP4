# Koristi bazu
USE hr;

# Napisati upit za prikaz imena, prezimena i plate zaposlenih koji
# imaju ve¢u platu od plate zaposlenog koji se preziva 'Bull'.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE SALARY >
      (SELECT SALARY FROM employees
      WHERE LAST_NAME LIKE 'Bull'
      LIMIT 1);

# Napisati upit za prikaz imena i prezimena zaposlenih na IT
# departmanu.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees
WHERE DEPARTMENT_ID =
      (SELECT DEPARTMENT_ID FROM departments
      WHERE DEPARTMENT_NAME = 'IT'
      LIMIT 1);

# Napisati upit za prikaz imena i prezimena zaposlenih koji imaju
# menadoera i koji rade u departmanu u Americi
# (COUNTRY_ID = 'US').
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees e
WHERE MANAGER_ID IS NOT NULL
AND (SELECT COUNTRY_ID FROM locations
    WHERE LOCATION_ID = (SELECT LOCATION_ID FROM departments d
                        WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID)) = 'US';

# Napisati upit za prikaz imena i prezimena zaposlenih koji nisu
# menadoeri.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime' FROM employees e
WHERE (SELECT COUNT(*) FROM employees e2
      WHERE e2.MANAGER_ID LIKE e.EMPLOYEE_ID) = 0;

# Napisati upit za prikaz imena, prezimena i plate zaposlenih koji
# imaju platu ve¢u od prose£ne plate.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

# Napisati upit za prikaz imena, prezimena i plate zaposlenih koji
# imaju najmanju platu na njihovoj poziciji (JOB_ID).
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata', JOB_ID AS 'Pozicija' FROM employees e
WHERE SALARY = (SELECT MIN(SALARY) FROM employees e2
               WHERE e.JOB_ID = e2.JOB_ID);

# Napisati upit za prikaz imena, prezimena i plate zaposlenih koji
# zarauju vi2e od prose£ne plate i koji su zaposleni na nekom IT
# departmanu.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees)
AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments
                     WHERE DEPARTMENT_NAME LIKE "%IT%");

# Napisati upit za prikaz imena, prezimena i plate zaposlenih koji
# zarauju najmanju platu.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees
WHERE SALARY = (SELECT MIN(SALARY) FROM employees);

# Napisati upit za prikaz imena, prezimena, identikator pozicije
# (JOB_ID) i platu zaposlenih koji zarauju vi2e od svakog
# zaposlenog na poziciji Shipping Clerk (JOB_ID =
# 'SH_CLERK'). Sortirati rezultat od najmanje do najve¢e plate.
SELECT FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', JOB_ID AS 'Pozicija', SALARY AS 'Plata' FROM employees
WHERE SALARY > (SELECT MAX(SALARY) FROM employees
                GROUP BY JOB_ID
                HAVING JOB_ID = 'SH_CLERK')
ORDER BY SALARY ASC;

# Napisati upit koji prikazuje lokacije sa minimalnom duoinom
# naziva ulice (locations.STREET_ADDRESS).
SELECT * FROM locations
WHERE LENGTH(STREET_ADDRESS) = (SELECT MIN(LENGTH(STREET_ADDRESS)) FROM locations);

# Napisati upit za prikaz identikatora, imena, prezimena i plate
# zaposlenih koji zarauju vi2e od proseka na svom departmanu.
SELECT EMPLOYEE_ID AS 'Identifikator', FIRST_NAME AS 'Ime', LAST_NAME AS 'Prezime', SALARY AS 'Plata' FROM employees e
WHERE SALARY > (SELECT AVG(SALARY) FROM employees e2
               GROUP BY DEPARTMENT_ID
               HAVING e2.DEPARTMENT_ID = e.DEPARTMENT_ID);

# Napisati upit koji prikazuju 5. najve¢u platu.

# bez podupita
SELECT SALARY AS 'Plata' FROM employees
ORDER BY SALARY DESC
LIMIT 4, 1;

# sa podupitom
SELECT SALARY AS 'Plata' FROM employees e
WHERE (SELECT COUNT(SALARY) FROM employees e2
      WHERE e2.SALARY > e.SALARY) = 4;

# Napisati upit koji prikazuje 4. najmanju platu.

# bez podupita
SELECT SALARY AS 'Plata' FROM employees
ORDER BY SALARY ASC
LIMIT 3, 1;

# sa podupitom
SELECT SALARY AS 'Plata' FROM employees e
WHERE (SELECT COUNT(SALARY) FROM employees e2
      WHERE e2.SALARY < e.SALARY) = 3;

# Napisati upit koji prikazuje poslednjih deset zaposlenih
# (poslednjih u tabeli, ne po datumu zaposlenja).

# Iskreno, ovo mislim da ne bi nikad skontao iz teksta sta treba, pogotovo ne kako misli da se uradi
# bar ne onako kako sam ja interpretirao, a i ova sintaksa je na ivici supporta SQL jezika
# Resenje prekopirano od profesora
SELECT * FROM (SELECT EMPLOYEE_ID FROM employees
                     ORDER BY EMPLOYEE_ID DESC
                     LIMIT 10) SUB
ORDER BY EMPLOYEE_ID ASC;

# Napisati upit koji prikazuje podatke o departmanima koji
# nemaju zaposlenih.
SELECT * FROM departments
WHERE 0 = (SELECT COUNT(*) FROM employees
          WHERE employees.DEPARTMENT_ID = departments.DEPARTMENT_ID);
