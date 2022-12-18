with investor_delta as (

    SELECT trim(VALUE:id,'"') as ID ,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:investor_name,'"') as NAME,trim(VALUE:code,'"') as CODE 
    FROM TEST_EDW.EXTERNAL.ACCOUNT_INVESTOR
)

select *
from investor_delta