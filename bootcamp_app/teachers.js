const { Pool } = require ('pg');

const pool = new Pool({
  user: 'ziggy',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = [process.argv[2] || 'JUL02'];
const queryString = `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohort;
  `
pool.query(queryString, cohort)
  .then(res => {
    console.table(res.rows)
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of${user.id} and was in the ${user.cohort} cohort.`);
    })
  })
  .catch(err => console.log('query error', err.stack));