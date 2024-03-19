This is the readme file for all the SQL assignments.

Question_1


Step 1:Creates an "ecommerce" database and defines four tables: gold_member_users, users, sales, and product.
Step 2:Inserts data into the tables with appropriate datatypes.
Step 3:Lists all tables in the "ecommerce" database.
Step 4:Counts the records in each table using a single query.
Step 5:Calculates the total amount spent by each customer.
Step 6:Lists distinct visit dates for each customer.
Step 7:Finds the first product purchased by each customer.
Step 8:Identifies the most purchased item by each customer.
Step 9:Lists customers who are not gold members.
Step 10:Calculates spending by customers during their gold membership.
Step 11:Lists customers whose names start with "M".
Step 12:Retrieves distinct customer IDs.
Step 13:Renames a column in the product table. Step 14:Updates a product name in the product table.
Step 15:Renames a table.
Step 16:Adds a new column to a table.
Step 17:Deletes records and demonstrates rollback.
Step 18:Inserts a duplicate record into the product table.
Step 19:Identifies duplicates in the product table.

Question_2


Step 1 :The product_details table is created with two columns: sell_date to store the date of sale and product to store the name of the product sold.
Step 2 :Sample sales data is inserted into the product_details table.
Step 3 :The SELECT query retrieves sales data, calculates the number of distinct products sold on each sale date, and aggregates the products sold into a comma-separated list.
Step 4 :Results are grouped by sale date and sorted by the number of distinct products sold.

Question_3


Step 1 :The dept_tabl table is created with three columns: id_deptname to store department IDs, emp_name to store employee names, and salary to store employee salaries.
Step 2 :employee data is inserted into the dept_tabl table.
Step 3 :The SELECT query extracts the department name from the id_deptname column using string
manipulation functions, sums up the salaries of all employees within each department, and groups the results by department name.

Question_4


Step 1 :The script creates a table email_signup to store user sign-up data, including email addresses and signup dates.
Step 2 :Sample data is inserted into this table.
Step 3 :Any missing signup dates (NULL values) are updated to '1970-01-01'.
Step 4 :It counts the number of Gmail accounts.
Step 5 :It finds the latest and earliest signup dates for Gmail accounts.
Step 6 :It calculates the difference in days between the earliest and latest signup dates for Gmail accounts.

Question_5


Step 1 :The script provides SQL queries to analyze sales data from the sales_data table.
Step 2 :The first query retrieves the latest sales for each product.
Step 3 :The second query calculates the change in quantity sold compared to the previous row for each product.
Step 4 :The third query identifies the first and last quantities sold for each product.
Step 5 :These queries offer valuable insights into sales trends, changes, and quantities sold over time.

Question_6


Entities and Attributes
Student
Attributes: student_id (PK), name, date_of_birth, email_address
Course
Attributes: course_code (PK), title, credit_hours
Instructor
Attributes: instructor_id (PK), name, office_location
Major
Attributes: major_id (PK), name
Department
Attributes: department_id (PK), name

Relationships
Many-to-Many relationship between Student and Course
One-to-Many relationship between Instructor and Course
One-to-Many relationship between Student and Major
One-to-Many relationship between Department and Course
