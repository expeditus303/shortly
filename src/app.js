import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import authsRoutes from "./routes/auths.routes.js";
import urlRoutes from "./routes/urls.routes.js";

dotenv.config();

const app = express();
app.use(express.json())
app.use(cors())

app.use(authsRoutes)
app.use(urlRoutes)

const PORT = process.env.PORT
app.listen(PORT, () => console.log(`Server listening on ${PORT}`))
