
  
    

        create or replace transient table EDW.ANALYTICS.select_account  as
        (/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with account_data as (

    select * 
    from account_dim
)

select *
from account_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
        );
      
  