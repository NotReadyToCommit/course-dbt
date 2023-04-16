{% snapshot inventory_snapshot %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='product_id',
    check_cols=['inventory'],
   )
}}

select 
PRODUCT_ID
,NAME
,PRICE
,INVENTORY

from {{ source('postgres', 'products') }}

{% endsnapshot %}