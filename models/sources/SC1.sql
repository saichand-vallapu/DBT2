{{ config(materialized="ephemeral") }}
select id, name
from {{ source("raw_data", "CUSTOMERS") }}
