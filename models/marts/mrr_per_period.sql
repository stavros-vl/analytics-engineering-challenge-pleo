WITH 
  base_mrr AS (SELECT * FROM {{ ref('mrr_base') }})

-- Add the different periods we want to see mrr for
, mrr_per_period AS (
  SELECT
    DATE_TRUNC(period_start_day, DAY) AS day_s,
    DATE_TRUNC(period_start_day, WEEK) AS week_s,
    DATE_TRUNC(period_start_day, MONTH) AS month_s,
    DATE_TRUNC(period_start_day, QUARTER) AS quarter_s,
    DATE_TRUNC(period_start_day, YEAR) AS year_s,
    SUM(mrr) AS mrr
  FROM
    base_mrr
  GROUP BY
    1, 2, 3, 4, 5
)
SELECT
  day_s,
  week_s,
  month_s,
  quarter_s,
  year_s,
  mrr
FROM
  mrr_per_period
