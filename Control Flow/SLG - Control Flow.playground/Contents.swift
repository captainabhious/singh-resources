//: Playground - noun: a place where people can play

import UIKit

// IF CONDITIONALS
// - Utilize an if statment to run some code only if some conditions are met.
// - Uses standard comparison operators ( ==, !=, >, <, >=, <=)
// - If statements are useful, but to do something more than once - use loops.
// - Loops (while, for) perform same logic multiple times

// WHILE LOOPS
// - A 'while' loop performs a set of statements over and over again until boolean condition becomes false.
// - Two types of while loops: 'while' & 'repeate-while'
// - while evaluates condition at start of each pass; repeat-while evaluates condition at the end of each pass through the loop




// FOR IN LOOPS
// - A sequence of instructions in a range or colleciton that is continually repeated until a certain condition is reached
// - Useful to iterate over arrays, dictionaries, ranges, strings, and other sequences


// EX: Iterating Over a Dictionary
// - Iterate over items in an array to access key-value pairs
// - Each item in dict is returned as (key, value) tuple
// - Dictionary contents inherently unordered so iteration won’t guarantee order
// - Order you insert items into a dict doesn’t guarantee order in which they’re retrieved
 

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


// EX: Iterating Over a Range
// - A Range is an interval of values defined by lower & upper bounds
// - If lowerBound > upperBound then code will CRASH

for i in 1...10 {
    print(i)
} // prints 1-10

let minutes = 60
for minute in 0..<minutes {
    print(minute)
} // prints 0-9; good idea to use stride function to skip by certain intervals

// - Loop a range in reverse order w/ "reversed" range method
for i in (1...10).reversed() {
    print(i)
} // prints 10-1


// EX: Executing Statements Multiple Times w/o Value
// - Sometimes you just want to execute some statments multiple times but don't care about the index value. For loop Swift convention uses "_" as loop var name to indicate when you don't intend to use each "i"
// - Naming loop var as underscore useful bc immediately can tell that the sequence iteration's value is ignored

for _ in 1...5 {
    print("Hello World")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")




// SWITCH STATEMENTS
// - A 'switch' statment considers a value & compares it against several possible matching pattterns. It then executes appropriate block of code, based on first successful pattern match
// - Alternative to 'if' statment for responding to multiple potential states.
// - Exhaustive: ('default' case)
// - No implicit fallthrough: entire 'switch' statement finishes execution as soon as first matching 'case' is completed (no need for explicit 'break')


// EX: Switch with compound case
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"


// EX: Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// EX: Tuples
// - Can use tuples to test multiple values in same 'switch' statement
// - Use wildcard pattern '_' to match any possible value

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
} // Note: if somePoint = (0,0) then multiple matches are possible but first matching case is always used


// EX: Value Bindings
// - A 'switch' case can name the value(s) it matches to temporary constants/variables for use in the body of the case.

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// first case matches point w/ y value of 0 and assigns x value to temp constant (let x)
// no default value b/c last case declares tuple of 2 placeholder constants that can match any value




// EX: Where Clause
// - A 'switch' statement can use a 'where' clause to check for additional conditions

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// placeholder constanst x,y take on 2 tuple values from yetAnotherPoint
// constants are used in 'where' clause to create dynamic filter

// EX: Compound Case w/ Value Bindings

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}




// CONTROL TRANSFER STATEMENTS

// EX: Continue
// - The 'continue' statement tells the loop to stop what it is doing & start again at beginning of next iteration thru the same loop.
// - "I'm done with the current loop iteration, next."

// EX: Break
// - A 'break' statement ends execution of entire control flow statement immediately and transfers control to code after the loop/statement's closing brace }

// EX: Fallthrough
// - As previously mentioned, 'switch' statements completes execution upon first matching case
// - If need C-style fallthrough behavior where 'switch' statements fall through bottom of each case into the next one, use 'fallthrough'

// EX: Labeled Statements
// - Use labeled statements to be explicit about which loop/conditional statement to break/continue

// EX: Early Exit
// - Utilize a 'guard' statement, similar to 'if' statement, to require a condition must be true in order for code after guard statement to be executed.
// - 'Guard' always has else, unlike 'if' - code inside else is executed if condition is not true








/* EXAMPLE PROBLEMS

// EX: Iterating Stride function (works w/ any kind of #)
 
for i in stride(from: 0, to: 3, by: 0.5) {
    print(i)
} // can also use stride decreasingly

 

// 1) Use a for loop to print the numbers from 1 - 100 (inclusive)

// a) for version:
for i in (1...100) {
    print(i)
}

// b) while version:
var starting = 1

while starting <= 100 {
    print(starting)
    starting += 1
}



// 2) Use a for loop to print the numbers from 1 - 100 (exclusive). print "Odd" if the number is odd, "Even" if it is even.

// a) for version:
for i in (1...100) {
    if i % 2 == 0 {
        print("even - \(i)")
    } else {
        print("odd - \(i)")
    }
}

// b) while version:
var startingNumber = 1

while startingNumber <= 100{
    if startingNumber % 2 == 0 {
        print("even - \(startingNumber)")
    } else {
        print("odd - \(startingNumber)")
    }
    startingNumber += 1
}

 

//3)The famous FizzBuzz problem! Write a program that loops through numbers 1 to 100: For numbers that are multiples of three print “Fizz”; for numbers that are multiples of five, print “Buzz”; for numbers that are multiples of both three and five print “FizzBuzz”; and for number that don't meet any of those requirements, just print the number.

for i in (1...100) {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}



// 4) Using the Harmonic Series formula, compute the value for n = 5,000.
var sum: Float = 0

for i in (1...5000) {
    sum = sum + (1/Float(i))
}
print(sum)


 
// 5) Use a loop to print all of the prime numbers from 1 to p for p = 2,000
var count = 0

for i in (1...2000) {
    for j in (1...i) {
        if i % j == 0 {
            count += 1
        }
    }
    if count == 2 {
        print (i)
    }
    count = 0
}



// 6) Use a loop to calculate 15! (Factorial).
var factorial = 15
for i in (1...14).reversed() {
    factorial *= i
}
print("15! is \(factorial)")


// 7) Print an Airplane seating arrangement (1a through 1h) for 26 rows of seats

for row in 1...26 {
    print("\(row)a \(row)b \(row)c  \(row)d \(row)e  \(row)f \(row)g \(row)h")
}

*/







