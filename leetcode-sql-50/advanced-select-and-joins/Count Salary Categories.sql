-- This SQL query categorizes accounts based on their income levels and counts the number of accounts in each category.
-- The categories are defined as follows:
-- - Low Salary: income < 20000
-- - Average Salary: 20000 <= income <= 50000
-- - High Salary: income > 50000
-- The query uses UNION ALL to combine the results of three separate SELECT statements,
-- one for each salary category.
SELECT
    'Low Salary' AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income < 20000
UNION ALL
SELECT
    'Average Salary' AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income BETWEEN 20000 AND 50000
UNION ALL
SELECT
    'High Salary' AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income > 50000;

-- The result set will have two columns:
-- 1. category: A string indicating the salary category (Low, Average, or High)
-- 2. accounts_count: The number of accounts in each category
-- Note: This query assumes that the 'Accounts' table exists and has an 'income' column.
-- The query will return three rows, one for each salary category, even if a category has zero accounts.