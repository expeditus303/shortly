import { Router } from "express";
import { tokenValidation } from "../middlewares/auths.middlewares.js";

const urlRoutes = Router();

urlRoutes.post("/urls/shorten", tokenValidation);

export default urlRoutes;
