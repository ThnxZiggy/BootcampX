CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);

--SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date, students.start_date as start_date
--FROM students 
--LEFT JOIN cohorts ON cohorts.id = cohort_id
--WHERE start_date != cohort_start_date
--ORDER BY cohort_start_date;--
