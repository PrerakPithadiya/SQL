-- Department Top Three Salaries
-- This SQL query finds the top three salary earners in each department.
-- It uses Common Table Expressions (CTEs) to break down the problem into manageable steps.
-- CTE 1: DepartmentSalaries
-- This CTE ranks the unique salaries within each department.
WITH
    DepartmentSalaries AS (
        SELECT
            e.departmentId,
            e.salary,
            DENSE_RANK() OVER (
                PARTITION BY
                    e.departmentId
                ORDER BY
                    e.salary DESC
            ) AS salary_rank
        FROM
            (
                -- Subquery to get distinct department-salary combinations
                SELECT DISTINCT
                    departmentId,
                    salary
                FROM
                    Employee
            ) e
    ),
    -- CTE 2: HighEarners
    -- This CTE selects the employees who earn one of the top 3 unique salaries in their department.
    HighEarners AS (
        SELECT
            e.name AS Employee,
            e.salary AS Salary,
            d.name AS Department
        FROM
            Employee e
            JOIN Department d ON e.departmentId = d.id
            JOIN DepartmentSalaries ds ON e.departmentId = ds.departmentId
            AND e.salary = ds.salary
        WHERE
            ds.salary_rank <= 3
    )
    -- Main Query
    -- This query returns the final result set, ordered by Department and Salary in descending order.
SELECT
    Department,
    Employee,
    Salary
FROM
    HighEarners
ORDER BY
    Department,
    Salary DESC;

-- Note: This query assumes the existence of two tables:
-- 1. Employee (with columns: id, name, salary, departmentId)
-- 2. Department (with columns: id, name)
-- The query uses DENSE_RANK() to handle cases where multiple employees in a department have the same salary.
-- It ensures that if there are ties, all employees with the same salary are included in the result.
-- The use of DISTINCT in the subquery of DepartmentSalaries CTE is to handle cases where multiple employees
-- in the same department have the same salary, ensuring each unique salary is ranked only once per department.
-- The final ORDER BY clause sorts the results first by Department (alphabetically) and then by Salary (highest to lowest),
-- providing a clear and organized view of the top earners in each department.