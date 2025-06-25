# SQL Introduction

# Table Creation
create table customers (Id int,Name varchar(20),Age int,
Address varchar(60),Salary decimal(10,2));

# Inserting Values
insert into customers values(1,"Ram",29,"Ind",12000);

# Display Table contents
select * from customers;

insert into customers (Id,Name,Age,Address,Salary) values (2,"Rohit",37,"India",50000);

# Inserting Multiple values at a time
insert into customers values(18,"Virat",36,"India",59000),
(7,"Dhoni",43,"India",35500),
(10,"Sachin",52,"India",25000);

select * from customers;

# Selecting specific Columns
select Name from customers;
select Name,Age from customers;

# Describe the table
desc customers;

SET SQL_SAFE_UPDATES = 0;

# UPDATE table contents
update customers set id=45 WHERE name="Rohit";
select * from customers;

# ALTER command in MySQL is used to modify the structure of an existing table
-- ADD - new column
-- Drop - delete column
-- Modify - change the data type, increase size --- of an existing column

alter table customers add column Phone_num int;
select * from customers;

alter table customers modify Name varchar(30);
desc customers;

alter table customers drop phone_num;
select * from customers;

# Deletes the records from the table
delete from customers where Id=1;
select * from customers;

# Drop - Deletes an entire table
Drop table customers; 