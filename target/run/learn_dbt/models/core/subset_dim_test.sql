
  
    

        create or replace transient table EDW.ANALYTICS.subset_dim_test  as
        (/* materialized='table') }} */
-- where trim(VALUE:TYPE,'"') = 'SELLER'
with  __dbt__cte__account_subset_test as (
 

with subset_data as (

    SELECT trim(VALUE:id,'"') as ID,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:subset_name,'"') as NAME,trim(VALUE:code,'"') as CODE,trim(VALUE:subset_type,'"') as TYPE,trim(VALUE:counterparty_id,'"') as COUNTERPARTY_ID,trim(VALUE:is_dealer,'"') as IS_DEALER,trim(VALUE:earn_out_minimum_fee,'"') as EARN_OUT_MINIMUM_FEE,trim(VALUE:settings,'"') as SETTINGS,trim(VALUE:soft_descriptors,'"') as SOFT_DESCRIPTORS,trim(VALUE:earn_out_plan,'"') as EARN_OUT_PLAN,VALUE:enabled_notices as ENABLED_NOTICES 
    FROM EDW.EXTERNAL.ACCOUNT_SUBSET
)

select *
from subset_data
),subset_test_data as (select * from __dbt__cte__account_subset_test),

subset_dim_org as (select * from ANALYTICS.SUBSET_DIM),

final as    (
    select
    a.id as partner_id,
    a.name as name,
    a.code as code,
    a.type as type,
    a.created_by as created_by,
    a.updated_by as updated_by,
    hash(a.code) as subset_key,
    case
        when b.subset_key is not null
        then b.audit_created_by_user
        else current_user()
    end as audit_created_by_user,
    case
        when b.subset_key is not null then b.audit_created_dtm else current_timestamp()
    end as audit_created_dtm,
    current_user() as audit_modified_by_user,
    current_timestamp() as audit_modified_dtm,
    1 as src_sys_key,
    a.updated_at,
    a.is_disabled,
    a.settings,
    a.soft_descriptors,
    a.counterparty_id,
    a.is_dealer,
    a.earn_out_minimum_fee,
    a.earn_out_plan,
    a.enabled_notices,
    a.created_at,
    hash(a.counterparty_id) as counterparty_key
    from subset_test_data a
    left join subset_dim_org b on hash(a.code) = b.subset_key 
    )

select * from final
        );
      
  