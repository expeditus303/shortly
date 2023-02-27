import bcrypt from "bcrypt"
import { connectiondb } from "../database/database.connection.js"

export function checkUserExists() {
    return async (req, res, next) => {
        const { email } = req.body

        const userExists = await connectiondb.query("SELECT * FROM users WHERE email = $1", [email])

        if (userExists.rowCount !== 0) return res.sendStatus(409)

        next()
    }
}

export function checkEmailPassword() {
    return async (req, res, next) => {
        const { email, password } = req.body

        const userExists = await connectiondb.query("SELECT * FROM users WHERE email = $1", [email])

        if (userExists.rowCount === 0) return res.sendStatus(401)

        const user = userExists.rows[0]

        const hashPassword = bcrypt.compareSync(password, user.password)

        if (!hashPassword) return res.sendStatus(401)

        res.locals.user = user

        console.log(user.id)
        
        next()
    }
}