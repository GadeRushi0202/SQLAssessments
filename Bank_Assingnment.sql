create table Bank1 (
Bank_Id int primary key,
Name varchar(40),
Address Varchar (45),
City varchar(35),
State varchar(60)
)

create table Customer_Master(
Cust_Id int primary key,
cnmae  varchar(40),
contact varchar(30),
Age int,
Pan_no varchar(45)
)

create table Customer1 (
Cust_Id int,
Bank_Id int,
constraint FK_C foreign key (Bank_Id) references Bank1(Bank_Id),
constraint FK_CM foreign key (Cust_Id) references Customer_Master(Cust_Id)
)

create table AccountType(
AccType_Id int primary key,
AccType varchar(45)
)

create table Accounts(
Acc_No int primary key ,
Cust_Id int,
AccType_Id int,
Balance numeric (12,2)
constraint FK_A foreign key (Cust_Id) references Customer_Master(Cust_ID),
constraint KF_AA foreign key(AccType_Id) references AccountType(AccType_Id)
)

create table Trasaction (
Transaction_Id int primary key,
Acc_No int,
Amount numeric(12,2),
Transaction_Type varchar(25)
constraint FK_T foreign key(Acc_No) references Accounts(Acc_No)
)


select * from Bank1
select * from Customer1
select * from Accounts
select * from AccountType
select * from Trasaction
select * from Customer_Master


insert into Bank1(Bank_Id,Name,Address,City,State)Values
(101,'SBI','Karve Nager','Pune','Maharashtra'),
(102,'ICICI','Savedi','Nagar','Maharashtra'),
(103,'ICICI','Savedi','Nagar','Maharashtra'),
(104,'SBI','Savedi','Nagar','Maharashtra'),
(105,'Bank of Baroda','Kada','Beed','Maharashtra'),
(106,'Bank Of India','Matapur','Shrirampur','Maharashtra'),
(107,'Bank Of India','Matapur','Dhule','Maharashtra'),
(108,'SBI','Karve Nager','Pune','Maharashtra'),
(109,'Bank of Baroda','Kada','Beed','Maharashtra'),
(110,'Axis Bank','Vinayk Nagar','Surat','Gujrat')

insert into Customer1(Cust_Id,Bank_Id)values
(201,101),(202,102),(203,103),(204,104),(205,105),(206,106),(207,107),(208,108),(209,109),(210,110)

insert into AccountType(AccType_Id,AccType)values
(301,'Savings account'),(302,'Salary account'),
(303,'Current Bank Account'),(304,'Fixed Deposit Account.'),
(305,'Savings account'),(306,'Salary account'),
(307,'Current Bank Account'),(308,'Fixed Deposit Account.'),
(309,'Savings account'),(310,'Salary account')

insert into Accounts(Acc_No,Cust_Id,AccType_Id,Balance)values
(401,201,301,145500),(402,202,302,155500),(403,203,303,245500),
(404,204,304,345500),(405,205,305,45500),(406,206,306,55500),
(407,207,307,35500),(408,208,308,45500),(409,209,309,65500),(410,210,310,545500)

insert into Trasaction(Transaction_Id,Acc_No,Amount,Transaction_Type)values
(501,401,5000,'debit'),(502,402,6000,'credit'),(503,403,7000,'debit'),(504,404,5000,'debit'),(505,405,9000,'credit'),
(506,406,15000,'credit'),(507,407,4000,'debit'),(508,408,25000,'credit'),(509,409,3000,'credit'),(510,410,10000,'debit')


insert into Customer_Master(Cust_Id,cnmae,contact,Age,Pan_no)values
(201,'Rushi','7447307393',23,'PRG0202B'),(202,'Rajesh','9527256519',27,'RG2802MN'),
(203,'Vishal','7378764545',26,'VAG11052A'),(204,'Pratiksha','8856259836',21,'PKG2508R'),
(205,'Rutu','8297324563',20,'RKG0202R'),(206,'Dhanajay','9989695930',24,'DR1910D'),
(207,'Kunal','7896354896',23,'KSC0202B'),(208,'Suraj','9887307393',23,'SP0202B'),
(209,'Shubham','9923959843',23,'SND0202B'),(210,'Shubham','7897307393',20,'SKG0202B')

--1.	Find the no of accounts in saving account
select count(*) from AccountType where AccType='Savings account'
--2.	Display all bank name, cname , city from all  bank in ascending order of bankname  and desceding order of city name
select b.name,c.cnmae,b.City from Bank1 b inner join Customer1 cust on cust.bank_id = b.bank_Id 
inner join customer_Master c on c.cust_id=cust.cust_id
--3.	Find the customer who has perform maximum number of transaction
select * from customer_master where cust_id=(select cust_id from accounts where acc_no =(select top 1 acc_no from Trasaction group by acc_no order by count(transaction_id) desc))
--4.	find the customers whose  balance is greater than avg balance of saving accounts.
 select * from customer_master where cust_id in(select cust_id from accounts where balance>(select avg(balance) from accounts where acctype_id in (select acctype_id from AccountType where acctype='savings Account')))
--5.	find the amount , name of customer whose acc_no is 401
select t.amount ,a.cust_id,c.cnmae from Trasaction t 
inner join Accounts a  on t.Acc_No=a.Acc_No
inner join Customer_Master c on c.Cust_Id=a.Cust_Id where t.Acc_No=401
--6.	display the customer name ,contact of customers whose account type is saving’ order by descending order of cname .
 select cnmae,contact from customer_master where cust_Id in (select a.cust_id from accounts a inner join AccountType ac on ac.acctype_id=a.Acctype_id where ac.acctype='savings Account')order by cnmae desc
--7.	display bank name , total balance of all customers in that bank of all banks in descending order of balance.
 select b.name,sum(a.balance) as 'balance of bank' from bank1 b inner join customer1 c on c.bank_id=b.bank_Id 
 inner join Accounts a on a.cust_id=c.cust_Id 
 group by b.name order by 'balance of bank'desc

select * from Bank1
select * from Customer1
select * from Accounts
select * from AccountType
select * from Trasaction
select * from Customer_Master