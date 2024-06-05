Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+
Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+


Approach and Explanation:
To retrieve the required data for each month and country, use the DATE_FORMAT function to extract the month from trans_date,
then utilize the COUNT function to count the total transactions and the approved transactions using a CASE statement within the SUM function.
Additionally, calculate the total transaction amounts and the approved transaction amounts by summing the amount field,
again using a CASE statement for approved transactions.
Group the results by the formatted month and country to produce the desired summary.
  
-- Solution
# Write your MySQL query statement below
SELECT DATE_FORMAT(trans_date, '%Y-%m') 
AS month, country, --> show month as well as country, DATE_FORMAT function is used for month in this query...
       country,
       COUNT(id) AS trans_count, --> Using Aggregation function COUNT to calculate trans_count(alias)...
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,  --> WHEN state is 'approved' then add it on approved_count...
       SUM(amount) AS trans_total_amount, --> Using Aggregation function SUM for calculate trans_total_count...
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount --> WHEN state is 'approved' then add amount otherwise 0 alias as approved_total_amount...
FROM Transactions  --> Association from Transactions Table...
GROUP BY month, country; --> Grouping w.r.t. month and country...

======================================================================================================================
Also can use IF replace CASE
-- Solution
SELECT  DATE_FORMAT(trans_date, '%Y-%m') AS month, country, --> show month as well as country, DATE_FORMAT function is used for month in this query...
        COUNT(id) AS trans_count, --> show month as well as country, DATE_FORMAT function is used for month in this query...
        SUM(IF(state = 'approved',1,0)) AS approved_count,--> if state is 'approved' then add it on approved_count...
        SUM(amount) AS trans_total_amount,--> Using Aggregation function SUM for calculate trans_total_count...
        SUM(IF(state = 'approved',amount,0)) AS approved_total_amount --> if state is 'approved' then add amount otherwise 0 alias as approved_total_amount...
FROM  Transactions  --> Association from Transactions Table...
GROUP BY month,country; --> Grouping w.r.t. month and country...
