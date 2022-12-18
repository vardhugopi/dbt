
  
    

        create or replace transient table TEMP.STAGING.account_investor  as
        (with investor_data as (

    SELECT * from TEST_EDW.ANALYTICS.INVESTOR
)

select *
from investor_data
        );
      
  