-- This query retrieves sales data grouped by date, including the number of unique products sold and a list of products
-- Table: Activities
-- Columns used: sell_date, product
SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG (
        DISTINCT product,
        ','
        ORDER BY
            product ASC
    ) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;

-- Explanation:
-- 1. SELECT clause:
--    - sell_date: The date of the sale
--    - COUNT(DISTINCT product) AS num_sold: Counts the number of unique products sold on each date
--    - STRING_AGG(DISTINCT product, ',' ORDER BY product ASC) AS products: 
--      Concatenates distinct product names into a comma-separated list, ordered alphabetically
-- 2. FROM clause:
--    - Specifies the source table 'Activities'
-- 3. GROUP BY clause:
--    - Groups the results by sell_date to aggregate data for each unique date
-- 4. ORDER BY clause:
--    - Sorts the final result set by sell_date in ascending order
-- Note: This query uses STRING_AGG instead of GROUP_CONCAT for better compatibility across different SQL dialects