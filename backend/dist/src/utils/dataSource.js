"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppDataSource = void 0;
const typeorm_1 = require("typeorm");
exports.AppDataSource = new typeorm_1.DataSource({
    type: "mysql",
    host: "127.0.0.1",
    port: 3306,
    username: "root",
    password: "",
    database: "election",
    entities: ['dist/src/entities/*.entity.js'],
<<<<<<< HEAD
    logging: true,
=======
>>>>>>> 8182123ce764a1e1856b7496c192370606aca880
    synchronize: true,
});
