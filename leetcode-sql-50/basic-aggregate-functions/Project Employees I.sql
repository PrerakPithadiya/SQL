-- Project Employees I
-- This query calculates the average years of experience for employees in each project
-- Table: Project
-- Columns: project_id, employee_id
-- Table: Employee
-- Columns: employee_id, name, experience_years
-- Query to calculate average years of experience per project
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    Project p
    JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;

-- Explanation:
-- 1. We join the Project and Employee tables on employee_id
-- 2. We group the results by project_id to get data for each project
-- 3. We calculate the average experience years for each project using AVG()
-- 4. We round the result to 2 decimal places using ROUND()
-- 5. The result shows each project_id and its corresponding average years of experience
-- Note: This query assumes that each employee works on only one project at a time.
-- If an employee can work on multiple projects, the results may need to be adjusted accordingly.