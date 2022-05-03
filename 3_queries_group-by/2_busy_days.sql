SELECT day, count(id)
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;