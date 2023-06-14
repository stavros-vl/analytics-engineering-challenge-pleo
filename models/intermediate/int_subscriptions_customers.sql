WITH base AS (
    SELECT 
        invoices.invoice_id,
        invoices.customer_id,
        mrr_base.period_start_day,
        mrr_base.period_end_day,
        mrr_base.converted_amount,
        mrr_base.mrr
    FROM 
        {{ ref("mrr_base") }} mrr_base
    INNER JOIN 
        {{ ref("stg_invoice") }} invoices
    ON 
        invoices.invoice_id = mrr_base.id

)
SELECT 
  *
FROM base