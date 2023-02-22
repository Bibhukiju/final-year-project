"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const candidates_controller_1 = require("../controllers/candidates.controller");
const candidateRoutes = (0, express_1.Router)();
candidateRoutes.get('/candidates/:id', candidates_controller_1.getCandidates);
candidateRoutes.post('/test', (req, res) => {
    console.log(req.body);
});
exports.default = candidateRoutes;
