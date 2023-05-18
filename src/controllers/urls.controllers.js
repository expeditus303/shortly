import { StatusCodes } from "http-status-codes"
import urlsServices from "../services/urls.services.js"

async function create(req, res, next) {

    try {
        const shortUrl = await urlsServices.create(req, res)        

        res.status(StatusCodes.CREATED).send(shortUrl)
    } catch (err) {
        next(err)
    }
}

const urlsControllers = {
    create
}

export default urlsControllers