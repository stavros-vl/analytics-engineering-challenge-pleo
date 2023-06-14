{% macro calculate_mrr(converted_amount, period_start_day, period_end_day) %}
  SAFE_DIVIDE({{ converted_amount }}, DATE_DIFF({{ period_end_day }}, {{ period_start_day }}, DAY) + 1)
{% endmacro %}