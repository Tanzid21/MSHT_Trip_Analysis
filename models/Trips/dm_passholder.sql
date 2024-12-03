{{ config(materialized='table', schema='TEST') }}

WITH passholder_cte AS (
    SELECT
        TRIP_ID AS TRIP_ID,
        PASSHOLDER_TYPE AS PASSHOLDER_TYPE,
        PLAN_DURATION AS PLAN_DURATION
    FROM "SPRINGBOARD"."TEST"."ROW_LOCATION"
)
SELECT * 
FROM passholder_cte