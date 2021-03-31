-- Creating table schema

-- Create table departments

DROP TABLE departments

CREATE TABLE departments (
  dept_no VARCHAR(10),
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

-- Create table employees
DROP TABLE employees
CREATE TABLE employees (
	emp_no INT,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;

--Create table dept_emp
DROP TABLE dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.dept_no = employees.emp_noWHERE CAST()
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- Create table dept_managers
DROP TABLE dept_managers
CREATE TABLE dept_managers (
 dept_no VARCHAR (10),
 emp_no INT,
 from_date DATE NOT NULL,
 to_date DATE NOT NULL,
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_managers;

--Creating salaries table
DROP TABLE salaries
CREATE TABLE salaries (
	emp_no BIGINT NOT NULL,
	salary BIGINT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);


SELECT * FROM salaries;

--Creating titles table
DROP TABLE titles
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles;