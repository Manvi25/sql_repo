create table email_signup (id int, email_id varchar(50), signup_date date);

--inserting the data into table
insert into email_signup values
(1, 'Rajesh@Gmail.com', '2022-02-01'), 
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'), 
(3, 'Hitest@Gmail.com', '2020-09-08'), 
(4, 'Salil@Gmmail.com', '2019-07-05'), 
(5, 'Himanshu@Yahoo.com', '2023-05-09'), 
(6, 'Hitesh@Twitter.com', '2015-01-01'), 
(7, 'Rakesh@facebook.com', null);

-- Update signup_date for records with NULL signup_date to '1970-01-01'
UPDATE email_signup
SET signup_date = '1970-01-01'
WHERE signup_date IS NULL;

-- Query to find statistics about Gmail accounts
SELECT COUNT(CASE WHEN email_id LIKE '%@gmail.com' THEN 1 END) AS count_gmail_account, 
MAX(CASE WHEN email_id LIKE '%@gmail.com' THEN signup_date END) AS latest_signup_date, 
MIN(CASE WHEN email_id LIKE '%@gmail.com' THEN signup_date END) AS first_signup_date,
DATEDIFF(DAY, MIN(CASE WHEN email_id LIKE '%@gmail.com' THEN signup_date END), MAX(CASE WHEN email_id LIKE '%@gmail.com' THEN signup_date END)) as diff_in_days
FROM email_signup;