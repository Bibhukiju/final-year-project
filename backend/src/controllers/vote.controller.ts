import { Request, Response } from "express";
import { Vote } from "../entities/vote.entity";
import { AppDataSource } from "../utils/dataSource";


const voteRepository = AppDataSource.getRepository(Vote)
export const castvote = async (req: Request, res: Response): Promise<Response> => {
    console.log(req.body)
    const { votes } = req.body;
    const vote = voteRepository.create(votes);
    console.log(vote)

    return res.send({ msg: 'vote casted' })
}