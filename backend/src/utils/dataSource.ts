import { DataSource } from "typeorm"
import { User } from "../entities/user.entity"


export const AppDataSource = new DataSource({
    type: "mysql",
    host: "127.0.0.1",
    port: 3306,
    username: "root",
    password: "",
    database: "election",
    entities: [User],
    logging: true
})
