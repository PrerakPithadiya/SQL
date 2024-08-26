-- This query calculates the percentage of users who have registered for each contest
-- and orders the results by percentage in descending order and contest_id in ascending order.
-- Main query
SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / (
            SELECT
                COUNT(*)
            FROM
                Users
        ),
        2
    ) AS percentage
FROM
    Register r
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;

-- Explanation of the query:
-- 1. We select the contest_id from the Register table.
-- 2. We calculate the percentage of users who registered for each contest:
--    a. Count the distinct users who registered for the contest
--    b. Multiply by 100.0 to convert to a percentage
--    c. Divide by the total number of users (subquery in the denominator)
--    d. Round the result to 2 decimal places
-- 3. We group the results by contest_id to get one row per contest
-- 4. We order the results by:
--    a. Percentage in descending order (highest percentage first)
--    b. Contest_id in ascending order (to break ties in percentage)
-- Note: This query assumes that:
-- - The Register table contains columns: contest_id and user_id
-- - The Users table contains all users
-- - A user can register for multiple contests
-- - We want to include contests even if no users have registered for them