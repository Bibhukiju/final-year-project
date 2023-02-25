import { Router } from 'express';
import { decryptor } from '../utils/decrypter';

import { validateVote } from '../utils/validateVote';
import { castvote } from '../controllers/vote.controller';

const voteRoutes = Router()

voteRoutes.post('/vote', validateVote, decryptor, castvote)

export default voteRoutes;