import { Request, Response } from "express";

export const decryptor = async (req: Request, res: Response, next: any) => {
    console.log(req.body);
    next();
}