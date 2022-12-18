--{{ config(materialized='ephemeral') }} 

with pool_data as (

    SELECT * from {{ source('lookup','POOL_DIM')}}
)

select *
from pool_data


