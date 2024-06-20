-- audit table creation
Create table auditTable
(Table_Name varchar(30), Modified_Date varchar(30), Audit_Action varchar(30))

-- view audit Table
select * from auditTable;

-- delete trigger creation (audit)
create trigger audit 
after delete on Persons
for each row
insert into auditTable
( Table_Name, Modified_Date, Audit_Action)
values
('Persons',CURRENT_TIMESTAMP(),'Delete');

-- drop trigger audit
drop trigger audit;

-- view persons
select * from persons;

-- disabling  safe mode
SET SQL_SAFE_UPDATES = 0;

-- Delete a person 
delete from Persons where PersonID ='104';

-- insert trigger audit1
create trigger audit1 
after insert on Persons
for each row
insert into auditTable
( Table_Name, Modified_Date, Audit_Action)
values
('Persons',CURRENT_TIMESTAMP(),'Insert');

-- inserting a row 
insert into persons
values('104','Ibrahim','aron','carvan','mumbai');


-- update trigger audit2
create trigger audit2 
after update on Persons
for each row
insert into auditTable
( Table_Name, Modified_Date, Audit_Action)
values
('Persons',CURRENT_TIMESTAMP(),'Update');

-- Updating a row
update persons
set LastName='Thomas',FirstName='Mathew'
where PersonID='104';


