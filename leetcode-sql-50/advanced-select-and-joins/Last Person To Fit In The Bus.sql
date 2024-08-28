-- This SQL query finds the last person who can fit on a bus with a weight limit of 1000 units.
-- It uses Common Table Expressions (CTEs) and window functions to solve the problem efficiently.
-- CTE to sort the queue based on turn order
WITH
    SortedQueue AS (
        SELECT
            person_name,
            weight,
            turn
        FROM
            Queue
        ORDER BY
            turn
    ),
    -- CTE to calculate cumulative weights for each person in the queue
    AccumulateWeights AS (
        SELECT
            person_name,
            weight,
            SUM(weight) OVER (
                ORDER BY
                    turn ROWS BETWEEN UNBOUNDED PRECEDING
                    AND CURRENT ROW
            ) AS total_weight
        FROM
            SortedQueue
    )
    -- Main query to select the last person who can fit on the bus
SELECT
    person_name
FROM
    AccumulateWeights
WHERE
    total_weight <= 1000 -- Ensure the total weight doesn't exceed the bus capacity
ORDER BY
    total_weight DESC -- Sort in descending order to get the last person
LIMIT
    1;

-- Retrieve only the last person who fits