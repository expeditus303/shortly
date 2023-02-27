import bcrypt from 'bcrypt';
import { connectiondb } from '../database/database.connection.js';
import { v4 as uuid } from 'uuid';

export async function signUp(req, res) {
    const { name, email, password } = req.body


    const hashedPassword = bcrypt.hashSync(password, 10)

    try {
        await connectiondb.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3);", [name, email, hashedPassword])

        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}