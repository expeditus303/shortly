import { Router } from "express";
import { shortenUrl } from "../controllers/urls.controllers.js";
import { tokenValidation } from "../middlewares/auths.middlewares.js";
import { validateModelBody } from "../middlewares/validateModel.middleware.js";
import { urlModel } from "../models/urls.models.js";

const urlRoutes = Router();

urlRoutes.post("/urls/shorten", tokenValidation, validateModelBody(urlModel), shortenUrl);

export default urlRoutes;
