WITH subscriptions_base AS (
    SELECT *
    FROM {{ ref("stg_invoice_items") }}
    WHERE type = 'subscription'    
)
SELECT 
    invoice_id,
    id,
    DATE(period_start_at) AS period_start_day,
    DATE(period_end_at) AS period_end_day,    
    {{ convert_currency('amount', 'currency') }} AS converted_amount
FROM subscriptions_base
