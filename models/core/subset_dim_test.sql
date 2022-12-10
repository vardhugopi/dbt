
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

/*materialized='table') }} */

with subset_test_data as (

    select * from {{ ref('account_subset_test') }} --where trim(VALUE:TYPE,'"') = 'SELLER'
)

select *
from subset_test_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
