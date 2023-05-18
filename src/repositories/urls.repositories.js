import db from "../config/database.connection.js";

function create(userId, url, shortenedUrl){
    return db.query(`INSERT INTO shorts ("userId", "shortUrl", url) VALUES ($1, $2, $3) RETURNING id, "shortUrl"`, [userId, url, shortenedUrl])
}

const urlsRepositories = {
    create
}

export default urlsRepositories