const map_application = require("../mp")

const user = {
    register: (username, password, callback) => {
        map_application.query(`INSERT INTO users (username, password) VALUES (? , ?)`, [username, password], callback)
    },
    getUserByName: (username, callback) => {
        map_application.query(`SELECT * FROM users WHERE username=?`, [username], callback)
    },
    deleteUserByName: (username, callback) => {
        map_application.query(`DELETE FROM users WHERE username=?`, [username], callback)
    }
}

module.exports = user;