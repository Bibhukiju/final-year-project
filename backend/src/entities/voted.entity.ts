import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Voted {
    @PrimaryGeneratedColumn("uuid")
    voted_id: string

    @Column()
    voter_id: string
}