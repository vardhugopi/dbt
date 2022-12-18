-- 

with subset_data as (

    SELECT * from TEST_EDW.ANALYTICS.SUBSET_DIM
)

select *
from subset_data