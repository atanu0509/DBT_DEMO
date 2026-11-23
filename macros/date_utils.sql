{% macro get_season(x) %}

CASE 
WHEN MONTH(started_time) in (12,1,2) THEN 'WINTER'
WHEN MONTH(started_time) in (3,4,5) THEN 'SPRING'
WHEN MONTH(started_time) in (6,7,8) THEN 'SUMMER'
ELSE 'AUTUMN'
END

{% endmacro %}


{% macro day_type(x) %}
CASE
WHEN DAYNAME(Started_time) in ('Sat', 'Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{% endmacro %}