/* Filtering data */

/* 
####################################################################################################
Comparison Operator */

use salesdb;

/* equal = */

select *
from customers
where country = 'Germany';

/*not equal != */

select *
from customers
where country !='Germany';

/*greater > */

select *
from customers
where score > 500;

/* Lesser < */

select *
from customers
where score <500;

/*greater than qual >= */

select *
from customers
where score >= 500;

/* 
###################################################################################################
Logical Operator */


/* AND */

select *
from customers
where country='USA' and  score =750 and firstname='Mary';

/* OR */

select *
from customers
where score=500 and country='Germany' or score= '400' and country='Germany';


/* NOT */

Select *
from customers
where not score  = 500;

/* 
####################################################################################################
Range Operator */

/* BETWEEN */

select *
from customers
where score between 100 and 500;


select *
from customers
where score >=100 and score <=500;


/* 
####################################################################################################
Membership Operator */

/* IN
Not IN
 */

select *
from customers
where country= 'Germany' or country = 'USA';

select *
from customers
where country in ('Germany', 'USA');

select *
from customers
where firstname not in ('Kevin');


/* 
####################################################################################################
Search Operator */

/* LIKE */

/*find all customers whose first name starts with 'm' */
select *
from customers
where firstname like 'M%';  /* firstname starts with 'M' */

/*find all customers whose first name contains an 'r' */

select *
from customers
where firstname like '%r%';

/*find all customers whose first name contains an 'r' in the thrid position */

select *
from customers
where firstname like '__r%';


/* 
####################################################################################################
SQL Join */

/* Inner Join */

select 
	customers.customerid,
	customers.firstname,
	orders.orderid,
	orders.orderstatus
from customers
inner join orders
	on customers.customerid= orders.customerid
		order by orderid asc ;
          
          
/* Left Join */

/* Get all the customers along with their orders including those without orders */


select 
	c.customerid,
	c.firstname,
	o.orderid,
	o.orderstatus
from customers as c
left join orders as o
	on c.customerid= o.customerid;
     
select * from customers;
select * from orders;


/* Right Join */
/* Get all customers along with their orders, including orders without matching customers */

select 
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
from customers as c
right join orders as o
	on c.customerid=o.customerid;
 
 
 /* full Join */

select 
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
from customers as c
Full join orders as o
	on c.customerid=o.customerid;