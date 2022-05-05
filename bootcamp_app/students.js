const { Pool } = require ('pg');


//connect to the bootcampx database in students.js using this example;
const pool = new Pool({
  user: 'ziggy',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// could have also connected using  the following;
// const { Client } = require('pg');

// const client = new Client({
//   user: 'vagrant',
//   password: '123',
//   host: 'localhost',
//   database: 'bootcampx'
// });

//pool is the preferred method with Node-gres


//start writing queries - this is using SQL:
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;

//this is by writing with JS:
const cohort = process.argv[2];
const limit = process.argv[3];
pool.query(`SELECT students.id id, students.name name, cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE '%${cohort}%'
  LIMIT ${limit || 5};
  `)
  .then(res => {
    console.table(res.rows)
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of${user.id} and was in the ${user.cohort} cohort.`);
    })
  })
  .catch(err => console.log('query error', err.stack));