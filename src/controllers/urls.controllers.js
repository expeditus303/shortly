import { StatusCodes } from "http-status-codes"
import urlsServices from "../services/urls.services.js"

async function openShortUrl(req, res, next) {
    try {
        const url = await urlsServices.openShortUrl(req)

        res.redirect(url)
    } catch (err) {
        next(err)
    }
}

async function getById(req, res, next) {
    try {
        const url = await urlsServices.getById(req)

        res.status(StatusCodes.OK).send(url)
    } catch (err) {
        next(err)
    }
}

async function create(req, res, next) {
    try {
        const shortUrl = await urlsServices.create(req, res)        

        res.status(StatusCodes.CREATED).send(shortUrl)
    } catch (err) {
        next(err)
    }
}

const urlsControllers = {
    create,
    getById,
    openShortUrl
}

export default urlsControllers