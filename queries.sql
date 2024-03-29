--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT a.emp_no as "Employee Number", a.last_name as "Last Name",
a.first_name as "First Name", a.gender as "Gender", b.salary as "Salary"
FROM employees a 
JOIN salaries b
ON a.emp_no = b.emp_no;

--2. List employees who were hired in 1986.

SELECT first_name as "First Name", last_name as "Last Name"
FROM employees 
WHERE DATE_PART('year', DATE(hire_date)) = 1986;

--3. List the manager of each department with the following 
--information: department number, department name, 
--the manager's employee number, last name, first name, 
--and start and end employment dates.

SELECT a.dept_no as "Dept. No.", a.dept_name as "Dept. Name", 
c.emp_no as "Manager Emp. No.", c.first_name as "Mgr. First Name", 
c.last_name as "Mgr. Last Name", b.from_date as "Employment Start Date", 
b.to_date as "Employment End Date"
FROM department a
JOIN dept_manager b ON a.dept_no = b.dept_no
JOIN employees c ON b.emp_no = c.emp_no;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT a.emp_no as "Employee No.", b.last_name as "Last Name", 
b.first_name as "First Name", c.dept_name as "Dept. Name"
FROM dept_emp a
JOIN employees b ON a.emp_no = b.emp_no
JOIN department c ON a.dept_no = c.dept_no;

--5. List all employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT first_name as "Employee First Name", 
last_name as "Employee Last Name"
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their
--employee number, last name, first name, and department name.

SELECT a.emp_no as "Employee Number", a.last_name as "Last Name",
a.first_name as "First Name", c.dept_name as "Department"
FROM employees a
JOIN dept_emp b 
ON a.emp_no = b.emp_no
JOIN department c 
ON b.dept_no = c.dept_no
WHERE c.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including
--their employee number, last name, first name, and department name.

SELECT a.emp_no as "Employee Number", a.last_name as "Last Name",
a.first_name as "First Name", c.dept_name as "Department"
FROM employees a
JOIN dept_emp b 
ON a.emp_no = b.emp_no
JOIN department c 
ON b.dept_no = c.dept_no
WHERE c.dept_name IN ('Sales','Development');

--8. In descending order, list the frequency count of employee
--last names, i.e., how many employees share each last name.

SELECT distinct last_name as "Employee Last Name:", 
count(*) as "Number sharing this last name:"
FROM employees
GROUP BY 1 
ORDER BY 2 DESC;