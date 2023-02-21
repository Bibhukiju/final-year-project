import { Request, Response } from "express";
import { Area } from "../entities/area.entity";
import { AppDataSource } from "../utils/dataSource";

const areaRepository = AppDataSource.getRepository(Area)
export const getCandidates = async (req: Request, res: Response): Promise<Response> => {
    const areaCode = req.params.id;
    console.log(areaCode);
    console.log("hello from candidates")
    try {
        const candidates = await areaRepository.find({
            relations: {
                candidates: true
            },
            where: {
                area_id: areaCode
            }
        });
        console.log(candidates)
        return res.send(candidates)
    } catch (error) {
        console.log(error)
    }

}