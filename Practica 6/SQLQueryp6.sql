CREATE VIEW view_jobAndHisory
AS
SELECT JOBS.job_title,JOBS.max_salary,
JOBS_HISORY.end_date,JOBS_HISORY.start_date 
FROM JOBS 
CROSS JOIN JOBS_HISORY;

CREATE VIEW view_orderAndOrder_items
AS
SELECT ORDERS.order_date,ORDERS.order_mode,
ORDER_ITEMS.quantity, ORDER_ITEMS.unit_price 
FROM ORDERS
CROSS JOIN ORDER_ITEMS;

CREATE VIEW view_productDescriptionAndproductInformation
AS
SELECT PRODUCT_DESCRIPTIONS.translated_name,PRODUCT_DESCRIPTIONS.translated_description,
PRODUCT_INFORMATION.product_name,PRODUCT_INFORMATION.product_description
FROM PRODUCT_DESCRIPTIONS
CROSS JOIN PRODUCT_INFORMATION;

CREATE VIEW view_emploteeAndDepartament
AS
SELECT Employees.first_name,Employees.last_name,
DEPARTAMENTS.department_name
FROM Employees
CROSS JOIN DEPARTAMENTS;

CREATE VIEW view_jobHisoryAndDepartament
AS
SELECT JOBS_HISORY.end_date,JOBS_HISORY.start_date,
DEPARTAMENTS.department_name 
FROM JOBS_HISORY
CROSS JOIN DEPARTAMENTS;
