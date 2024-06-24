Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
Approach and Explanation:
To determine if three line segments can form a triangle, we use the triangle inequality theorem,
which states that the sum of any two sides must be greater than the third side.
We apply this rule by checking if x + yz, y + z > x, and x + zy. If all these conditions are met,
the segments can form a triangle; otherwise, they cannot.
The query selects each row and evaluates these conditions using a CASE statement to return 'Yes' or 'No' accordingly.
Solution:
SELECT
x, y, z, CASE WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes'
ELSE 'No' end AS triangle
FROM triangle

-- Intuition
SELECT *, /*Show all records from Triangle Table*/
IF(x + y > z AND y + z > x AND x + z > y, "Yes", "No") /* Condition for formation a triangle (Addition of two sides always greater than remaining side)... if condition satisfies then Yes it's triangle otherwise No it's not a triangle...*/
FROM Triangle; /*Association from Triangle Table...*/
