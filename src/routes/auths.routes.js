import { Router } from "express";
import { signIn, signUp } from "../controllers/auths.controllers.js";
import { checkEmailPassword, checkUserExists } from "../middlewares/auths.middlewares.js";
import { validateModelBody } from "../middlewares/validateModel.middleware.js";
import { signinModel, signupModel } from "../models/auths.models.js";

const authsRoutes = Router()

authsRoutes.post("/signup", validateModelBody(signupModel), checkUserExists, signUp)
authsRoutes.post("/signin", validateModelBody(signinModel), checkEmailPassword, signIn)

export default authsRoutes

