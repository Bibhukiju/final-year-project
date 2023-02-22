"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.castvote = void 0;
const vote_entity_1 = require("../entities/vote.entity");
const dataSource_1 = require("../utils/dataSource");
const voteRepository = dataSource_1.AppDataSource.getRepository(vote_entity_1.Vote);
const castvote = async (req, res) => {
    try {
        console.log(req.body);
        const { areaId, voteOrder } = req.body;
        console.log(areaId, voteOrder);
        const vote = voteRepository.create({ area_code: areaId, votes: voteOrder });
        console.log(vote);
        await voteRepository.save(vote);
        return res.send({ msg: 'vote casted' });
    }
    catch (error) {
        console.log(error);
    }
};
exports.castvote = castvote;
