-- This SQL query calculates the average selling price for each product
-- Common Table Expressions (CTEs)
-- Revenue CTE: Joins Prices and UnitsSold tables to get price and units for each product
WITH
    Revenue AS (
        SELECT
            p.product_id,
            p.price,
            u.units
        FROM
            Prices p
            LEFT JOIN UnitsSold u ON p.product_id = u.product_id
            AND u.purchase_date BETWEEN p.start_date AND p.end_date
    ),
    -- Aggregated CTE: Calculates total revenue and total units sold for each product
    Aggregated AS (
        SELECT
            product_id,
            COALESCE(SUM(price * units), 0) AS total_revenue,
            COALESCE(SUM(units), 0) AS total_units
        FROM
            Revenue
        GROUP BY
            product_id
    ),
    -- Final CTE: Calculates the average price for each product
    Final AS (
        SELECT
            p.product_id,
            ROUND(
                COALESCE(total_revenue / NULLIF(total_units, 0), 0),
                2
            ) AS average_price
        FROM
            (
                SELECT DISTINCT
                    product_id
                FROM
                    Prices
            ) p
            LEFT JOIN Aggregated a ON p.product_id = a.product_id
    )
    -- Main query: Selects the product_id and average_price from the Final CTE
SELECT
    product_id,
    average_price
FROM
    Final;

-- Notes:
-- 1. The Revenue CTE joins Prices and UnitsSold tables to get price and units for each product within the valid date range.
-- 2. The Aggregated CTE calculates total revenue and total units sold for each product.
-- 3. The Final CTE calculates the average price for each product, handling cases where there are no units sold.
-- 4. COALESCE and NULLIF functions are used to handle potential NULL values and division by zero.
-- 5. The main query selects the final results from the Final CTE.
-- 6. This query ensures that all products from the Prices table are included in the result, even if they have no sales.