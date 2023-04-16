select * from INFORMATION_SCHEMA.COLUMNS 
where 
table_schema = 'PUBLIC'
and
table_name in (
'ADDRESSES'
,'USERS'
,'EVENTS'
,'ORDERS'
,'PRODUCTS'
,'ORDER_ITEMS'
,'PROMOS'
)