const mysql = require("mysql2")

const conn =  mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'senha123456',
    database: 'systemGraduation',
})

module.exports = conn;