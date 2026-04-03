use Mydatabase;
select * from customers;
use salesdb;
show tables;
select * from customers;


select 

country,
score
from customers
where score>500;


select 

country,
score
from customers
where country='USA';

/* sorting 
*/

select * from customers
order by score DESC;

/* nested sorting */
/* Without nested sorting */
select *
from customers
order by country ASC;

/* With Nested Sorting */
Select *
from customers
order by country ASC,score Desc;
/* nesteed sorting will only work when the first sorting has duplicate values */

/* GROUPBY */
Select country, sum(score)
from customers
group by country;

select sum(score) as total_score,
count(customerid) as total_customers
from customers;

/* group by with filter */

select country, sum(score)
from customers
group by country
having sum(score)>890;

/* group by with filter inside a filter */

select country , avg(score) as score_average
from customers
where score!=0
group by country
having avg(score)>430;

/* Distinct */

select distinct
country
from customers;

/* TOP or LIMIT 
TOP function is only valid in Microsoft SQL */

select * from customers 
order by score asc LIMIT 2;


select *
from orders
;

select *
from orders
where orderstatus = 'Delivered'
order by orderdate DESC limit 2;

/* creating table */

create table persons(
	id int not null,
     person_name varchar(50) not null,
     birth_date date,
     phone varchar(50) not null,
     constraint pk_persons primary key (id)
     );
     
/* Alter table */

Alter table persons
add email varchar(50) not null;    

alter table persons
drop column phone;

/* Drop table */
drop table persons;

/* Insert */
insert into customers(customerid, firstname, lastname, country, score)
values
(7,'San','Lee','Japan',700);
     
     


create table persons(
	id int not null,
     person_name varchar(50) not null,
     birth_date date,
     phone varchar(50) not null,
     constraint pk_persons primary key (id)
     );

/* Inserting data from customers to persons */

select *
from customers;


         