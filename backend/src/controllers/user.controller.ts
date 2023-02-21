import { Request, Response } from "express"

export const verifyUser = (req: Request, res: Response) => {
    console.log(req.baseUrl);

}