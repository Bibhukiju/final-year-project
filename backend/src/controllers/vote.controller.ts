import { Request, Response } from "express";
import { Vote } from "../entities/vote.entity";
import { AppDataSource } from "../utils/dataSource";
import { rsa } from "../app";
import { decoder } from "../utils/number_to_ASCII";


const voteRepository = AppDataSource.getRepository(Vote)
export const castvote = async (req: Request, res: Response): Promise<Response> => {
    try {
        const { vote } = req.body;
        console.log(vote)
        const decryptedText = decoder(vote);
        return res.send({ message: decryptedText })
    } catch (error) {
        console.log(error)
    }
}


