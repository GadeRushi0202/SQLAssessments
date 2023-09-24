create table EmployeeInfo(
EmpID int primary key,
EmpFName varchar (50),
EmpLName varchar(50),
Department varchar(55),
Project varchar(10),
Address varchar(25),
DOB date ,
Gender varchar(30)
)

create table EmoloyeePostion(
EmpId int,
EmpPosition varchar (20),
DateOfJoining date,
Salary Numeric(12,2),
constraint FK_EmpId foreign key(EmpId) references EmployeeInfo (EmpId)
)

insert into EmployeeInfo(EmpID,EmpFName,EmpLName,Department,Project,Address,DOB,Gender)values
(1,'Rohit','Gupta','Admin','P1','Delhi','12/02/1979','Male'),
(2,'Rahul','Mahajan','Admin','P2','Mumbai','10/10/1986','Male'),
(3,'Sonia','Banrjee','HR','P3','Pune','06/05/1983','FeMale'),
(4,'Ankita','Kapoor','HR','P4','Channai','11/28/1983','FeMale'),
(5,'Swati','Grag','HR','P5','Delhi','04/06/1991','FeMale')

insert into EmoloyeePostion (EmpId,EmpPosition,DateOfJoining,Salary)values
(1,'Exective','04/01/2020',75000),
(2,'Manager','04/03/2020',500000),
(3,'Manager','04/02/2020',150000),
(2,'Officer','04/02/2020',90000),
(1,'Manager','04/03/2020',300000)

select * from EmployeeInfo
select * from EmoloyeePostion

--1. Create a query to generate the first records from the EmployeeInfo table.
select top 1 * from EmployeeInfo
select top 1 * from EmployeeInfo order by EmpID
--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1 * from EmployeeInfo order by EmpID desc
--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select *from EmoloyeePostion order by salary  desc offset 2 rows fetch next 1 row only
---Or
select e1.*,p1.salary
from EmployeeInfo e1
inner join EmoloyeePostion p1 on p1.EmpId=e1.EmpID
order by p1.salary desc
offset 2 row
fetch next 1 row only
--4. Write a query to find duplicate records from a table.
select EmpPosition ,count(EmpId) from EmoloyeePostion group by EmpPosition having count(EmpId)>1

select e1.EmpID,count(p1.EmpId) as 'Count'
from EmployeeInfo e1
inner join EmoloyeePostion p1 on p1.EmpId=e1.EmpID
group by p1.EmpId
having count(p1.empid) > 1
--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select EmpPosition , sum(Salary)from EmoloyeePostion group by EmpPosition
--6. find the employee who has max salary
select max(salary)as Max_Salary from EmoloyeePostion

select top 1 e1.* ,p1.salary from EmployeeInfo e1
inner join EmoloyeePostion p1 on p1.EmpId=e1.EmpID
order by p1.Salary desc
--7 find the employee who has max salary from HR department
select top 1 e1.* ,p1.salary from EmployeeInfo e1
inner join EmoloyeePostion p1 on p1.EmpId=e1.EmpID
where e1.Department='Admin'
order by p1.Salary desc
--8 find the age of each employee
select *,year(cast(getdate()as date))- year(cast(dob as date)) as 'age' from EmployeeInfo
--9 display only female employee details
select * from EmployeeInfo where Gender='Female'
--10 display employee whos position is executive
select top 1 e1.* ,p1.EmpPosition,p1.salary from EmployeeInfo e1
inner join EmoloyeePostion p1 on p1.EmpId=e1.EmpID
where p1.EmpPosition='exective'
--11 display count of employee in each city
select Address ,count(empid) as 'count' from EmployeeInfo
group by Address