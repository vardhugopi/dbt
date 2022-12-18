
with investor_data as (

    SELECT * from {{ source('lookup','INVESTOR')}}
)

select *
from investor_data


