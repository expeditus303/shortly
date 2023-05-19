import { Router } from "express";
import authRoutes from "./auth.routes.js";
import urlsRoutes from "./urls.routes.js";
import usersRoutes from "./users.routes.js";

const routes = Router()

routes.use([authRoutes, urlsRoutes, usersRoutes])

export default routes