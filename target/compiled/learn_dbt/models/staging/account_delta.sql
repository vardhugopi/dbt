-- 

with account_delta as (

    SELECT trim(VALUE:id,'"') as ID,trim(VALUE:created_at,'"') as CREATED_AT,trim(VALUE:updated_at,'"') as UPDATED_AT,trim(VALUE:created_by,'"') as CREATED_BY,
    trim(VALUE:updated_by,'"') as UPDATED_BY,trim(VALUE:is_disabled,'"') as IS_DISABLED,trim(VALUE:account_number,'"') as ACCOUNT_NUMBER,trim(VALUE:customer_name,'"') as CUSTOMER_NAME,
    trim(VALUE:instrument_id,'"') as INSTRUMENT_ID,trim(VALUE:pool_id,'"') as POOL_ID,trim(VALUE:seller_id,'"') as SELLER_ID,trim(VALUE:administrator_id,'"') as ADMINISTRATOR_ID,
    trim(VALUE:insurance_company_id,'"') as INSURANCE_COMPANY_ID,trim(VALUE:customer_id,'"') as CUSTOMER_ID,trim(VALUE:status,'"') as STATUS,trim(VALUE:status_change_date,'"') as STATUS_CHANGE_DATE,
    trim(VALUE:calculation_rule_type,'"') as CALCULATION_RULE_TYPE,trim(VALUE:calculation_rule_name,'"') as CALCULATION_RULE_NAME,trim(VALUE:contract_file_name,'"') as CONTRACT_FILE_NAME,
    trim(VALUE:seller_reserve_code,'"') as SELLER_RESERVE_CODE,trim(VALUE:admin_reserve_code,'"') as ADMIN_RESERVE_CODE,trim(VALUE:product,'"') as PRODUCT,trim(VALUE:first_due_date,'"') as FIRST_DUE_DATE,trim(VALUE:next_due_date,'"') as NEXT_DUE_DATE,trim(VALUE:oldest_due_date,'"') as OLDEST_DUE_DATE,trim(VALUE:current_due_date,'"') as CURRENT_DUE_DATE,trim(VALUE:current_schedule,'"') as CURRENT_SCHEDULE,trim(VALUE:maturity_date,'"') as MATURITY_DATE,trim(VALUE:intent_date,'"') as INTENT_DATE,trim(VALUE:anniversary_date,'"') as ANNIVERSARY_DATE,trim(VALUE:projected_cancellation_date,'"') as PROJECTED_CANCELLATION_DATE,trim(VALUE:pool_assigned_date,'"') as POOL_ASSIGNED_DATE,trim(VALUE:cancellation_date,'"') as CANCELLATION_DATE,trim(VALUE:cancellation_reason,'"') as CANCELLATION_REASON,trim(VALUE:reinstatement_date,'"') as REINSTATEMENT_DATE,trim(VALUE:cancellation_requested_user,'"') as CANCELLATION_REQUESTED_USER,trim(VALUE:ingested_date,'"') as INGESTED_DATE,trim(VALUE:payment_frequency,'"') as PAYMENT_FREQUENCY,trim(VALUE:policy_term,'"') as POLICY_TERM,trim(VALUE:policy_mileage,'"') as POLICY_MILEAGE,trim(VALUE:policy_effective_date,'"') as POLICY_EFFECTIVE_DATE,trim(VALUE:policy_program,'"') as POLICY_PROGRAM,trim(VALUE:policy_number,'"') as POLICY_NUMBER,trim(VALUE:vehicle_vin,'"') as VEHICLE_VIN,trim(VALUE:vehicle_make,'"') as VEHICLE_MAKE,trim(VALUE:vehicle_model,'"') as VEHICLE_MODEL,trim(VALUE:vehicle_year,'"') as VEHICLE_YEAR,trim(VALUE:vehicle_trim,'"') as VEHICLE_TRIM,trim(VALUE:vehicle_mileage,'"') as VEHICLE_MILEAGE,trim(VALUE:endorsement_count,'"') as ENDORSEMENT_COUNT,trim(VALUE:endorsement_amount,'"') as ENDORSEMENT_AMOUNT,trim(VALUE:funded_endorsement_amount,'"') as FUNDED_ENDORSEMENT_AMOUNT,trim(VALUE:term_changes_count,'"') as TERM_CHANGES_COUNT,trim(VALUE:seller_cost_adjustment_count,'"') as SELLER_COST_ADJUSTMENT_COUNT,trim(VALUE:reinstatement_count,'"') as REINSTATEMENT_COUNT,trim(VALUE:due_date_lifetime_change_count,'"') as DUE_DATE_LIFETIME_CHANGE_COUNT,trim(VALUE:due_date_yearly_change_count,'"') as DUE_DATE_YEARLY_CHANGE_COUNT,trim(VALUE:extensions_lifetime_count,'"') as EXTENSIONS_LIFETIME_COUNT,trim(VALUE:extensions_yearly_count,'"') as EXTENSIONS_YEARLY_COUNT,trim(VALUE:extensions_lifetime_terms_updated,'"') as EXTENSIONS_LIFETIME_TERMS_UPDATED,trim(VALUE:extensions_yearly_terms_updated,'"') as EXTENSIONS_YEARLY_TERMS_UPDATED,trim(VALUE:total_retail_cost,'"') as TOTAL_RETAIL_COST,trim(VALUE:down_payment_amount,'"') as DOWN_PAYMENT_AMOUNT,trim(VALUE:installments,'"') as INSTALLMENTS,trim(VALUE:installment_amount,'"') as INSTALLMENT_AMOUNT,trim(VALUE:financed_amount,'"') as FINANCED_AMOUNT,trim(VALUE:accounts_discount_amount,'"') as ACCOUNTS_DISCOUNT_AMOUNT,trim(VALUE:seller_cost,'"') as SELLER_COST,trim(VALUE:dealer_profit,'"') as DEALER_PROFIT,trim(VALUE:seller_advance_amount,'"') as SELLER_ADVANCE_AMOUNT,trim(VALUE:seller_reserve_amount,'"') as SELLER_RESERVE_AMOUNT,trim(VALUE:admin_advance_amount,'"') as ADMIN_ADVANCE_AMOUNT,trim(VALUE:admin_reserve_amount,'"') as ADMIN_RESERVE_AMOUNT,trim(VALUE:annual_percentage_rate,'"') as ANNUAL_PERCENTAGE_RATE,trim(VALUE:service_fee_amount,'"') as SERVICE_FEE_AMOUNT,trim(VALUE:service_interest_percentage,'"') as SERVICE_INTEREST_PERCENTAGE,trim(VALUE:renewal_fee,'"') as RENEWAL_FEE,trim(VALUE:renewal_payhold,'"') as RENEWAL_PAYHOLD,trim(VALUE:finance_charge,'"') as FINANCE_CHARGE,trim(VALUE:mtm_advanced_installments,'"') as MTM_ADVANCED_INSTALLMENTS,trim(VALUE:is_shortage_account,'"') as IS_SHORTAGE_ACCOUNT,trim(VALUE:payments_made,'"') as PAYMENTS_MADE,trim(VALUE:paid_amount,'"') as PAID_AMOUNT,trim(VALUE:late_fee_paid_amount,'"') as LATE_FEE_PAID_AMOUNT,trim(VALUE:principal_balance_amount,'"') as PRINCIPAL_BALANCE_AMOUNT,trim(VALUE:last_payment_amount,'"') as LAST_PAYMENT_AMOUNT,trim(VALUE:payoff_amount,'"') as PAYOFF_AMOUNT,trim(VALUE:last_payment_date,'"') as LAST_PAYMENT_DATE,trim(VALUE:last_payment_description,'"') as LAST_PAYMENT_DESCRIPTION,trim(VALUE:installment_due_amount,'"') as INSTALLMENT_DUE_AMOUNT,trim(VALUE:delinquency_due_amount,'"') as DELINQUENCY_DUE_AMOUNT,trim(VALUE:delinquency_lifetime_count,'"') as DELINQUENCY_LIFETIME_COUNT,trim(VALUE:delinquency_yearly_count,'"') as DELINQUENCY_YEARLY_COUNT,trim(VALUE:nsf_assessed_count,'"') as NSF_ASSESSED_COUNT,trim(VALUE:nsf_waived_count,'"') as NSF_WAIVED_COUNT,trim(VALUE:nsf_due_amount,'"') as NSF_DUE_AMOUNT,trim(VALUE:late_fee_assessed_count,'"') as LATE_FEE_ASSESSED_COUNT,trim(VALUE:late_fee_waived_count,'"') as LATE_FEE_WAIVED_COUNT,trim(VALUE:late_fee_due_amount,'"') as LATE_FEE_DUE_AMOUNT,trim(VALUE:is_return_premium_paid,'"') as IS_RETURN_PREMIUM_PAID,trim(VALUE:is_nc_payment_should_hit_admin,'"') as IS_NC_PAYMENT_SHOULD_HIT_ADMIN,trim(VALUE:is_endorsement_should_hit_admin,'"') as IS_ENDORSEMENT_SHOULD_HIT_ADMIN,trim(VALUE:is_endorsement_should_hit_advance,'"') as IS_ENDORSEMENT_SHOULD_HIT_ADVANCE,trim(VALUE:is_terms_change_enabled,'"') as IS_TERMS_CHANGE_ENABLED,trim(VALUE:is_endorsements_enabled,'"') as IS_ENDORSEMENTS_ENABLED,trim(VALUE:is_seller_cost_adjustment_enabled,'"') as IS_SELLER_COST_ADJUSTMENT_ENABLED,
    trim(VALUE:is_auto_pay_suspended,'"') as IS_AUTO_PAY_SUSPENDED,trim(VALUE:initial_web_password,'"') as INITIAL_WEB_PASSWORD,trim(VALUE:customer_state,'"') as CUSTOMER_STATE,
    trim(VALUE:cancellation_hold_days,'"') as CANCELLATION_HOLD_DAYS,trim(VALUE:first_billed_date,'"') as FIRST_BILLED_DATE,trim(VALUE:last_billed_date,'"') as LAST_BILLED_DATE,
    trim(VALUE:late_charge_grace_days,'"') as LATE_CHARGE_GRACE_DAYS,trim(VALUE:delinquency_grace_days,'"') as DELINQUENCY_GRACE_DAYS,
    trim(VALUE:billing_statement_days,'"') as BILLING_STATEMENT_DAYS,trim(VALUE:maximum_due_date_change_days,'"') as MAXIMUM_DUE_DATE_CHANGE_DAYS,
    trim(VALUE:maximum_due_date_changes_per_year,'"') as MAXIMUM_DUE_DATE_CHANGES_PER_YEAR, trim(VALUE: maximum_due_date_changes_per_life,'"') as MAXIMUM_DUE_DATE_CHANGES_PER_LIFE,
    trim(VALUE:maximum_extensions_per_year, '"') as MAXIMUM_EXTENSIONS_PER_YEAR,
    trim(VALUE:maximum_extensions_per_life,'"') as MAXIMUM_EXTENSIONS_PER_LIFE,trim(VALUE:late_fee_amount,'"') as LATE_FEE_AMOUNT,trim(VALUE:late_fee_percentage,'"') as LATE_FEE_PERCENTAGE,
    trim(VALUE:late_fee_calculation,'"') as LATE_FEE_CALCULATION,trim(VALUE:nsf_fee_amount,'"') as NSF_FEE_AMOUNT,trim(VALUE:IS_PRISTINE,'"') as IS_PRISTINE
    FROM TEST_EDW.EXTERNAL.ACCOUNT
)

select *
from account_delta