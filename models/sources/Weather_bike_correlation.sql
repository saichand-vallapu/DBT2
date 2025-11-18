{{ config(materialized="table") }}
with CTE as (
    select *
    from 
    {{ref('Trips_fact')}} 

)

select * from CTE