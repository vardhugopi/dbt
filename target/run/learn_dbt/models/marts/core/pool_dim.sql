
  
    

        create or replace  table TEMP.ANALYTICS.pool_dim  as
        (with
    pool_delta as (select * from TEMP.STAGING.account_pool_delta),

    pool_dim_org as (select * from TEMP.STAGING.account_pool),

    investor_org as (select * from TEMP.STAGING.account_investor),

    final as (
        select
            a.id,
            a.created_at,
            a.updated_at,
            a.created_by,
            a.updated_by,
            a.is_disabled,
            a.name,
            a.description,
            a.investor_id,
            hash(i.code) as investor_key,
            hash(a.name) as pool_key,
            case
                when b.pool_key is not null
                then b.audit_created_by_user
                else CURRENT_USER()
            end as audit_created_by_user,
            case
                when b.pool_key is not null
                then b.audit_created_dtm
                else current_timestamp()
            end as audit_created_dtm,
            CURRENT_USER() as audit_modified_by_user,
            current_timestamp() as audit_modified_dtm,
            1 as src_sys_key
        from pool_delta a
        left join pool_dim_org b on hash(a.name) = b.pool_key
        left join investor_org i on a.investor_id = i.id
    )

select *
from final
        );
      
  