const map_application = require("../mp")

const user = {
    register: (username, password, callback) => {
        db.query(`INSERT INTO users (username, password) VALUES (? , ?)`, [username, password], callback)
    },
    getUserByName: (username, callback) => {
        db.query(`SELECT * FROM users WHERE username=?`, [username], callback)
    }
}

module.exports = user;