import { nanoid } from 'nanoid'
import urlsRepositories from '../repositories/urls.repositories.js'
import error from '../errors/errors.js'

async function openShortUrl(req) {
    const { shortUrl } = req.params

    const { rows: [url] } = await urlsRepositories.getByShortUrl(shortUrl)
    if (!url) throw error.notFound("Oops! The short URL you're looking for doesn't exist")

    return url.url
}

async function getById(req) {
    const { id } = req.params

    const queryResult = await urlsRepositories.getById(id)
    if (!queryResult.rowCount) throw error.notFound("Oops! The short URL you're looking for doesn't exist")
    
    const [shortUrl] = queryResult.rows
    return shortUrl
}

async function create(req, res) {
    const { url } = req.body
    const { userId } = res.locals

    const shortenedUrl = nanoid(12)

    const { rows: [shortUrl] } = await urlsRepositories.create(userId, url, shortenedUrl)

    return shortUrl
}

async function deleteById(req, res){
    const { id: shortUrlId } = req.params
    const { userId } = res.locals

    const { rows: [{deletion_status}]} = await urlsRepositories.deleteById(shortUrlId, userId)

    if(deletion_status === "Mismatched userId") throw error.unauthorized()
    if(deletion_status === "Mismatched id") throw error.notFound()

    return 
}

const urlsServices = {
    openShortUrl,
    getById,
    create,
    deleteById
}

export default urlsServices