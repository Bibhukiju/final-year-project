"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.decryptor = void 0;
const decryptor = async (req, res, next) => {
    console.log(req.body);
    next();
};
exports.decryptor = decryptor;
