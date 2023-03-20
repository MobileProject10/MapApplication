const mysql = require('mysql2');

const map_application = mysql.createPool({
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    waitForConnections: true,
    multipleStatements: true,
    connectionLimit: 10
})

module.exports = map_application