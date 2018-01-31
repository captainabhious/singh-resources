import UIKit


// CLOSURES: self-contained blocks of functionality that can be passed around & used in code
// - can capture and store references to any constants and variables from the context in which they're defined
// - global & nested functions are special cases of closures

/* Closure Syntax:
 { (parameters) -> return type in
 statements
 }
 */

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

// Step 1: Replace func keyword + funcName w/ '{'
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


















