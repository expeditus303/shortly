import { StatusCodes } from "http-status-codes";
import usersServices from "../services/users.services.js";

async function getUserData(req, res, next) {
    try {
        const userData = await usersServices.getUserData(res)

        res.status(StatusCodes.OK).send(userData)
    } catch (err) {
        next(err)
    }
}

const usersControllers = {
    getUserData
}

export default usersControllers