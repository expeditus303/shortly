import db from "../config/database.connection.js";

function getByShortUrl(shortUrl){
    return db.query(`SELECT url FROM shorts WHERE "shortUrl" = $1`, [shortUrl])
}

function getById(id){
    return db.query(`SELECT id, "shortUrl", url FROM shorts WHERE id = $1`, [id])
}

function create(userId, url, shortenedUrl){
    return db.query(`INSERT INTO shorts ("userId", url, "shortUrl") VALUES ($1, $2, $3) RETURNING id, "shortUrl"`, [userId, url, shortenedUrl])
}

const urlsRepositories = {
    getByShortUrl,
    getById,
    create,
}

export default urlsRepositories