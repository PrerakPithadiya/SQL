-- This query finds the second highest salary in the Employee table
-- If there is no second highest salary, it will return NULL
-- Main query to find the second highest salary
SELECT
    MAX(salary) AS SecondHighestSalary
FROM
    Employee
WHERE
    salary < (
        -- Subquery to find the highest salary
        SELECT
            MAX(salary)
        FROM
            Employee
    );

-- Explanation:
-- 1. The subquery (SELECT MAX(salary) FROM Employee) finds the highest salary in the table
-- 2. The main query then selects the maximum salary that is less than the highest salary
-- 3. This effectively gives us the second highest salary
-- 4. If there is no second highest salary (e.g., all salaries are the same or there's only one employee),
--    the query will return NULL due to the behavior of the MAX function on an empty set
-- Note: This solution assumes that the Employee table has a 'salary' column of a numeric type
-- If there are duplicate salaries, this query will still work correctly