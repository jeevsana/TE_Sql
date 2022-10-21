create database TE_CORE_MVC

use  TE_CORE_MVC

create table Trainees
(
TID int Primary Key,
TName varchar(25),
TAge int check(TAge>=22)
)
select * from Trainees