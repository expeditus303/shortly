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

    const { rows: [url] } = await urlsRepositories.getById(id)
    if (!url) throw error.notFound("Oops! The short URL you're looking for doesn't exist")

    return url
}

async function create(req, res) {
    const { url } = req.body
    const { userId } = res.locals

    const shortenedUrl = nanoid(12)

    const { rows: [shortUrl] } = await urlsRepositories.create(userId, url, shortenedUrl)

    return shortUrl
}

const urlsServices = {
    openShortUrl,
    getById,
    create,
}

export default urlsServices