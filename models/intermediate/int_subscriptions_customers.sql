WITH base AS (
    SELECT 
        invoices.invoice_id,
        invoices.customer_id,
        subscriptions.period_start_day,
        subscriptions.period_end_day,
        subscriptions.converted_amount
    FROM 
        {{ ref("int_subscriptions") }} subscriptions
    INNER JOIN 
        {{ ref("stg_invoice") }} invoices
    ON 
        invoices.invoice_id = subscriptions.id

)
SELECT 
  *
FROM base