-- This query calculates the quality and poor query percentage for each query name
-- It uses aggregate functions and conditional logic to compute the required metrics
-- Select the query name and calculate the quality and poor query percentage
SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        AVG(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name
    -- Explanation of the query:
    -- 1. We select from the Queries table
    -- 2. We group the results by query_name to get metrics for each unique query
    -- 3. We filter out any rows where query_name is NULL to ensure data integrity
    -- 4. For each group (query_name), we calculate:
    --    a. Quality: The average of (rating / position), rounded to 2 decimal places
    --    b. Poor Query Percentage: The percentage of queries with a rating less than 3,
    --       calculated as an average of a CASE statement (1 for poor queries, 0 for others),
    --       multiplied by 100 and rounded to 2 decimal places
    -- Note: This query assumes that the Queries table contains columns:
    -- query_name, rating, and position