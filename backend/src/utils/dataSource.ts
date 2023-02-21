import { DataSource } from "typeorm"


export const AppDataSource = new DataSource({
    type: "mysql",
    host: "127.0.0.1",
    port: 3306,
    username: "root",
    password: "",
    database: "election",
    entities: ['dist/src/entities/*.entity.js'],
    synchronize: true,
})
