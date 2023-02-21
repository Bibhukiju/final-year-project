import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class User {
    @PrimaryGeneratedColumn("uuid")
    user_id: string


    @Column()
    citizenship_number: string;

    @Column()
    name: string

    @Column()
    date_of_birth: string
}