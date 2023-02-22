"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const vote_controller_1 = require("../controllers/vote.controller");
const voteRoutes = (0, express_1.Router)();
voteRoutes.post('/vote', vote_controller_1.castvote);
