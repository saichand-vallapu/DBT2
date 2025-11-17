with
    cte as (
        select
            to_timestamp(started_at) as started_at,
            date(started_at) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            dayname(to_timestamp(started_at)) as day_started_at,
            month(to_timestamp(started_at)) as month_started_at,
            {{ Season_type("MONTH_STARTED_AT") }} as station_of_year,
            {{ Day_type("DAY_STARTED_AT") }} as day_type
        from {{ source("raw_data", "Bike") }}
        where started_at != 'started_at'

    )
select *
from cte
