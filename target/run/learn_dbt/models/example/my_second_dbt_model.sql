
  create or replace  view EDW.ANALYTICS.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from EDW.ANALYTICS.my_first_dbt_model
where id = 1
  );
