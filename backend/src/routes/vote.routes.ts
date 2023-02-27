import { Router } from 'express';
import { castvote } from '../controllers/vote.controller';

const voteRoutes = Router()

voteRoutes.post('/vote', castvote)

export default voteRoutes;