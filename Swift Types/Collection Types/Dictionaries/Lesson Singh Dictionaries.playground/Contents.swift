//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Dictionaries > Arrays - unordered, fast; give it a value 

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."


// Use Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// Prints "The airports dictionary is not empty."


// You can add a new item to a dictionary w/ subscript syntax
airports["LHR"] = "London"
print(airports)
// the airports dictionary now contains 3 items


// You can also use subscript syntax to change the value associated w/ a particular key:
airports["LHR"] = "London Heathrow"
print(airports)
// the value for "LHR" has been changed to "London Heathrow"



// As an alternative to subscripting......
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."


// You can also use subscript syntax to retrieve a value from the dictionary for a ..........
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."


// You can use subscript syntax to remove a key-value pair
airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary


// Alternatively, remove a key-value pair from a dictionary..................
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."






// ITERATING OVER A DICTIONARY

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow


