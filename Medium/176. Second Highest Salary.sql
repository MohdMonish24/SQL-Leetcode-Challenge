Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+

Query
WITH highest_salary AS (
    SELECT MAX(salary) AS salary
    FROM Employee
)
SELECT MAX(salary) AS "SecondHighestSalary" 
FROM Employee
WHERE salary < (SELECT salary FROM highest_salary);


Explanation
WITH highest_salary AS (...): This is the CTE part of the query. It creates a temporary result set named highest_salary that is used in the subsequent SELECT statement. The CTE calculates the maximum salary from the Employee table and labels it as salary.

SELECT MAX(salary) AS "SecondHighestSalary" FROM Employee WHERE salary < (SELECT salary FROM highest_salary): This is the main query that uses the result of the CTE.
It selects the maximum salary from the Employee table where the salary is less than the highest salary found in the CTE.
This effectively gives you the second highest salary because it excludes the highest salary from the calculation.

What is performand in this query
Not using ORDER BY clause
ORDER BY clause, is an expensive clause. The cost of this is O(nlog(n))
Saving subquery with CTE
Utility of CTE it's saving the result of subquery SELECT MAX(salary) FROM Employee and avoid execution of MAX function each time
