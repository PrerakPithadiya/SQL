-- List The Products Ordered In A Period
-- This query retrieves product names and their total ordered units within a specific date range
-- Select the product name and sum of ordered units
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM
    Products p
    JOIN Orders o ON p.product_id = o.product_id
WHERE
    -- Filter orders within February 2020
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    p.product_id,
    p.product_name
HAVING
    -- Only include products with 100 or more total units ordered
    SUM(o.unit) >= 100;

-- Query Explanation:
-- 1. JOIN: Combines the Products and Orders tables based on product_id
-- 2. WHERE: Filters orders to include only those from February 2020
-- 3. GROUP BY: Groups the results by product_id and product_name
-- 4. HAVING: Filters the grouped results to include only products with 100 or more total units ordered
-- 5. The query returns the product name and the total number of units ordered for each qualifying product
-- Note: This query assumes that the 'Products' and 'Orders' tables exist and have the necessary columns (product_id, product_name, order_date, unit)