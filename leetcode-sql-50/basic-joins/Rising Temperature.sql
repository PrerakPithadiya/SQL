-- This query retrieves the IDs of weather records where the temperature is higher than the previous day's temperature.
-- Table: Weather
-- Columns:
--   id (int): Unique identifier for each weather record
--   recordDate (date): Date of the weather record
--   temperature (int): Temperature recorded on that date
-- Query explanation:
-- 1. We use a self-join on the Weather table to compare each day's temperature with the previous day's temperature.
-- 2. The JOIN condition uses DATE_SUB to match each record with the record from the previous day.
-- 3. The WHERE clause filters for records where the current day's temperature is higher than the previous day's temperature.
SELECT
    w1.id
FROM
    Weather w1
    JOIN Weather w2 ON DATE_SUB (w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
WHERE
    w1.temperature > w2.temperature;

-- Note: This query assumes that there are no missing dates in the Weather table.
-- If there might be missing dates, consider using a more robust date comparison method.