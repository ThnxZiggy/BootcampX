--Select the name of the student, their average completion time, and the average suggested completion time.
--Order by average completion time from smallest to largest.
--Only get currently enrolled students.
--This will require data from students, assignment_submissions, and assignments.

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration,
avg(assignments.duration) as average_estimated_duration 
FROM assignments
JOIN assignment_submissions ON assignments.id = assignment_id
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration ASC;