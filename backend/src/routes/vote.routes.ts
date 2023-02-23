import { Router } from 'express';
import { castvote } from '../controllers/vote.controller';
import { validateVote } from '../utils/validateVote';

const voteRoutes = Router()

voteRoutes.post('/vote', validateVote, castvote)

export default voteRoutes;