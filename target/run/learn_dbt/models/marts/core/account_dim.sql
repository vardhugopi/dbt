
  
    

        create or replace  table TEMP.ANALYTICS.account_dim  as
        (with
     __dbt__cte__account as (
-- 

with account_data as (

    SELECT * from TEST_EDW.ANALYTICS.ACCOUNT_DIM
)

select *
from account_data
),  __dbt__cte__account_subset as (
-- 

with subset_data as (

    SELECT * from TEST_EDW.ANALYTICS.SUBSET_DIM
)

select *
from subset_data
),account_delta as (select * from TEMP.STAGING.account_delta),

    account_dim_org as (select * from __dbt__cte__account),

    subset_dim_org as (select * from __dbt__cte__account_subset),

    pool_dim_org as (select * from TEMP.STAGING.account_pool),

    final as (
        select
            a.account_number,
            a.seller_id,
            a.created_at,
            a.updated_at,
            a.created_by,
            a.updated_by,
            a.is_disabled,
            a.customer_name,
            a.status_change_date,
            a.status,
            a.calculation_rule_type,
            a.product,
            a.first_due_date,
            a.next_due_date,
            a.maturity_date,
            a.intent_date,
            a.projected_cancellation_date,
            a.cancellation_date,
            a.cancellation_reason,
            a.cancellation_requested_user,
            a.ingested_date,
            a.payment_frequency,
            a.policy_term,
            a.policy_mileage,
            a.policy_effective_date,
            a.policy_program,
            a.policy_number,
            a.vehicle_vin,
            a.vehicle_make,
            a.vehicle_model,
            a.vehicle_year,
            a.vehicle_trim,
            a.vehicle_mileage,
            a.endorsement_count,
            a.endorsement_amount,
            a.reinstatement_count,
            a.due_date_lifetime_change_count,
            a.due_date_yearly_change_count,
            a.extensions_lifetime_count,
            a.extensions_yearly_count,
            a.extensions_lifetime_terms_updated,
            a.extensions_yearly_terms_updated,
            a.total_retail_cost,
            a.down_payment_amount,
            a.installments,
            a.installment_amount,
            a.financed_amount,
            a.accounts_discount_amount,
            a.seller_cost,
            a.dealer_profit,
            a.seller_advance_amount,
            a.seller_reserve_amount,
            a.admin_advance_amount,
            a.admin_reserve_amount,
            a.annual_percentage_rate,
            a.service_fee_amount,
            a.service_interest_percentage,
            a.renewal_fee,
            a.renewal_payhold,
            a.mtm_advanced_installments,
            a.is_shortage_account,
            a.payments_made,
            a.paid_amount,
            a.principal_balance_amount,
            a.last_payment_amount,
            a.payoff_amount,
            a.last_payment_date,
            a.last_payment_description,
            a.delinquency_due_amount,
            a.delinquency_lifetime_count,
            a.delinquency_yearly_count,
            a.nsf_assessed_count,
            a.nsf_waived_count,
            a.nsf_due_amount,
            a.late_fee_assessed_count,
            a.late_fee_waived_count,
            a.late_fee_due_amount,
            a.customer_id,
            hash(a.account_number) as account_key,
            case
                when b.account_key is not null
                then b.audit_created_by_user
                else current_user()
            end as audit_created_by_user,
            case
                when b.account_key is not null
                then b.audit_created_dtm
                else current_timestamp()
            end as audit_created_dtm,
            current_user() as audit_modified_by_user,
            current_timestamp() as audit_modified_dtm,
            1 as src_sys_key,
            hash(a.customer_id) as customer_key,
            hash(adm.code) as administrator_key,
            a.administrator_id,
            hash(ins.code) as insurance_company_key,
            a.insurance_company_id,
            hash(slr.code) as seller_key,
            a.instrument_id,
            hash(a.instrument_id) as instrument_key,
            a.admin_reserve_code,
            a.anniversary_date,
            a.calculation_rule_name,
            a.contract_file_name,
            a.finance_charge,
            a.is_terms_change_enabled,
            a.is_endorsements_enabled,
            a.is_seller_cost_adjustment_enabled,
            a.is_auto_pay_suspended,
            a.initial_web_password,
            a.funded_endorsement_amount,
            a.seller_cost_adjustment_count,
            a.pool_id,
            a.pool_assigned_date,
            a.installment_due_amount,
            a.is_return_premium_paid,
            a.seller_reserve_code,
            a.id,
            hash(p.name) as pool_key,
            a.is_endorsement_should_hit_admin,
            a.is_endorsement_should_hit_advance,
            a.late_fee_paid_amount,
            a.cancellation_hold_days,
            a.is_nc_payment_should_hit_admin,
            a.reinstatement_date,
            a.late_charge_grace_days,
            a.delinquency_grace_days,
            a.billing_statement_days,
            a.maximum_due_date_change_days,
            a.maximum_due_date_changes_per_year,
            a.maximum_due_date_changes_per_life,
            a.maximum_extensions_per_year,
            a.maximum_extensions_per_life,
            a.late_fee_amount,
            a.late_fee_percentage,
            a.late_fee_calculation,
            a.nsf_fee_amount,
            a.is_pristine
        from account_delta a
        left join account_dim_org b on hash(a.account_number) = b.account_key
        left join subset_dim_org slr on a.seller_id = slr.partner_id
        left join subset_dim_org adm on a.administrator_id = adm.partner_id
        left join subset_dim_org ins on a.insurance_company_id = ins.partner_id
        left join pool_dim_org p on a.pool_id = p.id
    )

select *
from final
        );
      
  