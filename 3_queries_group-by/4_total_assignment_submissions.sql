--Select the cohort name and total submissions.
--Order the results from greatest to least submissions.

SELECT cohorts.name as cohort, count(assignment_submissions.id) as total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.id) DESC;





-- cohort | total_submissions 
--------+-------------------
 --SEP24  |              9328
 --JUN04  |              8030