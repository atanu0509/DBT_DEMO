WITH TRIPS as (

select 
RIDE_ID,
-- RIDABLE_TYPE,
date(to_timestamp(STARTED_AT)) as TRIP_DATE,
START_STATIO_ID as START_STATION_ID,
END_STATION_ID,
MEMBER_CSUAL as MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND, to_timestamp(STARTED_AT), to_timestamp(ENDED_AT)) as TRIP_DURATION_SECONDS


from {{ ref('stg_bike') }}
where RIDE_ID != 'ride_id'
OR STARTED_AT != 'starttime'
limit 10
)

select * from TRIPS