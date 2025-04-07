const mysql = require('mysql2/promise');
require('dotenv').config();

const boliviaDB = mysql.createPool({
  host: process.env.DB_BOL_HOST,
  user: process.env.DB_BOL_USER,
  password: process.env.DB_BOL_PASS,
  database: process.env.DB_BOL_NAME,
});

module.exports = boliviaDB;
