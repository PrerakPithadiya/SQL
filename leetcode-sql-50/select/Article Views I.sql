-- This query retrieves distinct author IDs who have viewed their own articles
-- It selects from the Views table and orders the results by ID
-- Select distinct author IDs
SELECT DISTINCT
    author_id AS id
FROM
    Views
WHERE
    -- Filter for cases where the author viewed their own article
    author_id = viewer_id
ORDER BY
    -- Sort the results by ID in ascending order
    id;

-- Note: This query is useful for identifying authors who engage with their own content,
-- which could be valuable for analyzing user behavior or content engagement metrics.