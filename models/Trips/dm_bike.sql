{{ config(materialized='table', schema='TEST') }}

WITH Bike_cte AS (
    SELECT
    BIKE_ID AS BIKE_ID,
    TRIP_ID AS TRIP_ID
    FROM "SPRINGBOARD"."TEST"."ROW_LOCATION"
)
SELECT * 
FROM Bike_cte