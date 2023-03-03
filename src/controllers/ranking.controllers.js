import { getRankingDB } from "../repositories/ranking.repository.js";

export async function getRanking(req, res) {
  try {
    const ranking = await getRankingDB()

    res.status(200).send(ranking.rows)
  } catch (err) {}
}
