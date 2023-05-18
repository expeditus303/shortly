import db from "../config/database.connection.js";

function findUserByEmail(email) {
    return db.query(`SELECT * FROM users WHERE email =$1`, [email])
}

function createUser(name, email, hashPassword) {
    return db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashPassword])
}

function createSession(id, token) {
    return db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)`, [id, token])
}

function findSessionByToken(token){
    return db.query(`SELECT * FROM sessions WHERE token=$1`, [token])
}

const authRepositories = {
    findUserByEmail,
    createUser,
    createSession,
    findSessionByToken
}

export default authRepositories