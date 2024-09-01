-- Find Users With Valid Emails
-- This query selects users with valid email addresses from the Users table
-- Purpose:
-- The purpose of this query is to filter and retrieve users whose email addresses
-- meet specific criteria for validity.
-- Table:
-- Users - Contains user information including user_id, name, and email address
-- Columns selected:
-- user_id - Unique identifier for each user
-- name - Name of the user
-- mail - Email address of the user
-- Validity criteria for email addresses:
-- 1. Must end with @leetcode.com
-- 2. Must start with a letter (uppercase or lowercase)
-- 3. Can contain letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), and hyphens (-)
-- 4. The local part (before @) must contain at least one character
SELECT
    user_id,
    name,
    mail
FROM
    Users
WHERE
    mail LIKE '%@leetcode.com' -- Ensure the email ends with @leetcode.com
    AND mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode.com$' -- Ensure the email starts with a letter and contains valid characters
    -- Notes:
    -- - The LIKE operator is used to match the email domain
    -- - The REGEXP operator is used for more complex pattern matching:
    --   ^ : Start of the string
    --   [a-zA-Z] : First character must be a letter
    --   [a-zA-Z0-9._-]* : Followed by zero or more valid characters
    --   $ : End of the string
    -- Potential improvements:
    -- - Consider adding additional checks for email validity if required
    -- - Optimize the query if dealing with large datasets
    -- - Implement appropriate indexing on the 'mail' column for better performance