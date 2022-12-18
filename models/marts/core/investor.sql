with
    investor_delta as (select * from {{ ref("account_investor_delta") }}),

    investor_org as (select * from {{ ref("account_investor") }}),

    final as (
        select
            a.id,
            a.created_at,
            a.updated_at,
            a.created_by,
            a.updated_by,
            a.is_disabled,
            a.name,
            a.code,
            case
                when b.investor_key is not null
                then b.audit_created_by_user
                else CURRENT_USER()
            end as audit_created_by_user,
            case
                when b.investor_key is not null
                then b.audit_created_dtm
                else current_timestamp()
            end as audit_created_dtm,
            CURRENT_USER() as audit_modified_by_user,
            current_timestamp() as audit_modified_dtm,
            1 as src_sys_key,
            hash(a.code) as investor_key
        from investor_delta a
        left join investor_org b on hash(a.code) = b.investor_key
    )

select *
from final
