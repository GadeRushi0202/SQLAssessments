create table Patients(
Patient_ID int primary key,
First_Name varchar(30),
Last_Name varchar(30),
Gender varchar (10),
Birth_Date Date,
City varchar(30),
Province_ID Varchar(50),
Allergies varchar(90),
Height decimal(3,0),
Wight decimal(4,0),
Constraint FK_PN foreign key(Province_ID) references Province_Names(Province_ID)
)

create table Province_Names(
Province_ID Varchar (50) primary key,
Province_Name varchar(30)
)

create table Doctors (
Docter_Id int primary key,
First_Name varchar(30),
Last_Name varchar(30),
Specialty varchar(60)
)

create table Admissions(
Patient_ID int,
Admission_Date Date,
Discharge_Date Date ,
Diagnosis Varchar(80),
Attenting_Docter_Id int,
Constraint FK_P foreign key (Patient_ID) references Patients(Patient_ID),
Constraint FK_D foreign key (Attenting_Docter_Id) references Doctors(Docter_Id)
)

insert into Patients(Patient_ID,First_Name,Last_Name,Gender,Birth_Date,City,Province_ID,Allergies,Height,Wight) values
(101,'Rahul','Sharma','Male','1980/01/01','Mumbai','MH','Asthma and eczema',174.5,75.5),
(102,'Rajesh','Patel','Male','1985/08/22 ','Ahmedabad','Gj','None',165.5,55.5),
(103,'Ram','Sharma','Male','1990/07/23 ','Delhi','DL','Shellfish',150.5,65.5),
(104,'Geeta','Rao','Female','1993/04/04','Bangalore','KA','Shellfish',150.5,65.5),
(105,'Shreya','Joshi','Female','1996/02/25 ','Goa ','Go','None',150,60.5)



insert into Doctors(Docter_Id,First_Name,Last_Name,Specialty)values
(201,'Sandip','Gade','Cardiologist'),
(202,'Vijay','Gade','Eye'),
(203,'Raj','Verma','Dentist'),
(204,'Neha','Patel','Pediatrician'),
(205,'Priya','Singh','Dermatologist')

insert into Province_Names(Province_ID,Province_Name)values
('Mh','Maharashtra'),('Gj','Ahmedabad'),('DL','Delhi'),('KA','Bangalore'),('Go','Maharashtra')

insert into Admissions(Patient_ID,Admission_Date,Discharge_Date,Diagnosis,Attenting_Docter_Id)Values
(101,'2023/01/10','2023/01/20','Fractured Arm ',201),
(102,'2023/02/05','2023/02/15','Eye Infection ',202),
(103,'2023/03/20','2023/03/25','Tooth Extraction ',203),
(104,'2023/04/12','2023/04/12' ,'Fractured Arm ',204),
(105,'2023/05/15','2023/05/28','Eye Infection',205)

select * from Doctors
select * from Patients
select * from Admissions
select * from Province_Names

--1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select First_name ,Last_Name,Gender from Patients where Gender='Male'
--2.	Show the first name & last name of patients who does not have any allergies
select First_Name ,Last_Name from Patients where Allergies='None'
--3.	Show the patients details that start with letter ‘C’
select * from Patients where First_Name like 'R%'
--4.	Show the patients details that height range 100 to 200
select * from Patients where Height between 150 and 160
--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update Patients set Allergies ='NKA' where Allergies='None'
--6.	Show how many patients have birth year is 2020
select * from Patients where year(Birth_Date)=1980
--7.	Show the patients details who have greatest height
SELECT top 1*FROM patients ORDER BY Height desc
--8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select count(*) as 'Count' from Patients where Gender='Male'
select count(*) as 'Count' from Patients where Gender='FeMale'
--9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select  First_name,Last_Name ,Allergies from Patients where Allergies in('Shellfish','NKA') order by First_name,Last_Name asc
--10.	Show first_name, last_name, and the total number of admissions attended for each doctor.Every admission has been attended by a doctor.
select d.first_name,d.last_name,COUNT(a.Attenting_Docter_Id) AS Doctors
from doctors d JOIN admissions a ON d.Docter_Id = a.Attenting_Docter_Id
group by d.first_name, d.last_name

--11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select CONCAT(p.first_name, ' ', p.last_name) AS patient_name, a.Diagnosis, CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
from admissions a join patients p ON a.patient_id = p.Patient_ID JOIN doctors d ON a.Patient_ID = d.Docter_Id
