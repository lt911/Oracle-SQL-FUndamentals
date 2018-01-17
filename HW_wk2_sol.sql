//A2 

// Q1
SELECT last_name, salary
FROM employees
WHERE salary > 12000;

//Q2
SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

//Q3
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

//Q4
SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name in ('Matos', 'Taylor')
ORDER BY hire_date;

//Q5
SELECT last_name, department_id 
FROM employees
WHERE department_id in (20, 50)
ORDER BY last_name;

//Q6
SELECT last_name "Employee", salary "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 5000 AND 12000)
AND (department_id in (20, 50));

//Q7
SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YY') = '10';

//Q8
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

//Q9
SELECT last_name, salary, commission_pct
FROM employees
WHERE commiSsion_pct IS NOT NULL
ORDER by salary DESC;

//Q10
SELECT last_name, salary
FROM employees
WHERE salary > &salary_var;

//Q11
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id = &manager
ORDER BY &column_name;
UNDEFINE column_name

//Q12
SELECT last_name
FROM employees
WHERE (last_name like '%a%') 
AND (last_name like '%e%');

//Q13
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT in (2500,3500,7000);

/*........ Assignment 3 ......................*/
//Q1
SELECT SYSDATE
FROM dual;

//Q2
SELECT employee_id, last_name, salary, ROUND(salary * 1.155) "New Salary"
FROM employees;

//Q3
SELECT employee_id, last_name, salary, ROUND(salary * 1.155) "New Salary", ROUND(salary * .155) "Increase"
FROM employees;

//Q4
SELECT INITCAP(last_name), LENGTH(last_name)
FROM employees
WHERE LOWER(SUBSTR(last_name, 1, 1)) = '&start_letter';

//Q5
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) MONTHS_WORKED
FROM employees
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE, hire_date));

//Q6
SELECT last_name, LPAD(salary, 15, '$') SALARY
FROM employees;

//Q7
SELECT last_name, LPAD('*', FLOOR(salary/1000), '*') "SALARIES_IN_ASTERISK"
FROM employees
ORDER BY LENGTH(LPAD('*', FLOOR(salary/1000), '*')) DESC;

//Q8
SELECT last_name, TRUNC((SYSDATE-hire_date)/ 7) tenure
FROM employees
WHERE department_id = 90
ORDER BY TRUNC((SYSDATE-hire_date)/7) DESC;

/*..................Assignment 4......................*/
//Q1
SELECT last_name||' earns '||TO_CHAR(salary, '$9,999.99')||' but wants '|| TO_CHAR(salary*3, '$9,999.99')  "Dream Salaries"
FROM employees;

SELECT last_name||' earns $'||salary||' but wants $'||salary*3||'.'  "Dream Salaries"
FROM employees;

//Q2
SELECT last_name, hire_date, 'Monday, the '||TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'),'Ddspth')||' of '||
     TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'),'fmMonth')||', '||
     TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'),'fmYYYY') REVIEW
FROM employees;

//Q3
SELECT last_name, 
    (CASE WHEN commission_pct IS NULL THEN 'No Commission'
        ELSE TO_CHAR(commission_pct)
    END) COMM
FROM employees;

//Q4
SELECT job_id, 
  (CASE job_id WHEN 'AD_PRES' THEN 'A'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'SA_REP' THEN 'D'
                WHEN 'ST_CLERK' THEN 'E'
                ElSE '0'
    END) GRADE
FROM employees;

//Q5
SELECT job_id, 
  (CASE WHEN job_id = 'AD_PRES' THEN 'A'
        WHEN job_id = 'ST_MAN' THEN 'B'
        WHEN job_id = 'IT_PROG' THEN 'C'
        WHEN job_id = 'SA_REP' THEN 'D'
        WHEN job_id = 'ST_CLERK' THEN 'E'
        ElSE '0'
    END) GRADE
FROM employees;


//Q6
SELECT job_id, 
  DECODE( job_id, 'AD_PRES', 'A',
                  'ST_MAN' , 'B',
                  'IT_PROG', 'C',
                  'SA_REP', 'D',
                  'ST_CLERK', 'E',
                  '0')
                  GRADE
FROM employees;