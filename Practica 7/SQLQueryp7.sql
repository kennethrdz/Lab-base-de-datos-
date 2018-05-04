CREATE PROCEDURE sp_addJob 
				@job_titlee nchar(50),
				@min_salaryy nchar(10),
				@max_salaryy money
AS
INSERT INTO JOBS (job_id, job_title, min_salary,max_salary) 
VALUES(NEWID(), @job_titlee, @min_salaryy, @max_salaryy)

CREATE PROCEDURE sp_dropJob
				@job_title as varchar(30)
AS
DELETE FROM JOBS WHERE job_title = @job_title

CREATE PROCEDURE sp_addCustomer
				@cust_first varchar(50),
				@cust_last varchar(10),
				@cust_addres varchar(50),
				@phone int,
				@nls_language varchar(max),
				@nls_territory varchar(max),
				@credit int,
				@cust_email varchar(max),
				@account varchar(max),
				@cust_geo varchar(50),
				@date_of int,
				@marital varchar(max),
				@gender varchar(max),
				@income varchar(max)
AS
INSERT INTO CUSTOMERS(customer_id, cust_first_name, cust_last_name, cust_address, phone_numbers,nls_language,nls_territory,credit_limit,cust_email,account_mgr_id,cust_geo_location,date_of_birth,marital_status,gender,income_level)
VALUES (NEWID(), @cust_first, @cust_last,@cust_addres,@phone,@nls_language, @nls_territory,@credit,@cust_email,@account,@cust_geo,@date_of,@marital,@gender,@income);

CREATE PROCEDURE sp_dropCustomer
				@cust_first as varchar(30)
AS
DELETE FROM CUSTOMERS WHERE cust_first_name = @cust_first

CREATE PROCEDURE sp_dropEmployee
				@first as varchar(50)
AS
DELETE FROM Employees WHERE first_name = @first

CREATE FUNCTION dbo.stripJob (@input VARCHAR(250))
RETURNS VARCHAR(250)
AS BEGIN
    DECLARE @job VARCHAR(250)

    SET @job = @Input

    SET @job = REPLACE(@job, 'j', '')
    SET @job = REPLACE(@job, 'a', '')

    RETURN @job
END


CREATE TRIGGER tr_Job
      ON JOBS
      AFTER UPDATE
      AS
        BEGIN
         INSERT INTO JOBS
         (job_id, job_title,min_salary, max_salary)
         SELECT newid(),job_title, min_salary, max_salary
         FROM INSERTED
        END