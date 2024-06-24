Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.


Approach and Explanation:
To find numbers that appear at least three times consecutively, we need to compare each row with the next two rows.
By joining the table with itself twice, we can align three consecutive rows and check if they have the same number.
Specifically, we join Logs as 11 with 12 where 12.id is l1.id + 1, and with 13 where 13.id is l1.id + 2.
We then check if 11.num, 12.num, and 13.num are equal. If they are, it means the number appears three times consecutively.
The query selects these numbers and returns them as the result.
Solution:

SELECT DISTINCT 11.num AS ConsecutiveNums
FROM Logs 11
JOIN Logs 12 ON 11.id = 12.id 1
JOIN Logs 13 ON 11.id = 13.id 2
WHERE 11.num = 12.num AND 12.num = 13.num;

-- Intuition
SELECT DISTINCT l1.num --> Show num from Logs Table(alias as l1) we can also use any instance like l2 & l3(as your choice)...
AS ConsecutiveNums --> alias as ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3 --> we took three instances l1, l2 & l3 from Logs Table...
WHERE --> Clause...
l1.id = l2.id - 1 --> difference b/w first instance/num and second instance/num is 1 for consecutive nos.
AND
l2.id = l3.id - 1 AND --> as well as for thirdinstance/num w.r.t. second instance/num for consecutive nos.
AND
l1.num = l2.num AND
l2.num = l3.num; --> Instances for the same table...
