//: Playground - noun: a place where people can play

import UIKit

// ENUMERATIONS: common, custom type used to model a certain finite # of possibilities; type-safe way of coding //

// definition (w/ raw values)
enum Directions: Int {
    case north = 0, south = 3, east = 6, west = 10
}


// RAW VALUES: explicit type-declaration of an enum's cases w/ a primitive type
enum compassPoint : String {
    case north, south, east, west
}
print(compassPoint.east) // can do w/o raw value, still prints same

// Initializing from a Raw Value: when defining enum w/ raw-value type, enum auto receives an initializer that takes a value of the raw value's type (as a paramater called "rawValue") and returns either enum case or nil. You can use this initializer to try to create a new instance
let possibleDirection = Directions(rawValue: 10) // possibleDirection is of optional type Directions?
// bc not all raw values have an associated member value, raw value initializer is a faliable one
print(possibleDirection!)


// Convert Raw Values --> Enum Types
let myRawValue = 20

//optionalbinding
if let myDirections = Directions(rawValue: myRawValue) { // not optional anymore b/c optional binding w/ if, let statement
    // can use a switch (switch myDirections { case .north, etc)
    print("success")
} else {
    print("hell naw")
}


// Matching Enum Values w/ Switch Statement
var directionToHead = Directions.east

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


// ASSOCIATED VALUES: can store additional custom info (assoc values) of any type, different for each enum case if needed
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 7, 81, 69)
print(productBarcode)

productBarcode = .qrCode(".upc now replaced by .qrCode b/c can only have one case for this var Barcode")
print(productBarcode)


// Getting Associated Values w/ Switch Statement
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check): // make each raw value a constant or var (i.e: let manufacturer = 7)
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR Code: \(productCode).")
}
// * can do "case let .upc" since all associated values are being extracted as constants (or vars)

// Ex: We <3 Swift
enum iOSDeviceType {
    case iPhone(String)
    case iPad(String)
    case iWatch
}

var myDevice = iOSDeviceType.iPhone("6") // instantiating enum iOSDeviceType
switch myDevice {
case .iPhone(let model):
    print("iPhone \(model)")
case .iPad(let model):
    print("iPad \(model)")
case .iWatch:
    print("iWatch")
//default:
//    print("not an iOS device")
}

// Recursive Enumeration: Apple Docs (Enumerations)
//A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.






// TUPLES: comma-seaparated list of types; group of zero or more values represented as one value
// useful as the return type of a function to enable f(x) to return a single tuple containing multiple values
// can have multiple differing types

// decalaration: like a var or constant but enclosed in parentheses
var person = ("John", "Doe")

var firstName = person.0 // John; dot notation
var lastName = person.1 // Smith
print("Hi, my name is \(firstName) \(lastName)!")

// Named Elements: can name elements from a tuple & use those names to refer to them
var dude = (firstName: "Abhi", lastName: "Singh")

var hisFirstName = dude.firstName
var hisLastName = dude.lastName
print("The Notorious \(hisFirstName) \(hisLastName)!" )

// Creating a Tuple
var point = (0, 0)
print(point)

point.0 = 10
point.1 = 15
print(point)

// Tuples Are Value Types Passed By Copy/Value
var origin = (x: 0, y: 0)

var dot = origin
dot.x = 3
dot.y = 5

print(origin)
print(dot)

// Multiple Assignment
var (a, b, c) = (1, 2, 3)
print((a, b, c))

// One Line Swap
(a, b) = (b, a)
print((a, b, c))

// Return Multiple Values From a Function
func divmod(_ a: Int, _ b:Int) -> (Int, Int) {
    return (a / b, a % b)
}

print(divmod(7, 3))
print(divmod(5, 2))
print(divmod(12, 4))

