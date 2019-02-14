# Azuriranje podataka
# Koristiti bazu
USE hr;

# Napisati SQL insert naredbu koja Vas zaposljava na poziciju
# programera (JOB_ID = 'IT_PROG') na departman sa
# identifikatorom 30.
INSERT INTO employees(FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
VALUES ('Tele','Tabis', 'tele@tab.is', '+381 te-le-ta-bis', NOW(), 'IT_PROG', 1500, 30);

# Pove¢ati Vasu platu za 1000
UPDATE employees
SET SALARY = SALARY + 1000
WHERE FIRST_NAME = 'Tele';

# Obrisati Va2 zapis u tabeli zaposlenih
DELETE FROM employees
WHERE FIRST_NAME = 'Tele';

# Citanje rezultata
SELECT * FROM employees WHERE FIRST_NAME = 'Tele';