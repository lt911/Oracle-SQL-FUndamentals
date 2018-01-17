/*.........Lesson 3 ..........*/
/* A1 */
//Q1
SELECT MAX(salary) "Maximum", MIN(salary) "Minimum", SUM(salary) "Sum", ROUND(AVG(salary)) "Average"
FROM employees;

//Q2
SELECT job_id,MAX(salary) "Maximum", MIN(salary) "Minimum", SUM(salary) "Sum", ROUND(AVG(salary)) "Average"
FROM employees
GROUP BY job_id;

//Q3
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING job_id = '&job_value';

//Q4
SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM employees;

//Q5
SELECT MAX(salary) - MIN(salary) difference
FROM employees;

//Q6
SELECT manager_id, MIN(salary)
FROM employees
GROUP BY manager_id
HAVING (manager_id IS NOT NULL AND MIN(salary) > 6000)
ORDER BY MIN(salary) DESC;

//Q7
SELECT COUNT(*),
    COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2009', hire_date)) "2009",
    COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2010', hire_date)) "2010",
    COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2011', hire_date)) "2011",
    COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2012', hire_date)) "2012"
FROM employees;

//Q8
SELECT job_id "Job",
    SUM(DECODE(department_id, 20, salary)) "Dept 20",
    SUM(DECODE(department_id, 50, salary)) "Dept 50",
    SUM(DECODE(department_id, 80, salary)) "Dept 80",
    SUM(DECODE(department_id, 90, salary)) "Dept 90",
    SUM(salary)
FROM employees
GROUP BY job_id;

/*     A2   */
//Q1
SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

//Q2
SELECT last_name, e.department_id, department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

//Q3
describe departments;

describe EMPLOYEES;

SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';

//Q4
SELECT e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", e.manager_id "Mgr#" 
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

//Q5
SELECT e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", e.manager_id "Mgr#" 
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
ORDER BY e.employee_id;

//Q6
SELECT e.department_id department, e.last_name employee, c.last_name colleague
FROM employees e
JOIN employees c
ON e.department_id = c.department_id
WHERE e.employee_id <> c.employee_id
ORDER by e.department_id, e.last_name, c.last_name;

//Q7
DESCRIBE job_grades;

SELECT e.last_name, e.job_id, d.department_name, e.salary, g.grade_level
FROM employees e 
JOIN departments d
ON (e.department_id = d.department_id)
JOIN job_grades g
ON (e.salary BETWEEN g.lowest_sal AND g.highest_sal);

//Q8
SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
                    FROM employees
                    WHERE LOWER(last_name) = 'davies');
                    
//Q9
SELECT e.last_name "LAST_NAME", e.hire_date "HIRE_DATE", m.last_name "MANAGER", m.hire_date "Manager_hire_date"
FROM employees e
JOIN employees m
ON (e.manager_id = m.employee_id)
WHERE e.hire_date < m.hire_date;

/*     A3     */
// Q1
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
                        FROM employees
                        WHERE last_name = '&&emp_name')
AND last_name <> '&emp_name';
UNDEFINE emp_name;

//Q2
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary;

//Q3
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id 
                        FROM employees
                        WHERE last_name LIKE '%u%');

//Q4
SELECT e.last_name, e.department_id, e.job_id
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
WHERE location_id = &loc_id;

//Q5
SELECT last_name, salary
FROM employees
WHERE manager_id = (SELECT employee_id 
                    FROM employees 
                    WHERE last_name = 'King');
                    
//6
SELECT department_id, last_name, job_id
FROM employees 
WHERE department_id in (SELECT department_id
                        FROM departments
                        WHERE department_name = 'Executive');
                        
//Q7
SELECT last_name
FROM employees
WHERE salary > ANY(SELECT salary
                FROM employees
                WHERE department_id = 60);

//Q8
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
AND department_id IN (SELECT DISTINCT department_id 
                        FROM employees
                        WHERE last_name LIKE '%u%');