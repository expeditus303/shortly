import { nanoid } from "nanoid";
import { connectiondb } from "../database/database.connection.js";
import { createShortUrl } from "../repository/urls.repositories.js";

export async function shortenUrl(req, res) {
  const { url } = req.body;

  const userId = res.locals.userId;

  const shortUrl = nanoid(10);

  try {
    const shortUrlId = await createShortUrl(userId, shortUrl, url);

    const id = shortUrlId.rows[0].id;

    const sendShortUrl = {
      id,
      shortUrl,
    };
    res.status(201).send(sendShortUrl);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function openUrl(req, res) {
  const { shortUrl } = req.params;

  try {
    const url = await connectiondb.query(`UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE "shortUrl" = $1 RETURNING url`, [shortUrl])

    if (url.rowCount === 0) return res.sendStatus(404)

    const openUrl = url.rows[0].url
    res.redirect(openUrl)
  } catch (err) {
    res.status(500).send(err.message);
  }
}
