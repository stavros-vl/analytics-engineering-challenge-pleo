WITH base AS (
    SELECT *
    FROM {{ source('invoices', 'invoice_raw') }}
)
SELECT
    invoice_id,
    customer_id
FROM
    base