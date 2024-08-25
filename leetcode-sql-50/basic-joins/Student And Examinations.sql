-- This query retrieves information about students, subjects, and their exam attendance
-- It combines data from Students, Subjects, and Examinations tables
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM
    Students s
    CROSS JOIN Subjects sub
    LEFT JOIN Examinations e ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;

-- Explanation of the query:
-- 1. We start with a CROSS JOIN between Students and Subjects to get all possible combinations
-- 2. We then LEFT JOIN with Examinations to include exam attendance information
-- 3. COALESCE is used to replace NULL values with 0 for students who didn't attend exams
-- 4. GROUP BY is used to aggregate the exam attendance count for each student-subject combination
-- 5. The result is ordered by student_id and subject_name for easy readability
-- This query provides a comprehensive view of:
-- - All students (even those who haven't taken any exams)
-- - All subjects (even if no student has taken an exam in that subject)
-- - The number of times each student has taken an exam in each subject
-- Note: This query assumes that:
-- - The Students table contains all student information
-- - The Subjects table contains all subject information
-- - The Examinations table contains records of all exam attendances