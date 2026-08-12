WITH CTE AS (
    SELECT 

    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT
    FROM {{ source('demo', 'bike') }}
),

    CTE_2 AS (
        SELECT 
    Date(STARTED_AT) AS DATE_STARTED_AT,
    HOUR(STARTED_AT) AS HOUR_STARTED_AT,
    {{day_type('START_AT')}} AS DAY_TYPE,

    {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    FROM CTE
)

SELECT *
FROM CTE_2
