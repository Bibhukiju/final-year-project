import { Request, Response, Router } from "express";


const testRoutes = Router();


testRoutes.get('/', async (req: Request, res: Response): Promise<Response> => {

    // const primes = generateKeys(5);
    return res.send({ test: 'primes' })
})

export default testRoutes;