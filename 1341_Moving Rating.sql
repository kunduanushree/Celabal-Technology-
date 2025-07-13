(
  SELECT user_id AS name
  FROM MovieRating
  GROUP BY user_id
  ORDER BY COUNT(*) DESC, user_id
  LIMIT 1
)
UNION ALL
(
  SELECT m.title AS name
  FROM MovieRating mr
  JOIN Movie m ON mr.movie_id = m.movie_id
  WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
  GROUP BY mr.movie_id, m.title
  ORDER BY AVG(mr.rating) DESC, m.title
  LIMIT 1
);
