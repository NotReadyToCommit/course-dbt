{{ 
    config(
        materialized='table'
    )
}}
with order_sessions as (
    SELECT 
    SESSION_ID
    ,ORDER_ID
    from {{ ref ('stg_events') }}
    where event_type = 'checkout'
)

    select
        PRODUCT_ID,
        NAME,
        EVENT_TYPE,
        date(created_at) as event_date,
        count(base.SESSION_ID) AS SESSION_COUNT,
        count(EVENT_ID) AS EVENT_COUNT,
        count(USER_ID) AS USER_COUNT,
        count(order_sessions.ORDER_ID) AS ORDER_COUNT
    from {{ ref ('stg_events') }} base
    left JOIN (select PRODUCT_ID, name from {{ ref ('stg_products') }}) using( PRODUCT_ID)
    left join order_sessions using (SESSION_ID)
    group by 1,2,3,4