-- This query retrieves the number of unique subjects taught by each teacher
-- It uses the Teacher table to gather this information
-- Select the teacher_id and count of distinct subject_id
SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY
    teacher_id;

-- Explanation:
-- 1. We select the teacher_id column to identify each teacher
-- 2. We use COUNT(DISTINCT subject_id) to count only unique subjects for each teacher
-- 3. We alias this count as 'cnt' for clarity in the output
-- 4. The FROM clause specifies that we're querying the Teacher table
-- 5. We use GROUP BY teacher_id to ensure we get a separate count for each teacher
-- 
-- Note: This query assumes that the Teacher table contains columns for teacher_id and subject_id
-- The result will show each teacher's ID along with the number of unique subjects they teach