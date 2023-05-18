import { Router } from "express";
import authMiddleware from "../middlewares/auth.middleware.js";
import urlsControllers from "../controllers/urls.controllers.js";
import schemasMiddleware from "../middlewares/schemas.middleware.js";
import urlsSchemas from "../schemas/urls.schemas.js";

const urlsRoutes = Router()

urlsRoutes.post("/urls/shorten", authMiddleware, schemasMiddleware(urlsSchemas.create), urlsControllers.create)

export default urlsRoutes