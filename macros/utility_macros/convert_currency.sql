{% macro convert_currency(amount, currency) %}
CASE
  WHEN {{ currency }} = 'gbp' THEN {{ amount }} / 0.87
  WHEN {{ currency }} = 'sek' THEN {{ amount }} / 11.22
  WHEN {{ currency }} = 'dkk' THEN {{ amount }} / 7.45
  ELSE {{ amount }}
END
{% endmacro %}