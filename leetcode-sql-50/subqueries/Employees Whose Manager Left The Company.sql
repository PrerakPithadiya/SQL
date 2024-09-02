-- This query retrieves employee IDs for employees whose managers have left the company
-- and whose salary is less than 30000.
-- Select the employee_id column from the Employees table
SELECT
    e.employee_id
FROM
    Employees e
    -- Perform a LEFT JOIN with the Employees table itself to get manager information
    LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE
    -- Filter for employees with salary less than 30000
    e.salary < 30000
    -- Ensure the employee has a manager assigned
    AND e.manager_id IS NOT NULL
    -- Check if the manager's record doesn't exist (indicating they've left the company)
    AND m.employee_id IS NULL
    -- Sort the results by employee_id in ascending order
ORDER BY
    e.employee_id;

-- Query Explanation:
-- 1. We use a LEFT JOIN to match employees with their managers.
-- 2. The WHERE clause filters for:
--    a. Employees with salary less than 30000
--    b. Employees who have a manager assigned (manager_id IS NOT NULL)
--    c. Managers who are not in the Employees table (m.employee_id IS NULL)
-- 3. The results are ordered by employee_id in ascending order.
-- Note: This query assumes that when a manager leaves the company, their record is removed from the Employees table.
-- If this assumption is incorrect, the query may need to be adjusted accordingly.