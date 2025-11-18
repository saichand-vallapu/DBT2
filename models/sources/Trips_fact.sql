with Trips as (

select 
	RIDE_ID ,
	RIDEABLE_TYPE, 
	DATE(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE, 
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF( SECOND , TO_TIMESTAMP(STARTED_AT) ,TO_TIMESTAMP(ENDED_AT))
    from {{source("raw_data","Bike")}}
    where ride_id!='ride_id'
)

select * from Trips