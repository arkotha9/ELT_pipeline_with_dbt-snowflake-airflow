select
    *
FROM
    {{ ref('fct_orders') }}
WHERE
    date(order_date) > CURRENT_DATE() OR YEAR(DATE(order_date)) < 1990