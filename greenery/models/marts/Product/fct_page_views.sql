{{ 
    config(
        materialized='table'
    )
}}

select 
    PRODUCT_ID,
    NAME,
    event_date,
    sum(SESSION_COUNT) as page_views,
    sum(ORDER_COUNT) as orders,
    sum(ORDER_COUNT)/sum(SESSION_COUNT) as conversion_rate
from {{ ref ('int_sessions') }}
where EVENT_TYPE = 'page_view'
group by 1,2,3