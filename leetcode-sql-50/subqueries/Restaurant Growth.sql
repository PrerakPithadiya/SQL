-- Restaurant Growth Query
-- This query calculates the moving 7-day sales average for a restaurant
-- Select distinct visited dates, total amount, and average amount
SELECT DISTINCT
    visited_on,
    SUM(amount) OVER w AS amount,
    ROUND((SUM(amount) OVER w) / 7, 2) AS average_amount
FROM
    customer
    -- Define a named window for the moving 7-day period
WINDOW
    w AS (
        ORDER BY
            visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING
            AND CURRENT ROW
    )
    -- Limit the results to exclude the first 6 days (as they don't have full 7-day data)
    -- and include all subsequent days (represented by a large number like 999)
LIMIT
    6, 999
    -- Notes:
    -- 1. The query uses a window function to calculate the moving sum and average.
    -- 2. The DISTINCT keyword is used to avoid duplicate rows for dates with multiple transactions.
    -- 3. The window 'w' is defined to include the current row and 6 preceding days.
    -- 4. The LIMIT clause skips the first 6 days and includes all subsequent days.
    -- 5. The average amount is calculated by dividing the 7-day sum by 7 and rounding to 2 decimal places.
    -- Potential Improvements:
    -- 1. Consider adding error handling for cases where there's insufficient data.
    -- 2. Optimize performance for large datasets by adding appropriate indexes.
    -- 3. Implement date range parameters for more flexible reporting.