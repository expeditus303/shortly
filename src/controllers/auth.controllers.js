import { StatusCodes } from "http-status-codes";
import authServices from "../services/users.services.js";

async function signUp(req, res, next) {

    try {
        await authServices.signUp(req)

        res.sendStatus(StatusCodes.CREATED)

    } catch (err) {
        next(err)
    }
}

async function signIn(req, res, next) {

    try {
        const token = await authServices.signIn(req)

        res.status(StatusCodes.OK).send(token)
    } catch (err) {
        next(err)
    }
}

const authControllers = {
    signUp,
    signIn
}

export default authControllers