Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
In SQL, employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 
 

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.

The result format is in the following example.

 

Example 1:

Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

Explanation: 
The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
Kalel's manager is employee 11, who is still in the company (Joziah).
Joziah's manager is employee 6, who left the company because there is no row for employee 6 as it was deleted.

Approach and Explanation:
To find the employees whose salary is strictly less than $30000 and whose manager has left the company,
we first need to identify employees meeting the salary condition.
Then, we check if their manager's ID does not exist in the `employee_id` column of the Employees table,indicating the manager has left the company.
This is achieved by using a NOT IN` clause to exclude manager IDs present in the current Employees table.
Finally, we order the results by employee_id` to match the required output format.
This approach ensures that we only return the IDs of employees whose managers are no longer listed in the company records.


# Write your MySQL query statement below
SELECT employee_id   /* show employee_id from Employees table.. */
FROM employees        /*Association from Employees table.. */
WHERE salary<30000 AND   /* Condition given in the problem...*/
manager_id NOT IN          /*Using sub sql query for manager_id acc. to condition given in the problem... */
(SELECT employee_id FROM employees)    /*don't need to consider those managers which are present in Employees Table in sub sql query... */
ORDER BY employee_id;    /*Ordering w.r.t. employee_id.. */


-- Using Join
SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.salary < 30000 AND e2.employee_id IS NULL AND e1.manager_id IS NOT NULL
ORDER BY employee_id;
