"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateVote = void 0;
const validateVote = async (req, res, next) => {
    const { voterId } = req.body;
    console.log(req.body);
    console.log(voterId);
    next();
};
exports.validateVote = validateVote;
