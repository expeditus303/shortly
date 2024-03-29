import { Router } from "express";
import authMiddleware from "../middlewares/auth.middleware.js";
import urlsControllers from "../controllers/urls.controllers.js";
import schemasMiddleware from "../middlewares/schemas.middleware.js";
import urlsSchemas from "../schemas/urls.schemas.js";

const urlsRoutes = Router()

urlsRoutes.get("/urls/open/:shortUrl", schemasMiddleware(urlsSchemas.shortUrl, "params"), urlsControllers.openShortUrl)
urlsRoutes.get("/urls/:id", schemasMiddleware(urlsSchemas.id, "params") , urlsControllers.getById)
urlsRoutes.post("/urls/shorten", authMiddleware, schemasMiddleware(urlsSchemas.create), urlsControllers.create)
urlsRoutes.delete("/urls/:id", schemasMiddleware(urlsSchemas.id, "params"), authMiddleware, urlsControllers.deleteById)

export default urlsRoutes