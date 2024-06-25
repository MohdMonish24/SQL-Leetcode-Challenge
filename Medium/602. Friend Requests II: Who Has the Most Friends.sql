Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

 

Example 1:

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
 

Follow up: In the real world, multiple people could have the same most number of friends. Could you find all these people in this case?

Approach and Explanation:
• To find the person who has the most friends based on the RequestAccepted table, we can start by using a CTE (Common Table Expression) to combine both requester_id and accepter_id into a single list of unique user IDs. This ensures that each person's ID appears once, regardless of whether they sent or accepted friend requests.
• We then count how many times each ID appears in this combined list to determine the number of friends each person has.
• By ordering these counts in descending order and limiting the result to one row, we can identify the person with the highest number of friends.
• This approach efficiently computes the maximum number of friends and provides a straightforward solution to identifying the person with the most friends in the context of the given dataset.

# Write your MySQL query statement below
WITH cte as (
SELECT requester_id AS id FROM RequestAccepted UNION ALL
SELECT accepter_id AS id FROM RequestAccepted)
SELECT id, count(*) AS num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1;
