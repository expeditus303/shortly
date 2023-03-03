import dotenv from "dotenv";
import pkg from "pg";

dotenv.config();

const { Pool } = pkg;

export const connectiondb = new Pool({
  connectionString: process.env.DATABASE_URL
});

if (process.env.MODE === "prod") connectiondb.ssl = true;



