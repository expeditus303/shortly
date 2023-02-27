import { connectiondb } from "../database/database.connection.js";

export function createShortUrl(userId, shortUrl, url){
    return connectiondb.query(`INSERT INTO urls ("userId", "shortUrl", url) VALUES ($1, $2, $3) RETURNING id`, [userId, shortUrl, url])
}