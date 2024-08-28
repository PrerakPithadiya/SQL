-- Primary Department For Each Employee
-- This SQL query identifies the primary department for each employee in the Employee table.
-- It handles two scenarios:
-- 1. Employees with a designated primary department (primary_flag = 'Y')
-- 2. Employees with only one department (which becomes their primary department by default)
-- Step 1: Identify employees who have a primary department flagged with 'Y'
WITH
    PrimaryDepartments AS (
        SELECT
            employee_id,
            department_id
        FROM
            Employee
        WHERE
            primary_flag = 'Y'
    ),
    -- Step 2: Identify employees who only have one department and thus have no primary_flag = 'Y'
    SingleDepartmentEmployees AS (
        SELECT
            e.employee_id,
            e.department_id
        FROM
            Employee e
            LEFT JOIN PrimaryDepartments pd ON e.employee_id = pd.employee_id
        WHERE
            pd.department_id IS NULL
        GROUP BY
            e.employee_id
        HAVING
            COUNT(e.department_id) = 1
    )
    -- Step 3: Combine results from PrimaryDepartments and SingleDepartmentEmployees
SELECT
    employee_id,
    department_id
FROM
    PrimaryDepartments
UNION ALL
SELECT
    employee_id,
    department_id
FROM
    SingleDepartmentEmployees
    -- Explanation:
    -- 1. PrimaryDepartments CTE:
    --    - Selects employees with a primary department (primary_flag = 'Y')
    --    - Returns employee_id and department_id for these employees
    -- 2. SingleDepartmentEmployees CTE:
    --    - Identifies employees not in PrimaryDepartments (using LEFT JOIN and WHERE pd.department_id IS NULL)
    --    - Groups by employee_id and selects only those with one department (HAVING COUNT(e.department_id) = 1)
    --    - Returns employee_id and department_id for these employees
    -- 3. Final SELECT statement:
    --    - Combines results from both CTEs using UNION ALL
    --    - Returns the primary department for each employee, whether it's explicitly flagged or implied by being the only department
    -- Note: This query assumes that employees with multiple departments will have exactly one department flagged as primary (primary_flag = 'Y').
    -- If this assumption doesn't hold, additional error handling or data validation might be necessary.