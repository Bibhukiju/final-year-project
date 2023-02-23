import { Request, Response, Router } from "express";
import { generatePrimes } from "../utils/generatePrime";

const testRoutes = Router();


testRoutes.get('/', async (req: Request, res: Response): Promise<Response> => {
    
    const primes = generatePrimes(50, 100);
    return res.send({ primes })
})

export default testRoutes;