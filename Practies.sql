create database college1
use college1

create table student (
Roll_No int primary key,
Name varchar(50),
Marks int not null ,
Grade varchar(10),
City varchar(25)
--branch  varchar (50) default('Kothrud')
--balance int,
--constraint chk_bal check (balance >0)
)


--insert  -->it is used to add new records in the table
insert into student (Roll_No,Name,Marks,Grade,City)
values
(101,'anil',78,'C','Pune'),
(102,'Bhumika',93,'A','Mumbai'),
(103,'Chetan',85,'B','Mumbai'),
(104,'Dhruv',96,'A','Delhi'),
(105,'emanuse',12,'F','Delhi'),
(106,'Farah',82,'B','Delhi')
--select used to select any data from the datbase
select * from student
select Name ,Marks,City from student
select city from Student
--drop table student

--Distinct --> unique (not shoew duplicate value)
select Distinct city from student

--Where clause ---> To define some condition
select * from student where marks > 80
select Name,Marks From student where marks >80
select * from student where city = 'Delhi'
select * from student where marks > 80 And city ='Delhi'

--Arithmatic operators
select * from student where marks +10 > 100
select * from student where marks > 90

--And ---> To check for both condition to be true
select * from student where marks >90 and city ='delhi'

--Or -->To check for one of the condition to be true
select * from student where marks >90 or city ='delhi'

--Between -->select for a given range
select * from student where marks between 80 and 90

--In --> Matches any values in the list
select * from student where city in('Mumbai','Pune')

--Not ---> To negate the given condition
select * from student where city not in('Mumbai','Delhi')

--check -->  check used to apply certain condition , if condition is true then data can be inserted in to the table
alter table Student add Age int
alter table Student add constraint Ch_age check(age>=18)

--Default -->  

--using alter coomand Default   set default lacation of branch is kothrud  
alter table student add constraint de_branch default 'Kothrud' for city
--to remove the constraint
alter table student drop constraint de_branch


--create index constraint 
--cluster index
create unique index in_emp on Student (Roll_No)
--non cluster index
create index in_emp2 on Student (Name,City)


--Limit clause -->sets an upper limit on number of(tuples) rows to be retruned

-->       primary key

--create  table Dept(
--did int,
--dname varchar(40),
--constraint pk_dept primary key(did)
--)

-->    Foreign Key

--create table Emp (
--id int ,
--name varchar(20),
--did int,
--constraint pk_emp  primary key(id),
--constraint fk_emp_dept foreign key (did) references Dept(did)
--)

--using alter command
--alter table Emp add constraint fk_emp_dept foreign key (did) references ept(did)



----------------------------------------------------------------------------

create table  Employee(
Id int primary key,
Name Varchar (50) not null,
Email varchar(40) unique,
Age int check(age>=18),
salary numeric(12,2)
)
select * from Employee

--DML -- Insert
--Insert --> it is used to add new record in the table
insert into Employee values(1,'Rushi','Rushi@gmail.com',23,45000)
insert into Employee values(2,'Rajesh','Rajeshi@gmail.com',27,55000)
insert into Employee values(3,'Vishal','Vishal@gmail.com',26,65000)
insert into Employee values(4,'Pratiksha','Pratiksha@gmail.com',20,75000)
insert into Employee values(5,'Rutu','Rutu@gmail.com',19,35000)
insert into Employee values(6,'Dhanajay','Dhanajay@gmail.com',24,85000)
insert into Employee values(7,'Kunal','Kunal@gmail.com',23,75000)
insert into Employee values(8,'Suraj','Suraj@gmail.com',23,55000)
insert into Employee values(9,'Tejas','Tejas@gmail.com',24,36000)
insert into Employee values(10,'Shubham','Shubham@gmail.com',23,45000)
insert into Employee values(11,'Vinayk','Vinayk@gmail.com',25,35000)
insert into Employee values(12,'Pravin','Pravin@gmail.com',28,45000)
insert into Employee values(13,'Akshay','Akshay@gmail.com',24,55000)
insert into Employee values(14,'Vendash','Vendash@gmail.com',18,25000)
insert into Employee values(15,'Harsh','Harsh@gmail.com',27,15000)

--insert record in to specific columns
insert into Employee(id,name,Email,Age,salary)values(16,'Rushi','Rushi@gmail.com',18,45000)
--you can skip col which has default constarint

--upadte command--->it is used to modify the exsiting records
update Employee set salary=850000 where Id=3
update Employee set Email='Rishi@gmailcom',salary=950000,Age=24 where Id=1
alter table Employee add city  varchar(25)
--in --> multiple records
update Employee set city='Pune' where id in(1,6,7,8,11,12,13)
update Employee set city='Nagar' where id in(2,3,4,9)
update Employee set city='Kada' where id in(5,10,14,15)
update Employee set city='Pune' where id in(16)


--delete --> To remove data from the table
delete from Employee where id=16
delete from employee where city='Pune' 
delete from Employee where age<18
delete from Employee where id  in(1,3,5,9,15)

--select --> select command  as DQL command  -->To fetch data we use select
-- * --> indicates all columns
--select query is to fecth the data
select * from Employee
select Name, Email,City from Employee


--aliss to the columns & to the table --as-- as create the alies
--as-->Renames columns of expressions in query result
select Name as 'EMP_Name' ,Email as 'EMP-Email' from Employee
select emp.name as 'Emp name',emp.Email,emp.Salary from Employee emp
--display all Columns
select emp.*from Employee emp

--Select with where clause
--where clause check for match data

--Get the data whose id is 1
select * from Employee where id=1
--Get the data emp have city name as pune
select * from Employee where city='Pune'
select * from Employee where city='Beed'
select * from Employee where city='Kada'
select * from Employee where city='Nagar'
--fetch the data of emp whose age is <24
select * from Employee where age < 24
--fetch the data of emp whose age is < 24
select * from Employee where age >= 24
--<>--> Not equal to
select * from Employee where age <> 34
select * from Employee where age <> 34 and age<>23

--Distinct -->it is used to get unique records
select distinct city from Employee
select distinct Age from Employee

--And -->  all the condition should be true
        -- combine all the condition & fetch matched data
select * from  Employee where salary<= 45000 and city='Pune' and age<28

--OR -->either one is true
select * from Employee city where city='Pune'or city='Kada'

--Between and -->Range - when you want to fetch records between range
select * from Employee where salary between 18000and 95000
select * from Employee where age between 23 and 28

--in clause --> Match the multiple selection
select * from Employee where id in(1,2,3,4,5)
select * from Employee where age in (23,24,28,18)
select * from Employee where city in('Pune','Kada')
--not in clase --> Skip the data
select * from Employee where id not in(1,2,3,5,9,8)
select * from Employee where city not in ('Pune','Kada')

-----------------------------------------------------------------------------
create table Product(
Id int primary key,
Name varchar (30),
Price int,
company varchar(40)
)
insert into Product values(1,'Mobile',7500,'Redmi')
insert into Product values(2,'Mobile',85500,'Iphone')
insert into Product values(3,'Mobile',16000,'OPPO')
insert into Product values(4,'Mobile',25000,'OnePlus')
insert into Product values(5,'Mobile',17500,'Vivo')
insert into Product values(6,'Laptop',54000,'HP')
insert into Product values(7,'Laptop',45000,'DELL')
insert into Product values(8,'Laptop',65000,'ASUS')
insert into Product values(9,'Mobile',19500,'SAMSUNG')
insert into Product values(10,'Mobile',8500,'Redmi')

--1)Display all records
select * from Product
--2)Display products whose price is<10000
select * from Product where Price<10000
--3)Diplay records product whose company name is Redmi
select * from product where company ='Redmi'
--4)Display Products whose price is between 15000 to 40000
select * from Product where Price between 6000 and 40000
--5)Display  unique company name
select Distinct Company from Product
--6)Display products whose company is dell & hp
select * from product where Company in ('HP','Dell')

------------------------------------------------------------------------------
--Null= Black Field
--if any column having black field i.e null,can not check using operators
select * from Employee where city is null
--is not null--->whwn you want to skip null records in the statement
select * from Employee where city is not null
select * from Employee

--****************************************************************************
--Like clause in sql-->search term for varchar / string data type
--%-->is used for not know letters or count
---Search by Starting Latter--- start with R  end with any letter
select * from Employee where name like 'R%'
---Search by Ending Latter  --> end with H start with any letter
select * from Employee where name like '%H'
--start and end with any letter , name contains H
select * from Employee where name like '%H%'

select * from Employee where name like '[RH]%'
--Match with multiple letters i.er in or --name end with iR or H or a
select * from Employee where name like '%[RHa]'
select * from Employee where name like '%[RH]%'

--range [a-g] ,[h-z]
select *from Employee where name like'[R-z]%'

--underscore is used to define specific letters 
---match the exact count of letters 
select * from Employee where name like 'R____'
select * from Employee where name like '____I'
select * from Employee where name like '__S__'
--************************************************************************
--Order By -->To sort the data based on col specified
select *from Employee order by name
select *from Employee order by Age

select *from Employee order by name ASC
select *from Employee order by salary asc

select *from Employee order by name desc
select *from Employee order by salary desc

select *from Employee order by name, salary

--*************************************************************
--limiting the records in sql using top ,offset And fetch

--first 5 records
select top 5 * from Employee
-- last 5 records
select top 5 * from Employee order by id desc
--percentege
select top 50 percent * from Employee
select top 40 percent * from Employee
--ties-->match data based on columm that we specify in order by
select top 3 with ties * from Employee order by id
select top 3 with ties * from Employee order by salary

--Fetch --> select the records 
--offset --> to skip records
--order by caulse is must in the query

--display emp who have 3rd highest salary in the table
select * from Employee order by salary desc
offset 2 row
fetch next 1 row only
--display emp who have 5th highest salary in the table
select * from Employee order by salary desc
offset 4 row
fetch next 1 row only
--display emp who have 3rd ,4th highest salary in the table
select * from Employee order by salary desc
offset 2 row
fetch next 2 row only
--display emp who have 3rd lowest 
select * from Employee order by salary 
offset 2 row
fetch next 1 row only

--*************************************************************
--Aggregate Function in sql 
--Max salary
select max(salary) as 'max Salary' from Employee
select max(Age) as 'max Age' from Employee
--min Salaery
select min(salary) as 'min Salary' from Employee
select min(Age) as 'min Age' from Employee
--Avg Salary
select avg(salary) as 'Avg Salary' from Employee
--sum salary 
select sum(salary) as 'Sum Salary' from Employee
--count
select count(id) as 'total count ' from Employee
select count(distinct City) as 'total count ' from Employee
select count(distinct salary) as 'total count ' from Employee
select count(distinct Age) as 'total count ' from Employee
--find total count eith null records count(*)
select count(*) as 'total count ' from Employee
--------------------------------------------------------------------------------------
------------------------Join---------------------------------------------
select * from Employee
create table Dept(
did int primary key,
dname varchar (20)
)
insert into Dept(Did,Dname)values
(101,'HR'),(102,'Admin'),(103,'Development'),(104,'Testing'),(105,'Sales')
select * from Dept

alter table employee add did int
alter table employee add constraint pk_fk_dept_emp 
foreign key(did) references Dept(did)

update Employee set did=101 where id in (1,13)
update Employee set did=102 where id in (2,12)
update Employee set did=103 where id in (3,4,5,6,7)
update Employee set did=104 where id in (8,9)
update Employee set did=105 where id in (10,11)
-------Inner Join----------
--inner join-->join two or more tables based  on a comman column .
            -- inner join will display match data from both the tables
			--data will be displayed when there is a match data from the comman colum

select * from Dept
select * from Employee

select e.*,d.dname
from Employee e 
inner join Dept d on d.did= e.did


--Left join  ------
--Dispaly all records from records from left table And match from right table and unmatch data will be display as null
select e.*,d.dname
from Employee e 
left join Dept d on d.did= e.did

create table Users(
Userid int primary key,
UserName varchar(45),
email varchar(50)
)
create table Product1(
pid int primary key,
pname varchar(40),
price numeric(12,2)
)
create table Order1(
orderid int primary key,
pid int,
userid int,
quantity int,
constraint FK_P1 foreign key (pid) references Product1(pid),
constraint FK_U foreign key (userid) references Users (userid)
)
insert into Users(userid,userName,email)values
(101,'Rushi','Rushi@gmail.com'),(102,'Rajesh','Rajesh@gmail.com'),
(103,'Vishal','Vishal@gmail.com'),(104,'Shubham','Shubham@gmail.com'),
(105,'Dhanajay','Dhanajay@gmail.com')

insert into Product1 values(201,'Redmi Mobile',7500)
insert into Product1 values(202,'Iphone Mobile',85500)
insert into Product1 values(203,'OPPO Mobile',16000)
insert into Product1 values(204,'OnePlus Mobile',25000)
insert into Product1 values(205,'Vivo Mobile',17500)
insert into Product1 values(206,'HP Laptop',54000)
insert into Product1 values(207,'DELL Laptop',45000)
insert into Product1 values(208,'ASUS Laptop',65000)
insert into Product1 values(209,'SAMSUNG Mobile',19500)
insert into Product1 values(200,'Redmi Mobile',8500)

insert into Order1(orderid,pid,userid,quantity)values
(301,201,101,1),(302,202,102,1),(303,203,103,3),(304,204,104,2),
(305,205,105,1),(306,206,102,4),(307,204,103,3)
select * from Users
select * from Product1
select * from Order1

select o.orderid,o.pid,p.pname,p.price,u.UserName 
from order1 o
inner join Product1 p on p.pid=o.pid
inner join Users u on u.Userid=o.userid


select e.*,d.dname
from Employee e 
inner  join Dept d on d.did= e.did

select o.orderid,o.pid,o.quantity,p.pname,p.price
from Order1 o
inner join Product1 p  on p.pid=o.pid
--Right Join--
--in right join display all records from right table and matched data from left table , if data is not matched the diplay null
select e.*,d.dname
from Employee e 
right  join Dept d on d.did= e.did

select o.orderid,o.pid,o.quantity,p.pname,p.price
from Order1 o
right join Product1 p  on p.pid=o.pid

--left join
select e.*,d.dname
from Employee e 
left  join Dept d on d.did= e.did

select o.orderid,o.pid,o.quantity,p.pname,p.price
from Order1 o
left join Product1 p  on p.pid=o.pid

--outre join / full outer join /full join
-->All the records from both tables And unmached recorde will be displayed as null
select o.orderid,o.pid,o.quantity,p.pname,p.price
from Order1 o
Full join Product1 p  on p.pid=o.pid

select e.*,d.dname
from Employee e 
full  join Dept d on d.did= e.did 

--Cross Join / certesian product
-->
create table Color(
id int primary key,
cname varchar(25)
)
create table Size(
id int,
sname varchar(25)
constraint FK_S foreign key (id) references Color(id)
)
insert into Color(id,cname)values
(1,'red'),(2,'Blue'),(3,'green'),(4,'Black'),(5,'Pink')
insert into Size(id,sname)values
(1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'XXL')

select * from color cross join Size

--Self Join 
-->if we are join a table with itself is called self join

--1)Compare the salary of each emp And dispaly the name who has more salary then other emp
select e1.Name as'Eaen High',e2.Name as 'Earn Less',e1.salary,e2.salary
from Employee e1 , Employee e2 
where e1.salary < e2.salary
--2)Display emp nane and manager name

--Manager id
alter table employee add manager_id int
update Employee set manager_id =4 where id in(1,2,3)
update Employee set manager_id =8 where id in(5,6,7)
update Employee set manager_id =12 where id in(9,10,11)
update Employee set manager_id =15 where id in(13,14)

select e1.Name 'Employee',e2.Name as 'Manager'
from Employee e1,Employee e2
where e1.Manager_id =e2.Id

---------------------------------Group By-----------------------------
--group by clause is used to combine the result or result base summary of rows
--display count of emp in each dep
--summary of dept 
select did, count(id)as 'Count' from Employee
group by did

--display dept wise sum salary
select did,sum(salary) from employee
group by did
--display dept wise avg salary
select did,avg(salary) from employee
group by did
--Dispaly count of emp in each city
select city, count (city) as 'City_name'from Employee
group by city

select city, count (city) as 'City_name'from Employee
where city='pune'
group by city

select * from Order1
select * from Product1
--dispaly number of order placed by each customer
select pid, count(orderid) from Order1
group by pid
--find the total marks of each student
select sid, sum(marks) as 'Total' from Exam
group by sid

---------------important point by group by clause------------------
--you can only add column in the select satement ,which you have added in the grop by clause
--if you wnat to add any other column it must be with aggregate function


---------------------------Having Clause----------------------------
-->when you want to put condition with the aggregate function
--Dispaly count of emp in each city where count >2
select city, count (city) as 'City_name'from Employee
group by city
having count (id)>5

select pid, count(orderid) from Order1
group by pid
having count(orderid)>1


create table student2 (
sid int primary key,
sname varchar  (50),
coursename varchar(60),
fees int
)
insert into Student2(sid,sname,coursename,fees)values
(1,'Rushi','C#',5000),(2,'Rajesh','C#',5000),(3,'Vishal','C#',5000),
(4,'Pratiksha','Java',6000),(5,'Rutu','Java',6000),(6,'Suraj','Java',6000),
(7,'Dhanajay','C#',5000),(8,'Kunal','C#',5000),(9,'Tejas','C#',5000),
(10,'Sharad','C#',5000),(11,'Akshay','C#',5000),(12,'Arjun','C#',5000),
(13,'Parvin','C#',5000),(14,'Harsh','C#',5000),(15,'Shubham','C#',5000),
(16,'Vaibhav','C',4000),(17,'Ashu','C',4000),(18,'Umesh','C',4000)

select * from student2
--dispaly count of student with their course name
--dispaly count of student for c# course
--display course and count student but count of stud >10
--display sum of fees for each course 
select coursename ,count(sid),sum(fees) as 'sum_Fee' from student2
group by coursename
having count(sid)>10
--display count of stud in each course ,stud count less than 15 display in desc order
select coursename,count (sid) from student2 
group by coursename
having count(sid)<15 order by COUNT(sid) desc

--------------------------Built in function--------------------------
select * from Employee
--len -->to find the lenght 
select name,len(name)from Employee
--upper & lower
select UPPER (name)as'Employee_Name' ,LOWER(name) as 'Epployee_Name' from Employee
--substring-->to extract no of chars from given col
select email,SUBSTRING(email,0,5)as'Substring'from Employee

select TRIM(name) from Employee--remove leading and traling spaces
select LTRIM(name) from Employee--remove the space from left side
select RTRIM(name) from Employee--remove the space from Right side

--cast-->conversion from one data type to another dat type
select cast(salary as varchar(20))as 'String salary'from Employee

--year,month,day,-->extract the year or month or day from the date
select GETDATE()--retrun the system date and time
select cast (Getdate() as date)
select cast(getdate() as date)
select year (cast(getdate() as date))

--find the birth date year of each employee
--current year-age
select name ,age,year(cast(Getdate() as date))-age as 'Birth Year' from Employee

--concat --> conversion from one data type to another data type
select concat (name ,'->',email,'->',age)as 'Concat'from Employee
--Replace-->
select replace(name,'R','r') from employee
select replace(email,'@','#') from employee
------------------------------------------------------------------------------------------
--addition of 2 number using sql function
--scaler function
create function Addtion (@a int ,@b int)
returns int
as begin  
--declare variable in sql
declare @c int
--code to execute 
set @c=@a+@b
return @c
end

select dbo.Addtion(10,20)as'sum'

--dbo--->database object

--Scaler function 
create function GetaEmpName(@id int)
returns  varchar(50)
as begin 
return (select name from Employee where id=@id)
end

select dbo.GetaEmpName(1)as 'EmpName'

-- multi value function begin & end keyword not need to write

create function GetEmpByDept(@did int)
returns table
as
return (select * from Employee where did=@did)


select * from dbo.GetEmpByDept(103)


--create a function to accept the product price and give 10% discount and return the discount price
create function GetDiscount(@price int)
returns decimal
as begin
declare @disprice decimal
set @disprice = @price-(@price*0.10)
return @disprice
end
select dbo.GetDiscount(200)
select name, price, dbo.GetDiscount(price) as 'discount price' from Product


--Trigger-->Triggers are special type of SP in SQL server DB
         --Triggers are get executed automatically in response with some events(some query select , insert, update,delete)
         --Trigger internally stored data in the Table (Magic Tables)
create table EmployeeTrack(
id int primary key identity(1,1),
description varchar(255)
)
create trigger tr_Employee
on Employee after insert
as begin
declare @id int
declare @name varchar(20)
declare @email varchar(30)
select @id=id,@name=name,@email=email from inserted
insert into EmployeeTrack values ('New record with details '+CAST(@id as varchar)+'name'+@name+'email'+@email+'date'+cast(GETDATE()as varchar(20))+'added')
end
select * from Employee
select * from EmployeeTrack
insert into Employee values(16,'Gade','Gade@gmail.com',26,450000,102,15,'Pune')


Create trigger tr_Employee_delete
on Employee after delete
as begin
declare @id int
declare @name varchar(20)
declare @email varchar(30)
select @id=id,@name=name,@email=email from deleted
insert into EmployeeTrack values('record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' removed')
end
delete from Employee where id=16
select * from Employee
select * from tr_Employee_delete
---case Expression -->Case expressions are used in the sql to add certain conditions, based on condition you want to display true or false value
--syntax-->  
         -- Case
              -- When  conditio1  then ‘true statment1’
               --When  condition2 then ‘ true statement2’
               --Else ‘false stamtment’
         -- End

select * from Product1
select pname,price,
case
    when price>50000  then'Expensive'
	when price<50000 then 'Not Expensive'
	else 'Average'
end as 'remark'
from Product1

--emp salary between 40k to 90 -->high salry
--sal between 25k to 40k -->average
--sal <25k is low slary
select * from Employee
select Name, salary,
case  
    when salary>40000 and salary<90000 then 'High Salary'
	when salary>25000 and salary<40000 then 'Average'
	when salary <25000 then 'Low Salary'
	else 'No Salary'
end as 'remark'
from Employee

--home work-->work on union & union all 
           -->You need to combine the results from both the tables
--Rules-->1.No of columns in each select statement must be same
       -->2.Sequence must be same
       -->3.Data type must be same
--Select name,city,state from customer
--Union
--Select name,city,state from supplier

-->Union will fetch only unique records 


--Select name,city,state from customer
--Union all
--Select name,city,state from supplier

--Union all will fetch duplicate records also
create table custmoers(
Name varchar(50),
City Varchar(60),
State varchar(70)
)
insert into custmoers(Name,City,State) values
('Rushi','Pune','maharashtra'),('Suraj','Pune','maharashtra'),('Dhanajay','Pune','maharashtra'),
('pravin','Pune','maharashtra'),('kunal','Pune','maharashtra'),('Dhanajay','Pune','maharashtra'),
('Rushi','Pune','maharashtra'),('Vishal','Nagar','maharashtra'),('Rajesh','Nagar','maharashtra'),
('Rajesh','Nagar','maharashtra'),('Rajesh','Nagar','maharashtra'),('Pratiksha','Nagar','maharashtra'),
('Rutu','Latur','maharashtra'),('Harsh','Beed','maharashtra'),('vedansh','Beed','maharashtra')
create table Supplier(
Name varchar(50),
City Varchar(60),
State varchar(70)
)
insert into Supplier(Name,City,State) values
('Rushi','Pune','maharashtra'),('Shard','Pune','maharashtra'),('Akshay','Pune','maharashtra'),
('Arjun','Pune','maharashtra'),('Sandesh','Nevasa','maharashtra'),('Nilesh','Kada','maharashtra'),
('Ashutosh','Beed','maharashtra'),('Vishal','Nagar','maharashtra'),('Rajesh','Nagar','maharashtra'),
('Shubham','Beed','maharashtra'),('Sandip','Nagar','maharashtra'),('Vijay','Nagar','maharashtra'),
('Sudhir','Beed','maharashtra'),('Tushar','Beed','maharashtra'),('Gade','Beed','maharashtra')
select * from custmoers
select * from Supplier

Select name,city,state from custmoers
Union all
Select name,city,state from supplier

Select name,city,state from custmoers
Union 
Select name,city,state from supplier
