SELECT * FROM JOBS WHERE max_salary > 2000;

SELECT * FROM LOCATIONS	WHERE postal_code > 64720;

SELECT * FROM EMPLOYEES WHERE salary > 1000;

SELECT * FROM JOBS WHERE min_salary > 1000 AND max_salary < 3000;

SELECT * FROM JOBS WHERE min_salary < 4000;


SELECT salary
FROM Employees
GROUP BY salary;

SELECT postal_code
FROM LOCATIONS
GROUP BY postal_code;

SELECT job_title
FROM JOBS
GROUP BY job_title;

SELECT min_salary
FROM JOBS
GROUP BY min_salary;

SELECT max_salary
FROM JOBS
GROUP BY max_salary;

SELECT MIN(min_salary)
FROM JOBS;

SELECT AVG(min_salary)
FROM JOBS;

SELECT AVG(max_salary)
FROM JOBS;

SELECT SUM(max_salary)
FROM JOBS;

SELECT MIN(max_salary)
FROM JOBS;

SELECT postal_code, count(country_id)
FROM LOCATIONS
GROUP BY postal_code
HAVING count(country_id) > 1;

SELECT salary, count(employee_id)
FROM EMPLOYEES
GROUP BY salary
HAVING count(job_id) > 1;

SELECT max_salary, count(job_id)
FROM JOBS
GROUP BY max_salary
HAVING count(job_id) > 1;

SELECT job_title, count(job_id)
FROM JOBS
GROUP BY job_title
HAVING count(job_id) > 0;

SELECT min_salary, count(job_id)
FROM JOBS
GROUP BY min_salary
HAVING count(job_id) > 0;

SELECT TOP 5 * FROM JOBS;
SELECT TOP 3 * FROM JOBS;
SELECT TOP 3 * FROM LOCATIONS;
SELECT TOP 5 * FROM LOCATIONS;
SELECT TOP 5 * FROM EMPLOYEES;

