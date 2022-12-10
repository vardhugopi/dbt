
  create or replace  view EDW.dbt_vardhugopi.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from EDW.dbt_vardhugopi.my_first_dbt_model
where id = 1
  );
