/*:
 # ![GA icon](GAIcon.png) Swift Conditionals

 Week I DAY V

 ## The topics we will cover are:

 - if / else
 - switch
 - nests

 ## By the end of this lesson, we should be able to (i.e., Learning Objectives):
 * Define what a Swift decision structure is & what its keywords (i.e., `if`, `else`, `switch`) & syntax are.
 * Identify which type of decision structure solves our problem, its relational, & logical operators (`&&`, `||`, `!`), paranthesis
 * Apply best practices & comment our decision structures
 * Perform basic logical operations

 ## Connection to long term goal:
 Deepen our understanding of Swift & its structures; alternate decision structures are key to programming & algorithms

 ## Student prework before we open!
 * variables / constants
 * types
 */

/*:

 ## decision structures

 * any program is reducible to one or more of three structures: consequential, decision, repetition.

 * a decision structure causes a program to perform actions only under certain conditions. It frequently utilizes Boolean expressions, relational operators, & logical operations (and, or, not)

* each of these structures is based on a conditional, which is a Boolean statement

 * decision structures are reducible to one or more of the three types: single alternate decision structure; dual alternate decision structure; multiple alternate decision structure

 * any one of these structures may be combined into the other to create _nested_ decision structures

Can we imagine scenarios where a decision depends upon the outcome of a specific event? What is the structure of our scenario?

*/

// Write code here.


// Come up with your own decision structure

var coldIsTrue = false
if coldIsTrue {
    print("Stay in bed and watch Saturday morning TV")
} else {
    print ("Get up and say hi Eric")
}

var rain = true
var lazy = false

if rain {
    print ("grab your raincoat or umbrella")
} else if lazy {

    print( "stay home")

} else {
    print ("go to school with regular outfit")
}

var life = 50
if life < 20 {
    print ("Go get life points")
} else {
    print ("Save the world")
}

/*:

 # single alternate decision structure (a.k.a. `if`)

 * In the if statement, the statements within the body of the if statement will only be executed if the statements condition evaluates to true.

 ```

 if <condition> {
 // statements...
 }

 ```

 */

// Write code here

let a = 7
let b = 6
if a >= b {
    print(a)
}

if a <= b {
    print(a)
    // What happens here?
}

if a != b {
    print(b)
}

if a == b && b == a {
    print(a)
}

if a != b {
    print(a)
}

/*:

 # dual alternate decision structure (a.k.a. `if` / `else`)

 ```
 if <condition> {
 // Executed if the condition evaluates to true
 <oneOrMoreStatements>
 } else {
 // Executed otherwise
 <oneOrMoreStatements>
 }
```
*/

// write code here


// write

if a >= b {
    print(a)
} else {
    print(b)
}

if a <= b {
    print(a)
    // What happens here?
} else {
    print(b)
}

if a != b {
    print(b)
} else {
    print("#same")
}

if a > b && b > a {
    print(a)
} else {
    //When does this happen?
}

if a > b || b > a {
    print(a)
} else {
    //When does this happen?
}

/*:

 ### multiple dual alternate decision structure (a.k.a. `if` / `else if` / `else`)
*/

// write code here

/*:

 ## multiple alternate decision structure (a.k.a. switch)

 ```
 switch(expression) {
    case constant-expression  :
        statement(s);
        break; /* optional */
    case constant-expression  :
    statement(s);
        break; /* optional */
        /* you can have any number of case statements */
        default : /* Optional */
    statement(s);
 }

 ```


*/

// write code here


var index = 10

switch index {
case 100  :
    print( "Value of index is 100")
case 10,15  :
    print( "Value of index is either 10 or 15")
case 5  :
    print( "Value of index is 5")
default :
    print( "default case")
}

var numberOfLegs = 6

switch numberOfLegs {
case 0:
    print("I'm a snake probably")
case 2:
    print("I am a biped")
case 4:
    print("I am a quadruped")
case 6:
    print("I am an insect")
case 8:
    print("I am a spider")
case 100:
    print("I am a centipede")
default:
    print("Run! An alien!")
}

/*:

 ## You know the others. What is nesting?

 */

// Write code here

var temp = 25
var isRaining = true

if temp > 20 {
    if !isRaining {
        print("Go play outside")
    } else {
        print("Go outside with umbrella")
    }
} else {
    print("Get heating ASAP")
}

if temp > 20 && !isRaining {

} else if temp > 20 && isRaining {

} else {
    print("Get heating ASAP")
}

if temp <= 20 {
    print("hi")
}

enum department {
    case marketing, legal, engineering, accounting, maintenance
}

enum direction {
    case North, West, East, South, SouthWest, SouthEast
}



var jobDescription = department.legal

var employed = true
var employedHere = true
var isSaturday = false
var time = 1000

if !employed {
    print("Get a job")
} else if !employedHere {
    print("Not allowed in")
} else if isSaturday {
    print("Go home")
} else {
    switch jobDescription {
    case department.marketing:
        if time < 900 {
            print("Check emails")
        } else {
            print("Call customers")
        }
    case .engineering:
        print("Write more switch statements")
    case .legal:
        print("Sue somebody")
    case .accounting:
        print("Pay employees")
    default:
        print("Go home we have nothing for you")
    }
}

if jobDescription == .accounting {
    
}

var testInt = 5

switch testInt {
case 1..<5:
    print("Hello")
case 10:
    print("Goodbye")
default:
    print("S\"tu'f'f")
}

abs(-40)

/*
if (raining || pouring) && oldMan == snoring {
    
}
*/
/*:

 ## Closing

 We covered data Swift's conditionals & decision structure.

 ### Class Discussion

  What we have learned:
 * What is an `if` statement? What is an `else`? Can we have one without the other?
 * What boolean logic does Swift provide us? How do we represent them in Swift code?
 * What is an `if/else`? What is a `switch`? When would we use one over the other?
 * What kind of logic can we perform with conditionals that we couldn't before?
 */
