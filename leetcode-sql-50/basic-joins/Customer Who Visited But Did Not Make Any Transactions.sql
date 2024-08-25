-- This query retrieves customers who visited but did not make any transactions
-- It counts the number of visits without transactions for each customer
-- Select the customer ID and count of visits without transactions
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE
    t.visit_id IS NULL -- Filter for visits without transactions
GROUP BY
    v.customer_id;

-- Explanation:
-- 1. We start with the Visits table (v) as our base
-- 2. We perform a LEFT JOIN with the Transactions table (t) on visit_id
-- 3. The WHERE clause filters for visits where there's no matching transaction (t.visit_id IS NULL)
-- 4. We then GROUP BY customer_id to get results for each customer
-- 5. COUNT(v.visit_id) gives us the number of visits without transactions for each customer
-- Note: This query assumes that:
--   - The Visits table contains all customer visits
--   - The Transactions table contains all transactions
--   - A NULL value in t.visit_id after the LEFT JOIN indicates no transaction for that visit