-- This query retrieves employee names and their bonuses, focusing on employees with no bonus or a bonus less than 1000
-- It uses a LEFT JOIN to include all employees, even those without a bonus record
-- Table descriptions:
-- Employee: Contains employee information (empId, name, etc.)
-- Bonus: Contains bonus information for employees (empId, bonus)
-- Query breakdown:
-- 1. SELECT clause: Specifies the columns to be retrieved
-- 2. FROM clause: Specifies the main table (Employee)
-- 3. LEFT JOIN: Includes all employees, matching with bonus information where available
-- 4. WHERE clause: Filters the results to include only employees with no bonus or bonus < 1000
SELECT
    e.name, -- Employee name from the Employee table
    b.bonus -- Bonus amount from the Bonus table (NULL if no bonus)
FROM
    Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId -- LEFT JOIN to include all employees
WHERE
    b.bonus IS NULL -- Employees with no bonus record
    OR b.bonus < 1000;

-- Employees with bonus less than 1000
-- Note: This query assumes that empId is the primary key in the Employee table
-- and the foreign key in the Bonus table for the relationship between the two tables.
-- Expected output:
-- | name | bonus |
-- |------|-------|
-- | ...  | ...   |
-- Results will include employee names and their bonus (if any),
-- but only for those with no bonus or a bonus less than 1000.