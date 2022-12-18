
  
    

        create or replace transient table TEMP.STAGING.account_pool  as
        (with pool_data as (

    SELECT * from TEST_EDW.ANALYTICS.POOL_DIM
)

select *
from pool_data
        );
      
  