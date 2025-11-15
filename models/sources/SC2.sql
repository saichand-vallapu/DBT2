select
    count(id) as row_count
from {{ ref('SC1') }}
