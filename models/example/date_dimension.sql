WITH CTE AS (
    SELECT 

    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT
    FROM {{ source('demo', 'bike') }}
),

    CTE_2 AS (
        SELECT 
    Date(STARTED_AT) AS DATE_STARTED_AT,
    HOUR(STARTED_AT) AS HOUR_STARTED_AT,
    CASE 
        WHEN DAYNAME(STARTED_AT) IN ('Sat','Sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESS DAY'
    END AS DAY_TYPE,

    CASE
        WHEN MONTH(STARTED_AT) IN (3, 4, 5)   THEN 'Spring'
        WHEN MONTH(STARTED_AT) IN (6, 7, 8)   THEN 'Summer'
        WHEN MONTH(STARTED_AT) IN (9, 10, 11)  THEN 'Autumn'
        WHEN MONTH(STARTED_AT) IN (12, 1, 2)   THEN 'Winter'
    END AS STATION_OF_YEAR

    FROM CTE
)

SELECT *
FROM CTE_2
