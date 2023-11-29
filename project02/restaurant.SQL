-- My restaurant SQL mini project

-- create table and write 3-5queries

/* Open Database */

.open restaurant.db
.mode column
.mode box
.header on

/* create  table and insert data */

DROP TABLE customers;
DROP TABLE menu;
DROP TABLE orders;
DROP TABLE invoice;
DROP TABLE payment;
DROP TABLE delivery_platform;

CREATE TABLE customers (
  customer_id int UNIQUE,
  firstname TEXT,
  lastname TEXT,
  phone TEXT,
  email TEXT,
  gender TEXT
);

INSERT INTO customers VALUES
  (1, 'Tim', 'Slipknot', '0801234567','slipktim@gmail.com', 'F'),
  (2, 'Post', 'Malone', '0812345678','posty@gmail.com', 'M'),
  (3, 'Swaee', 'Lee', '0823456789', 'swaeelee@outlook.co.th','M'),
  (4, 'Bele', 'Tomeo', '0834567890', 'beleto@gmail.com','F'),
  (5, 'Will' ,'Viewvill', '0845678901', 'willviewvill@outlook.coth', 'F'),
  (6, 'Mook', 'Rock', '0856789012','mookrock@gmail.com', 'F'),
  (7, 'Zack', 'Codeine', '0867890123', 'zackcodeineg@outlook.co.th', 'F'),
  (8, 'Junji', 'Ito', '0878901234', 'junjiito@gmail.com', 'M'),
  (9, 'Boy', 'Pablo', '0889012345', 'boypablo@gmail.com', 'M'),
  (10, 'kill', 'bill', '0890123456', 'killbill@outlook.co.th', 'F');

CREATE TABLE menu (
  menu_id int,
  menu_name TEXT,
  price int
);

INSERT INTO menu VALUES 
    (1, 'Taco beef supreme', 139),
    (2, 'Crunchy Taco', 129),
    (3, 'Loaded nachos', 199),
    (4, 'Burrito', 129),
    (5, 'Chicken wings', 89),
    (6, 'Cheesy bacon chips', 99),
    (7, 'Quesdilla choco', 79),
    (8, 'Cola', 45),
    (9, 'Soft Soda', 25);

CREATE TABLE orders (
  order_id int,
  order_date TEXT,
  platform_id int,
  menu_id int,
  quantity int,
  payment_id int
);

INSERT INTO orders VALUES 
    (1, '2023-08-30', 3, 2, 1, 2),
    (2, '2023-08-30', 3, 1, 3, 2),
    (3, '2023-08-30', 2, 5, 2, 1),
    (4, '2023-08-30', 1, 3, 1, 2),
    (5, '2023-08-31', 1, 4, 1, 1),
    (6, '2023-08-31', 2, 6, 2, 2),
    (7, '2023-08-31', 3, 7, 1, 1),
    (8, '2023-08-31', 3, 2, 3, 3),
    (9, '2023-08-31', 2, 9, 3, 3),
    (10, '2023-09-01', 2, 1, 2, 2),
    (11, '2023-09-01', 1, 1, 2, 2),
    (12, '2023-09-01', 3, 4, 1, 2),
    (13, '2023-09-02', 1, 5, 3, 2),
    (14, '2023-09-02', 3, 3, 2, 1),
    (15, '2023-09-02', 2, 8, 3, 3),
    (16, '2023-09-02', 1, 7, 2, 1),
    (17, '2023-09-02', 1, 1, 2, 2),
    (18, '2023-09-03', 3, 2, 1, 2),
    (19, '2023-09-03', 3, 2, 2, 2);

CREATE TABLE invoice (
  invoice_id int,
  invoice_date TEXT,
  customer_id int,
  order_id int,
  total_price int,
  payment_id int,
  platform_id int
);

INSERT INTO invoice VALUES 
  (1, '2023-08-30', 3, 1, 258 , 2, 3),
  (2, '2023-08-30', 8, 2, 417, 2, 3),
  (3, '2023-08-30', 4, 3, 178, 1, 2),
  (4, '2023-08-30', 2, 4, 199, 2, 1),
  (5, '2023-08-31', 1, 5, 129, 1, 1),
  (6, '2023-08-31', 3, 6, 198, 2, 2),
  (7, '2023-08-31', 5, 7, 79, 1, 3),
  (8, '2023-08-31', 6, 8, 387, 3, 3),
  (9, '2023-08-31', 10, 9, 75, 3, 2),
  (10, '2023-09-01', 1, 10, 278, 2, 2),
  (11, '2023-09-01', 4, 11, 278, 2, 1),
  (12, '2023-09-01', 5, 12, 129, 2, 3),
  (13, '2023-09-02', 1, 13, 267, 2, 1),
  (14, '2023-09-02', 7, 14, 398, 1, 3),
  (15, '2023-09-02', 9, 15, 135, 3, 2),
  (16, '2023-09-02', 4, 16, 158, 1, 1),
  (17, '2023-09-02', 8, 17, 278, 2, 1),
  (18, '2023-09-03', 6, 18, 129, 2, 3),
  (19, '2023-09-03', 2, 19, 258, 2, 3);

CREATE TABLE payment (
  payment_id int,
  payment_name TEXT
);

INSERT INTO payment VALUES 
  (1, 'cash'),
  (2, 'mobile banking'),
  (3, 'credit card');

CREATE TABLE delivery_platform (
  platform_id int,
  platform_name TEXT
);

INSERT INTO delivery_platform VALUES 
  (1, 'Grab'),
  (2, 'Lineman'),
  (3, 'Robinhood');

SELECT * FROM customers;
SELECT * FROM menu;
SELECT * FROM orders;
SELECT * FROM invoice;
SELECT * FROM payment;
SELECT * FROM delivery_platform;


/* Q1 : What's the most popular menu */ 

.shell echo ""
.shell echo "Q1: What's the most popular menu?"
  
SELECT 
	menu_name, 
	COUNT(menu_name) AS QTYS
FROM 
	orders AS ord, menu 
WHERE 
	ord.menu_id = menu.menu_id
GROUP BY menu_name
ORDER BY 2 DESC;

/* Q2 : Who's the top spender */

.shell echo ""
.shell echo " Q2 : Who's the top spender?"
  
WITH customer_pay AS (
	SELECT 
  		cus.firstname||' '||cus.lastname AS fullname, 
  		total_price
	FROM 
  		invoice AS inv
	LEFT JOIN 
  		customers AS cus ON inv.customer_id = cus.customer_id
  )
SELECT 
	fullname, sum(total_price) AS grand_total
FROM 
	customer_pay
GROUP BY fullname
ORDER BY grand_total DESC
LIMIT 1;

/* Q3 : most paid method */

.shell echo ""
.shell echo " Q3 : most paid method?"
  
WITH paymethod AS    
  (
  SELECT
        payment_name
    FROM orders
    LEFT JOIN payment ON orders.payment_id = payment.payment_id
  )
SELECT 
payment_name,
count(payment_name) AS NumberOfUsing
From paymethod
GROUP BY payment_name
ORDER BY NumberOfUsing DESC
LIMIT 1;

/* Q4 : delivery platform with the most orders */

.shell echo ""
.shell echo " Q4 : delivery platform with the most orders?"

WITH deliveryplatform AS    
  (
  SELECT
        platform_name
    FROM orders
    LEFT JOIN delivery_platform ON orders.platform_id = delivery_platform.platform_id
  )
SELECT 
platform_name,
count(platform_name) AS NumberOfUsing
From deliveryplatform
GROUP BY platform_name
ORDER BY NumberOfUsing DESC
;
