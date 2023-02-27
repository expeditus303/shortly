import { Router } from "express";
import { signUp } from "../controllers/auths.controllers.js";
import { validateModel } from "../middlewares/validateModel.middleware.js";
import { signupModel } from "../models/auths.models.js";

const authsRoutes = Router()

authsRoutes.post("/signup", validateModel(signupModel), signUp)

export default authsRoutes

