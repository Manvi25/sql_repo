-- 1. Create Database as ecommerce
CREATE DATABASE ecommerce;
-- 2. Create 4 tables under the ecommerce database
USE ecommerce;

CREATE TABLE gold_member_users (
    userid INTEGER,
    user_name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE users (
    userid INTEGER,
    user_name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE sales (
    userid INTEGER,
    user_name VARCHAR(50),
    created_date DATE,
    product_id INTEGER
);

CREATE TABLE product (
    product_id INTEGER,
    product_name VARCHAR(50),
    price INTEGER
);

-- 3. Insert values provided above with respective datatypes
-- Gold members Data Set
INSERT INTO gold_member_users (userid, user_name, signup_date)
VALUES 
    (001,'John','2017-09-22'), 
    (002,'Mary','2017-04-21'),
    (003,'David','2018-06-15'),
    (004,'Anna','2019-03-25'),
    (005,'Emma','2020-02-10'),
    (006,'James','2017-11-05'),
    (007,'Sophia','2016-08-14');

-- Users Data Set
INSERT INTO users (userid, user_name, signup_date)
VALUES 
    (001,'John','2014-09-02'), 
    (003,'Michel','2015-01-15'), 
    (002,'Mary','2014-04-11'),
    (004,'Anna','2019-03-25'),
    (005,'Emma','2020-02-10'),
    (006,'James','2017-11-05'),
    (007,'Sophia','2016-08-14'),
    (008,'Oliver','2015-10-20'),
    (009,'Ella','2018-04-30'),
    (010,'William','2019-09-12');

-- Sales Data Set
INSERT INTO sales (userid, user_name, created_date, product_id)
VALUES 
    (001,'John','2017-04-19',2), 
    (002,'Mary','2019-12-18',1), 
    (003,'Michel','2020-07-20',3), 
    (001,'John','2019-10-23',2), 
    (001,'John','2018-03-19',3), 
    (002,'Mary','2016-12-20',2), 
    (001,'John','2016-11-09',1), 
    (001,'John','2016-05-20',3), 
    (002,'Michel','2017-09-24',1), 
    (001,'John','2017-03-11',2), 
    (001,'John','2016-03-11',1), 
    (002,'Mary','2016-11-10',1), 
    (002,'Mary','2017-12-07',2), 
    (003,'Michel','2020-05-20',1), 
    (003,'Michel','2020-01-20',3),
    (003,'David','2019-08-12',2),
    (004,'Anna','2020-05-28',3),
    (005,'Emma','2021-01-15',1),
    (006,'James','2018-12-07',2),
    (007,'Sophia','2017-10-22',1),
    (008,'Oliver','2019-07-03',3),
    (009,'Ella','2020-04-18',2),
    (010,'William','2021-02-09',1);

-- Product Data Set
INSERT INTO product (product_id, product_name, price)
VALUES 
    (1,'Mobile',980), 
    (2,'Ipad',870), 
    (3,'Laptop',330),
    (4,'Smartwatch',150),
    (5,'Headphones',90),
    (6,'Tablet',420),
    (7,'Desktop',1200),
    (8,'Camera',300),
    (9,'Printer',200),
    (10,'Smart Speaker',100);

-- 4. Show all the tables in the same database(ecommerce)
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- 5. Count all the records of all four tables using a single query
SELECT 
    'gold_member_users' AS table_name, COUNT(*) AS records_count 
FROM 
    gold_member_users 
UNION ALL 
SELECT 
    'users', COUNT(*) 
FROM 
    users 
UNION ALL 
SELECT 
    'sales', COUNT(*) 
FROM 
    sales 
UNION ALL 
SELECT 
    'product', COUNT(*) 
FROM 
    product;

-- 6. What is the total amount each customer spent on ecommerce company
SELECT 
    s.userid, s.user_name, SUM(p.price) AS total_amount 
FROM 
    sales s 
JOIN 
    product p ON s.product_id = p.product_id 
GROUP BY 
    s.userid, s.user_name;

-- 7. Find the distinct dates of each customer visited the website
SELECT DISTINCT 
    s.created_date, s.user_name 
FROM 
    sales s;

-- 8. Find the first product purchased by each customer using 3 tables(users, sales, product)
SELECT 
    s.userid, s.user_name, p.product_name 
FROM 
    sales s 
JOIN 
    product p ON s.product_id = p.product_id 
WHERE 
    s.created_date = (SELECT MIN(created_date) FROM sales WHERE userid = s.userid);

-- 9. What is the most purchased item of each customer and how many times the customer has purchased it
SELECT 
    s.userid, s.user_name, p.product_name, COUNT(*) AS item_count 
FROM 
    sales s 
JOIN 
    product p ON s.product_id = p.product_id 
GROUP BY 
    s.userid, s.user_name, p.product_name 
ORDER BY 
    item_count DESC;

-- 10. Find out the customer who is not the gold_member_user
SELECT * 
FROM users 
WHERE userid NOT IN (SELECT userid FROM gold_member_users);

-- 11. What is the amount spent by each customer when he was the gold_member user
SELECT 
    s.userid, s.user_name, SUM(p.price) AS total_amount 
FROM 
    sales s 
JOIN 
    product p ON s.product_id = p.product_id 
WHERE 
    s.userid IN (SELECT userid FROM gold_member_users) 
GROUP BY 
    s.userid, s.user_name;

-- 12. Find the Customers names whose name starts with M
SELECT * 
FROM users 
WHERE user_name LIKE 'M%';

-- 13. Find the Distinct customer Id of each customer
SELECT DISTINCT 
    userid, user_name 
FROM 
    users;

-- 14. Change the Column name from product table as price_value from price
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';

-- 15. Change the Column value product_name – Ipad to Iphone from product table
UPDATE product
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';

-- 16. Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

-- 17. Create a new column  as Status in the table create above gold_membership_users  
-- the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
ALTER TABLE gold_membership_users
ADD Status VARCHAR(3);

UPDATE 
gold_membership_users
SET Status = 'Yes'



-- 18. Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
BEGIN TRANSACTION;
DELETE FROM users WHERE userid IN (1, 2);

-- Rollback changes
ROLLBACK TRANSACTION;

-- 19. Insert one more record as same (3,'Laptop',330) as product table
INSERT INTO product (product_id, product_name, price_value)
VALUES (3, 'Laptop', 330);

-- 20. Write a query to find the duplicates in product table
SELECT product_id, product_name, price_value, COUNT(*) AS duplicate_count
FROM product
GROUP BY product_id, product_name, price_value
HAVING COUNT(*) > 1;


