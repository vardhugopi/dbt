
with investor_data as (

    SELECT * from {{ source('lookup','POOL_DIM')}}
)

select *
from investor_data


