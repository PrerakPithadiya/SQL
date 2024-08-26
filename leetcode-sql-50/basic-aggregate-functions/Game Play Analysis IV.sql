-- Game Play Analysis IV
-- This query calculates the fraction of players who logged in for two consecutive days
-- starting from their first login date.
-- Step 1: Identify the first login date for each player
WITH
    FirstLogin AS (
        SELECT
            player_id,
            MIN(event_date) AS first_login_date
        FROM
            Activity
        GROUP BY
            player_id
    ),
    -- Step 2: Check if the player logged in on the day after the first login
    NextDayLogin AS (
        SELECT
            f.player_id
        FROM
            FirstLogin f
            JOIN Activity a ON f.player_id = a.player_id
            AND a.event_date = DATE_ADD (f.first_login_date, INTERVAL 1 DAY)
    )
    -- Step 3: Calculate the fraction of players who logged in again the day after their first login
SELECT
    -- Use ROUND to limit the result to 2 decimal places
    -- Multiply by 1.0 to ensure floating-point division
    ROUND(
        COUNT(DISTINCT n.player_id) * 1.0 / COUNT(DISTINCT f.player_id),
        2
    ) AS fraction
FROM
    FirstLogin f
    LEFT JOIN NextDayLogin n ON f.player_id = n.player_id;

-- Notes:
-- - The FirstLogin CTE finds the earliest login date for each player.
-- - The NextDayLogin CTE identifies players who logged in the day after their first login.
-- - The main query calculates the fraction by dividing the count of players who logged in 
--   the next day by the total count of players, then rounds to 2 decimal places.
-- - A LEFT JOIN is used to include all players, even those who didn't log in the next day.
-- - DISTINCT is used to avoid counting duplicate logins on the same day.