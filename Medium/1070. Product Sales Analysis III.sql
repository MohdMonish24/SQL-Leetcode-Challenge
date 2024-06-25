Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+


Approach and Explanation:
To select the product id, year, quantity, and price for the first year of every product sold,
you can use a subquery to identify the minimum year for each product_id in the Sales table. 
Then, join this subquery with the Sales table on the product_id and year to retrieve the desired information. 
This approach ensures that you only select the records corresponding to the first year of sales for each product. 
The resulting table will contain the product_id, first_year, quantity, and price for the initial sales year of each product.

# Write your MySQL query statement below
SELECT product_id, /*show the product_id from Sales table...*/
year AS first_year,/* also show year alias as first_year...*/
quantity, price /*also show quantity & price from Sales table.. */
FROM sales  /* Association from Sales table...*/
WHERE (product_id, year) IN  /* Using sub - query for desire o/p...*/
(SELECT product_id, /* as a sub - query show product_id.*/
MIN(year) AS first_year /*Using Aggregation function MIN to find first year alias as f_year... */
FROM sales /*Association.. */
GROUP BY product_id); /* Grouping w.r.t. product_id (Aggregation)...*/
