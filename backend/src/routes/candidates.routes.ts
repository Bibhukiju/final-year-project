import { Router } from "express";
import { getCandidates } from "../controllers/candidates.controller";


const candidateRoutes = Router();

candidateRoutes.post('/candidates', getCandidates)

export default candidateRoutes;