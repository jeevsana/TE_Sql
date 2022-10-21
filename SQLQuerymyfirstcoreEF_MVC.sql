create database MVC_EF
use MVC_EF

create table Employee
(
EID int  Primary Key IDENTITY(1,1),
EName varchar(25),
EAge int check(EAge>=22)
)

select * from Employee

set IDENTITY_INSERT Employee ON

drop table Employee

set IDENTITY_INSERT Employee OFF

