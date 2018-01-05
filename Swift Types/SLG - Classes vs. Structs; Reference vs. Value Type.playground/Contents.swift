import UIKit

/*
CLASSES & STRUCTS: general-purpose, flexible constructs that become the building block of your program's code. You define properties (constants/variables) and methods(functions) to add functionality.

Comparison:
 Both can...
 - define properties to store values
 - define methods to provide funcitonality
 - define subscripts to provide access to their values - shortcuts for accessing the member elements of a collection, list, or sequence; use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval.
 - define initializers to set up their initial state
 - be extended to expand their functionality beyond a default implementation
 - conform to protocols to provide standard functionality of a certain kind
 
 Classes have but Structs do not:
 - Inheritance, which is covered in the next lessons, enables one class to inherit the characteristics and behavior of another.
 - Type casting enables you to check and interpret the type of a class instance at runtime as is the case with `as`.
 - Deinitializers enable an instance of a class to free up any resources it has assigned.
 - Reference counting allows more than one reference to a class instance (classes passed by reference, structs by copy/value)
*/


// Example Defintion Syntax:
struct Resolution {
    var width = 0
    var height = 0
}
// both of these just describe what a Resolution or VM will look it; they themselves don't describe specific resolution or video mode... to do so, create an instance of the struct or class
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


// Create An Instance of struct/class 
let someResolution = Resolution()
let someVideoMode = VideoMode()


// initialization: process of preparing an instance of class, struct, or enum for use
// initialization: involves setting initial value for each stored property (vars/lets) on that instance
// both structs & classes use initializer syntax; simplest form is intiliazing to class/struct's default value - empty parentheses ()
// only Structs have auto-generated memberwise initializer to initialize properties of new struct instances
let vga = Resolution(width: 1000, height: 6000)



// VALUE TYPES VS. REFERENCE TYPES: //

/*
 VALUE TYPES:
 - type whose property value(s) are copied when assigned to var or let or when passed to a f(x)
 - copying creates an independent instance w/ its own unique copy of its data, usually defined as a struct, enum, or tuple
 - all Swift "primitive" types are structs (value types)
 */

// declare constant (hd) & set to an instance of struct Resolution that's initialized w/ a width & height
let hd = Resolution(width: 1920, height: 1080)
print("let hd = Resolution       \(hd) - original hd")
// declare var (cinema) & set to current value of hd
var cinema = hd
print("var cinema = hd           \(cinema) - hd is copied to new var cinema")
cinema.width = 2048   // changes cinema's property (width) but not hd's
print("var cinema.width = 2048   \(cinema) - changes cinema.width, not hd's")
print("let hd                    \(hd) - hd unchanged")

print("")

// EX:
struct SomeStruct {
    var data = -1
}
var x = SomeStruct() // instantiate the struct
print("var x = SomeStruct()      \(x) - x original")
var y = x   // x is copied to y
print("var y = x                 \(y) - y copy of original")
x.data = 42 // changes x, not y
print("x.data = 42               \(x) - changes x, not y")
print("var y                     \(y) - y unchanged")

print("")



/*
 REFERENCE TYPES:
 - are not copied when assigned to a var or let or when passed to a f(x)
 - instead of a copy, a reference to the same existing instance is used (shared instance now)
 */

let tenEighty = VideoMode()
tenEighty.resolution = hd   // sets new constant's (tenEighty) resolution property to prev constant (hd: 1920 x 1080)
tenEighty.interlaced = true // changes default .interlaced value from F to T
tenEighty.name = "1080i" //
tenEighty.frameRate = 25.0
print("tenEighty's framerate:                 \(tenEighty.frameRate) - changed from default 0.0")

let alsoTenEighty = tenEighty  // tenEighty is assigned to new let constant
alsoTenEighty.frameRate = 30.0 // modified framerate
// because classes = reference types, 1080 & also1080 both refer to same VideoMode instance; just 2 different names
print("alsoTenEighty's modified framerate:    \(alsoTenEighty.frameRate)")
print("tenEighty's framerate also changes:    \(tenEighty.frameRate)")

/*
When to use which?
 Use a value type when:
- comparing instance data with == makes sense
- you want copies to have independent state
- the data will be used in code across multiple threads

 Use a reference type (e.g. use a class) when:
- comparing instance identity with === makes sense
- you want to create shared, mutable state
*/
