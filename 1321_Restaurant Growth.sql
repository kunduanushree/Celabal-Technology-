WITH DailyTotal AS (
  SELECT
    visited_on,
    SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
Windowed AS (
  SELECT
    visited_on,
    SUM(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(
      AVG(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
      ), 2
    ) AS average_amount,
    RANK() OVER (ORDER BY visited_on) AS rnk
  FROM DailyTotal
)
SELECT
  visited_on,
  amount,
  average_amount
FROM Windowed
WHERE rnk >= 7
ORDER BY visited_on;
