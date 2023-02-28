import { Router } from "express";
import { userInfo } from "../controllers/users.controllers.js";
import { tokenValidation } from "../middlewares/auths.middlewares.js";

const usersRoutes = Router()

usersRoutes.get("/users/me", tokenValidation, userInfo)

export default usersRoutes