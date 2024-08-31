-- This SQL query calculates the total TIV (Total Insured Value) for 2016 for policyholders
-- who meet specific criteria related to their 2015 TIV and location uniqueness.
-- Common Table Expressions (CTEs)
WITH
    SharedTIV AS (
        -- Find all tiv_2015 values that are shared by two or more policyholders
        -- This helps identify policyholders with non-unique 2015 TIV
        SELECT
            tiv_2015
        FROM
            Insurance
        GROUP BY
            tiv_2015
        HAVING
            COUNT(*) > 1
    ),
    UniqueLocation AS (
        -- Find all policyholders who have unique lat, lon coordinates
        -- This helps identify policyholders with unique locations
        SELECT
            pid
        FROM
            Insurance
        GROUP BY
            lat,
            lon
        HAVING
            COUNT(*) = 1
    )
    -- Main Query
    -- Calculate the sum of tiv_2016 for policyholders meeting both conditions
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance
WHERE
    -- Condition 1: Policyholder's tiv_2015 is in the SharedTIV list
    tiv_2015 IN (
        SELECT
            tiv_2015
        FROM
            SharedTIV
    )
    -- Condition 2: Policyholder's location (pid) is in the UniqueLocation list
    AND pid IN (
        SELECT
            pid
        FROM
            UniqueLocation
    );

-- Notes:
-- 1. The SharedTIV CTE identifies tiv_2015 values that appear more than once.
-- 2. The UniqueLocation CTE identifies policyholders with unique lat, lon combinations.
-- 3. The main query sums tiv_2016 for policyholders meeting both conditions.
-- 4. The result is rounded to 2 decimal places for precision in financial reporting.
-- 5. This query helps analyze the 2016 TIV for a specific subset of policyholders,
--    potentially for risk assessment or premium calculation purposes.