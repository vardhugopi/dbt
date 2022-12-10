/* materialized='table') }} */
-- where trim(VALUE:TYPE,'"') = 'SELLER'
with subset_test_data as (select * from {{ ref("account_subset_test") }})

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

