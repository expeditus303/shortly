import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { checkSessionExists, createNewUser, createSession } from '../repositories/auths.repository.js';

export async function signUp(req, res) {
    const { name, email, password } = req.body


    const hashedPassword = bcrypt.hashSync(password, 10)

    try {
        await createNewUser(name, email, hashedPassword)

        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signIn(req, res) {
    const token = uuid()
    const userId = res.locals.user.id

    const sendToken = {token: "token"}

    try {
        const sessionExists = await checkSessionExists(userId)

        const user = sessionExists.rows[0]

        if (sessionExists.rowCount !== 0) sendToken.token = user.token

        if (sessionExists.rowCount === 0) {
            await createSession(userId, token)
            sendToken.token = token            
        }
            
        return res.status(200).send(sendToken)

    } catch (err) {
        res.status(500).send(err.message)
    }
}