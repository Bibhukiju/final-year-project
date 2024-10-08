import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()

export class Vote {
    @PrimaryGeneratedColumn('uuid')
    vote_id: string

    @Column({ type: "text" })
    votes: string

    @Column()
    area_code: string
}