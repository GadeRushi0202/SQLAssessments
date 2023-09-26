create table Assignments(
Id int primary key,
First_Name varchar(15),
Last_Name varchar(15),
Age int not null,
Department varchar(30),
Salary numeric(12,2)
)

insert into Assignments values(1,'Rushi','Gade',23,'Information Technology', 45000)
insert into Assignments values(2,'Rajesh','Gade',27,'B-Pharm',55000)
insert into Assignments values(3,'Vishal','Gade',26,'MCA',65000)
insert into Assignments values(4,'Pratiksha','Gade',21,'information Technology',765000)
insert into Assignments values(5,'Rutu','Gade',20,'B-Pharm',60000)
insert into Assignments Values(6,'Shumbham','Gade',22,'MCA',55500)
insert into Assignments Values(7,'Shubham','Desai',23,'Civil Engineering',56000)
insert into Assignments values(8,'Dhananjay','Rokade',24,'Information Technology',700000)
insert into Assignments values(9,'Kunal','Chaudhary',23,'Information Technology',650000) 
insert into Assignments values(10,'Akshay','Datir',24,'Information Technology',463000)

--Assignments CW :-

--1.	Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
select First_Name as "Employee_Frist_Name" ,Last_Name as "Employee_Last_Name" from Assignments

--2.	Write a query to get unique department ID from employee table.
--output -> B-Pharm ,Civil Engineering , Information Technology, MCA
select DISTINCT Department from Assignments

--3.	Write a query to get the total salaries payable to employees.
select Sum(Salary) as Total_Salary from Assignments
--output -> Total_Salary = 2914500.00

--4.	Write a query to get all employee details from the employee table order by first name, descending.
select * from Assignments order by First_Name desc

--5.   Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary5).
select First_Name,Last_Name ,salary ,salary*12 as PF from Assignments

--6.	Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
select Id, First_Name, Last_Name from Assignments order by Salary asc

--7.	Write a query to get the maximum and minimum salary from employees table.
select Max(salary) as Max_Salary ,Min(salary) as Min_Salary from Assignments

--Assignments HW:-

--1.	Write a query to calculate 171*214+625
select 171*214+625

--2.	Write a query to get the average salary and number of employees in the employees table
select Avg(salary) as AVG_Salary, count(*) as Employee from Assignments

--3.	Write a query to get the number of employees working with the company
select count(*) as Count_Employee from Assignments

--SELECT COUNT(DISTINCT job_id) AS num_jobs

select * from Assignments
