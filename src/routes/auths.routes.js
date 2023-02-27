import { Router } from "express";
import { validateModel } from "../middlewares/validateModel.middleware.js";
import { signupModel } from "../models/auths.models.js";

const authsRoutes = Router()

authsRoutes.post("/signup", validateModel(signupModel))

export default authsRoutes

