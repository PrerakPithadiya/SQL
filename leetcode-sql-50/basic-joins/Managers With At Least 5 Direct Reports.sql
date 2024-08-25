-- Query to find managers with at least 5 direct reports
-- This query joins the Employee table with itself to match managers with their direct reports
SELECT
    e1.name -- Select the name of the manager
FROM
    Employee e1
    JOIN Employee e2 ON e1.id = e2.managerId -- Join the Employee table with itself
    -- e1 represents the managers, e2 represents the employees reporting to them
GROUP BY
    e1.id,
    e1.name -- Group by manager's id and name to count their direct reports
HAVING
    COUNT(e2.id) >= 5;

-- Filter to include only managers with 5 or more direct reports
-- Explanation:
-- 1. The query uses a self-join on the Employee table to match managers with their direct reports.
-- 2. We group the results by the manager's id and name to count the number of direct reports for each manager.
-- 3. The HAVING clause filters the results to include only managers with 5 or more direct reports.
-- 4. The final output shows the names of managers who have at least 5 direct reports.
-- Note: This query assumes that the Employee table has columns: id, name, and managerId.
-- The managerId in e2 is matched with the id in e1 to establish the reporting relationship.