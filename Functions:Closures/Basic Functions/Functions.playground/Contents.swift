//: Playground - noun: a place where people can play

import UIKit

/*

FUNCTIONS: self-contained chunks of code performing a specific task

 - f(x)'s have a name that describe their purpose. that name is used to "call" the f(x) to perform the task when needed
 - can provide data to a f(x) by sending parameters to it & f(x) can give data back as result
 - every function in Swift has a type, consisting of the function's parameter types & return type
 - can use this type like any other type in Swift, making it easy to pass f(x)s as parameters to other f(x)s, & to return f(x)s from f(x)s
 - f(x)s can also be written w/in other f(x)s to encapsulate useful functionality w/in a nested f(x) scope

*/

// Defining & Calling Functions:



// func defining:
func greetAgain(person: String) -> String { // input parameter: String, return type: String
    return "Hello again, " + person + "!" // func body
}
// func calling:
print(greetAgain(person: "Hannah"))
print(greetAgain(person: "Bob"))


func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// Function Parameters & Return Values

// Functions W/o Parameters
// - funcs not req'd to define input parameters

func sayHelloWorld() -> String {
    return "Hello, world." // always returns same String message when called
}
print(sayHelloWorld())

// Function W/ Multiple Parameters
// - funcs can have multiple input parameters, which are written w/in func's () separated by commas

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Timothy", alreadyGreeted: true))



func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print(minMax(array: [4, 234, 55, 7, 123, 4, 678, 369, 1]))




