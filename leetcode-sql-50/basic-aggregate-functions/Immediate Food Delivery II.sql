-- Immediate Food Delivery II
-- This SQL query calculates the percentage of immediate orders among all first orders for each customer.
-- An order is considered immediate if the customer's preferred delivery date matches the order date.
-- The query is structured in three main parts using Common Table Expressions (CTEs):
WITH
    FirstOrders AS (
        -- Step 1: Identify the first order for each customer
        -- This CTE finds the earliest order date for each customer
        SELECT
            customer_id,
            MIN(order_date) AS first_order_date
        FROM
            Delivery
        GROUP BY
            customer_id
    ),
    ImmediateOrders AS (
        -- Step 2: Determine if the first order is immediate
        -- This CTE joins the Delivery table with the FirstOrders CTE to check if the first order is immediate
        -- An order is immediate if the order_date matches the customer_pref_delivery_date
        SELECT
            d.customer_id,
            CASE
                WHEN d.order_date = d.customer_pref_delivery_date THEN 1
                ELSE 0
            END AS is_immediate
        FROM
            Delivery d
            JOIN FirstOrders fo ON d.customer_id = fo.customer_id
            AND d.order_date = fo.first_order_date
    )
    -- Step 3: Calculate the percentage of immediate first orders
    -- This final step computes the percentage of immediate orders among all first orders
    -- The result is rounded to two decimal places
SELECT
    ROUND(SUM(is_immediate) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM
    ImmediateOrders;

-- Note: This query assumes the existence of a 'Delivery' table with columns:
-- customer_id, order_date, and customer_pref_delivery_date
-- The result of this query will be a single value representing the percentage of
-- immediate first orders across all customers.