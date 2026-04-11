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
 
 
 /* FULL JOIN (UNION) */

select 
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
from customers as c
left join orders as o
	on c.customerid=o.customerid
     
     union
     
select 
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
from customers as c
right join orders as o
	on c.customerid=o.customerid;
     
/* LEFT ANTI JOIN*/

/* get all the customer who haven't placed any order so far */

select
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
     from customers as c
     left join orders as o
	on  c.customerid= o.customerid
     where o.customerid is null;
     
/* similarly it works for RIGHT ANTI JOIN */

/* 
#################################################################################################### */
/* FULL ANTI JOIN*/

select
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
     from customers as c
     left join orders as o
	on  c.customerid= o.customerid
     where o.customerid is null
     
     union

select
	c.firstname,
     c.country,
     o.customerid,
     o.orderid
     from customers as c
     right join orders as o
	on  c.customerid= o.customerid
     where c.customerid is null;


/* Sample question: 
	get all the customers along with their orders, but only for customers
	who have palced an order (without using inner join)*/
 
 
 select *
 from customers as c
 left join orders as o
 on c.customerid = o.customerid
 where o.customerid is not null;
 
 /* CROSS JOIN*/
 
 Select *
 from customers as c
 cross join orders as o ;
 
 /* Cross join doesn't make any sense in this scenario with cutomer and orders table
 but it can be used to find combinationn in other scenarios*/
 
 /* 
#################################################################################################### */
 
 
 /* MULTIPLE JOIN*/
 
 /* Using salesdb , retrive the list of all orders, olong with the elated customer,
 product and employee details.
 for each order, display:
	order id
	customer name (firstname)
	product name
	sales amount 
	product price
     sales's persons name
 */
 
 
select 
	o.orderid,
	o.sales,
	c.firstname as customer_first_name,
     c.lastname as customer_last_name,
     p.product,
     p.price,
     e.firstname as employee_first_name,
     e.lastname as  employee_last_name
from orders as o

	left join customers as c 
	on c.customerid= o.customerid
		
          left join products as p
          on o.productid= p.productid
          
			left join employees as e
               on o.salespersonid= e.employeeid;