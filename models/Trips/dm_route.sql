{{ config(materialized='table', schema='TEST') }}

WITH Bike_cte AS (
    SELECT
    TRIP_ID AS TRIP_ID,
    TRIP_ROUTE_CATEGORY AS TRIP_ROUTE_CATEGORY
    FROM "SPRINGBOARD"."TEST"."ROW_LOCATION"
)
SELECT * 
FROM Bike_cte