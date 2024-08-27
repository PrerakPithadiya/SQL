-- This SQL query retrieves the sales information for each product's first year of sale.
-- Common Table Expression (CTE) to find the first year of sale for each product
WITH
    FirstYearSales AS (
        SELECT
            product_id,
            MIN(year) AS first_year
        FROM
            Sales
        GROUP BY
            product_id
    )
    -- Main query to fetch the sales details for the first year of each product
SELECT
    s.product_id, -- Product ID
    f.first_year, -- First year of sale for the product
    s.quantity, -- Quantity sold in the first year
    s.price -- Price of the product in the first year
FROM
    Sales s
    JOIN FirstYearSales f ON s.product_id = f.product_id
    AND s.year = f.first_year;

-- Query Explanation:
-- 1. The CTE 'FirstYearSales' finds the earliest year of sale for each product.
-- 2. The main SELECT statement joins the Sales table with the FirstYearSales CTE.
-- 3. The JOIN condition ensures that we only get the sales data for the first year of each product.
-- 4. The result includes the product ID, first year of sale, quantity sold, and price for that year.
-- Note: This query assumes that the 'Sales' table contains columns for product_id, year, quantity, and price.
-- It's designed to work with databases that support Common Table Expressions (CTEs).