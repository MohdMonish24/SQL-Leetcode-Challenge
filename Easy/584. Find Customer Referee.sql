Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
The result format is in the following example.


Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

Approach and Explanation:
To identify customers not referred by customer with id=2, we utilize a SQL query where we select the 'name' column 
from the 'Customer' table where the 'referee_id' is not equal to 2 or where 'referee_id' is null, indicating they 
were either referred by someone other than customer with id 2 or not referred at all.


Solution:
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL

