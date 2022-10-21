create database SE

create table Worker
(
Worker_ID int Primary Key,
First_Name char(25),
Last_Name char(25),
Salary int,
Joining_Date DateTime,
Department char(25)
)
 insert  into Worker values(01,'john','wilks',100000,'12-09-19 09.00.00','HR')
 select *from Worker;