-- Friend Requests II: Who Has The Most Friends
-- This query determines which user has the most friends based on accepted friend requests.
-- Common Table Expressions (CTEs)
WITH
    -- FriendsCount CTE: Counts friends for each user, considering both requester and accepter roles
    FriendsCount AS (
        -- Count friends for users who sent requests
        SELECT
            requester_id AS id,
            COUNT(DISTINCT accepter_id) AS num
        FROM
            RequestAccepted
        GROUP BY
            requester_id
        UNION ALL
        -- Count friends for users who accepted requests
        SELECT
            accepter_id AS id,
            COUNT(DISTINCT requester_id) AS num
        FROM
            RequestAccepted
        GROUP BY
            accepter_id
    ),
    -- TotalFriends CTE: Calculates the total number of friends for each user
    TotalFriends AS (
        SELECT
            id,
            SUM(num) AS total_friends
        FROM
            FriendsCount
        GROUP BY
            id
    )
    -- Main Query: Selects the user with the most friends
SELECT
    id,
    total_friends AS num
FROM
    TotalFriends
ORDER BY
    total_friends DESC
LIMIT
    1;

-- Query Explanation:
-- 1. FriendsCount CTE: 
--    - Counts friends for each user in two parts:
--      a) As a requester: counts distinct accepters
--      b) As an accepter: counts distinct requesters
--    - Uses UNION ALL to combine both counts
-- 2. TotalFriends CTE:
--    - Aggregates the friend counts from FriendsCount
--    - Calculates the total number of friends for each user
-- 3. Main Query:
--    - Selects the user ID and their total number of friends
--    - Orders the results by the total number of friends in descending order
--    - Limits the output to 1 row, effectively selecting the user with the most friends
-- Note: This query assumes that the RequestAccepted table contains all accepted friend requests,
-- with columns requester_id and accepter_id representing the users involved in each request.