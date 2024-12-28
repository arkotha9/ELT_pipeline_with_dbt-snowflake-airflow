SELECT
    litems.order_item_key,
    litems.part_key,
    litems.line_number,
    litems.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    {{ discounted_amt('litems.extended_price', 'litems.discount_percentage')}} as item_discount_amount
FROM
    {{ ref('stg_tpch_orders') }} as orders
JOIN
    {{ ref('stg_tpch_line_items') }} as litems
ON
    orders.order_key = litems.order_key
ORDER BY
    orders.order_date