-- This SQL query retrieves the product prices as of '2019-08-16' for all products in the Products table.
-- It handles cases where a product has price changes before the given date and products without any price changes.
WITH
    -- CTE to get the latest price for each product before or on '2019-08-16'
    LatestPrices AS (
        SELECT
            product_id,
            new_price,
            change_date,
            ROW_NUMBER() OVER (
                PARTITION BY
                    product_id
                ORDER BY
                    change_date DESC
            ) AS rn
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
    ),
    -- CTE to combine latest prices and products without price changes
    LatestPricesBeforeDate AS (
        -- Select products with price changes
        SELECT
            product_id,
            COALESCE(new_price, 10) AS price -- Use new_price if available, otherwise default to 10
        FROM
            LatestPrices
        WHERE
            rn = 1
        UNION
        -- Select products without price changes
        SELECT DISTINCT
            product_id,
            10 AS price -- Default price for products without changes
        FROM
            Products
        WHERE
            product_id NOT IN (
                SELECT DISTINCT
                    product_id
                FROM
                    LatestPrices
            )
    )
    -- Main query to select and order the final results
SELECT
    product_id,
    price
FROM
    LatestPricesBeforeDate
ORDER BY
    product_id;

-- Query Explanation:
-- 1. LatestPrices CTE:
--    - Selects all price changes up to '2019-08-16'
--    - Uses ROW_NUMBER() to rank price changes for each product
-- 2. LatestPricesBeforeDate CTE:
--    - Combines latest prices for products with changes and default prices for products without changes
--    - Uses COALESCE to handle NULL values and set default price to 10
-- 3. Main SELECT:
--    - Retrieves the final product_id and price from the LatestPricesBeforeDate CTE
--    - Orders the results by product_id
-- Note: This query assumes that the Products table contains columns: product_id, new_price, and change_date