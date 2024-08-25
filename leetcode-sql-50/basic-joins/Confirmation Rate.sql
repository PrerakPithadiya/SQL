-- This query calculates the confirmation rate for each user in the Signups table
-- The confirmation rate is the ratio of 'confirmed' actions to total actions in the Confirmations table
SELECT
    s.user_id,
    ROUND(
        COALESCE(
            SUM(
                CASE
                    WHEN c.action = 'confirmed' THEN 1
                    ELSE 0
                END
            ) / COUNT(c.action),
            0
        ),
        2
    ) AS confirmation_rate
FROM
    Signups s
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY
    s.user_id;

-- Explanation:
-- 1. We start with the Signups table (s) to ensure we include all users, even those without confirmations
-- 2. We LEFT JOIN with the Confirmations table (c) to include all confirmation attempts
-- 3. The CASE statement counts 'confirmed' actions
-- 4. SUM(CASE...) / COUNT(c.action) calculates the ratio of confirmed to total actions
-- 5. COALESCE handles cases where a user has no confirmation attempts, defaulting to 0
-- 6. ROUND(..., 2) formats the result to two decimal places
-- 7. We GROUP BY s.user_id to get a result for each user
-- Note: This query assumes that 'confirmed' is the only positive action in the Confirmations table
-- If there are other positive actions, the CASE statement should be adjusted accordingly