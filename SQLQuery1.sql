--create database - collection of tables
create  database TES

create table Dept
(
DID int Primary Key,
DName varchar(20) Unique Not Null,
)

create table Emply
(
EID int Primary Key,
EName varchar(20)  Not Null ,
EDesignation varchar(20) default 'Trainee',
EAge int check(EAge>22),
EDeptNo int references Dept(DID)
) 
--DML--
--Design--
insert into Dept values(100,'IT'),(101,'JSE'),(103,'Design'),(104,'Development'),(105,'Admin');
insert into Emply values(1,'June','JSE',23,101);
insert into Emply (EID,EName,EDesignation,EAge,EDeptNo)values(2,'sam','Development',23,102);
insert into Emply (EID,EName,EDesignation,EAge,EDeptNo)values(5,'ppp','Design',26,106);
insert into Emply values(6,'LMN','JSE',23,107);
insert into Emply values(7,'ABC','SW',24,108);
insert into Emply values(8,'PQR','JIT',27,109);
insert into Emply values(9,'JKL','TRAINEE',26,110);
--select--
select * from Dept;
select *from Emply;


update Emply set EID=4 where EName='July'; 
update Emply set EName='Jennie' where EID=5; 
update Emply set  EID=2 where EName='Jane';
update Emply set EID =3 where EName='July';
update Emply set EID=4 where EName='Jennie'; 
update Emply set EDeptNo=107 where EID=2; 

delete from Emply where EID=7;

select * from Dept;
select *from Emply;

select EName,EDesignation from Emply
select EName 'Name',EDesignation 'Designation' from Emply
select EName as 'Emp Name' ,EDesignation as 'Emp Designation' from Emply

select *from Emply;
delete from Emply where EID=2;
delete from Emply where EID=3;
delete from Emply where EID=4;

insert into Emply values(2,'LMN','JSE',23,107);
insert into Emply values(3,'ABC','SW',24,108);
insert into Emply values(4,'PQR','JIT',27,109);
insert into Emply values(5,'JKL','TRAINEE',26,110);
insert into Emply (EID,EName,EDesignation,EAge,EDeptNo)values(2,'sam','Development',23,102);
insert into Emply (EID,EName,EDesignation,EAge,EDeptNo)values(3,'ppp','Design',26,106);