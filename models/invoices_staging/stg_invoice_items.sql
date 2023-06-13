WITH base AS (
    SELECT *
    FROM {{ source('invoices', 'invoice_item__raw') }}
)
SELECT
    invoice_id,
    id,
    type,
    period_start AS period_start_at,
    period_end AS period_end_at,
    amount,
    currency,
    _synced AS synced_at
FROM
    base