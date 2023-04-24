select *
from {{ ref ('stg_events') }}
where EVENT_TYPE in ('checkout', 'package_shipped')
and ORDER_ID is null