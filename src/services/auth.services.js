import bcrypt from "bcrypt"
import error from "../errors/errors.js"
import usersRepositories from "../repositories/users.repositories.js"
import { v4 as uuidv4 } from "uuid";
import authRepositories from "../repositories/auth.repositories.js";

async function signUp(req) {
    const { name, email, password } = req.body

    const { rowCount: existingUser } = await authRepositories.findUserByEmail(email)
    if (existingUser > 0) throw error.conflict("Email already registered")

    const hashPassword = await bcrypt.hash(password, 10)

    return await authRepositories.createUser(name, email, hashPassword)
}

async function signIn(req) {
    const { email, password } = req.body

    const {rows: [existingUser]} = await authRepositories.findUserByEmail(email)
    if(!existingUser) throw error.unauthorized("User email not found.")

    const passwordMatch = await bcrypt.compare(password, existingUser.password)
    if(!passwordMatch) throw error.unauthorized("Incorrect password.")

    const token = uuidv4()

    await authRepositories.createSession(existingUser.id, token)
    
    return token
}

const authServices = {
    signUp,
    signIn
}

export default authServices