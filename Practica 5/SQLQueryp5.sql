SELECT * FROM JOBS;

SELECT * FROM JOBS_HISORY;

SELECT * FROM ORDERS;

SELECT * FROM ORDER_ITEMS;

SELECT * FROM INVENTORIES;

SELECT job_title
FROM JOBS
GROUP BY job_title;

SELECT min_salary
FROM JOBS
GROUP BY min_salary;

SELECT max_salary
FROM JOBS
GROUP BY max_salary;

SELECT phone_numbers
FROM CUSTOMERS
GROUP BY phone_numbers;

SELECT credit_limit
FROM CUSTOMERS
GROUP BY credit_limit;

SELECT AVG(max_salary)
FROM JOBS;

SELECT SUM(max_salary)
FROM JOBS;

SELECT MIN(max_salary)
FROM JOBS;

SELECT AVG(phone_numbers)
FROM CUSTOMERS;

SELECT SUM(phone_numbers)
FROM CUSTOMERS;

SELECT cust_first_name, COUNT(customer_id)
FROM Customers
GROUP BY cust_first_name
HAVING COUNT(customer_id) > 0;

SELECT phone_numbers, count(customer_id)
FROM CUSTOMERS
GROUP BY phone_numbers
HAVING count(customer_id) > 0;

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

SELECT TOP 4 * FROM Customers;

SELECT TOP 3 * FROM JOBS;

SELECT TOP 5 * FROM Customers;

SELECT TOP 2 * FROM Customers;

SELECT TOP 5 * FROM JOBS;
