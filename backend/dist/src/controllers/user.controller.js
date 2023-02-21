"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyUser = void 0;
const user_entity_1 = require("../entities/user.entity");
const dataSource_1 = require("../utils/dataSource");
const userRepository = dataSource_1.AppDataSource.getRepository(user_entity_1.User);
const verifyUser = async (req, res) => {
    try {
        const user = userRepository.find({ where: {} });
        console.log(user);
        return res.send({});
    }
    catch (error) {
    }
};
exports.verifyUser = verifyUser;
