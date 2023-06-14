WITH 
  base AS (SELECT * FROM {{ ref("int_subscriptions_customers") }})

, mrr_per_customer_month as (
  SELECT
    customer_id,
    date_trunc(period_start_day, month) as month_,
    SUM(mrr) as mrr_per_month
  FROM base
  GROUP BY 1, 2
  ORDER BY 2

)
SELECT 
  * 
FROM mrr_per_customer_month

