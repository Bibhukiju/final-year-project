import { Request, Response } from "express";

export const validateVote = async (req: Request, res: Response, next: any) => {
    const { voterId } = req.body
    console.log(req.body);
    console.log(voterId);
    next();
}