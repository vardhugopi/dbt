/* materialized='table') }} */
-- where trim(VALUE:TYPE,'"') = 'SELLER'
with  __dbt__cte__account_subset_test as (
 

with subset_data as (

    SELECT trim(VALUE:id,'"') as ID,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:subset_name,'"') as NAME,trim(VALUE:code,'"') as CODE,trim(VALUE:subset_type,'"') as TYPE,trim(VALUE:counterparty_id,'"') as COUNTERPARTY_ID,trim(VALUE:is_dealer,'"') as IS_DEALER,trim(VALUE:earn_out_minimum_fee,'"') as EARN_OUT_MINIMUM_FEE,trim(VALUE:settings,'"') as SETTINGS,trim(VALUE:soft_descriptors,'"') as SOFT_DESCRIPTORS,trim(VALUE:earn_out_plan,'"') as EARN_OUT_PLAN,VALUE:enabled_notices as ENABLED_NOTICES 
    FROM EDW.EXTERNAL.ACCOUNT_SUBSET
)

select *
from subset_data
),subset_test_data as (select * from __dbt__cte__account_subset_test)

select
    id as partner_id,
    name as name,
    code as code,
    type as type,
    created_by as created_by,
    updated_by as updated_by,
    hash(code) as subset_key,
    current_user() as audit_created_by_user,
    current_timestamp() as audi_created_dtm,
    current_user() as audit_modified_by_user,
    current_timestamp() as audit_modified_dtm,
    1 as src_sys_key,
    updated_at,
    is_disabled,
    settings,
    soft_descriptors,
    counterparty_id,
    is_dealer,
    earn_out_minimum_fee,
    earn_out_plan,
    enabled_notices,
    created_at,
    hash(counterparty_id) as counterparty_key
from subset_test_data
/*from subset_delta a
    left join subset_dim_sf b on hash(code) = b.subset_key

    Uncomment the line below to remove records with null `id` values
*/