/*.................Lesson 4 ................................*/
/*  A1 */
//Q1
DESCRIBE my_employee;

//Q2
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

//Q3
INSERT INTO my_employee
    (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs',860);

//Q4
SELECT * FROM my_employee;

//Q5
INSERT INTO my_employee
VALUES (&id, '&last_name', '&first_name', '&user_id', &salary);

//Q6
INSERT INTO my_employee
VALUES (&id, '&last_name', '&first_name', '&user_id', &salary);

//Q7
SELECT * FROM my_employee;
COMMIT;

//Q8
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

//Q9
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

//Q10
SELECT * FROM my_employee;

//Q11
DELETE FROM my_employee
WHERE first_name = 'Betty' 
AND last_name= 'Dancs';
SELECT * FROM my_employee;

//Q12
COMMIT;

//Q13
INSERT INTO my_employee
VALUES (&id, '&last_name', '&first_name', '&user_id', &salary);

//Q14
SELECT * FROM my_employee;

//Q15
SAVEPOINT step_15;

//Q16
DELETE FROM my_employee;

//Q17
SELECT * FROM my_employee;

//Q18
ROLLBACK to step_15;

//Q19
SELECT * FROM my_employee;

//Q20
COMMIT;

//Q21, Q22
INSERT INTO my_employee
VALUES (&id, '&&lastname', '&&firstname', LOWER(SUBSTR('&firstname',1, 1)||SUBSTR('&lastname',1,7)), &salary);
UNDEFINE lastname
UNDEFINE firstname;

//Q23
SELECT * FROM my_employee
WHERE id = 6;

/*    A2   */
//Q1
CREATE TABLE dept
  (id   NUMBER(7)
  CONSTRAINT id_pk PRIMARY KEY,
  name  VARCHAR2(25));
  
DESCRIBE dept;

//Q2
CREATE TABLE emp
 (id NUMBER(7),
 last_name VARCHAR2(25),
 first_name VARCHAR2(25),
 dept_id NUMBER(7)
 CONSTRAINT emp_dept_id_FK REFERENCES dept (id)
 ); 
 
 DESCRIBE emp;
 
 //Q3
 ALTER TABLE emp
 ADD (commission    NUMBER(2, 2));
 
DESCRIBE emp;

//Q4
ALTER TABLE emp
MODIFY (last_name VARCHAR2(50));
DESCRIBE emp;

//Q5
ALTER TABLE emp
DROP (first_name);
DESCRIBE emp;

//Q6
ALTER TABLE emp
SET UNUSED (dept_id);
DESCRIBE emp;

//Q7
ALTER TABLE emp
DROP UNUSED COLUMNS;

//Q8
CREATE TABLE employees2 
(id, first_name, last_name, salary, dept_id)
AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees;

DESCRIBE employees2;

//Q9
ALTER TABLE employees2 READ ONLY;

//Q10
DELETE FROM employees2;

//Q11
ALTER TABLE employees2 READ WRITE;

TRUNCATE TABLE employees2;
SELECT * FROM employees2;

//Q12
DROP TABLE emp;
DROP TABLE dept;
DROP TABLE employees;

/*       A3     */
//Q1
GRANT select 
ON regions
TO ora22
WITH GRANT OPTION;

/* on ora22 */
--GRANT select 
--ON ora21.regions
--TO ora23;

REVOKE select
on ora21.regions
FROM ora23;

//Q2
GRANT  select, update 
ON ora21.countries 
TO ora22;

//Q3
REVOKE select, update
on ora21.countries
FROM ora22;

//Q4
GRANT select
ON departments
TO ora22;

/* on ora22 */
--GRANT select
--ON departments
--TO ora21;

//Q5
SELECT *
FROM departments;

//Q6
DESCRIBE departments;
INSERT INTO departments
VALUES (500, 'Education', NULL, NULL);

SELECT * FROM ora22.departments;

//Q7
REVOKE select
on departments
FROM ora22;

//Q8
DELETE FROM departments
WHERE department_id = 500;

/*    A4    */
//Q1
SELECT table_name FROM user_tables;

//Q2
SELECT table_name, owner FROM ALL_TABLES;

//Q3
SELECT column_name, data_type, data_length, data_precision "PRECISION", data_scale "SCALE", nullable
FROM user_tab_columns
WHERE table_name = '&table_name';

//Q4
DESCRIBE user_constraints;
DESCRIBE user_cons_columns;

SELECT ucc.column_name, uc.constraint_name, uc.constraint_type, uc.search_condition, uc.status
FROM user_constraints uc JOIN user_cons_columns ucc
ON uc.table_name = ucc.table_name
AND uc.constraint_name = ucc.constraint_name
AND uc.table_name = ('&table_name');


//Q5
COMMENT ON TABLE departments
IS 'Company department information including name, code, and location.';

SELECT comments FROM user_tab_comments
WHERE table_name = 'DEPARTMENTS';

//Q7
SELECT table_name
FROM user_tables
WHERE table_name IN ('DEPT2', 'EMP2');

//Q8
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name IN ('DEPT2', 'EMP2');

//Q9
SELECT object_name, object_type
FROM user_objects
WHERE object_name IN ('DEPT2', 'EMP2');