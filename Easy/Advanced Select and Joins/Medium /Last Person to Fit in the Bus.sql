Table: Queue

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |
+-------------+---------+
person_id column contains unique values.
This table has the information about all people waiting for a bus.
The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
weight is the weight of the person in kilograms.
 

There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

The result format is in the following example.

 

Example 1:

Input: 
Queue table:
+-----------+-------------+--------+------+
| person_id | person_name | weight | turn |
+-----------+-------------+--------+------+
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |
+-----------+-------------+--------+------+
Output: 
+-------------+
| person_name |
+-------------+
| John Cena   |
+-------------+
Explanation: The folowing table is ordered by the turn for simplicity.
+------+----+-----------+--------+--------------+
| Turn | ID | Name      | Weight | Total Weight |
+------+----+-----------+--------+--------------+
| 1    | 5  | Alice     | 250    | 250          |
| 2    | 3  | Alex      | 350    | 600          |
| 3    | 6  | John Cena | 400    | 1000         | (last person to board)
| 4    | 2  | Marie     | 200    | 1200         | (cannot board)
| 5    | 4  | Bob       | 175    | ___          |
| 6    | 1  | Winston   | 500    | ___          |
+------+----+-----------+--------+--------------+

Approach and Explanation:
• To determine the last person who can board the bus without exceeding the weight limit of 1000 kilograms, 
  we first need to calculate the cumulative weight of people boarding the bus in the order determined by the 'turn' column.
• We use a window function to compute the running total of weights ordered by 'turn'.
• Next, we filter to keep only the entries where the
cumulative weight does not exceed 1000 kilograms.
• Finally, we select the person with the highest cumulative weight that is still within the limit,
  which gives us the last person who can board the bus without exceeding the weight limit.

# Write your MySQL query statement below
SELECT person_name
FROM (SELECT
person_name, turn, weight,
SUM(weight) OVER(ORDER BY turn) AS cum
FROM queue) a
WHERE a.cum <= 1000
ORDER BY a.cum DESC
LIMIT 1;


-- Intuition
SELECT qu1.person_name --> show person_name from first instance qu1 of Queue table...
FROM Queue qu1 --> Association from Queue table first instance qu1...
INNER JOIN --> It helps to join itself for all content...
Queue qu2 --> second instance qu2 from Queue table...
ON qu1.turn >= qu2.turn --> Joining condition...
GROUP BY qu1.turn --> grouping w.r.t. first instance qu1 of Queue table...
HAVING SUM(qu2.weight) <= 1000 --> Condition given in problem...
ORDER BY SUM(qu2.weight) DESC --> coz, we need to show name of the last man when total weight of bus is 1000 or less than 1000.
LIMIT 1; --> Only show top row person_name...
