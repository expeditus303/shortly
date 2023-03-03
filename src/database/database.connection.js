import dotenv from "dotenv";
import pkg from "pg";

dotenv.config();

const { Pool } = pkg;

const configDatabase = {
  connectionString: process.env.DATABASE_URL
};

if (process.env.MODE === "prod") configDatabase.ssl = true;


export const connectiondb = new Pool(configDatabase)


