WITH CTE AS (
SELECT 
STARTED_AT,
to_timestamp(STARTED_AT) as started_time,
date(started_time) as date_started_at,
hour(started_time) as hr_Started_At,

{{ day_type('STARTED_AT')}} AS DAY_TYPE,

{{ get_season ('STARTED_AT')}} AS SEASON 

from {{ ref('stg_bike') }}
where STARTED_AT != 'started_at'
)

SELECT * from CTE