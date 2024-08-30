-- This query retrieves patients with diabetes type I (DIAB1) from the Patients table
-- It checks for DIAB1 at the beginning, middle, or end of the conditions string
-- Select relevant columns
SELECT
    patient_id,
    patient_name,
    conditions
FROM
    Patients
WHERE
    -- Check for DIAB1 preceded by a space (middle or end of string)
    conditions LIKE '% DIAB1%'
    -- Check for DIAB1 at the beginning of the string
    OR conditions LIKE 'DIAB1%'
    -- Check for DIAB1 at the end of the string (redundant with first condition, but kept for clarity)
    OR conditions LIKE '% DIAB1';

-- Note: This query assumes that 'DIAB1' is the code for diabetes type I
-- It will return patients who have DIAB1 listed in their conditions,
-- regardless of where it appears in the string (beginning, middle, or end)
-- Potential improvements:
-- 1. Consider using REGEXP for more flexible pattern matching
-- 2. Add error handling for invalid data in the 'conditions' column
-- 3. Implement input sanitization if this query is used with user input