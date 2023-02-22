import { Column, Entity, OneToMany, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";
import { Candidates } from "./candidates.entity";

@Entity()

export class Area {
    @PrimaryColumn({ unique: true })
    area_id: string

    @Column({ unique: true })
    area: string

    @OneToMany(() => Candidates, (candidate) => candidate.area)
    candidates: Candidates[]

}