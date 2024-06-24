Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
Example 2:

Input: 
Employees table:
+-------------+---------+------------+-----+ 
| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 1           | Michael | null       | 45  |
| 2           | Alice   | 1          | 38  |
| 3           | Bob     | 1          | 42  |
| 4           | Charlie | 2          | 34  |
| 5           | David   | 2          | 40  |
| 6           | Eve     | 3          | 37  |
| 7           | Frank   | null       | 50  |
| 8           | Grace   | null       | 48  |
+-------------+---------+------------+-----+ 
Output: 
+-------------+---------+---------------+-------------+
| employee_id | name    | reports_count | average_age |
| ----------- | ------- | ------------- | ----------- |
| 1           | Michael | 2             | 40          |
| 2           | Alice   | 2             | 37          |
| 3           | Bob     | 1             | 37          |
+-------------+---------+---------------+-------------+


Approach and Explanation:
To retrieve the manager's information, we perform a self-join on the Employees table,
matching the reports_to column of one instance (e1) with the employee_id of another instance (e2).
Then, we count the number of employees (reports_count) reporting directly to each manager
and calculate the average age (average_age) of those employees, rounded to the nearest integer. 
Finally, we order the result by employee_id.
Solution:

SELECT
e2.employee_id, e2.name, /* show employee_id & also show name for Table Employees(alias as e1)...*/
COUNT(e2.employee_id) AS reports_count,  /*Using Aggregate function to count employee alias as reports_count from Table Employees(alias as e1)... */
ROUND(AVG(e2.age)) AS average_age  /* Using Aggregate function to find average age of employee who reports for their manager then, round off the age alias as average_age...*/
FROM Employees e1/*Association from Employees Table(alias as e1)...*/
JOIN employees e2 /*Inner join helps to joining the tables with whole content... Employees Table(alias as e2)...*/
ON e1.reports_to e2.employee_id /* Joining condition...*/
GROUP BY employee_id /* Grouping w.r.t. e1.employee_id, e1.name...*/
ORDER BY employee_id; /* & Ordering w.r.t. employee_id...*/
