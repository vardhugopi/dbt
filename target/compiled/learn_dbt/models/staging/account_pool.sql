-- 

with pool_data as (

    SELECT * from TEST_EDW.ANALYTICS.POOL_DIM
)

select *
from pool_data