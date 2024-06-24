Table: Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.

Approach and Explanation:
• To categorize the bank accounts based on their income into "Low Salary," "Average Salary,"
  and "High Salary," we use three separate 'SELECT' statements with 'UNION to combine the results.
• Each SELECT statement counts the number of accounts within the respective salary range: 
  less than $20000 for "Low Salary," between $20000 and $50000 inclusive for "Average Salary," and greater than $50000 for "High Salary."
• By using UNION', we ensure that all three categories are included in the final result, even if there are no accounts in a particular category.
• This approach ensures that each salary category is represented with the correct count of accounts.

-- solution  
SELECT
"High Salary" AS category,
COUNT(*) AS accounts_count
FROM accounts
WHERE income>50000
UNION
SELECT
"Average Salary" AS category, COUNT(*) AS accounts_count
FROM accounts
WHERE income BETWEEN 20000 AND 50000
UNION
SELECT
"Low Salary" AS category,
COUNT(*) AS accounts_count
FROM accounts
WHERE income<20000;
