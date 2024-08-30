-- Delete Duplicate Emails
-- This SQL query deletes duplicate email entries from the Person table,
-- keeping only the entry with the lowest ID for each unique email address.
-- Common Table Expression (CTE) to identify duplicate entries
WITH
    cte AS (
        SELECT
            id
        FROM
            Person
        WHERE
            id NOT IN (
                -- Subquery to find the minimum ID for each email
                SELECT
                    MIN(id)
                FROM
                    Person
                GROUP BY
                    email
            )
    )
    -- Delete statement to remove duplicate entries
DELETE FROM Person
WHERE
    id IN (
        -- Subquery to select IDs from the CTE
        SELECT
            id
        FROM
            cte
    );

-- Explanation:
-- 1. The CTE 'cte' identifies all IDs that are not the minimum ID for each email.
-- 2. The DELETE statement removes all rows from the Person table where the ID
--    is present in the CTE, effectively deleting all duplicate email entries
--    except for the one with the lowest ID.
-- 3. This approach ensures that only one entry per unique email address remains
--    in the Person table after execution.
-- Note: This query assumes that the Person table has 'id' and 'email' columns,
-- and that 'id' is the primary key of the table.