-- This query retrieves information about employees who have direct reports,
-- including their employee ID, name, number of reports, and average age of their reports.
-- Main query
SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM
    Employees m
    LEFT JOIN Employees e ON m.employee_id = e.reports_to
WHERE
    m.employee_id IN (
        SELECT DISTINCT
            reports_to
        FROM
            Employees
        WHERE
            reports_to IS NOT NULL
    )
GROUP BY
    m.employee_id,
    m.name
ORDER BY
    m.employee_id;

-- Query Explanation:
-- 1. The main query uses a self-join on the Employees table to connect managers (m) with their reports (e).
-- 2. We use LEFT JOIN to include managers even if they don't have any reports.
-- 3. The WHERE clause filters for employees who have at least one direct report.
-- 4. We GROUP BY manager's employee_id and name to aggregate data for each manager.
-- 5. COUNT(e.employee_id) calculates the number of reports for each manager.
-- 6. ROUND(AVG(e.age)) calculates the average age of reports, rounded to the nearest integer.
-- 7. Results are ordered by the manager's employee_id.
-- Subquery Explanation:
-- The subquery in the WHERE clause selects distinct employee IDs of all managers (reports_to).
-- It ensures we only include employees who actually have reports.
-- Note: This query assumes that:
-- - The Employees table has columns: employee_id, name, age, and reports_to.
-- - reports_to column contains the employee_id of the manager an employee reports to.
-- - NULL in reports_to indicates the employee doesn't report to anyone (likely top management).
-- Performance Considerations:
-- - Indexing on employee_id and reports_to columns could improve query performance.
-- - For large datasets, consider using window functions or CTEs for potential optimization.