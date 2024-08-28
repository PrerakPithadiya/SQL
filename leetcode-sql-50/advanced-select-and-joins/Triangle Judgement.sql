-- Triangle Judgement
-- This query determines whether the given sides can form a valid triangle
-- Table: Triangle
-- Columns:
--   x: INT - Length of the first side
--   y: INT - Length of the second side
--   z: INT - Length of the third side
-- The query checks if the sum of any two sides is greater than the third side
-- This is known as the Triangle Inequality Theorem
SELECT
    x,
    y,
    z,
    CASE
    -- Check if the sum of any two sides is greater than the third side
        WHEN (x + y > z)
        AND (x + z > y)
        AND (y + z > x) THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle;

-- Output:
--   x: INT - Length of the first side
--   y: INT - Length of the second side
--   z: INT - Length of the third side
--   triangle: VARCHAR - 'Yes' if a valid triangle can be formed, 'No' otherwise
-- Note: This query assumes that all side lengths are positive numbers
-- Additional validation may be needed for negative or zero values