//: [Previous](@previous)

import Foundation
import UIKit

class Meh: Codable {
    var foo = "bar"
    var bar = "baz"
    var meh = "moo"
}

var meh = Meh()

let encoder = JSONEncoder()
let jsonString = encoder
print(jsonString)

//: [Next](@next)
