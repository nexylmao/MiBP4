# King ne treba da ima MANAGER_I
SELECT * FROM employees
WHERE LAST_NAME = 'King';

UPDATE employees
SET MANAGER_ID = NULL
WHERE EMPLOYEE_ID = 100;