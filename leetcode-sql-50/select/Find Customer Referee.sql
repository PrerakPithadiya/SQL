-- Find Customer Referee
-- This query retrieves customer names who either have no referee or a referee other than ID 2
-- Select the customer name
select
    name
from
    customer
where
    -- Condition 1: Referee ID is not equal to 2
    referee_id <> 2
    -- Condition 2: Referee ID is null (no referee)
    or referee_id is null;

-- Note:
-- - This query uses the OR operator to combine two conditions
-- - The first condition checks for referee_id not equal to 2
-- - The second condition checks for null referee_id
-- - The result includes customers meeting either of these conditions
-- - This approach ensures we capture both customers with no referee and those with a referee other than ID 2