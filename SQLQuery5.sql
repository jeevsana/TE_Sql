use org;
--scalar
create function arearectangle(int @x int, @y int)
returns int
as 
begin
	return (@x * @y)
end

select dbo.arearectangle(6,12) as Result

--OUTPUT parameter-----------
create procedure sal(@ans int output)
as
begin
 select @ans= avg(salary) from Worker_W
end

--execute procedure
Declare @Avg_amt int
exec sal @Avg_amt output
Print @Avg_amt

select * from Worker_W

--Trigger to restrict DML access between 6:00PM to 10.00AM--------------

create trigger Trg_deny
on orders -- table name
FOR INSERT
as
begin
	print 'You cannot insert into the demo table'
	Rollback transaction 
end

alter trigger Trg_deny
on Orders
for insert,update, delete
as 
begin 
	if (DATEPART(HH , GETDATE()) > 24) or (DATEPART(HH , GETDATE()) < 10)
	begin
		print 'You cannot Order between 6:00PM to 10.00AM'
		Rollback transaction
	end
end 

select * from orders

delete from orders where order_no=70009
insert into orders values( 70009, 564.7, '2021-11-28', 3006, 5001)

--Server-scope trigger to restrict DDL access

create trigger trg_server_scope
on All Server
for Create_table, Alter_table, Drop_table
as
begin
	print 'You cannot perform DDL operation in any of the database'
	rollback transaction
end

create table demo1
(
TID int,
Salary int
)

create database APP_1
use APP_1
create table demo1
(
TID int,
Salary int
)

drop database APP_1

--Working of explicit transaction with Save transaction

insert into demo1 values(105, '100000')
insert into demo1 values(106, '2344500')
insert into demo1 values(107, '890822')
select * from demo1

begin transaction
	update demo1 set Salary='890000' where TID=107
	insert into demo1 values(108, '120000')
	save transaction upd
	insert into demo1 values(109, '900000')
	rollback transaction upd
commit transaction

delete from demo1 where TID=107 
delete from demo1 where TID=108 

--Difference between throw and Raiserror in exception handling
create database Proc_exp_hand
use Proc_exp_hand

create 
alter procedure Proc_exp_hand
@a int
as
begin 
	declare @cube  int	
	begin try
			begin 
				if(@a<0)
				--Raiserror('If we u calculate the cube for -ve value u get negative ans. So, can you change number', 14,1)
				throw 50001, 'Answer is negative, Please change the number!!', 14;
				set @cube=power(@a,3)
				print 'Cube of given number is:' + cast(@cube as varchar)			
			end
	end try
	begin catch
			begin 
			print error_number()
			print error_message()
			print error_severity()
			print error_state()
			end
	end catch
end
	
exec Proc_exp_hand 4

exec Proc_exp_hand -1


CREATE TABLE t1(
    id int primary key
);
GO
BEGIN TRY
    INSERT INTO t1(id) VALUES(1);
    --  cause error
    INSERT INTO t1(id) VALUES(1);
END TRY
BEGIN CATCH
    PRINT('Raise the caught error again');
    THROW;
END CATCH