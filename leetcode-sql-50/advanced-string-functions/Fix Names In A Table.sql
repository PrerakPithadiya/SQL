-- Fix Names In A Table
-- This query capitalizes the first letter of each name and makes the rest lowercase
-- Select the user_id and the modified name
SELECT
    user_id,
    CONCAT (
        UPPER(SUBSTRING(name, 1, 1)), -- Capitalize the first letter
        LOWER(SUBSTRING(name, 2)) -- Make the rest of the name lowercase
    ) AS name
FROM
    Users
ORDER BY
    user_id;

-- Explanation:
-- 1. We select the user_id column as is
-- 2. We use CONCAT to join two parts of the name:
--    a. UPPER(SUBSTRING(name, 1, 1)) capitalizes the first letter
--    b. LOWER(SUBSTRING(name, 2)) makes the rest of the name lowercase
-- 3. We alias this concatenated result as 'name'
-- 4. We select from the Users table
-- 5. We order the results by user_id in ascending order
-- Note: This query assumes that the 'name' column in the Users table
-- contains at least one character. If there's a possibility of empty
-- names, additional error handling might be necessary.