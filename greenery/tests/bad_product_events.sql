select *
from {{ ref ('stg_events') }}
where EVENT_TYPE not in ('page_view', 'add_to_cart', 'checkout', 'package_shipped')