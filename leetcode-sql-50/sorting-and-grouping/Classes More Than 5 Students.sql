-- This query retrieves classes with 5 or more students
-- Table: Courses
-- Columns: class, student
-- 
-- The query performs the following operations:
-- 1. Selects the 'class' column from the Courses table
-- 2. Groups the results by the 'class' column
-- 3. Filters the groups to include only those with 5 or more students
-- 
-- Note: This query assumes that each row in the Courses table represents a unique student enrollment in a class.
-- If there are duplicate entries for the same student in a class, consider using COUNT(DISTINCT student) instead.
SELECT
    class
FROM
    Courses
GROUP BY
    class
HAVING
    COUNT(student) >= 5;