INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'vendedor', '8000', '20000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'limpieza', '6000', '8000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'cajero/a', '5000', '10000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'secretaria', '2500', '12000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'contador', '10000', '30000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'guardia', '4000', '11000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'telemarketing', '5000', '12000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'gerente', '4500', '15000');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'supervisor', '3500', '12500');

INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
VALUES (NEWID(), 'administrador de sistemas', '8000', '35000');


DELETE FROM JOBS
WHERE job_title = 'vendedor';

DELETE FROM JOBS
WHERE job_title = 'limpieza';

DELETE FROM JOBS
WHERE job_title = 'cajero/a';

DELETE FROM JOBS
WHERE job_title = 'secretaria';

DELETE FROM JOBS
WHERE job_title = 'contador';
