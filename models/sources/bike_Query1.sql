{{ config(materialized="ephemeral") }}

select rideable_type, count(rideable_type) as count1
from {{ source("raw_data", "Bike") }}
group by rideable_type;

