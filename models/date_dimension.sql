WITH CTE AS (
SELECT 
STARTED_AT,
to_timestamp(STARTED_AT) as started_time,
date(started_time) as date_started_at,
hour(started_time) as hr_Started_At,

CASE
WHEN DAYNAME(Started_time) in ('Sat', 'Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE 
WHEN MONTH(started_time) in (12,1,2) THEN 'WINTER'
WHEN MONTH(started_time) in (3,4,5) THEN 'SPRING'
WHEN MONTH(started_time) in (6,7,8) THEN 'SUMMER'
WHEN MONTH(started_time) in (9,10,11) THEN 'AUTUMN'
END AS SEASON
from {{source('demo', 'bike')}}
where STARTED_AT != 'started_at'
)

SELECT * from CTE