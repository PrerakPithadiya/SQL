-- This query retrieves information about movies from the Cinema table
-- that meet specific criteria and orders them by rating.

-- Select columns:
-- id: Unique identifier for each movie
-- movie: Name of the movie
-- description: Brief description of the movie
-- rating: Numerical rating of the movie
SELECT
    id,
    movie,
    description,
    rating
FROM
    Cinema
WHERE
    id % 2 = 1  -- Filter for odd-numbered IDs
    -- This condition ensures that only movies with odd-numbered IDs are selected
    -- It uses the modulo operator (%) to check if the ID is odd (remainder 1 when divided by 2)
    
    AND description <> 'boring'  -- Exclude movies with description 'boring'
    -- This condition filters out any movies that have the description 'boring'
    -- The '<>' operator is used for "not equal to" comparison

ORDER BY
    rating DESC;  -- Order by rating in descending order
    -- This sorts the results by the rating column in descending order (highest to lowest)
    -- DESC keyword is used to specify descending order

-- Note: This query is useful for finding highly-rated, non-boring movies with odd-numbered IDs
-- It can be particularly helpful for movie recommendation systems or for analyzing movie data
