import db from "../config/database.connection.js";

function findByEmail(email) {
    return db.query(`SELECT * FROM users WHERE email =$1`, [email])
}

function createUser(name, email, hashPassword) {
    return db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashPassword])
}

const usersRepositories = {
    findByEmail,
    createUser,
}

export default usersRepositories