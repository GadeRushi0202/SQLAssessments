create table customer4(
Cusr_id int primary key,
Cust_Name varchar(60),
City varchar(35),
Country Varchar(40),
Postel_Id int
)

create table Product4(
cusr_Id int,
Product_Name varchar(50),
comapany_Name varchar(35),
price int
constraint FK_P4 foreign key(cusr_Id) references Customer4(Cusr_Id)
)
insert into Product4(cusr_Id,Product_Name,comapany_Name,price)values
(1,'Mobile','Redmi',7500),(2,'Mobile','oppo',8500),(3,'Mobile','Vivo',15500),
(4,'Mobile','Iphone',75500),(5,'Mobile','Samsung',25500),(6,'Mobile','Pocco',6500),
(7,'Mobile','Relme',35500),(8,'Laptop','HP',55500),(9,'Laptop','Dell',50000),
(10,'laptop','Asus',95500),(11,'Laptop','Lava',3500),(12,'Laptop','Hp',6500)

insert into customer4 (Cusr_id,Cust_Name,City,Country,Postel_Id)Values
(1,'Rushi','Pune','India',411001),(2,'Rajesh','Nagar','India',414005),
(3,'Vishal','Nagar','India',414005),(4,'Dhanajay','Nagar','India',414005),
(5,'Kunal','Pune','India',411001),(6,'Suraj','Nagar','India',411001),
(7,'Akshay','Pune','India',414202),(8,'Sharad','Nagar','India',414005),
(9,'Arjun','London','England',515566),(10,'Sagar','Beed','India',414202),
(11,'Pravin','Berlin' ,'Germany',121110),(12,'Sachin','Berlin' ,'Germany',121110)

select * from customer4
select * from Product4

-----------------------------------Homework :--------------------------------


--1.	Write a statement that will select the City column from the Customers table
select city from customer4
--2.	Select all the different values from the Country column in the Customers table.
select distinct(city) from customer4
--3.	Select all records where the City column has the value "London
select * from customer4 where city='London'
--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customer4 where city not in('Berlin')
--5.	Select all records where the CustomerID column has the value 23.
select * from customer4 where Cusr_id =9
--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customer4 where  city ='Berlin' and Postel_Id =121110
--7.	Select all records where the City column has the value 'Berlin' or 'London'.
select * from customer4 where city='Berlin'or city='London'
--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select * from customer4 order by City asc
--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from customer4 order by City desc
--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customer4 order by Country ,city asc
--11.	Select all records from the Customers where the PostalCode column is empty.
select * from customer4 where Postel_Id is null
--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select * from customer4 where Postel_Id is not null
--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customer4 set City ='Beed' where Country='Bharat'

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM customer4 WHERE Country = 'England'
--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(price) from Product4
--16.	Use an SQL function to select the record with the highest value of the Price column.
select Max(price) from Product4
--17.	Use the correct function to return the number of records that have the Price value set to 20
select count(*) from Product4 where price=15500
--18.	Use an SQL function to calculate the average price of all products.
select avg(price) from Product4
--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) from Product4
--20.	Select all records where the value of the City column starts with the letter "P".
select * from customer4  where city like'P%'
--21.	Select all records where the value of the City column ends with the letter "R".
select * from customer4  where city like'%R'
--22.	Select all records where the value of the City column contains the letter "a".
select * from customer4  where city like'%a%'
--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customer4 where city like 'p_e'
--24.	Select all records where the value of the City column does NOT start with the letter "a".
select * from customer4 where city not like 'P%'
--25.	Select all records where the second letter of the City is an "a".
select * from customer4 where SUBSTRING(City, 2, 1) = 'a'
--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customer4  where city like'[pnb]%'
--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customer4 where City LIKE '[a-f]%'
--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customer4  where city not like'[pnb]%'
--29.	Use the IN operator to select all the records where the Country is either "india" or "germany".
select * from customer4 where Country in('india','germany')
--30.	Use the IN operator to select all the records where Country is NOT "England" and NOT "germany".
select * from customer4 where Country not in('England','germany')
--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Product4 where price between 7500 and 75000
--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Product4 where price not between 7500 and 75000
--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Mobile' and 'Laptop'.
select * from Product4 where Product_Name between  'Mobile' and 'Laptop'
--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select cusr_id,cust_name,City,Country,postel_id as 'Pno' from customer4
--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from customer4 as Consumers
--36.	List the number of customers in each country.
select country,count(cusr_Id)as 'Count_Country' from customer4 
group by Country
order by Count_Country desc
--37.	List the number of customers in each country, ordered by the country with the most customers first.
select country,count(cusr_Id)as 'Count Country' from customer4 
group by Country
--38.	Write the correct SQL statement to create a new database called testDB.
create database TestDB
--39.	Write the correct SQL statement to delete a database named testDB
drop database TestDB
--40.	Add a column of type DATE called Birthday in Persons table
alter table customer4 ADD Birthday DATE
--41.	Delete the column Birthday from the Persons table
alter table customer4 drop column Birthday