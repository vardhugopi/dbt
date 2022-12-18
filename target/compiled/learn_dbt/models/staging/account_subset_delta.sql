-- 

with subset_delta as (

    SELECT trim(VALUE:id,'"') as ID,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:subset_name,'"') as NAME,trim(VALUE:code,'"') as CODE,trim(VALUE:subset_type,'"') as TYPE,trim(VALUE:counterparty_id,'"') as COUNTERPARTY_ID,trim(VALUE:is_dealer,'"') as IS_DEALER,trim(VALUE:earn_out_minimum_fee,'"') as EARN_OUT_MINIMUM_FEE,trim(VALUE:settings,'"') as SETTINGS,trim(VALUE:soft_descriptors,'"') as SOFT_DESCRIPTORS,trim(VALUE:earn_out_plan,'"') as EARN_OUT_PLAN,VALUE:enabled_notices as ENABLED_NOTICES 
    FROM TEST_EDW.EXTERNAL.ACCOUNT_SUBSET
)

select *
from subset_delta