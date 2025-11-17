{% macro Season_type(x) %}
CASE
    WHEN MONTH(TO_TIMESTAMP({{ x }})) in (12,1,2) THEN 'Winter'
    WHEN MONTH(TO_TIMESTAMP({{ x }})) in (3,4,5) THEN 'Spring'
    WHEN MONTH(TO_TIMESTAMP({{ x }})) in (6,7,8) THEN 'Summer'
    ELSE 'Autumn'
END
{% endmacro %}


{% macro Day_type(x) %}
CASE
when {{x}} in ('Sat','Sun') then 'Weekend'
else 'BusinessDay'
END
{% endmacro %}