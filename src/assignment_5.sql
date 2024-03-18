CREATE TABLE sales_data (
    product_id INT,
    sale_date DATE,
    quantity_sold INT
);

--inserting the values into the table
INSERT INTO sales_data (product_id, sale_date, quantity_sold) VALUES 
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);

--Assign rank by partition based on product_id and find the latest product_id sold
SELECT 
    product_id,
    sale_date,
    quantity_sold,
    RANK() OVER (PARTITION BY product_id ORDER BY sale_date DESC) AS rank
FROM 
    sales_data;

--Retrieve the quantity_sold value from a previous row and compare the quantity_sold
SELECT product_id,sale_date, quantity_sold,
LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS previous_quantity_sold,
CASE 
WHEN quantity_sold > LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) THEN 'Increased'
WHEN quantity_sold < LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) THEN 'Decreased'
ELSE 'No Change'
END AS comparison
FROM 
sales_data;

--Partition based on product_id and return the first and last values in ordered set
SELECT 
    product_id,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_value,
    LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM 
    sales_data;
