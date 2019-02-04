//: [Previous](@previous)

import UIKit

let quotes = ["It was not the AM/PM", "No soup for you", "We are both men of action. Lies do not become us.","Make em Laugh"]
for quote in quotes {
    print(quote)
}

let yellingQuotes = quotes.map { (value) -> String in
    value.uppercased()
}


for quote in yellingQuotes {
    print(quote)
}

//: [Next](@next)
