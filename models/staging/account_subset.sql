--{{ config(materialized='ephemeral') }} 

with subset_data as (

    SELECT * from {{ source('lookup','SUBSET_DIM')}}
)

select *
from subset_data


