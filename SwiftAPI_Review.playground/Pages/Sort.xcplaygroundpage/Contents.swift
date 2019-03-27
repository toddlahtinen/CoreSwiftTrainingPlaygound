//: [Previous](@previous)

import Foundation

var values = ["Duck", "Lamb", "Chicken", "Sprouts", "Beef", "Pork", "Salmon", "Red Herring"]

print(values)

print(values.sorted())

let customSort = values.sorted { (lhs, rhs) -> Bool in
    lhs > rhs // MARK: note the return statement is derived by context.
}

print(customSort)

class Person: Comparable, CustomStringConvertible {
    var description: String {
        return "\(age)"
    }

    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.dna == rhs.dna && lhs.fingerprint == rhs.fingerprint
    }

    var dna = "1234566"
    var fingerprint = "123456"
    var firstName = "Jane"
    var lastName = "Doe"
    var height = 72
    var weight = 150
    var age = 37
}
let j = Person()
j.age = 99
let b = Person()
b.age = 12
let c = Person()
c.age = 23

print([j, b, c].sorted())
//: [Next](@next)
