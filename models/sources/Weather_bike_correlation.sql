{{ config(materialized="table") }}
with CTE as (
    select *
    from 
    {{ref('Trips_fact')}} t
    left join {{ref('daily_weather')}} w
    on t.TRIP_DATE =w.daily_weather
)

select * from CTE