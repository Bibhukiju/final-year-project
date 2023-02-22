import { Router } from "express";
import { getCandidates } from "../controllers/candidates.controller";


const candidateRoutes = Router();

candidateRoutes.get('/candidates/:id', getCandidates)
candidateRoutes.post('/test', (req, res) => {
    console.log(req.body)
})

export default candidateRoutes;