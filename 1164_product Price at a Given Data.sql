WITH RankedProducts AS (
  SELECT
    product_id,
    new_price,
    RANK() OVER (
      PARTITION BY product_id
      ORDER BY change_date DESC
    ) AS rnk
  FROM Products
  WHERE change_date <= '2019-08-16'
), Latest AS (
  SELECT product_id, new_price
  FROM RankedProducts
  WHERE rnk = 1
)
SELECT
  DISTINCT p.product_id,
  IFNULL(l.new_price, 10) AS price
FROM Products p
LEFT JOIN Latest l USING (product_id);
