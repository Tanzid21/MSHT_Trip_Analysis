
{{ config(materialized='table', schema='TEST') }}

WITH raw_fact_cte AS (
    SELECT 
        rl.TRIP_ID AS trip_id,
        rl.DURATION AS durations,
        rl.PLAN_DURATION AS plan_duration,
        rl.BIKE_ID AS bike_id,
        rl.PASSHOLDER_TYPE AS passholder_type,
        rl.TRIP_ROUTE_CATEGORY AS trip_route_category,
        rl.STARTING_STATION_ID AS start_station_id,
        rl.ENDING_STATION_ID AS end_station_id,

        -- Generate surrogate keys for time dimensions
        TO_CHAR(TO_TIMESTAMP(rl.START_TIME, 'MM/DD/YYYY HH12:MI:SS AM'), 'YYYY/MM/DD HH24:MI:SS') AS start_time_key,
        TO_CHAR(TO_TIMESTAMP(rl.END_TIME, 'MM/DD/YYYY HH12:MI:SS AM'), 'YYYY/MM/DD HH24:MI:SS') AS end_time_key
    FROM "SPRINGBOARD"."TEST"."ROW_LOCATION" rl
)
SELECT *
FROM raw_fact_cte

