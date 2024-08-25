-- This SQL query calculates the average processing time for each machine
-- It uses Common Table Expressions (CTEs) to break down the problem into manageable steps
-- CTE 1: ProcessDurations
-- This CTE calculates the duration of each process for each machine
WITH
    ProcessDurations AS (
        SELECT
            a1.machine_id,
            a1.process_id,
            a2.timestamp - a1.timestamp AS duration
        FROM
            Activity a1
            JOIN Activity a2 ON a1.machine_id = a2.machine_id
            AND a1.process_id = a2.process_id
            AND a1.activity_type = 'start'
            AND a2.activity_type = 'end'
            AND a1.timestamp < a2.timestamp
    ),
    -- CTE 2: MachineAverages
    -- This CTE calculates the average duration for each machine
    MachineAverages AS (
        SELECT
            machine_id,
            AVG(duration) AS avg_duration
        FROM
            ProcessDurations
        GROUP BY
            machine_id
    )
    -- Main query
    -- This selects the final result, rounding the average duration to 3 decimal places
SELECT
    machine_id,
    ROUND(avg_duration, 3) AS processing_time
FROM
    MachineAverages;

-- Note: This query assumes the existence of an 'Activity' table with columns:
-- machine_id, process_id, activity_type, and timestamp
-- It joins this table with itself to pair 'start' and 'end' activities for each process
-- The result shows the average processing time for each machine, rounded to 3 decimal places