use d17;
-- customers table
create table customers(customer_id int primary key,name varchar(90),email varchar(90),address varchar(90));
-- products table
create table products(products_id int primary key,product_name varchar(90),price float,description varchar(90));
-- orders table
create table orders(order_id int primary key,customer_id int,products_id int,order_date date,total_cost float,
 foreign key (customer_id) references customers(customer_id),
 foreign key (products_id) references products(products_id));
 -- inserting customers records
 INSERT INTO customers VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'Hyderabad'),
(102, 'Priya Reddy', 'priya.reddy@gmail.com', 'Vijayawada'),
(103, 'Arjun Kumar', 'arjun.kumar@gmail.com', 'Visakhapatnam'),
(104, 'Sneha Patel', 'sneha.patel@gmail.com', 'Bengaluru'),
(105, 'Rohan Verma', 'rohan.verma@gmail.com', 'Chennai'),
(106, 'Anjali Singh', 'anjali.singh@gmail.com', 'Mumbai'),
(107, 'Kiran Rao', 'kiran.rao@gmail.com', 'Pune'),
(108, 'Meera Nair', 'meera.nair@gmail.com', 'Kochi'),
(109, 'Vikram Joshi', 'vikram.joshi@gmail.com', 'Delhi'),
(110, 'Aisha Khan', 'aisha.khan@gmail.com', 'Jaipur');
-- inserting products records
INSERT INTO products VALUES
(201, 'Rice', 55.00, 'Premium Basmati Rice 1kg'),
(202, 'Wheat Flour', 45.50, 'Whole Wheat Flour 1kg'),
(203, 'Sunflower Oil', 180.00, 'Refined Sunflower Oil 1L'),
(204, 'Sugar', 42.00, 'White Sugar 1kg'),
(205, 'Tea Powder', 220.00, 'Premium Tea Powder 500g'),
(206, 'Coffee Powder', 350.00, 'Instant Coffee 200g'),
(207, 'Turmeric Powder', 65.00, 'Pure Turmeric Powder 200g'),
(208, 'Red Chilli Powder', 95.00, 'Spicy Red Chilli Powder 500g'),
(209, 'Salt', 25.00, 'Iodized Salt 1kg'),
(210, 'Toor Dal', 145.00, 'Premium Toor Dal 1kg');
-- inserting orders records
INSERT INTO orders VALUES
(1001, 101, 201, '2026-06-01', 55.00),
(1002, 102, 203, '2026-06-02', 180.00),
(1003, 103, 205, '2026-06-03', 220.00),
(1004, 104, 202, '2026-06-04', 45.50),
(1005, 105, 210, '2026-06-05', 145.00),
(1006, 106, 204, '2026-06-06', 42.00),
(1007, 107, 208, '2026-06-07', 95.00),
(1008, 108, 206, '2026-06-08', 350.00),
(1009, 109, 207, '2026-06-09', 65.00),
(1010, 110, 209, '2026-06-10', 25.00);
select*from customers;
select*from products;
select*from orders;
-- Write a query that retrieves the order history for a specific customer, including the product name, order date, and total cost
select*from orders where customer_id = 103;
-- Write a query that retrieves the total sales for a specific product
select products_id, sum(total_cost) as Total_Sales from orders where products_id = 201 group by products_id;