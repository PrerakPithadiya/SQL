-- This query selects tweet IDs for tweets with content longer than 15 characters
-- Table: Tweets
-- Columns used:
--   - tweet_id: Unique identifier for each tweet
--   - content: The text content of the tweet
-- 
-- The LENGTH function is used to measure the character count of the content
-- Tweets with content longer than 15 characters are considered invalid
-- 
-- Note: This query assumes that the 'content' column allows NULL values
-- If 'content' can be NULL, you might want to add a NULL check to the WHERE clause
SELECT
    tweet_id
FROM
    Tweets
WHERE
    LENGTH (content) > 15;