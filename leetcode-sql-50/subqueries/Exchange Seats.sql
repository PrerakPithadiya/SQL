-- Exchange Seats
-- This query swaps the seats of adjacent students, except for the last student if there's an odd number of students.
-- Main query to select and order the results
SELECT
    id,
    student
FROM
    (
        -- Subquery to perform the seat swapping logic
        SELECT
            CASE
            -- For odd-numbered seats, swap with the next seat if it exists
                WHEN MOD(id, 2) = 1
                AND id + 1 IN (
                    SELECT
                        id
                    FROM
                        Seat
                ) THEN id + 1
                -- For even-numbered seats, swap with the previous seat
                WHEN MOD(id, 2) = 0 THEN id - 1
                -- For the last odd-numbered seat (if exists), keep it as is
                ELSE id
            END AS id,
            student
        FROM
            Seat
    ) AS SwappedSeats
ORDER BY
    id;

-- Explanation:
-- 1. The inner subquery uses a CASE statement to determine how to swap the seats:
--    - For odd-numbered seats (MOD(id, 2) = 1), it checks if the next seat exists and swaps with it.
--    - For even-numbered seats (MOD(id, 2) = 0), it swaps with the previous seat.
--    - For the last odd-numbered seat (if the total number of students is odd), it keeps the original seat.
-- 2. The subquery is aliased as 'SwappedSeats' to be used in the outer query.
-- 3. The outer query selects the swapped id and the corresponding student name.
-- 4. Results are ordered by the new seat id to maintain the original seating order.
-- Note: This solution assumes that the 'Seat' table contains columns 'id' and 'student'.
-- The query handles cases where there's an odd number of students, ensuring the last student remains in place.