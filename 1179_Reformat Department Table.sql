SELECT
  id,
  MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
  MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
  MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue
FROM Department
GROUP BY id
ORDER BY id;
