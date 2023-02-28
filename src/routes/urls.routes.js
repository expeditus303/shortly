import { Router } from "express";
import { deleteUrl, openUrl, sendUrl, shortenUrl } from "../controllers/urls.controllers.js";
import { tokenValidation } from "../middlewares/auths.middlewares.js";
import { validateModelBody } from "../middlewares/validateModel.middleware.js";
import { urlModel } from "../models/urls.models.js";

const urlRoutes = Router();

urlRoutes.get("/urls/open/:shortUrl", openUrl)
urlRoutes.get("/urls/:id", sendUrl)
urlRoutes.post("/urls/shorten", tokenValidation, validateModelBody(urlModel), shortenUrl);
urlRoutes.delete("/urls/:id", tokenValidation, deleteUrl)

export default urlRoutes;
