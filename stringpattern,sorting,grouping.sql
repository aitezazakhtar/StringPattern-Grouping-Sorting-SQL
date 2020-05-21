------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
                            
--- Query 1 

select * 
from Employees 
where address like '%Elgin,IL';

-- Query 2 
select * 
from Employees 
where B_DATE like '197%';

-- Query 3
select * 
from Employees 
where DEP_ID=5 and salary between 60000 and 70000;

-- Query 4
select f_name,l_name 
from Employees order by DEP_ID;

-- Query 5
select f_name,l_name  
from Employees  
order by DEP_ID desc, L_NAME desc;

-- Query 6
select Dep_id, count(emp_id) as "No. of Employees"
from Employees 
group by Dep_id;

-- Query 7
select Dep_id, count(emp_id) as "No. of Employees", avg(salary) as "Avg Salary"
from Employees 
group by Dep_id;

-- Query 8
select Dep_id, count(emp_id) as "No. of Employees", avg(salary) as "Avg Salary"
from Employees 
group by Dep_id
order by "Avg Salary";

-- Query 9
select Dep_id, count(emp_id) as "No. of Employees", avg(salary) as "Avg Salary"
from Employees 
group by Dep_id
having count(emp_id) < 4
order by "Avg Salary";

-- Query 10
select e.f_name, e.l_name, d.dep_name
from employees e, departments d 
where e.dep_id = d.dept_id_dep;