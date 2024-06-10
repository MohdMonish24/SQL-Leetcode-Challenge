Table: Followers

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.
 

Write a solution that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+
Output: 
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
+---------+----------------+
Explanation: 
The followers of 0 are {1}
The followers of 1 are {0}
The followers of 2 are {0,1}

Approach and Explanation:
To find the number of followers for each user, we group the rows by the user_id column using the GROUP BY clause.
We then use the COUNT() function to count the number of followers (follower_id) for each user_id.
Finally, we order the results by user_id in ascending order to meet the requirement of the problem statement.
This approach ensures that we get a count of followers for each user, sorted by user ID.
  
Solution:
SELECT user_id,  /* show column user_id from Followers Table... */
COUNT(follower_id) AS followers_count /* Using aggregation function count to count follower_id which should be unique... & alias as followers_count... */
FROM followers /* Association from Followers Table... */
GROUP BY user_id /* Grouping w.r.t. user_id... */
ORDER BY user_id; /* ORDER BY w.r.t. user_id... */

