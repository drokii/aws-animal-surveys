import { toAnimal } from "./animal-parser"

describe("toAnimal should", () => {
    it("parse a csv string into a list of Animals", () => {
        const csvFileContents = [
            "Name,Surname,FavouriteFood,Criminal,Age",
            "Henry,Jameson,Beans,Yes,4",
            "Piddles,,Blood,Yes,400",
            "Mr.Jimbo,,PVC Plastic,No,10"
        ].join("\n")
        expect(toAnimal(csvFileContents)).toEqual([{
            name: 'Henry',
            surname: 'Jameson',
            favouriteFood: 'Beans',
            criminalRecord: 'Yes',
            age: '4'
        },
        {
            name: 'Piddles',
            surname: '',
            favouriteFood: 'Blood',
            criminalRecord: 'Yes',
            age: '400'
        },
        {
            name: 'Mr.Jimbo',
            surname: '',
            favouriteFood: 'PVC Plastic',
            criminalRecord: 'No',
            age: '10'
        }])

    })

})