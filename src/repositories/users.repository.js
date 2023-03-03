import { connectiondb } from "../database/database.connection.js";

export function getUserData(userId) {
  return connectiondb.query(`
    SELECT 
    u.id AS "id",
    u.name AS "name",
    SUM(urls."visitCount") AS "visitCount",
    json_agg(
      json_build_object(
        'id', urls.id,
        'shortUrl', urls."shortUrl",
        'url', urls.url,
        'visitCount', urls."visitCount"
      )
    ) AS "shortenedUrls"
    FROM 
    users AS u
    LEFT JOIN urls ON u.id = urls."userId"
    WHERE 
    u.id = $1
    GROUP BY 
    u.id;`,
    [userId]
  );
}
