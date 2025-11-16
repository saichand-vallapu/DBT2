select
    rideable_type,
    case
        when percentage_rideable_type > 40
        then 'yes'
        when percentage_rideable_type <= 40
        then 'no'
    end as category_flag
from {{ ref("bike_query2") }};
