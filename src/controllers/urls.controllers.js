import { nanoid } from "nanoid";
import {
  checkUrl,
  createShortUrl,
  deleteUrlDB,
  getUrl,
  getUrlData,
} from "../repositories/urls.repository.js";

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
    const url = await getUrl(shortUrl);

    if (url.rowCount === 0) return res.sendStatus(404);

    const openUrl = url.rows[0].url;
    res.redirect(openUrl);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function sendUrl(req, res) {
  const { id } = req.params;

  try {
    const urlData = await getUrlData(id);

    if (urlData.rowCount === 0) return res.sendStatus(404);

    res.status(200).send(urlData.rows[0]);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function deleteUrl(req, res) {
  const { id: urlId } = req.params;

  const userId = res.locals.userId;

  try {
    const checkUrlExists = await checkUrl(urlId)

    if (checkUrlExists.rowCount === 0) return res.sendStatus(404)

    const deleteUrl = await deleteUrlDB(urlId, userId)

    if (deleteUrl.rowCount === 0) return res.sendStatus(401)

    res.sendStatus(204);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
