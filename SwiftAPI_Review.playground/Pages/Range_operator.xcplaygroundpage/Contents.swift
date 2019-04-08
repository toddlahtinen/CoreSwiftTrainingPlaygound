//: [Previous](@previous)

import Foundation
import UIKit

// MARK: Closed range
let retryCount = 5
for index in 1...retryCount {
    print("lets try sometihng... attempt:\(index)")

    if index == retryCount {
        print("lets send an error: 🦑")
    }
}
print("\n\n\n\n\n\n\n\n\n")

// MARK: half-open range
let names = ["Janet", "Bad Janet", "Michelle", "Michael"]

for i in 0..<names.count {
    print(names[i])
}
print("\n\n\n\n\n\n\n\n\n")

// MARK: One-Sided Ranges

let future = 2020...
let currentEra = 2007...2019
let beforeIPhone = ...2006
let years = [2000, 2010, 2011, 2014 ,1999, 1986, 1996, 1990, 2017, 2020, 2022, 2099]

for year in years.sorted() {
    if beforeIPhone.contains(year) {
        print("\(year) 📞")
    } else if currentEra.contains(year) {
        print("\(year) 📱")
    } else if future.contains(year) {
        print("\(year) 🧙🏿‍♂️")
    } else {
        print("🤦🏻‍♂️")
    }
}
print("\n\n\n\n\n\n\n\n\n")

//Works with more than just int
let creditCardformat = DateFormatter()
creditCardformat.dateFormat = "MM/yy"

let dateRange = Date()...

print("future date: \(dateRange.contains(creditCardformat.date(from: "11/13")!))")

//let date2 =
print("future date: \(dateRange.contains(Date.init(timeIntervalSinceReferenceDate:0)))")


//: [Next](@next)
