const mysql = require('mysql2/promise');
require('dotenv').config();

const alemaniaDB = mysql.createPool({
  host: process.env.DB_ALE_HOST,
  user: process.env.DB_ALE_USER,
  password: process.env.DB_ALE_PASS,
  database: process.env.DB_ALE_NAME,
});

module.exports = alemaniaDB;
