"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const testRoutes = (0, express_1.Router)();
testRoutes.get('/', async (req, res) => {
    // const primes = generateKeys(5);
    return res.send({ test: 'primes' });
});
exports.default = testRoutes;
