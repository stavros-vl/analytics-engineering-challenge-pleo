with base as (
  select
    period_start_day,
    invoice_id,
    customer_id,
    mrr
  from {{ref('int_subscriptions_customers')}}
)
, all_dates as (
  select distinct
    date
  from unnest(generate_date_array(
    (select min(period_start_day) from base),
    (select max(period_start_day) from base),
    interval 1 day
  )) as date
)

, filled_dates as (
  select
    all_dates.date,
    base.invoice_id as invoice_id,
    base.customer_id as customer_id,
    coalesce(base.mrr, 0) as mrr
  from all_dates
  cross join base

)
select
  *
from filled_dates order by 1


