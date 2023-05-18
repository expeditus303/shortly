import { Router } from "express";
import authRoutes from "./auth.routes.js";

const routes = Router()

routes.use([authRoutes])

export default routes