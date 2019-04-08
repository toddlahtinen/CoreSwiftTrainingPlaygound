//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"
var number: NSDecimalNumber = 0.1855
let truncate =  NSDecimalNumberHandler(roundingMode: .down,
                                              scale: 3,
                                              raiseOnExactness: false,
                                              raiseOnOverflow: false,
                                              raiseOnUnderflow: false,
                                              raiseOnDivideByZero: false)
number = number.rounding(accordingToBehavior: truncate)
let bankersBehavior =  NSDecimalNumberHandler(roundingMode: .bankers,
                                       scale: 2,
                                       raiseOnExactness: false,
                                       raiseOnOverflow: false,
                                       raiseOnUnderflow: false,
                                       raiseOnDivideByZero: false)


let rounded = number.rounding(accordingToBehavior: bankersBehavior)
print(rounded)
//: [Next](@next)
