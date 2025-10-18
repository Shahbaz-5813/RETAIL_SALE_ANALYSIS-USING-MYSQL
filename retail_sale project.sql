-- Questions we are going to solve in this project
-- How many sales we have?
-- How many  unique customers we have?
-- How many categories we have?
-- Ques1) write a sql queries to retreive all the columns for sales made on "2022-11-05".
-- --Ques2) write a sql query to retreive all transaction where the category is 
-- "clothing and the quantity sold is more than 10 in the month of nov-2022"
-- Ques3)write the sql queries to caluclate  net_sales of each category and total_order .
-- Ques4) find the average age of customer who purchased from "Beauty" category.
-- Ques5)writea sql query to find all the transaction where the total_sale > 1000.
-- Ques6) Find the total number of transaction (transaction_id) made by each gender in each category
-- Ques7) Write a sql query to calculate the average sale for eachmonth.Find out the best seeling month in each year.
-- Ques8) Write a sql query to findthe top 5 customers based on total_sale.
-- Ques9) write a sql query find the unique customer who purchased itmes from each category
-- Ques10)write a sql query to find the which time has max sale.



-- Create database retail_sales for this project
create database retail_sales;

-- After that importing file directly and then check the dataset
SELECT * FROM retail_sales_data;


-- DATA CLEANING

-- check count of data
SELECT count(*) FROM retail_sales_data;

-- Check null values in every column
select * from retail_sales_data
where customer_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- DATA EXPLORATION
-- How many sales we have?
select count(*) as total_sale from retail_sales_data;

-- How many  unique customers we have?
select count( distinct customer_id) as total_customers from retail_sales_data;

-- How many categories we have?
select  distinct category  from retail_sales_data;

-- DATA ANALYSIS AND BUSINESS PROBLEM AND ANSWER
-- Ques1) write a sql queries to retreive all the columns for sales made on "2022-11-05".

SELECT 
    *
FROM
    retail_sales_data
WHERE
    sale_date = '05-11-2022';
    
-- --Ques2) write a sql query to retreive all transaction where the category is 
-- "clothing and the quantity sold is more than 10 in the month of nov-2022"

SELECT 
    *
FROM
    retail_sales_data
WHERE
    category = 'Clothing'
        AND sale_date like  '%-11-2022'
        AND quantiy >= 4;

-- Ques3)write the sql queries to caluclate  net_sales of each category and total_order .
SELECT 
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_order
FROM
    retail_sales_data
GROUP BY category;


-- Ques4) find the average age of customer who purchased from "Beauty" category.
SELECT 
   round(avg(age),1)
FROM
    retail_sales_data
WHERE
    category = 'Beauty';
    
    
-- Ques5)writea sql query to find all the transaction where the total_sale > 1000.

SELECT 
    *
FROM
    retail_sales_data
WHERE
    total_sale > 1000;
    

-- Ques6) Find the total number of transaction (transaction_id) made by each gender in each category

SELECT 
    COUNT(customer_id),gender,category
FROM
    retail_sales_data
GROUP BY gender ,category
order by 1;


-- Ques7) Write a sql query to calculate the average sale for eachmonth.Find out the best seeling month in each year.

-- SELECT 
--     YEAR(sale_date) as year,
--     MONTH(sale_date) as month,
--     avg(total_sale ) as avg_sale
-- FROM
--     retail_sales_data
-- group by 1,2

-- Ques8) Write a sql query to findthe top 5 customers based on total_sale.

SELECT 
    customer_id, SUM(total_sale) AS total_sale
FROM
    retail_sales_data
GROUP BY 1
ORDER BY 1 , 2 DESC
LIMIT 5;
    


-- Ques9) write a sql query find the unique customer who purchased itmes from each category
SELECT 
    COUNT(DISTINCT customer_id), category
FROM
    retail_sales_data
GROUP BY category;


-- Ques10)write a sql query to find the which time has max sale.
SELECT 
    sale_time, sum(quantiy) as order_quantity
FROM
    retail_sales_data
GROUP BY 1
ORDER BY  2 DESC
LIMIT 5

-- End of the project








    

