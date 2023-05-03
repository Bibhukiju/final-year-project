"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const assert = require("assert");
const typeorm_1 = require("typeorm");
describe('Database Connection', function () {
    it('should connect to the database', async function () {
        const AppDataSource = new typeorm_1.DataSource({
            type: "mysql",
            host: "127.0.0.1",
            port: 3306,
            username: "root",
            password: "",
            database: "election",
            entities: ['dist/src/entities/*.entity.js'],
            synchronize: true,
        });
        try {
            await AppDataSource.initialize();
            assert.ok(true);
        }
        catch (error) {
            assert.fail(error);
            console.log(error);
        }
    });
});
