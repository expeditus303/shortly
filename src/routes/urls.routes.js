import { Router } from "express";
import { deleteUrl, openUrl, sendUrl, shortenUrl } from "../controllers/urls.controllers.js";
import { tokenValidation } from "../middlewares/auths.middlewares.js";
import { validateModelBody } from "../middlewares/validateModel.middleware.js";
import { urlModel } from "../models/urls.models.js";

const urlsRoutes = Router();

urlsRoutes.get("/urls/open/:shortUrl", openUrl)
urlsRoutes.get("/urls/:id", sendUrl)
urlsRoutes.post("/urls/shorten", tokenValidation, validateModelBody(urlModel), shortenUrl);
urlsRoutes.delete("/urls/:id", tokenValidation, deleteUrl)

export default urlsRoutes;
