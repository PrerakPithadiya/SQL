-- This query retrieves user activity data for the past 30 days
-- It counts the number of unique active users for each day within the specified date range
-- Select the activity date and count of distinct users
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    -- Filter for activities within the last 30 days
    -- Note: The date range is hardcoded and may need to be updated for different scenarios
    activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY
    -- Group the results by day to get daily active user counts
    activity_date;

-- Query explanation:
-- 1. We select from the Activity table
-- 2. We count distinct user_ids to avoid counting the same user multiple times per day
-- 3. We filter for activities within a 30-day period (adjust dates as needed)
-- 4. We group by activity_date to get daily counts
-- 5. The result shows the number of active users for each day in the specified period
-- Note: Ensure that the Activity table contains the necessary columns (activity_date, user_id)
-- and that the date range is appropriate for your specific use case.