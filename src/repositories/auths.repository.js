import { connectiondb } from "../database/database.connection.js";

export function createNewUser(name, email, hashedPassword) {
    return connectiondb.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3);", [name, email, hashedPassword])
}

export function checkSessionExists(userId){
    return connectiondb.query(`SELECT * FROM sessions WHERE "userId" = $1`, [userId])
}

export function createSession(userId, token) {
    return connectiondb.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)`, [userId, token])
}
