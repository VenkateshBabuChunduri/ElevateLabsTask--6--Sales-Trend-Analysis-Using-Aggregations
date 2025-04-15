CREATE DATABASE online_sales;
USE online_sales;

CREATE TABLE sales_data (
    Transaction_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(255),
    Units_Sold INT,
    Unit_Price DECIMAL(10, 2),
    Total_Revenue DECIMAL(10, 2),
    Region VARCHAR(100),
    Payment_Method VARCHAR(50)
);

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online_Sales_Data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Transaction_ID, Date, Product_Category, Product_Name, Units_Sold, Unit_Price, Total_Revenue, Region, Payment_Method);

SELECT * FROM sales_data LIMIT 10;

#### Query 1: Group by Month and Year

SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    SUM(Total_Revenue) AS Monthly_Revenue,
    COUNT(DISTINCT Transaction_ID) AS Order_Volume
FROM 
    sales_data
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;

### Query 2: Top 3 Months by Sales

SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    SUM(Total_Revenue) AS Monthly_Revenue
FROM 
    sales_data
GROUP BY 
    Year, Month
ORDER BY 
    Monthly_Revenue DESC
LIMIT 3;

#### Query 3 : Order Volume and Revenue by Product Category
-- This query calculates total revenue and order volume for each product category and sorts them by revenue in descending order:

SELECT 
    Product_Category,
    SUM(Total_Revenue) AS Total_Revenue,
    COUNT(DISTINCT Transaction_ID) AS Order_Volume
FROM 
    sales_data
GROUP BY 
    Product_Category
ORDER BY 
    Total_Revenue DESC;
    
   #### Query 4: Filter Data for Specific Time Periods
   -- Let’s focus on analyzing revenue and order volume for January 2024 as an example.
   
   SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    SUM(Total_Revenue) AS Monthly_Revenue,
    COUNT(DISTINCT Transaction_ID) AS Order_Volume
FROM 
    sales_data
WHERE 
    Date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;
    
    
    SHOW COLUMNS FROM sales_data;

#### Query 5: Revenue Trends by Product

SELECT 
    Product_Name,
    SUM(Total_Revenue) AS Total_Revenue,
    COUNT(DISTINCT Transaction_ID) AS Order_Volume
FROM 
    sales_data
GROUP BY 
    Product_Name
ORDER BY 
    Total_Revenue DESC;

#### Query: Revenue Trends by Product Over Time
-- Here’s a query to calculate monthly revenue for each product:

SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    Product_Name,
    SUM(Total_Revenue) AS Monthly_Revenue
FROM 
    sales_data
GROUP BY 
    Year, Month, Product_Name
ORDER BY 
    Year, Month, Monthly_Revenue DESC;
    
   #### Query 7: Top Products Within Each Category
	-- This query breaks down revenue by product and category:
    
    SELECT 
    Product_Category,
    Product_Name,
    SUM(Total_Revenue) AS Total_Revenue,
    COUNT(DISTINCT Transaction_ID) AS Order_Volume
FROM 
    sales_data
GROUP BY 
    Product_Category, Product_Name
ORDER BY 
    Product_Category, Total_Revenue DESC;
