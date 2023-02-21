import { Request, Response } from "express";
import { Candidates } from "../entities/candidates.entity";
import { AppDataSource } from "../utils/dataSource";

const candidateRepository = AppDataSource.getRepository(Candidates)
export const getCandidates = async (req: Request, res: Response): Promise<Response> => {
    const { areaCode } = req.body;
    try {
        const candidates = candidateRepository.find({
            relations: {
                area: true,
            },
            where: {
                area: areaCode
            }
        });
        return res.send(candidates)
    } catch (error) {

    }

}