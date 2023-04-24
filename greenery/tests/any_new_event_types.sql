select *
from {{ ref ('int_sessions') }}
where EVENT_TYPE in ('page_view', 'add_to_cart')
AND product_id is null