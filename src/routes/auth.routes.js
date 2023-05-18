import { Router } from "express";
import schemasMiddleware from "../middlewares/schemas.middleware.js";
import authSchemas from "../schemas/auth.schemas.js";
import authControllers from "../controllers/auth.controllers.js";

const authRoutes = Router()

authRoutes.post("/signup", schemasMiddleware(authSchemas.signUp), authControllers.signUp)
authRoutes.post("/signin", schemasMiddleware(authSchemas.signIn), authControllers.signIn)


export default authRoutes