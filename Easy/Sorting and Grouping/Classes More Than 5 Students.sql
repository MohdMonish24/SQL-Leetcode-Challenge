Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.

Approach and Explanation:
To find all the classes that have at least five students, we group the rows by the class column using the GROUP BY clause.
Then, we use the HAVING clause to filter the grouped results, retaining only those groups (classes) where the count of students is five or more.
This approach ensures that only classes meeting the specified student count criteria are included in the final result.
  
Solution:
SELECT class /* Show the column class for Courses Table... */
FROM courses  /* Association from Courses Table... */
GROUP BY class   /* Grouping w.r.t. class... */
HAVING COUNT (student) >= 5   /* Aggregation function count to count students which should be greater than 5 acc. to the problem... */
