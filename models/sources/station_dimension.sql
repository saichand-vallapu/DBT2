with bike1 as (
    select 
    distinct
    START_STATIO_ID as START_STATION_ID,
    START_STATION_NAME,
    START_LAT as station_lat,
    START_LNG as start_station_lng,
    END_STATION_ID,
    END_STATION_NAME
    from 
    {{source("raw_data","Bike")}}
    where ride_id!='ride_id'
)

select * from bike1