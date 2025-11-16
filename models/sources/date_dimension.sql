with CTE as (
select
TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
DATE(STARTED_AT) as DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
DAYNAME(TO_TIMESTAMP(STARTED_AT)) as DAY_STARTED_AT,
CASE
when DAY_STARTED_AT in ('Sat','Sun') then 'Weekend'
else 'BusinessDay'
end as DAY_TYPE,
MONTH(TO_TIMESTAMP(STARTED_AT)) as MONTH_STARTED_AT,
CASE
when MONTH_STARTED_AT in (12,1,2) then 'Winter'
when MONTH_STARTED_AT in (3,4,5) then 'Spring'
when MONTH_STARTED_AT in (6,7,8) then 'Summer'
else 'Autumn'
end as Season
from {{ source("raw_data", "Bike") }}
where STARTED_AT!='started_at'

)
select * from CTE
where Season='Winter'