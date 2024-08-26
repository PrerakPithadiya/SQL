-- Monthly Transactions I
-- This query analyzes transaction data on a monthly basis for each country.
-- It provides various metrics including total transactions, approved transactions,
-- total transaction amount, and approved transaction amount.
-- The results are grouped by month (in YYYY-MM format) and country.
SELECT
    -- Format the transaction date to YYYY-MM
    DATE_FORMAT (trans_date, '%Y-%m') AS month,
    country,
    -- Count total number of transactions
    COUNT(*) AS trans_count,
    -- Count approved transactions
    SUM(
        CASE
            WHEN state = 'approved' THEN 1
            ELSE 0
        END
    ) AS approved_count,
    -- Sum total transaction amount
    SUM(amount) AS trans_total_amount,
    -- Sum approved transaction amount
    SUM(
        CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM
    Transactions
GROUP BY
    -- Group by month and country
    DATE_FORMAT (trans_date, '%Y-%m'),
    country;

-- This query helps in analyzing:
-- 1. Transaction trends over time for each country
-- 2. Approval rates of transactions
-- 3. Total transaction volumes and approved transaction volumes
-- 4. Comparison of transaction metrics across different countries
-- Note: Ensure that the 'Transactions' table contains the following columns:
-- - trans_date: Date of the transaction
-- - country: Country where the transaction occurred
-- - state: State of the transaction (e.g., 'approved', 'declined')
-- - amount: Transaction amount