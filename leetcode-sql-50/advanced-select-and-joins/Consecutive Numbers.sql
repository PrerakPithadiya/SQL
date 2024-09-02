-- This query finds consecutive numbers that appear at least three times in a row in the Logs table.
-- We use self-joins to compare each row with the next two rows.
-- The DISTINCT keyword ensures we only get unique results.
SELECT DISTINCT
    L1.num AS ConsecutiveNums
FROM
    Logs L1
    JOIN Logs L2 ON L1.id = L2.id - 1 -- Join with the next row
    JOIN Logs L3 ON L1.id = L3.id - 2 -- Join with the row after next
WHERE
    L1.num = L2.num -- Check if the number is the same as in the next row
    AND L2.num = L3.num;

-- Check if the number is the same as in the row after next
-- ConsecutiveNums: The numbers that appear at least three times consecutively
-- Logs: The table containing the log entries
-- L1, L2, L3: Aliases for the Logs table in different self-joins
-- id: The identifier column in the Logs table
-- num: The number column in the Logs table
-- Note: This query assumes that the 'id' column is sequential without gaps.
-- If there are gaps in the 'id' sequence, consider using ROW_NUMBER() instead.