--	1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no as "EMP No", employees.last_name as "Last Name",employees.first_name as "First Name",employees.gender as "Gender",salaries.salary as "Salary"
FROM employees
JOIN salaries on employees.emp_no = salaries.emp_no;

--	2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * from employees;
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

--	3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_managers ON departments.dept_no = dept_managers.dept_no
JOIN employees ON dept_managers.emp_no = employees.emp_no;

--	4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Employee #", employees.last_name AS "Last Name", employees.first_name AS "First Name",
dept_emp.dept_no AS "Dept No", departments.dept_name  AS "Dept Name"
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by "Employee #";

--	5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--	6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name='Sales';

--	7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no AS "Emp NO", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Dept Name"
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN('Development','Sales');

--	8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency_Count"
FROM employees
GROUP By last_name
ORDER BY "Frequency_Count" DESC;