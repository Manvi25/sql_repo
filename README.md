## SQL Assignments README

This README file contains detailed instructions for each SQL assignment.

### Question 1

1. **Step 1**: Creates an "ecommerce" database and defines four tables: gold_member_users, users, sales, and product.
2. **Step 2**: Inserts data into the tables with appropriate data types.
3. **Step 3**: Lists all tables in the "ecommerce" database.
4. **Step 4**: Counts the records in each table using a single query.
5. **Step 5**: Calculates the total amount spent by each customer.
6. **Step 6**: Lists distinct visit dates for each customer.
7. **Step 7**: Finds the first product purchased by each customer.
8. **Step 8**: Identifies the most purchased item by each customer.
9. **Step 9**: Lists customers who are not gold members.
10. **Step 10**: Calculates spending by customers during their gold membership.
11. **Step 11**: Lists customers whose names start with "M".
12. **Step 12**: Retrieves distinct customer IDs.
13. **Step 13**: Renames a column in the product table.
14. **Step 14**: Updates a product name in the product table.
15. **Step 15**: Renames a table.
16. **Step 16**: Adds a new column to a table.
17. **Step 17**: Deletes records and demonstrates rollback.
18. **Step 18**: Inserts a duplicate record into the product table.
19. **Step 19**: Identifies duplicates in the product table.

### Question 2

1. **Step 1**: Creates the product_details table with sell_date and product columns.
2. **Step 2**: Inserts sample sales data into the product_details table.
3. **Step 3**: Retrieves sales data, calculates the number of distinct products sold on each sale date, and aggregates the products sold into a comma-separated list.
4. **Step 4**: Groups results by sale date and sorts by the number of distinct products sold.

### Question 3

1. **Step 1**: Creates the dept_tabl table with id_deptname, emp_name, and salary columns.
2. **Step 2**: Inserts employee data into the dept_tabl table.
3. **Step 3**: Extracts the department name from id_deptname, sums up employee salaries within each department, and groups results by department name.

### Question 4

1. **Step 1**: Creates the email_signup table to store user sign-up data.
2. **Step 2**: Inserts sample data into the email_signup table.
3. **Step 3**: Updates any missing signup dates (NULL values) to '1970-01-01'.
4. **Step 4**: Counts the number of Gmail accounts.
5. **Step 5**: Finds the latest and earliest signup dates for Gmail accounts.
6. **Step 6**: Calculates the difference in days between the earliest and latest signup dates for Gmail accounts.

### Question 5

1. **Step 1**: Provides SQL queries to analyze sales data from the sales_data table.
2. **Step 2**: Retrieves the latest sales for each product.
3. **Step 3**: Calculates the change in quantity sold compared to the previous row for each product.
4. **Step 4**: Identifies the first and last quantities sold for each product.

### Question 6

#### Entities and Attributes

- **Student**
  - Attributes: student_id (PK), name, date_of_birth, email_address
- **Course**
  - Attributes: course_code (PK), title, credit_hours
- **Instructor**
  - Attributes: instructor_id (PK), name, office_location
- **Major**
  - Attributes: major_id (PK), name
- **Department**
  - Attributes: department_id (PK), name

#### Relationships

- Many-to-Many relationship between Student and Course
- One-to-Many relationship between Instructor and Course
- One-to-Many relationship between Student and Major
- One-to-Many relationship between Department and Course