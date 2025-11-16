select rideable_type,
(count1/sum(count1) over())*100  as percentage_rideable_type
from {{ ref("bike_Query1") }}
