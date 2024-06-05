Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
  
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
The result format is in the following example.

 
Example 1:

Input: 
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
Output: 
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
Explanation: 
The customer id 1 has a first order with delivery id 1 and it is scheduled.
The customer id 2 has a first order with delivery id 2 and it is immediate.
The customer id 3 has a first order with delivery id 5 and it is scheduled.
The customer id 4 has a first order with delivery id 7 and it is immediate.
Hence, half the customers have immediate first orders. 

Approach and Explanation:
To calculate the percentage of immediate orders in the first orders of all customers,
employ a subquery to determine each customer's first order date.
Then, use a conditional statement within the SUM function to count the number of immediate orders,
where the order date matches the customer's preferred delivery date. Finally,
divide this count by the total number of distinct customer IDs
and multiply by 100 to obtain the immediate order percentage, rounded to two decimal places.
  
# Write your MySQL query statement below
SELECT
ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date
THEN 1 ELSE 0 END) * 100.0/ COUNT(DISTINCT customer_id),2)
AS immediate_percentage
FROM Delivery 
WHERE (customer_id, order_date) IN ( SELECT customer_id, MIN(order_date)
AS first_order_date FROM Delivery
GROUP BY customer_id);


SELECT
ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0))*100/COUNT(DISTINCT customer_id),2) --> If order date and customer_pref_delivery_date is same then, consider 1 otherwise 0 and sum after this we can calculate immediate_percentage finally, round off the answer...
AS immediate_percentage
FROM Delivery --> Alias as immediate_percentage FROM Delivery table...
WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date) AS first_order_date
FROM Delivery
GROUP BY customer_id); --> only consider minimum order date & these are the conditions given in problem...


Approach
To solve this problem, we can use a common table expression (CTE) to calculate the rank of each order for each customer based on the order date.
Then, we can select the immediate deliveries (where the order date is equal to the customer's preferred delivery date)
and calculate the percentage by dividing the count of immediate deliveries by the total count of orders.
  
/* Write your T-SQL query statement below */
WITH cte AS (
    SELECT
        customer_id,
        order_date,
        RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS r,
        customer_pref_delivery_date
    FROM
        Delivery
)
SELECT
    ROUND(
        CAST(100*COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) AS decimal) /
        CAST(COUNT(customer_id) AS decimal),
    2) AS immediate_percentage
FROM
    cte
WHERE r = 1;
