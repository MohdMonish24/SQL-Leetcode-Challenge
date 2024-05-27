
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).


EASY 3 METHOD 🔥||MYSQL || DATEDIFF/ JOIN/ SUB

Approach-:
DATEDIFF function returns the difference between two dates in terms of the specified datepart. 
The syntax for DATEDIFF is as follows:
DATEDIFF(datepart,startdate,enddate)

In the problem, the datepart will be day (other dateparts can be found here)
The startdate will be the previous date
The enddate will be the next date
The DATEDIFF should be 1, i.e., there is 1 day difference between our startdate and enddate

  
Code 1 (datediff)
SELECT w2.id from Weather w1,Weather w2
WHERE datediff(w2.recordDate, w1.recordDate) = 1 AND w2.temperature > w1.temperature;
#where datediff -> date difference b/w two dates

Code 2 (join)
SELECT w2.id from Weather w1 JOIN Weather w2
ON w2.temperature > w1.temperature AND
datediff(w2.recordDate,w1.recordDate) = 1;

Code 3 (subdate)
SELECT w2.id from Weather w1, Weather w2
WHERE w2.temperature > w1.temperature AND
subdate(w2.recordDate, 1) = w1.recordDate;
#where subdate -> subtract date 
