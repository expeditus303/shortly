import { nanoid } from "nanoid";
import { createShortUrl } from "../repository/urls.repositories.js";

export async function shortenUrl(req, res) {
  const { url } = req.body;

  const userId = res.locals.userId

  const shortUrl = nanoid(10);

  try {
    const shortUrlId = await createShortUrl(userId, shortUrl, url)

    const id = shortUrlId.rows[0].id

    const sendShortUrl = {
        id,
        shortUrl
    }

    res.status(201).send(sendShortUrl)
  } catch (err) {
    res.status(500).send(err.message);
  }
}
