"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const decrypter_1 = require("../utils/decrypter");
const validateVote_1 = require("../utils/validateVote");
const vote_controller_1 = require("../controllers/vote.controller");
const voteRoutes = (0, express_1.Router)();
voteRoutes.post('/vote', validateVote_1.validateVote, decrypter_1.decryptor, vote_controller_1.castvote);
exports.default = voteRoutes;
