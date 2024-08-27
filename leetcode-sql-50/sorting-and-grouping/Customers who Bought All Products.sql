-- Customers who Bought All Products
-- This SQL query identifies customers who have purchased all available products.
-- It uses Common Table Expressions (CTEs) to break down the problem into manageable steps.
-- Step 1: Get the total number of distinct products
WITH
    TotalProducts AS (
        SELECT
            COUNT(DISTINCT product_key) AS total_products
        FROM
            Product
    ),
    -- Step 2: Count the number of distinct products each customer bought
    CustomerProductCounts AS (
        SELECT
            customer_id,
            COUNT(DISTINCT product_key) AS bought_products
        FROM
            Customer
        GROUP BY
            customer_id
    )
    -- Step 3: Select customers who bought all the products
SELECT
    c.customer_id
FROM
    CustomerProductCounts c
    JOIN TotalProducts t ON c.bought_products = t.total_products;

-- Explanation:
-- 1. TotalProducts CTE:
--    - Calculates the total number of unique products available in the Product table.
--    - This gives us a baseline to compare against each customer's purchases.
-- 2. CustomerProductCounts CTE:
--    - Counts the number of distinct products each customer has bought.
--    - Groups the results by customer_id to get a count for each customer.
-- 3. Final SELECT statement:
--    - Joins the CustomerProductCounts with TotalProducts.
--    - The JOIN condition ensures we only select customers whose number of bought products
--      matches the total number of available products.
--    - This effectively filters for customers who have bought all available products.
-- Note: This query assumes that each entry in the Customer table represents a unique product purchase.
-- If a customer can buy the same product multiple times, this query will still work correctly
-- due to the use of COUNT(DISTINCT product_key).
-- Performance considerations:
-- - Using CTEs improves readability and maintainability of the code.
-- - The use of COUNT(DISTINCT) may impact performance on very large datasets.
--   In such cases, consider using subqueries or temporary tables for optimization.
-- Potential improvements:
-- - Add error handling for edge cases (e.g., no products in the Product table).
-- - Consider adding a date range filter if historical data analysis is needed.