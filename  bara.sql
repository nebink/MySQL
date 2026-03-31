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