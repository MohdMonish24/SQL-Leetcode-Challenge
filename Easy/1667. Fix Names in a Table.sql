Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The result format is in the following example.

 

Example 1:

Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

-- Solution
SELECT user_id, --> show user_id...
CONCAT(UPPER(LEFT(name, 1)), --> UPPER(LEFT(name, 1) it helps to convert first letter to uppercase...
LOWER(RIGHT(name, LENGTH(name) - 1))) --> it helps to convert all letters to lowercase except first letter...
Finally, after conversion we have to concatenate using CONCAT() func.
AS name --> alias as name...
FROM Users --> Association from Users table...
ORDER BY user_id; --> Ordering w.r.t. user_id...
