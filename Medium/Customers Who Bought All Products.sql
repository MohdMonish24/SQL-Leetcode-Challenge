Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.



Approach and Explanation:
To identify customers who bought all the products listed in the Product table,
we group the Customer table by customer_id and filter using HAVING to ensure that
the count of distinct product_key matches the total count of products in the Product table.
This way, we retrieve the customer_ids that have purchased all products.

  
Solution:
SELECT customer_id /* Show customer_id from Customer Table...*/
FROM Customer /* Association from Customer Table...*/
GROUP BY customer_id /* Grouping w.r.t. customer_id...*/
HAVING COUNT(distinct product_key) = 
(SELECT COUNT(product_key) FROM Product); /* Using Aggregation function COUNT to count product_key firstly for Customer Table then finally for Product Table & Check either they are equal or not equal...? if equal then consider...(Condition given in the problem)...*/
