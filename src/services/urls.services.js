import { nanoid } from 'nanoid'
import urlsRepositories from '../repositories/urls.repositories.js'

async function create(req, res){
    const { url } = req.body
    const { userId } = res.locals

    const shortenedUrl = nanoid(12)
    
    const {rows: [shortUrl]} = await urlsRepositories.create(userId, url, shortenedUrl)

    return shortUrl
}

const urlsServices = {
    create
}

export default urlsServices