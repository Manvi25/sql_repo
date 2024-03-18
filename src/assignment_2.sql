create database assignment_2
use assignment_2

--create table sales
create table sales(sell_date date,product_name varchar(50))

--inserting value into sales
insert into sales values('2020-05-30','Headphones'), 
('2020-06-01','Pencil'),
('2020-06-02','Mask'),
('2020-05-30','Basketball'),
('2020-06-01','Book'),
('2020-06-02', ' Mask '), 
('2020-05-30','T-Shirt'),
('2020-06-03', 'sunglasses'),
('2020-06-05', 'water bottle'),
('2020-06-05', 'Notebook'),
('2020-06-03', 'Running Shoes'),
('2020-06-04', 'Backpack'),
('2020-06-05', 'Umbrella'),
('2020-06-03', 'Gaming Mouse'),
('2020-06-04', 'Laptop Sleeve'),
('2020-06-05', 'Wireless Keyboard'),
('2020-06-03', 'Desk Lamp');

SELECT * FROM sales;

-- Query to find the number of different products sold and their names for each sell_date
SELECT sell_date, COUNT(DISTINCT product_name) AS num_sold,
STRING_AGG(product_name,', ') AS product
FROM sales
GROUP BY sell_date
ORDER BY num_sold;

