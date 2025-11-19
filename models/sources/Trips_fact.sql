{{ config(materialized="table") }}

with Trips as (

select 
	RIDE_ID ,
	DATE(TRY_TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE, 
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID as END_STATION_ID ,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF( SECOND , TRY_TO_TIMESTAMP(STARTED_AT) ,TRY_TO_TIMESTAMP(ENDED_AT)) as TimeDiff
    from {{source("raw_data","BIKE2018_AFTERTRANS")}}
    where ride_id!='ride_id'
)

select * from Trips