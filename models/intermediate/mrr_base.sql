WITH 
  subscriptions_base AS ( SELECT * FROM {{ ref('int_subscriptions') }})

-- Calculate the mrr per day with the given formula using the macro 'calculate_mrr'
, mrr_per_day AS (
    SELECT
        *,
        {{ calculate_mrr('converted_amount', 'period_start_day', 'period_end_day') }} AS mrr
    FROM
        subscriptions_base

)
SELECT
    *
FROM mrr_per_day