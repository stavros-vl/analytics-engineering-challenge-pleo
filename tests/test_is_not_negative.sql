{% test is_not_negative(model, column_name) %}

with validation as (

    select
        {{ column_name }} as col_to_check

    from {{ model }}

),

validation_errors as (

    select
        col_to_check

    from validation
    where col_to_check < 0

)

select *
from validation_errors

{% endtest %}