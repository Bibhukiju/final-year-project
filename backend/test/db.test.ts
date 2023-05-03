import * as  assert from "assert";
import { DataSource } from "typeorm";

describe('Database Connection', function () {
    it('should connect to the database', async function () {
        const AppDataSource = new DataSource({
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
        } catch (error) {
            assert.fail(error);
            console.log(error)
        }
    });
});
