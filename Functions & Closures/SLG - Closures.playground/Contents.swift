import UIKit


//: ## CLOSURES: self-contained blocks of functionality that can be passed around & used in code
//: ### - global & nested functions are special cases of closures

/*:
 Closure Syntax:
 { (parameters) -> returnType in
    statements
 }
 :*/

// 3 Forms of Closures
// - global funcs: closures that have a name & don't capture any values
// - nested funcs: closures that have a name & can capture values from their enclosing func
// - closure experessions: unnamed closures written in lightweight syntax that can capture value from surrouding context


// Func. vc Closure Key Differences
// Function:
// - has a name
// - has 'func' keyword
// - no 'in' keyword
// Closure:
// - no name
// - no 'func' keyword
// - has 'in' keyword


// Definining Func. vs Closure:
func giveAFunc() { }
var giveNoFunc = { () -> () in }
// closure is stored inside of a variable so we can call it
// closure itself starts with { and ends with }

// Call:
giveAFunc()
giveNoFunc
// call is identical

// Transforming a Function -> Closure:

// example func (soon to become closure)
func sayHello(name: String) -> String {
    return "Hello \(name)"
}

// Step 1: Replace func keyword & funcName w/ '{'
// Step 2: Replace the { after the return Type w/ 'in'

/*
{ (name: String) -> String in
    return "Hello \(name)"
}
*/

// Done. Can assign closure to a var & call like a func
var sayHello = { (name: String) -> String in
    return "Hello \(name)"
}
sayHello("Abhi Singh")



// CLOSURE EXPRESSIONS:
// - nested funcs can become sloppy
// - closure expressions: a manner of writing inline closures in a brief, focused syntax

// EX 1: Refining a Method [sorted(by:)]

// a) The Sorted Method
// - upon sorting, method returns new array (same size, type) correctly sorted (og array not modified)
// - method takes 2 arguments of same type as array's contents & returns Bool value stating whether 1st should appear before (T) or after (F) 2nd
// - therefore, sorting closure needs to be a func of type (String, String) -> Bool

let names = ["Brian", "Shek", "Abhi", "John"]

// One Way to provide sorting closure: write normal func of correct type & pass it in as an argument to sorted(by:) method

func backward (_ s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward) // [S, J, B, A] - sorted lexiographically


// b) Closure Expression Syntax
// - parameters in c.e.s. can be in-out parameters but can't have default value
// - variadic parameters can be used if named
// - tuples can be used as parameter & return types

// closure expression version of backward(_:_:)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// - parameters & return type written INSIDE {} instead
// - 'in' introduces start of closure's body -












