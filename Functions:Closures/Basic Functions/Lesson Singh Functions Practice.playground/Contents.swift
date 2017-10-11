//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//
//func octAngle () -> Int {
//    let octSum
//    


/*
- defining function, keyword func
- camelCase: isLikeThis 
- name of the function in camelCase followed by (parameters); name : type
- arrow -> (return type)
- callin a function executes contents of the function 
    funcName()

 
 func interiorAngle(numberofSides: Int)
 */


func funcName2() -> Int {
    print("SIGABORT")
    return 10
}

func paramFunc(param: Int, param2: String, param3:[Int]) {
    
}

func complicatedFunc(param1: Int, param2: Int) -> Int {
    return param1 + param2
}

//funcName()
var num = funcName2()
funcName2()
print(num)

var intArray: [Int] = [3, 6, 4]

paramFunc(param: 0, param2: "hi", param3: intArray)

var sum2 = complicatedFunc(param1: 3, param2: 6)
print(sum2)


// Write a function that takes an emoji and returns a number for that emoji.

var emoji🤡 = "🤡"

// This function takes an emoji and outputs the name of the emoji 
// E.G. pass in 🤡, it outputs "clown"
func emojiNamer(emoji: String) -> String {
    switch emoji {
        case "🤡":
            return "clown"
        case "🤠":
            return "cowboy"
    default:
        return "don't have that emoji"
    }
}

print(emojiNamer(emoji: "🤡"))
print(emojiNamer(emoji: "🤠"))


// Wrte a function that takes 3 integers and returns their average.

//var firstInteger = 1
//var secondInteger = 2
//var thirdInteger = 3

func integerAverager(num1: Double, num2: Double, num3: Double) -> Double {
    let avg = (num1 + num2 + num3)/3
    return avg
}

print(integerAverager(num1: 5, num2: 6, num3: 8))


/*
func bob(externalName internalName: String) {
    print(internalName)
}

bob(externalName: "string")


func save(_ username: String) {
    print("help")
    save(username)
}
 
*/






// Independent Practice: Playgrounds

// 1) Write a function that takes a name and prints "Hello (name)"

func returnName(yourname: String) {
    print("Hello \(yourname)")
}

returnName(yourname: "Abhi")


// 2) Takes 4 numbers and returns their products.

func productOfNumbers(num1: Double, num2: Double, num3: Double, num4: Double) -> Double {
    let product = (num1 * num2 * num3 * num4)
    return product
}

print(productOfNumbers(num1: 1, num2: 2, num3: 3, num4: 4))


// 3) Takes an integer and determines whether it is a perfect square

func perfectSquare(integer: Int) -> Bool {
    let theNumber = Int(sqrt(Double(integer))) * Int(sqrt(Double(integer)))
    print(theNumber)
    if theNumber == integer {
        return true
    } else {
        return false
    }
}

print(perfectSquare(integer: 8))

// OR this way (can remove the if, else statement and replace w/ return boolean statement)

func perfectSquare2(integer: Int) -> Bool {
    let theNumber = Int(sqrt(Double(integer))) * Int(sqrt(Double(integer)))
    return theNumber == integer
}

print(perfectSquare2(integer: 34))

// OR













// 4) Takes an integer and determines if it is a perfect number

func perfectSquareDetector(Number: Int) -> Bool {
    if  (sqrt(Double(Number))).truncatingRemainder(dividingBy: 1) == 0
    {
        return true
    }
    return false
}
print(perfectSquareDetector(Number: 64))
// A perfect number is a number in which the sum of its divisors are equal
func perfectNumber(Number: Int) -> Bool {
    var sum = 0
    for i in 1...Number/2 {
        if Number % i == 0 {
            sum = sum + i
        }
    }
    print(sum)
    if sum == Number {
        return true
    }
    
    return false
    
}
print (perfectNumber(Number: 8129))

