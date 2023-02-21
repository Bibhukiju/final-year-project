import { Router } from "express";
import { getCandidates } from "../controllers/candidates.controller";


const candidateRoutes = Router();

candidateRoutes.get('/candidates/:id', getCandidates)

export default candidateRoutes;