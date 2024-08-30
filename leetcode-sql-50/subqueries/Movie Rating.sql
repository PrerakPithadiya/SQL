-- This SQL query retrieves the top user who has rated the most movies
-- and the top-rated movie in February 2020.
-- Common Table Expressions (CTEs)
-- UserMovieCounts: Counts the number of distinct movies rated by each user
WITH
    UserMovieCounts AS (
        SELECT
            u.name AS user_name,
            COUNT(DISTINCT mr.movie_id) AS movie_count
        FROM
            Users u
            JOIN MovieRating mr ON u.user_id = mr.user_id
        GROUP BY
            u.name
    ),
    -- TopUser: Selects the user who has rated the most movies
    -- In case of a tie, it selects the user with the lexicographically smaller name
    TopUser AS (
        SELECT
            TOP 1 user_name
        FROM
            UserMovieCounts
        ORDER BY
            movie_count DESC,
            user_name
    ),
    -- MovieRatingsInFeb: Calculates the average rating for each movie in February 2020
    MovieRatingsInFeb AS (
        SELECT
            m.title AS movie_title,
            AVG(mr.rating) AS avg_rating
        FROM
            MovieRating mr
            JOIN Movies m ON mr.movie_id = m.movie_id
        WHERE
            mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY
            m.title
    ),
    -- TopMovie: Selects the highest-rated movie in February 2020
    -- In case of a tie, it selects the movie with the lexicographically smaller title
    TopMovie AS (
        SELECT
            TOP 1 movie_title
        FROM
            MovieRatingsInFeb
        ORDER BY
            avg_rating DESC,
            movie_title
    )
    -- Main Query
    -- Combines the results of TopUser and TopMovie using UNION ALL
SELECT
    (
        SELECT
            user_name
        FROM
            TopUser
    ) AS results
UNION ALL
SELECT
    (
        SELECT
            movie_title
        FROM
            TopMovie
    ) AS results;

-- Note: This query assumes the existence of the following tables:
-- 1. Users (user_id, name)
-- 2. Movies (movie_id, title)
-- 3. MovieRating (user_id, movie_id, rating, created_at)
-- The query will return two rows:
-- 1. The name of the user who has rated the most movies
-- 2. The title of the highest-rated movie in February 2020