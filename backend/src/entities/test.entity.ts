import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity() 
export class Test{
  @Column()
  id: number;
}