SELECT day, count(assignments.id), sum(duration)
FROM assignments
GROUP BY day
Order BY day;