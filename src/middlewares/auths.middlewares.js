import bcrypt from "bcrypt";
import { connectiondb } from "../database/database.connection.js";

export async function checkUserExists(req, res, next) {
  const { email } = req.body;

  try {
    const userExists = await connectiondb.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    if (userExists.rowCount !== 0) return res.sendStatus(409);

    next();
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function checkEmailPassword(req, res, next) {
  const { email, password } = req.body;

  try {
    const userExists = await connectiondb.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    if (userExists.rowCount === 0) return res.sendStatus(401);

    const user = userExists.rows[0];

    const hashPassword = bcrypt.compareSync(password, user.password);

    if (!hashPassword) return res.sendStatus(401);

    res.locals.user = user;

    next();
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function tokenValidation(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) return res.sendStatus(401);

  try {
    const tokenExists = await connectiondb.query(
      `SELECT * FROM sessions WHERE token = $1`,
      [token]
    );

    if (tokenExists.rowCount === 0) return res.sendStatus(401);

    const userId = tokenExists.rows[0].userId

    res.locals.userId = userId

    next();
  } catch (err) {
    res.status(500).send(err.message);
  }
}
