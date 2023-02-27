"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.castvote = void 0;
const vote_entity_1 = require("../entities/vote.entity");
const dataSource_1 = require("../utils/dataSource");
const number_to_ASCII_1 = require("../utils/number_to_ASCII");
const voteRepository = dataSource_1.AppDataSource.getRepository(vote_entity_1.Vote);
const castvote = async (req, res) => {
    try {
        const { vote } = req.body;
        console.log(vote);
        const decryptedText = (0, number_to_ASCII_1.decoder)(vote);
        return res.send({ message: decryptedText });
    }
    catch (error) {
        console.log(error);
    }
};
exports.castvote = castvote;
