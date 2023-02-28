import { connectiondb } from "../database/database.connection.js";

export async function getRanking(req, res) {
  try {
    const ranking = await connectiondb.query(`SELECT
    users.id,
    users.name,
    COUNT(urls."userId") AS linksCount,
    COALESCE(SUM(urls."visitCount"), 0) AS visitCount
  FROM
    users
    LEFT JOIN urls ON urls."userId" = users.id
  GROUP BY
    users.id
  ORDER BY
    visitCount DESC
  LIMIT
    10;`);

    res.status(200).send(ranking.rows)
  } catch (err) {}
}
