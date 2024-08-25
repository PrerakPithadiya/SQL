-- This query retrieves employee names and their unique identifiers
-- It performs a LEFT JOIN to include all employees, even those without a unique identifier
-- Table descriptions:
-- Employees: Contains employee information (id, name)
-- EmployeeUNI: Contains unique identifiers for employees (id, unique_id)
-- Query explanation:
-- 1. SELECT clause specifies the columns to retrieve:
--    - e.name: Employee name from the Employees table
--    - u.unique_id: Unique identifier from the EmployeeUNI table
-- 2. FROM clause specifies the main table (Employees)
-- 3. LEFT JOIN is used to include all employees, even if they don't have a unique identifier
-- 4. ON clause specifies the join condition (e.id = u.id)
-- Note: This query will return NULL for unique_id if an employee doesn't have a corresponding entry in EmployeeUNI
SELECT
    e.name,
    u.unique_id
FROM
    Employees e
    LEFT JOIN EmployeeUNI u ON e.id = u.id;

-- Expected results:
-- - All employees will be included in the result set
-- - Employees without a unique identifier will have NULL in the unique_id column
-- - The result set will be ordered based on the default ordering of the Employees table
-- Potential optimizations:
-- - If needed, add an ORDER BY clause to sort the results
-- - Consider adding an index on the id column in both tables for improved join performance
-- Maintenance considerations:
-- - Ensure that the id columns in both tables are kept in sync
-- - Regularly update the EmployeeUNI table when new employees are added