--{{ config(materialized='ephemeral') }} 

with account_data as (

    SELECT * from {{ source('lookup','ACCOUNT_DIM')}}
)

select *
from account_data


