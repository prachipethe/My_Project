-- Name=Karan Rajesh Sawant.
-- Project Name=Comany details.

show tables;

-- Q1
-- Write a query to display the names (first_name, last_name) 
-- using alias name “First Name", "Last Name" from employees table
select FIRST_NAME as "First Name", LAST_NAME as "Last Name"
from employees;

-- Q2
-- Write a query to get unique department ID from employee table.
select distinct DEPARTMENT_ID from employees;

-- Q3
--  Write a query to get all employee details from the employee table order by first name, descending. 
select * from employees 
order by FIRST_NAME desc;

-- Q4
-- Write a query to get the names (first_name, last_name), salary, 
-- PF of all the employees (PF is calculated as 15% of salary).
select  FIRST_NAME, LAST_NAME, SALARY,
round(((salary/100)*15)) as PF
from employees;

-- Q5
-- Write a query to get the employee ID, names (first_name, last_name), 
-- salary in ascending order of salary
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME,SALARY
from employees
order by SALARY desc;

-- Q6
-- Write a query to get the total salaries payable to employees.
select sum(salary) as total_salary from employees;

-- Q7
-- Write a query to get the maximum and minimum salary from employees table.
select max(salary) as max_salary, min(salary) as min_salary from employees;

-- Q8
-- Write a query to get the average salary and 
-- number of employees in the employees table.
select avg(salary) as avg_salary, count(employee_id) as total_emp from employees;

-- Q9
--  Write a query to get the number of employees working with the company.
select count(EMPLOYEE_ID) as total_emp from employees;

-- Q10
-- Write a query to get the number of jobs available in the employees table.
select count(JOB_ID) as no_job 
from employees;

-- Q11
-- Write a query get all first name from employees table in upper case. 
select ucase(first_name) from employees;

-- Q12
-- Write a query to get the first 3 characters of first name from employees table.
select FIRST_NAME, mid(first_name,1,3) from employees;
                  -- OR
select first_name, left(first_name,3) from employees;

-- Q13
-- Write a query to calculate 171*214+625. 
select (171*214)+625 as total;

-- Q14
--  Write a query to get the names (for example Ellen Abel, Sundar Ande etc.)
-- of all the employees from employees table.
select  FIRST_NAME,LAST_NAME,concat(first_name," ",last_name) as full_name from employees;

-- Q15
-- Write a query to get first name from employees table 
-- after removing white spaces from both side.
select FIRST_NAME,trim(first_name) from employees;

-- Q16
-- Write a query to get the length of the employee names (first_name, last_name)
-- from employees table.
select first_name,last_name, length(first_name) as FN_length, 
length(last_name) as LN_lenght
from employees;

-- Q17
-- Write a query to check if the first_name fields of the employees table contains numbers.
select count(first_name) 
from employees 
where first_name like "%0%" or "%1%" or "%2%" or "%3%" or "%4%" or "%5%"
or "%6%" or "%7%" or "%8%" or "%9%" or "%10%";

-- Q18
--  Write a query to select first 10 records from a table. 
select * 
from employees
limit 10; 

-- Q19
-- Write a query to get monthly salary (round 2 decimal places) of each and every employee
select salary, round(salary,2) from employees;

-- Q20
-- Write a query to display the name (first_name, last_name) and 
-- salary for all employees whose salary is not in the range $10,000 through $15,000.
select first_name, last_name,SALARY
from employees
where SALARY not between 10000 and 15000
order by SALARY;

-- Q21
-- Write a query to display the name (first_name, last_name) and department ID
-- of all employees in departments 30 or 100 in ascending order. 
select first_name, last_name, department_id 
from employees
where department_id=30 or department_id=100
order by department_id;

-- Q22
-- Write a query to display the name (first_name, last_name) and salary 
-- for all employees whose salary is not in the range $10,000 through $15,000 
-- and are in department 30 or 100.
select first_name, last_name,SALARY
from employees
where SALARY not between 10000 and 15000 
and (department_id=30 or department_id=100);

-- Q23
--  Write a query to display the name (first_name, last_name) 
-- and hire date for all employees who were hired in 1987. 
select FIRST_NAME,LAST_NAME,HIRE_DATE, year(1987)
from employees;

-- Q24
--  Write a query to display the first_name of all employees
-- who have both "b" and "c" in their first name.
select FIRST_NAME 
from employees
where FIRST_NAME like "b%" or FIRST_NAME like "c%";

-- Q25
-- Write a query to display the last name, job, and salary for all employees
-- whose job is that of a Programmer or a Shipping Clerk,
-- and whose salary is not equal to $4,500, $10,000, or $15,000.
select last_name,job_id,salary
from employees
where job_id in ("it_prog","st_clerk") and salary!=4500 and 
salary!=10000 and 
salary!=15000;

-- Q26
-- Write a query to display the last name of employees
-- whose names have exactly 6 characters.
select LAST_NAME
from employees
where LAST_NAME like "______";

-- Q27
--  Write a query to display the last name of employees
-- having 'e' as the third character.
select LAST_NAME 
from employees
where LAST_NAME like "__e%";

-- Q28
--  Write a query to display the jobs/designations available in the employees table
select distinct JOB_ID
from employees;

-- Q29
--  Write a query to display the name (first_name, last_name), salary
--  and PF (15% of salary) of all employees. 
select first_name,last_name,salary, 
round(((salary/100)*15)) as PF
from employees;

-- Q29
--  Write a query to select all record from employees
-- where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
select * 
from employees
where LAST_NAME="blake" or LAST_NAME="king" or LAST_NAME="ford";

-- Q30
--  Write a query to list the number of jobs available in the employees table
select count(job_ID) as total 
from employees ;

-- Q31
-- Write a query to get the total salaries payable to employees
select sum(salary) total_salary from employees;

-- Q32
-- Write a query to get the minimum salary from employees table. 
select min(salary) as min_pay from employees;

-- Q33
-- Write a query to get the maximum salary of an employee 
-- working as a Programmer. 
select * from employees;
select max(salary) as max_Pr 
from employees
where job_id="IT_PROG";

-- Q34
-- Write a query to get the average salary and number of employees working in the department 90. 
select DEPARTMENT_ID, avg(salary) as avg_sal, count(EMPLOYEE_ID) as C_EMP
from employees
where DEPARTMENT_ID=90;

-- Q35
-- Write a query to get the highest, lowest, sum, and average salary of all employees. 
select max(salary) as max, min(salary) as min,
sum(salary), avg(salary) as avg
from employees;

-- Q36
-- Write a query to get the number of employees with the same job.
select job_id,count(job_id)
from employees
group by job_id;

-- Q37
--  Write a query to get the difference between the highest and lowest salaries.
select max(salary)- min(salary) as diff
from employees;

-- Q38
--  Write a query to find the manager ID
-- and the salary of the lowest-paid employee for that manager. 
select  MANAGER_ID, min(SALARY) 
from employees
group by MANAGER_ID;

-- Q39
--  Write a query to get the department ID and the total salary payable in each department.
select DEPARTMENT_ID, sum(salary)
from employees
group by DEPARTMENT_ID;

-- Q40  
-- Write a query to get the average salary for each job ID excluding programmer.
select * from employees;
select job_id, avg(salary)
from employees
group by job_id
having job_id!="it_prog"; 


-- Q41
-- Write a query to get the total salary, maximum, minimum, average salary
-- of employees (job ID wise), for department ID 90 only.
select job_id,DEPARTMENT_ID,sum(salary), max(salary), min(salary), avg(salary)
from employees
group by JOB_ID,DEPARTMENT_ID
having DEPARTMENT_ID=90;


-- Q42
-- Write a query to get the job ID and maximum salary of the employees
-- where maximum salary is greater than or equal to $4000.
select job_id, salary, max(salary)
from employees
group by job_id,Salary
having salary>=4000;


-- Q43
-- Write a query to get the average salary for all departments employing more than 10
select job_id,department_id,avg(salary)
from employees
group by job_id, DEPARTMENT_id
having count(JOB_ID)>10;

-- Q44
-- Write a query to display the first day of the month (in datetime format) three months
-- before the current month.
select date_sub(date_sub(curdate(),interval 3 month),
interval day(date_sub(curdate(),interval 3 month)) -1 day) as
`first day of month before 3 month`;

-- Q45. Write a query to display the last day of the month (in datetime format) three months before
select  date_sub(date_sub(curdate(),interval -3 month),
interval day(date_sub(curdate(),interval -3 month)) -1 day) as
`first day of month before 3 month`  ;

-- Q46. Write a query to get the distinct Mondays from hire_date in employees tables.
select distinct , (str_to_date(concat(yearweek (hire_date,'1'),'%x%v%w')) 
from employees;
-- 47. Write a query to get the first day of the current year.
-- 48. Write a query to get the last day of the current year.
-- 49. Write a query to calculate the age in year.
-- 50. Write a query to get the current date in the following format.
-- Sample date : 2014-09-04
-- Output : September 4, 2014
-- 51. Write a query to get the current date in Thursday September 2014 format.
-- Thursday September 2014
-- 52. Write a query to extract the year from the current date.
-- 53. Write a query to get the DATE value from a given day (number in N).
-- Sample days: 730677
-- Output : 2000-07-11
-- 54. Write a query to get the first name and hire date from employees table where hire date
-- between '1987-06-01' and '1987-07-30'
-- Sample table: employees
-- 55. Write a query to display the current date in the following format.
-- Sample output: Thursday 4th September 2014 00:00:00
-- 56. Write a query to display the current date in the following format.
-- Sample output: 05/09/2014
-- 57. Write a query to display the current date in the following format.
-- Sample output: 12:00 AM Sep 5, 2014
-- 58. Write a query to get the firstname, lastname who joined in the month of June.
select first_name,last_name,HIRE_DATE 
from employees
where month(hire_date)="06";

-- 59. Write a query to get the years in which more than 10 employees joined.
select * from employees;
select HIRE_DATE
from employees
group by HIRE_DATE
having year(HIRE_DATE)>=10;

-- 60. Write a query to get first name of employees who joined in 1987.
select FIRST_NAME
from employees 
where year(HIRE_DATE) = "1987";

-- 61. Write a query to get department name, manager name, and salary of the manager for all
-- managers whose experience is more than 5 years.
select d.department_name,e.first_name,e.salary
from departments as d join employees as e
on d.department_id=e.employee_id
where (year(curdate()) - year(e.hire_date)) > 5;

-- 62. Write a query to get employee ID, last name, and date of first salary of the employees.
select employee_id,last_name,hire_date,salary
from employees;

-- 63. Write a query to get first name, hire date and experience of the employees.
select first_name,hire_date
from employees
where 
-- 64. Write a query to get the department ID, year, and number of employees joined. 









 


