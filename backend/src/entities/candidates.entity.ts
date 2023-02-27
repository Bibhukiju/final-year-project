import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Area } from "./area.entity";

@Entity()
export class Candidates {
    @PrimaryGeneratedColumn('uuid')
    candidateId: string

    @Column()
    candidate_name: string

    @Column()
    candidacy_area: string


    @Column()
    candidate_url: string

    @ManyToOne(() => Area, (area) => area.candidates)
    area: Area

}