import { int } from "aws-sdk/clients/datapipeline"
import { bool } from "aws-sdk/clients/signer"

export interface Animal {
    name: String
    surname: String
    favouriteFood: String
    criminalRecord: bool
    age: int
}

export interface Duck extends Animal{
    angry: boolean
    flightSpeed: string
    isPet: true
}