import db from "../config/database.connection.js";

function getByShortUrl(shortUrl){
    return db.query(`UPDATE shorts SET "visitCount" = "visitCount" + 1 WHERE "shortUrl" = $1 RETURNING url`, [shortUrl])
}

function getById(id){
    console.log(id)
    return db.query(`SELECT id, "shortUrl", url FROM shorts WHERE id = $1`, [id])
}

function create(userId, url, shortenedUrl){
    return db.query(`INSERT INTO shorts ("userId", url, "shortUrl") VALUES ($1, $2, $3) RETURNING id, "shortUrl"`, [userId, url, shortenedUrl])
}

function deleteById(shortUrlId, userId){
    return db.query(`
    WITH deleted_rows AS (
        DELETE FROM shorts
        WHERE id=$1 AND "userId"=$2
        RETURNING id, "userId"
      )
      SELECT
        CASE WHEN EXISTS (SELECT 1 FROM deleted_rows) THEN 'Record deleted'
             WHEN EXISTS (SELECT 1 FROM shorts WHERE id = $1) THEN 'Mismatched userId'
             ELSE 'Mismatched id'
        END AS deletion_status;
    `, [shortUrlId, userId])
}

const urlsRepositories = {
    getByShortUrl,
    getById,
    create,
    deleteById
}

export default urlsRepositories