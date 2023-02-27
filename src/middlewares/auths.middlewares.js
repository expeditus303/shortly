import { connectiondb } from "../database/database.connection.js"

export function checkUserExists() {
    return async (req, res, next) => {
        const { email } = req.body

        const userExists = await connectiondb.query("SELECT * FROM users WHERE email = $1", [email])

        if (userExists.rowCount !== 0) return res.sendStatus(409)

        next()
    }
}