--Select the students name and average time from assignment submissions.
--Order the results from greatest duration to least greatest duration.
--A student will have a null end_date if they are currently enrolled
--Expected Result:

      -- student       | average_assignment_duration 
---------------------+-----------------------------
 --Hettie Hettinger    |        140.0533333333333333
 --Santino Oberbrunner |        139.2991803278688525



 SELECT students.name as student, avg(assignments.duration) as average_assignment_duration
 FROM assignments
 JOIN assignment_submissions ON assignments.id = assignment_id
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
 ORDER BY average_assignment_duration DESC;
