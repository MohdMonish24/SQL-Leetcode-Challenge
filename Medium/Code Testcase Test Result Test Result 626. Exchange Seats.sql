Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.



Approach and Explanation:
To swap the seat IDs of every two consecutive students while leaving the last student's seat unchanged if the number of students is odd, we use a CASE statement in our SELECT clause.
• This CASE statement checks if the current id is the maximum (and also odd), in which case the id remains the same.
• For other odd id values, we increase the id by 1 to swap with the next seat.
• For even id values, we decrease the id by 1 to swap with the previous seat.
• Finally, we order the result by the modified id to ensure the output is in ascending order.
• This approach efficiently handles both even and odd numbers of students.

# Write your MySQL query statement below
SELECT
CASE
WHEN id =(SELECT MAX(id) FROM seat) AND id % 2=1 THEN id 
WHEN id % 2=1 THEN id + 1 
ELSE id - 1  
END AS id,   
student
FROM seat   
ORDER BY id; 


Intuition
SELECT
CASE
WHEN
id = (SELECT MAX(id) FROM Seat) AND MOD(id, 2) = 1
THEN id --> (SELECT MAX(id) FROM Seat) --> it always select last student of Seat table AND MOD(id, 2) = 1 --> it is true when odd number of students are present in Seat table...Finally, we can say this case works for only odd no. of students now, that time no swap required...
WHEN
MOD(id, 2) = 1
THEN id + 1
ELSE
id - 1
END AS id, student --> this case works for even occurrence now, that time we have to swap to next student for just previous student.
AS id, student --> alias as id, student...
FROM Seat --> Association from Seat table...
ORDER BY id; --> Ordering w.r.t. id...
