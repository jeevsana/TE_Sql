create database DFA_MVC
 
 use  DFA_MVC
  
  create table Trainee
  (
  TID int Primary Key,
  TName varchar(25),
  TAge int check(TAge>=22)
  )

  select * from Trainee