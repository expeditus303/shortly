import { Router } from "express";
import authRoutes from "./auth.routes.js";
import urlsRoutes from "./urls.routes.js";

const routes = Router()

routes.use([authRoutes, urlsRoutes])

export default routes