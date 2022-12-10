/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

/*materialized='table') }} */

with  __dbt__cte__account_subset_test as (
 

with subset_data as (

    SELECT trim(VALUE:id,'"') as ID,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:subset_name,'"') as NAME,trim(VALUE:code,'"') as CODE,trim(VALUE:subset_type,'"') as TYPE,trim(VALUE:counterparty_id,'"') as COUNTERPARTY_ID,trim(VALUE:is_dealer,'"') as IS_DEALER,trim(VALUE:earn_out_minimum_fee,'"') as EARN_OUT_MINIMUM_FEE,trim(VALUE:settings,'"') as SETTINGS,trim(VALUE:soft_descriptors,'"') as SOFT_DESCRIPTORS,trim(VALUE:earn_out_plan,'"') as EARN_OUT_PLAN,VALUE:enabled_notices as ENABLED_NOTICES 
    FROM EDW.EXTERNAL.ACCOUNT_SUBSET
)

select *
from subset_data
),subset_test_data as (

    select * from __dbt__cte__account_subset_test --where trim(VALUE:TYPE,'"') = 'SELLER'
)

select *
from subset_test_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null