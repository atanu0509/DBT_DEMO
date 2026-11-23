WITH TRIPS as (

select 
RIDE_ID,
RIDABLE_TYPE,
date(to_timestamp(STARTED_AT)) as TRIP_DATE,
START_STATION_ID,
END_STATION_ID,
MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND, to_timestamp(STARTED_AT), to_timestamp(ENDED_AT)) as TRIP_DURATION_SECONDS


from {{ source('demo', 'bike') }}
where RIDE_ID != 'ride_id'
limit 10
)

select * from TRIPS