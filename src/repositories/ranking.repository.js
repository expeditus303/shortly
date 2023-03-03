import { connectiondb } from "../database/database.connection";

export function getRankingDB() {
    return connectiondb.query(`SELECT
    users.id,
    users.name,
    COUNT(urls."userId") AS "linksCount",
    COALESCE(SUM(urls."visitCount"), 0) AS "visitCount"
  FROM
    users
    LEFT JOIN urls ON urls."userId" = users.id
  GROUP BY
    users.id
  ORDER BY
    "visitCount" DESC
  LIMIT
    10;`);
}