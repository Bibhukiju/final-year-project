"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getCandidates = void 0;
const area_entity_1 = require("../entities/area.entity");
const dataSource_1 = require("../utils/dataSource");
const areaRepository = dataSource_1.AppDataSource.getRepository(area_entity_1.Area);
const getCandidates = async (req, res) => {
    const areaCode = req.params.id;
    console.log(areaCode);
    console.log("hello from candidates");
    try {
        const candidates = await areaRepository.find({
            relations: {
                candidates: true
            },
            where: {
                area_id: areaCode
            }
        });
        console.log(candidates);
        return res.send(candidates[0]);
    }
    catch (error) {
        console.log(error);
    }
};
exports.getCandidates = getCandidates;
