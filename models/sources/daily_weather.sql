with
    daily_weather as (
        select date(time) as daily_weather, temp, weather, pressure, humidity, clouds
        from {{ source("raw_data", "Weather") }}
    ),
    daily_weather_agg as (
        select
            daily_weather,
            weather,
            round(avg(pressure), 2) as avg_pressure,
            round(avg(humidity), 2) as avg_humidity,
            round(avg(clouds), 2) as avg_clouds,
            round(avg(temp), 2) as avg_temp
        from daily_weather
        group by daily_weather, weather
        qualify
            row_number() over (partition by daily_weather order by count(weather) desc)
            = 1
    )

select *
from daily_weather_agg
