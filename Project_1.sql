-- 1.Display all students older than 20, sorted by age descending.
select name,age from students
where age > 20
order by age  desc;

-- 2.Fetch distinct cities where students are enrolled.
select distinct city from students
where name is not null;

-- 3.List top 3 highest-paid employees.
select name,salary from employees
order by salary desc
limit 3;

-- 4.Show employees whose salary is between 40,000 and 90,000.
select name,salary from employees
where salary between 40000 and 90000
order by salary asc;

-- 5.Find employees from Sales or Marketing earning more than 50,000.
SELECT e.name , dept_name as d from department
join employees as e
WHERE (dept_name = 'Sales' OR dept_name = 'Marketing')
AND salary > 50000;

-- 6.Retrieve customers whose names start with ‘A’ and end with ‘a’.
select * from customers
where customer_name like 'A%' and customer_name like '%a';

-- 7.Find products not belonging to Electronics category.
select product_name from products
where not category = 'Electronics';

-- 8.Display employees who do not have a bonus.
select name from task_3.employees
where bonus = null;

-- 9.Fetch orders placed in the last 30 days.
select order_id,order_date from orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 10.Show students whose age is NOT between 18 and 22.
select name , age from students
where age not between 18 and 22;

-- 11.Use CASE to label employees as Junior, Mid, Senior based on salary.
select *,
case 
when salary >= 70000 then 'Senior'
when salary between 51000 and 70000 then 'mid'
when salary <= 50000 then 'Junior'
end as Position
from employees;

-- 12.Count how many students belong to each city.
select city,count(id) from students
group by city;

-- 13.List employees sorted by department then salary descending.
select e.name,e.salary,d.dept_name from department as d
join employees as e
on e.id = d.id
order by salary desc;

-- 14. Display first 5 records skipping the first 3.
Select * from employees
LIMIT 3, 5;

-- 15.Find customers whose email is NULL.
select * from customers
where email is null;

-- 16. Display full name of employees using CONCAT.
select concat(name,"-",Salary) as emp_name from employees;

-- 17. Convert all product names to uppercase.
select upper(product_name) as Name from products;

-- 18. Find length of each customer name.
select customer_name,length(customer_name) as COUNT from customers;

-- 19. Extract first 4 letters of product name.
select product_name, left(product_name,4) from products;

-- 20. Replace word “Phone” with “Mobile” in product names.
select replace(product_name,'Phone','Mobile') as Upadte_name from products;

-- 21. Trim spaces from customer names.
select trim(customer_name) as Customer_name from customers;

-- 22. Display employee name as emp_name and salary as income.
select name as emp_name ,salary as income from employees;

-- 23. Show product name and category combined as one column.
select concat(product_name,'-',category) as Name from products;

-- 24. Convert city names to lowercase.
select lower(city) as city from students;

-- 25. Display first name and last name separately from full name.
SELECT
substring_index(customer_name, ' ', 1) AS first_name,
substring_index(customer_name, ' ', -1) AS last_name
FROM customers;

-- 26. Display employee name with department name.
select e.name,dept_name from employees as e
join department as d
on e.dept_id = d.id;

-- 27. Show all employees even if they don’t belong to any department.
select e.id,e.name,e.dept_id,d.dept_name from employees as e
left join department as d
on e.dept_id = d.id;

-- 28. Find departments with no employees.
select e.id,e.name,d.dept_name from employees as e
left join department as d
on e.dept_id = d.id
where e.id is null
limit 1;

-- 29. Display employee and their manager name (SELF JOIN).
select e.name as employee_name,o.name as man_name from employees as e
left join employees as o
on e.manager_id = o.id;

-- 30. List all customers with their order amounts.
select c.id,c.customer_name,sum(o.order_amount) as Amounts from customers as c
join orders as o
on c.id = o.customer_id
group by c.id,c.customer_name;

-- 31. Show customers who never placed an order.
select c.customer_name,c.id,o.order_id,o.order_amount from customers as c
left join orders as o
on c.id = o.customer_id
where o.order_id is null;

-- 32. Find products that were never sold.
select p.id,p.product_name from products as p
left join order_items as o
on p.id = o.product_id
where o.product_id is null;

-- 33. Display total sales per product with product category.
select p.product_name,sum(p.price*o.quantity) as Sales from products as p
join order_items as o
on p.id = o.product_id
group by product_name;

-- 34. Show employees working in departments located in ‘Delhi’.
select e.name, d.dept_name,d.location from department as d
left join employees as e
on e.id = d.id
where d.location = 'delhi';

-- 35. Find orders along with customer name and city.
select c.customer_name,o.order_id,c.city from customers as c
join orders as o
on c.id = o.customer_id;

-- 36. Display employees earning more than their manager.
select e.name as employee_name,e.salary AS employee_salary,m.name AS manager_name,m.salary AS manager_salary from employees as e
join employees as m
on e.manager_id = m.id
WHERE e.salary > m.salary;

-- 37. Show each department’s total salary expense.
select d.dept_name,sum(s.sales_amount) as Salary from department as d
left join sales as s
on d.id = s.product_id
group by d.dept_name;

-- 38. List orders with product and customer details.
select o.order_id,c.customer_name,c.city,p.product_name,oi.quantity from orders o
join customers c 
on o.customer_id = c.id
join order_items as oi
on o.order_id = oi.order_id
join products as p 
on oi.product_id = p.id;
    
-- 39 Show employees who joined after their manager
select * from employees;

-- 40 Find departments having more than 3 employees
select d.dept_name,count(e.id) as Counts from employees as e
left join department as d
on e.dept_id = d.id
group by d.dept_name
having count(e.id) > 3;

--  SECTION 4: 

-- 41.	Find total number of employees
select count(ID) as Counts from employees;

-- 42.	Calculate average salary per department
select d.Dept_name,avg(e.Salary) as average_salary from employees as e
left join department as d
on e.dept_id = d.id
group by dept_name;

-- 43 Find max and min salary in each department
select d.dept_name,max(e.Salary) as Maximum,min(e.Salary) as Minimum from employees as e
left join department as d
on e.dept_id = d.id
group by dept_name;

-- 44 Count number of orders per customer
select o.customer_id as ID,c.customer_name as Name,count(o.order_id) as Orders from orders as o
left join customers as c
on o.customer_id = c.id
group by customer_id,customer_name;

-- 45 Find total sales amount per day
select sale_date,sum(sales_amount) as total_sales from sales
group by sale_date;

-- 46.	Display products with total quantity sold > 10
select p.id,p.product_name,sum(s.qty) as Quantity from products as p
left join sales as s
on p.id = s.product_id
group by p.id,product_name
having sum(s.qty) > 10;

-- 47.	Find departments with average salary above 60,000
select d.dept_name,avg(e.Salary) as avg_salary from employees as e
left join department as d
on e.dept_id = d.id
group by dept_name
having avg(e.Salary) > 60000;

-- 48 Show cities having more than 2 students
select city,count(*) as Count from students
group by city
having count(*) > 2;

-- 49 Find customers who placed more than 2 orders
select c.customer_name,count(o.order_id) as Orders from customers as c
left join orders as o
on c.id = o.customer_id
group by c.customer_name
having count(o.order_id) > 2;

-- 50 Display product category wise revenue
select p.category,sum(s.qty * sales_amount) as Revenue from products as p
left join sales as s
on p.id = s.product_id
group by category;

-- 51 Find employees whose salary is above department average
select * from employees as e
where Salary > (select avg(Salary) from employees
where dept_id = e.dept_id);

-- 52 Count how many employees earn bonus
select count(*) from employees
where Bonus is not null;

-- 53 Show highest paid employee per department
select dept_id, name, d.dept_name, salary from employees as e
left join department as d
on e.dept_id = d.id
where salary = (select max(salary) from employees
where dept_id = e.dept_id);

-- 55 Calculate total inventory value per category
select p.category,sum(s.qty * sales_amount) as Revenue from products as p
left join sales as s
on p.id = s.product_id
group by category;


--  SECTION 5: 
--  
--  56 Find employees earning more than company average salary
select Name, Salary from employees
where Salary > (select avg(Salary) from employees as e);

-- 57 List students scoring above class average
select * from students
where mark > (select avg(mark) from students);

-- 58 Find customers who placed at least one order
select distinct(c.id),c.customer_name,o.order_id from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is not null;

-- 59 Find customers who placed no orders
select c.* from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null;

-- 60 Display products priced higher than average price
Select * from products
where price > (select avg(price) from products);

-- 61 Find employee with second highest salary
select * from employees
order by salary desc
limit 1,1;

-- 62 Display departments with salary expense above average
select d.dept_name,avg(e.salary) as Avg_salary from employees as e
left join department as d
on e.dept_id = d.id
group by dept_name
having avg(e.salary) > 'e.salary' 
order by avg_salary desc;

-- 63. Find customers who ordered both Laptop and Mobile.
select c.id, c.customer_name
from customers as c
join orders as o
on c.id = o.customer_id
join order_items as i
on o.order_id = i.order_id
join products as p
on i.product_id = p.id
where p.product_name in ('Laptop', 'Mobile')
group by c.id, c.customer_name
having count(distinct p.product_name) = 2;


-- 64. Show employees whose salary equals department max salary.
select e.* from employees as e
where e.salary = (select max(salary) from employees
where dept_id = e.dept_id);

-- 65. Find products sold more than average quantity.
select p.product_name,sum(o.quantity) as total_quantity from order_items as o
join products as p
on p.id = o.product_id
group by product_name 
having sum(o.quantity) > (select avg(quantity) from order_items );

-- 66. Find latest order per customer.
Select * from orders as o
Where order_date = (select max(order_date) from orders
where customer_id = o.customer_id);

-- 67. Display employees working in departments with no bonus employees.
select e.name ,e.bonus, d.dept_name from department as d
join employees as e
on e.id = d.id
where bonus is null;

-- 68. Find customers who placed orders worth more than 10,000.
select c.customer_name,sum(o.order_amount) as Total_Salary from orders as o
join customers as c
on c.id = o.customer_id
group by customer_name
having sum(o.order_amount) > '10000';

-- 69. Show employees whose manager earns less than them.
select e.id,e.name,e.salary,m.name as manager_name,m.salary as manager_salary
from employees as e
join employees as m
on m.manager_id = e.id
where e.salary > m.salary;

-- 70. Find top 3 selling products using subquery.
select product_name, total_sales from (select p.product_name,SUM(s.sales_amount) as total_sales from products as p
join sales as s
on p.id = s.product_id
group by p.id, p.product_name) as t
order by total_sales desc
limit 3;

-- 71. Dense rank employees within each department.
select id,salary,bonus, 
dense_rank() over(order by id) as dense
from employees;

-- 72. Show running total of sales by date.
select sale_date,sales_amount,
sum(sales_amount) over(order by sale_date) as Running_Total from sales;

-- 73. Find top 2 earners per department.
select * from (select id,Name,Dept_id,Salary,
dense_rank() over(partition by Dept_id order by Salary desc) as Rnk
from employees) as t
where Rnk <= 2;

-- 74. Calculate moving average of sales (last 3 days).
select sale_date,sales_amount,
avg(sales_amount) over(order by sale_date desc ) as moving_average
from sales
limit 3;

-- 75. Assign row numbers to orders by date.
select * ,
row_number() over(partition by customer_id order by order_amount) as Row_num from orders;

-- 76. Find highest sale per day using window function.
select sale_date,sales_amount,
rank() over(partition by sale_date order by sales_amount) as High_Salary
from sales;

-- 77. Compare each employee salary with department average.
select id, name, dept_id, salary, avg(salary) over (partition by Dept_id) as dept_avg_salary,
salary - avg(salary) over (partition by dept_id) as difference
from employees;

-- 78.	Show cumulative quantity sold per product
select p.id as product_id,p.product_name,sum(quantity) as Quantity from products as p
left join sales as s
on p.id = s.product_id
group by p.id,p.product_name;

-- 79 Rank customers based on total purchase amount
select *,
rank() over (order by total_amount desc) as Rnk
from (select c.id, c.customer_name, sum(o.order_amount) as total_amount
from customers c
left join orders o
on c.id = o.customer_id
group by c.id, c.customer_name
) as t;

-- SECTION 7:

-- 80 Rank employees based on salary
select *,
rank() over(order by Salary desc) as Rnkk
from employees;

-- 81 Insert 3 new students in a single query
insert into students(id,name,age,city,mark)
values
(9,'Ramya',23,'Hyderabad',92),
(10,'Nadhiya',24,'Chennai',95),
(11,'Saran',27,'Mumbai',88);

-- 82.	Update salary by 10% for Sales employees
set  sql_safe_updates = 0;

update employees
set salary = salary * 1.10
where Dept_id = 1;

-- 83 Delete customers with no orders
start transaction;
delete from customers as c
where not exists (select * from orders o
where o.customer_id = c.id);

-- 84 Demonstrate COMMIT and ROLLBACK using account transfer
start transaction;

update accounts
set balance = balance - 10000
where id = 1;

update accounts
set balance = balance - 10000
where id = 2;

rollback;
commit;

-- 85 Truncate temporary table
truncate table logs;

-- 86 Create a view for high salary employees
create or replace view v1 as
select * from employees
order by salary desc;

-- 87.	Update data using view
select * from v1;

update v1
set salary = salary * 1.10
where id = 1;

-- 88.	Drop an existing view
drop view v1;

-- 89 Create index on customer email
create index i2 on customers(email);

drop index i2 on customers;

show index from customers;

-- 90.	Show indexes on orders table
show index from orders;

-- 91.	Create procedure to fetch employee by id
delimiter //
create procedure p1(in emp int)
begin
select * from employees
where id = emp;
end //
delimiter ;

call p1(1);

-- 92.	Create procedure to count total orders
delimiter //
create procedure p2()
begin
select count(*) from orders;
end//
delimiter ;

call p2()

-- 93 Create function to calculate tax (10%)
delimiter //
create function f1(a decimal)
returns decimal
deterministic
begin
  return sales_amount * a;
end//

select f1(0.10);

-- 94.	Create trigger to log inserts on orders
delimiter /
create trigger t1
after delete on logs_
for each row
begin
insert into orders()
values
(old.log_id,old.log_message,old.log_date);
end/
delimiter ;

delete from logs_
where log_id = 1;

-- 95.	Create trigger to log deletes on customers
delimiter /
create trigger t1
after delete on logs_
for each row
begin
insert into orders()
values
(old.log_id,old.log_message,old.log_date);
end/
delimiter ;

-- 96.	Create event to delete old logs monthly
create event e1
on schedule every 1 month
do
truncate table logs_;

-- 97 Identify which constraints create indexes automatically
-- primary key
-- unique

-- 98.	Difference scenario using DELETE vs TRUNCATE
-- 		 In delete we can retrive the daleted data
--       But in truncate we can't retrive the deleted data
--       Delete is a DML command
--       Truncate is a DDL command
