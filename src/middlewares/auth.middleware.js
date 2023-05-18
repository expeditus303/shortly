import error from "../errors/errors.js";
import authRepositories from "../repositories/auth.repositories.js"
import { validate as uuidValidate } from 'uuid';

async function authMiddleware(req, res, next){
    const { authorization } = req.headers
    const token = authorization?.replace("Bearer ", "")

    const isTokenValid = uuidValidate(token)
    if(!isTokenValid) throw error.unauthorized("Invalid or missing authentication token")

    try {
        const {rows: [existingSession]} = await authRepositories.findSessionByToken(token)
        if(!existingSession) throw error.unauthorized("User not found for the given authentication token")
        
        res.locals.userId = existingSession.userId

        next()
        
    } catch (err) {
        next(err)
    }
}

export default authMiddleware