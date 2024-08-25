-- Product Sales Analysis I
-- This query retrieves product sales information by joining the Sales and Product tables
-- Select columns:
-- 1. product_name: The name of the product from the Product table
-- 2. year: The year of the sale from the Sales table
-- 3. price: The price of the product for that sale from the Sales table
SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales s
    -- Join the Sales table with the Product table using product_id as the joining key
    JOIN Product p ON s.product_id = p.product_id;

-- Purpose:
-- This query provides a comprehensive view of product sales, combining information
-- from both the Sales and Product tables. It allows for analysis of product performance
-- across different years and at various price points.
-- Tables used:
-- 1. Sales (s): Contains transaction data including product_id, year, and price
-- 2. Product (p): Contains product information including product_id and product_name
-- Join explanation:
-- The JOIN clause connects the Sales and Product tables based on the product_id,
-- ensuring that each sale is associated with the correct product information.
-- Output:
-- The query returns a result set with three columns:
-- 1. product_name: String - The name of the product sold
-- 2. year: Integer - The year in which the sale occurred
-- 3. price: Decimal - The price at which the product was sold
-- Note:
-- This query assumes that there is a one-to-one relationship between Sales and Product
-- based on product_id. If there are multiple sales for the same product, each sale
-- will appear as a separate row in the result set.