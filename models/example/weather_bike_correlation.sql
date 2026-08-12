WITH CTE AS (
    SELECT 
    t.*,
    d.*
    FROM 
    {{ ref('trip_fact') }} t 
    left join {{ ref('daily_weater') }} d 
    on t.TRIP_DATE = d.DAILY_WEATHER

    ORDER BY t.TRIP_DATE desc
    
   --limit 10
)

select 
*
from CTE
where DAILY_WEATHER IS NOT NULL