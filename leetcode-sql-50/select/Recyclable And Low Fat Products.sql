-- This query retrieves product IDs for items that are both low fat and recyclable
-- Table: products
-- Columns used:
--   - product_id: Unique identifier for each product
--   - low_fats: Indicates if the product is low fat ('Y' for yes, 'N' for no)
--   - recyclable: Indicates if the product is recyclable ('Y' for yes, 'N' for no)
-- Filters:
--   - low_fats = 'Y': Selects only low fat products
--   - recyclable = 'Y': Selects only recyclable products
-- Result: A list of product IDs that meet both criteria
SELECT
    product_id
FROM
    products
WHERE
    low_fats = 'Y'
    AND recyclable = 'Y';