import { Animal } from "../../entities/Animal";
import Papa from "papaparse";

export function toAnimal(csvFileContents: string): Animal[] {
    return Papa.parse(csvFileContents, { header: true }).data.map((row: any) => ({
        name: row["Name"],
        surname: row["Surname"],
        favouriteFood: row["FavouriteFood"],
        criminalRecord: row["Criminal"],
        age: row["Age"]
    }));
}