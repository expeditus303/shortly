import { connectiondb } from "../database/database.connection.js";

export function createShortUrl(userId, shortUrl, url) {
  return connectiondb.query(
    `INSERT INTO urls ("userId", "shortUrl", url) VALUES ($1, $2, $3) RETURNING id`,
    [userId, shortUrl, url]
  );
}

export function getUrl(shortUrl) {
  return connectiondb.query(
    `UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE "shortUrl" = $1 RETURNING url`,
    [shortUrl]
  );
}

export function getUrlData(id) {
  return connectiondb.query(
    `SELECT id, "shortUrl", url FROM urls WHERE id = $1;`,
    [id]
  );
}

export function checkUrl(urlId) {
  return connectiondb.query(`SELECT * FROM urls WHERE id = $1`, [urlId])
}

export function deleteUrl(urlId, userId) {
  return connectiondb.query(
    `DELETE FROM urls WHERE id = $1 AND "userId" = $2`,
    [urlId, userId]
  );
}