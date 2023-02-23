import { Request, Response } from "express"
import { User } from "../entities/user.entity"
import { AppDataSource } from "../utils/dataSource"


const userRepository = AppDataSource.getRepository(User)
export const verifyUser = async (req: Request, res: Response): Promise<Response> => {
    const { dob, name, citizenshipId } = req.body;
    console.log(req.body);
    if (dob && name && citizenshipId)
        try {
            const user = await userRepository.find({
                where: {
                    name,
                    citizenship_number: citizenshipId,
                    date_of_birth: dob,
                }
            })
            console.log(user);
            console.log(user.length, 'length of user');
            if (user.length === 1) {
                return res.status(200).send({ message: 'User found' })
            }
            else {
                return res.status(404).send({
                    message: 'User not found',
                    user
                })
            }
        } catch (error) {
            console.log(error);
            res.status(500).send({ message: 'Error ' + error })
        }
    else
        return res.status(404).send({ message: 'Fill all the data' })
}