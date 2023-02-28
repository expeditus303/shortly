import { getUserData } from "../repository/users.repositories.js"

export async function userInfo(req, res) {
    const userId = res.locals.userId

    try {
        const userData = await getUserData(userId)

        res.status(200).send(userData.rows[0])
    } catch (err) {
        
    }
}