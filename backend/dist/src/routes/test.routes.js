"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const generatePrime_1 = require("../utils/generatePrime");
const testRoutes = (0, express_1.Router)();
testRoutes.get('/', async (req, res) => {
    const primes = (0, generatePrime_1.generatePrimes)(50, 100);
    return res.send({ primes });
});
exports.default = testRoutes;
