import db from "../config/database.connection.js";

function findByEmail(email) {
    return db.query(`SELECT * FROM users WHERE email =$1`, [email])
}

function createUser(name, email, hashPassword) {
    return db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashPassword])
}

function getUserData(userId) {
    return db.query(`
    SELECT
        u.id,
        u.name,
        SUM(s."visitCount") AS "visitCount",
        jsonb_agg(
            jsonb_build_object(
                'id',
                s.id,
                'shortUrl',
                s."shortUrl",
                'url',
                s.url,
                'visitCount',
                s."visitCount"
            )
        ) AS "shortenedUrls"
    FROM users AS u
        JOIN shorts AS s ON u.id = s."userId"
    WHERE u.id = $1
    GROUP BY u.id
    `, [userId])
}

function getRanking(){
    return db.query(`
    SELECT
        u.id,
        u.name,
        COUNT(s."userId") AS "linksCount",
        SUM(s."visitCount") AS "visitCount"
    FROM users AS u
        JOIN shorts AS s ON u.id = s."userId"
    GROUP BY u.id
    ORDER BY
        "visitCount" DESC,
        u.name ASC
    LIMIT 10
    `)
}

const usersRepositories = {
    findByEmail,
    createUser,
    getUserData,
    getRanking
}

export default usersRepositories