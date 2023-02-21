import { Router } from "express";
import { verifyUser } from "../controllers/user.controller";

const userRouter = Router()


userRouter.post("/user",verifyUser)


export default userRouter;