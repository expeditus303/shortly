import { Router } from "express";
import authMiddleware from "../middlewares/auth.middleware.js";
import usersControllers from "../controllers/users.controllers.js";

const usersRoutes = Router()

usersRoutes.get("/users/me", authMiddleware, usersControllers.getUserData)
usersRoutes.get("/ranking", usersControllers.getRanking)

export default usersRoutes