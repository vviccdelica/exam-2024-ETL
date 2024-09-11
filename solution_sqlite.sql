WITH customer_sales AS (
    SELECT
        customers.customer_id,
        customers.age,
        sales_id
    FROM customers
    INNER JOIN sales
        ON sales.customer_id = customers.customer_id
    WHERE 
        customers.age >= 18
        AND
        customers.age <= 35
)
SELECT
    customer_id,
    age,
    item_name,
    SUM(CAST(quantity AS INTEGER)) as order_quantity
FROM orders
INNER JOIN customer_sales
    ON customer_sales.sales_id = orders.sales_id
INNER JOIN items
    ON items.item_id = orders.item_id
WHERE quantity > 0
GROUP BY 1,2,3