Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
Approach and Explanation:
• To find the prices of all products on 2019-08-16, we need to account for the initial price of 10 and any subsequent price changes up to that date.
• First, we handle products that had no price changes by selecting their initial price of 10 if their first recorded price change is after 2019- 08-16.
• Second, for products with price changes on or before 2019-08-16, we select the most recent price change before or on that date. This is done by finding the maximum change date for each product that is on or before 2019-08-16 and then retrieving the corresponding prices.
• Finally, we combine both results using UNION to ensure all products are included.

SELECT DISTINCT product_id, 10 AS price FROM Products
GROUP BY product_id
HAVING MIN(change_date) > "2019-08-16"
UNION
SELECT product_id, new_price
FROM Products
WHERE
(product_id, change_date) IN
(SELECT product_id, MAX(change_date) AS recent_date
FROM Products
WHERE change_date <= "2019-08-16"
GROUP BY product_id)


-- Intuition
SELECT product_id, --> Show product_id FROM Products Table...
new_price AS price --> also show new_price alias as price...
FROM Products --> Association from Products Table...
WHERE (product_id, change_date) IN --> we are going to write sub sql query...
(SELECT product_id, max(change_date) --> show product_id and Using aggregate function max to find maximum date to change...
FROM Products --> Association from Products Table...
WHERE change_date <= '2019-08-16' --> Condition given in the problem.
GROUP BY product_id) --> Grouping w.r.t. product_id...
UNION --> it helps to combining queries...
SELECT product_id, 10 AS price --> show again product_id but this time price is fixed it is 10 for all (follows condition)...
WHERE product_id NOT IN --> Again, we are going to write a sub sql query...
(SELECT product_id
FROM Products --> show product_id from Products Table...
WHERE change_date <= '2019-08-16'); --> (Condition given in the problem.)...
