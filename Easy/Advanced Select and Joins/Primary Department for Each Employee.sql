Table: Employee

+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+
(employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
employee_id is the id of the employee.
department_id is the id of the department to which the employee belongs.
primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.
 

Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+
Output: 
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+
Explanation: 
- The Primary department for employee 1 is 1.
- The Primary department for employee 2 is 1.
- The Primary department for employee 3 is 3.
- The Primary department for employee 4 is 3.

  Approach and Explanation:
To find the primary department for each employee, we handle two cases: 
employees with multiple departments and those with only one. For employees with multiple departments,
we select the row where primary_flag is 'Y'. For employees with only one department, we select that department.
The query checks if the primary_flag is 'Y' or if the employee has only one department, then retrieves the relevant department details for each employee.
Solution:
SELECT employee_id, department_id FROM Employee
WHERE
primary_flag = 'Y' OR
employee_id in (SELECT employee_id FROM Employee
Group by employee_id HAVING count(employee_id)=1)
-- 2nd Method
SELECT DISTINCT employee_id, / * show distinct employee_id from Employee Table...*/
department_id /* also show department_id from Employee Table...*/
FROM Employee /*Association from Employee Table...*/
WHERE employee_id IN /*We are going to write sub sql query for employee_id...*/
(SELECT employee_id
FROM Employee /*show employee_id from Employee Table...*/
GROUP BY employee_id /*grouping w.r.t. employee_id...*/
HAVING COUNT(*) = 1) /*Using Aggregate function count to count employee who is single (Condition given in problem)...*/
OR primary_flag = 'Y' /*  or primary_flag should be 'Y'....*/
ORDER BY employee_id; /* Ordering w.r.t. employee_id...*/
