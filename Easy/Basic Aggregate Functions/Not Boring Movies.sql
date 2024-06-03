Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]
 

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
The result format is in the following example.

 

Example 1:

Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.

Approach and Explanation:
To identify movies with odd-numbered IDs and descriptions that are not "boring," 
we select all columns from the Cinema table where the ID modulo 2 is not equal to 0,
indicating an odd-numbered ID, and where the description is not equal to "boring." Additionally, 
we order the result by rating in descending order to present higher- rated movies first.
This approach ensures we display only the relevant movies, sorted by their ratings.

My Solution:-
SELECT * FROM cinema --> show all records from Cinema table...
WHERE
id % 2 != 0 --> id should be odd...
and description != 'boring' --> description shouldn't be boring..
ORDER BY rating DESC --> w.r.t. rating (follows descending pattern).

2nd way Using Mod operator-:
SELECT * FROM Cinema WHERE MOD( id, 2) = 1 AND 
description <> 'boring' ORDER BY rating DESC
