--List the department of each employee with the following 
--information: employee number, last name, first name, and 
--department name.

SELECT a.dept_no as "Dept. No.", a.dept_name as "Dept. Name", 
c.emp_no as "Mgr's Emp. No.", c.first_name as "Mgr First Name", 
c.last_name as "Mgr Last Name", b.from_date as "Employment Start Date", 
b.to_date as "Employment End Date"
FROM department a
JOIN dept_manager b ON a.dept_no = b.dept_no
JOIN employees c ON b.emp_no = c.emp_no;
