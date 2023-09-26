use DP6Titans
create table Model(
Model_Id int primary key,
Model_Name varchar(50),
Cost int
)
drop table Model
create table Customer(
Cust_Id int primary key,
First_Name varchar (25),
Last_Name varchar(25),
Mobile_no varchar(25),
Gender varchar (10),
Email varchar (30) unique
)

create table Purchase(
Purchase_Id int,
Cust_Id int,
Model_Id int,
booking_Amount int,
Payment_Id int primary key ,
Purchase_Date date,
Rating_Id int,
constraint FK_Cust foreign key(Cust_Id) references Customer(Cust_Id),
constraint FK_Model foreign key(Model_Id) references Model(Model_Id),
constraint FK_Fr foreign key(Rating_Id)references FeedBack_Rating(Rating_Id)
)

Create table Payment_Mode(
Payment_Id int,
Paymen_Type varchar(40),
constraint FK_Purchase foreign key(Payment_Id) references Purchase(Payment_Id)
)

create table FeedBack_Rating(
Rating_Id int primary key,
Rating varchar(15)
)

insert into Model(Model_Id,Model_Name,Cost)values
(101,'KTM',125000),
(102,'Suzuki',75000),
(103,'Yamaha',95000),
(104,'TVS',85000),
(105,'Honda',65000),
(106,'Activa',99000)

insert into Customer(Cust_Id,First_Name,Last_Name,Mobile_no,Gender,Email) values
(201,'Rushi','Gade','7447307393','Male','Rushi@123'),
(202,'Rajesh','Gade','9527256519','Male','Rajesh@123'),
(203,'Vishal','Gade','7378764545','Male','Vishal@123'),
(204,'Pratiksha','Gade','9322897721','Female','Pratiksha@123'),
(205,'Rutu','Gade','8261814226','Female','Rutu@gmail.com'),
(206,'shumbham','Desai','992395984','Male','Shubham@123')

insert into Purchase(Purchase_Id,Cust_Id,Model_Id,booking_Amount,Payment_Id,Purchase_Date,Rating_Id)Values
(301,201,101,25000,401,'02/08/2023',1),
(302,202,102,35000,402,'03/09/2022',2),
(303,203,103,15000,403,'09/01/2023',3),
(304,204,104,17000,404,'10/08/2023',4),
(305,205,105,45000,405,'12/02/2023',5)
(306,206,106,50000,406,'07/09/2023',2)

insert into Payment_Mode(Payment_Id,Paymen_Type)values
(401,'online'),(402,'Cash'),(403,'Cheque'),(404,'online'),(405,'Cash'),(406,'Cheque')

insert into FeedBack_Rating(Rating_Id,Rating)values
(1,'Complaint'),(2,'Bad'),(3,'Average'),(4,'Good'),(5,'Excellent'),(2,'Bad')


select * from model
select * from Customer
select * from Purchase
select * from Payment_Mode
select * from FeedBack_Rating


--1.	WAQ to get the balance amount for customers who made cash 
 select (m.cost-p.booking_amount) as 'balance' from model m inner join purchase p on m.model_Id=p.model_id 
 inner join customer c on c.cust_id=p.Cust_id
 inner join Payment_mode pt on pt.payment_id=p.payment_id where pt.paymen_type='cash'
 --2.Delete all the records of customer who have paid complete amount as that of bike cost.
 delete from customer where cust_id in (select c.cust_id from customer c inner join purchase p on p.cust_Id=c.cust_id 
 inner join model m on p.model_id=m.model_id where (m.cost-p.booking_amount)=0)
 --3.	Create an index to have faster retrival of data on the basis of booking_amount.
 create unique index index_at on purchase(booking_amount)
 select * from purchase
 --4.WAQ to change payment mode to cash for ‘yamaha YZF’ purchased by customer with id 101. 
 update purchase set payment_id=22 where purchase_id=(select p.purchase_id from purchase p inner join model m on m.model_id=p.model_id where model_name='yamaha YZF' and cust_id=101)
 --5.Map where key is modelName and value is arraylist of ids of customers who purchased that model.
 --6.Create a stored procedure to get the full name of customer whose cust_id is provided as input.
 --7.WAQ to get the number of complaints registered for model activa.
 SELECT COUNT(*) AS num_complaints
FROM Purchase
INNER JOIN FeedBack_Rating ON Purchase.Rating_Id = FeedBack_Rating.Rating_Id
WHERE FeedBack_Rating.Rating = 'Complaint'
AND Model_Id = 106
 --8.WAQ to get all customer names who haven’t given ratings yet
 select c.* from customer c inner join purchase p on p.cust_id=c.cust_id where p.rating_id = null 
 --9.Delete all complaint records from purchase. 
 delete from  purchase where rating_id=1
 --10.Update ratings given by Mr Vaibhav from good to excellent.
 update purchase set rating_id=5 where cust_id=(select cust_id from customer where first_name='Rushi')
 --11.Reduce cost of all bikes for which rating is bad by 10%. 
 update model set cost=(cost-(cost*0.1)) where model_id=
 (select p.model_id from purchase p inner join Feedback_rating f on f.rating_id=p.rating_id where f.rating='bad')
 --12.Write a to display highest selling model along with name and count 
 select top 1 m.model_Id,m.model_name,count(p.cust_id) as 'count' from purchase p 
 inner join model m on m.model_Id=p.model_id group by m.model_id,m.Model_name order by count(p.cust_id) desc
 