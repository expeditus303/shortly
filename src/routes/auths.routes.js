import { Router } from "express";
import { signUp } from "../controllers/auths.controllers.js";
import { checkUserExists } from "../middlewares/auths.middlewares.js";
import { validateModel } from "../middlewares/validateModel.middleware.js";
import { signupModel } from "../models/auths.models.js";

const authsRoutes = Router()

authsRoutes.post("/signup", validateModel(signupModel), checkUserExists(), signUp)

export default authsRoutes

