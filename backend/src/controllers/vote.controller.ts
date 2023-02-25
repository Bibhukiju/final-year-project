import { Request, Response } from "express";
import { Vote } from "../entities/vote.entity";
import { AppDataSource } from "../utils/dataSource";


const voteRepository = AppDataSource.getRepository(Vote)
export const castvote = async (req: Request, res: Response): Promise<Response> => {
    try {
        // console.log(req.body)
        // const { areaId, voteOrder } = req.body;
        // console.log(areaId, voteOrder)
        // const vote = voteRepository.create({ area_code: areaId, votes: voteOrder })
        // console.log(vote)
        // await voteRepository.save(vote);
        return res.send({ msg: 'vote casted' })



    } catch (error) {
        console.log(error)
    }


}