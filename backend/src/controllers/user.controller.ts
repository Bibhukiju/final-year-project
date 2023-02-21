import { Request, Response } from "express"
import { User } from "../entities/user.entity"
import { AppDataSource } from "../utils/dataSource"


const userRepository = AppDataSource.getRepository(User)
export const verifyUser = async (req: Request, res: Response): Promise<Response> => {

    try {
        const user = userRepository.find({ where: {} })
        console.log(user)
        return res.send({})
    } catch (error) {

    }


}