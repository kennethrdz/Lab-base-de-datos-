CREATE VIEW view_employeeAndDepartament
AS
SELECT Employees.first_name,Employees.last_name,
DEPARTAMENTS.department_name
FROM Employees
CROSS JOIN DEPARTAMENTS;

CREATE VIEW view_jobHistoryAndDepartament
AS
SELECT JOBS_HISTORY.end_date,JOBS_HISTORY.start_date,
DEPARTAMENTS.department_name 
FROM JOBS_HISTORY
CROSS JOIN DEPARTAMENTS;

CREATE VIEW view_jobAndHistory
AS
SELECT JOBS.job_title,JOBS.max_salary,
JOBS_HISTORY.end_date,JOBS_HISTORY.start_date 
FROM JOBS 
CROSS JOIN JOBS_HISTORY;

CREATE VIEW view_DepartamentsAndLocations
AS
SELECT DEPARTAMENTS.departament_name, DEPARTAMENTS.location_id,
LOCATIONS.city 
FROM DEPARTAMENTS
CROSS JOIN LOCATIONS;

CREATE VIEW view_Job_HistoryAndEmployees
AS
SELECT JOB_HISTORY.end_date, JOB_HISTORY.start_date,
EMPLOYEES.first_name, EMPLOYEES.last_name 
FROM JOB_HISTORY 
CROSS JOIN EMPLOYEES;