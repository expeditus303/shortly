import bcrypt from "bcrypt"
import error from "../errors/errors.js"
import usersRepositories from "../repositories/auth.repositories.js"

async function signUp(req) {
    const { name, email, password } = req.body

    const {rowCount: existingUser} = await usersRepositories.findByEmail(email)
    if(existingUser > 0) throw error.conflict("Email already registered")

    const hashPassword = await bcrypt.hash(password, 10)

    await usersRepositories.create(name, email, hashPassword)

    return
}

const authServices = {
    signUp
}

export default authServices