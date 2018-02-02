//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// BASIC:

func greeting(name: String) {
    print("Hello, \(name)")
}
greeting(name: "Abhi")



func trueEvenFalseOdd(insertnumber: Int) -> Bool {
    let thisNumber = insertnumber
    if thisNumber % 2 == 0 {
        return true
    } else {
        return false
    }
}
print(trueEvenFalseOdd(insertnumber: 11))



// OR

func trueEvenFalseOdd2(insertnumber: Int) -> Bool {
    return insertnumber % 2 == 0
}
print(trueEvenFalseOdd2(insertnumber: 15))



// STRINGS:

func isEmpty(words: String) -> Bool {
    return words.characters.count == 0
}
print(isEmpty(words: ""))



func reverseString(backwards: String) -> String {
    return String(backwards.characters.reversed()) // type cast collectionOfCharacter to String
}
print(reverseString(backwards: "Hello, I'm 23 years old"))



func repeatStringxInt(phrase: String, numberOfRepeats: Int) {
    for _ in 1...numberOfRepeats {
        print(phrase, terminator:"")
    }
    print("")
}
repeatStringxInt(phrase: "Hello", numberOfRepeats: 3)

// OR:

func repeatStringxInt2(phrase: String, numberOfRepeats: Int) -> String {
    var returnString = phrase
    for _ in 1...numberOfRepeats {
        returnString += phrase
    }
    return returnString
    }
print(repeatStringxInt2(phrase: "Hello", numberOfRepeats: 3)) // prints 4 x !!!!!


// Write a function that takes two strings and checks whether they are the same, ignoring case.

func twoStrings(string1: String, string2: String) -> Bool {
    return string1.lowercased() == string2.lowercased()
}

print(twoStrings(string1: "Quality", string2: "quanity"))



//CONVERSIONS:

func conversionFC(fahrenheit: Int) -> Float {
    let celsius = Float((Double(fahrenheit) - 32.0) * (5.0/9.0))
    return celsius
}
print(conversionFC(fahrenheit: 43))



func conversionCF(celsius: Int) -> Float {
    let fahrenheit = Float((Double(celsius) * (9.0/5.0) + 32.0))
    return fahrenheit
}
print(conversionCF(celsius: 3))



func convertGigaBits(gigabytes: Double) -> Double {
    return gigabytes * 8589934592
}
print(convertGigaBits(gigabytes: 2))


//
//func convertToHexadecimal(decimal: Double) -> String {
////    for
//}


// MATH: 

func maxNumber(num1: Int, num2: Int) {
    if num1 > num2 {
        print(num1)
    } else {
        print(num2)
    }
}

maxNumber(num1: 2, num2: 4)

// OR:


func maxNumber2(num1: Int, num2: Int) -> Int {
    if num1 > num2 {
    return num1
    } else {
        return num2
    }
}
print(maxNumber2(num1: 2, num2: 17))


// OR TERNARY OPERATOR:

func maxNumber3(num1: Int, num2: Int) -> Int {
    return num1 > num2 ? num1 : num2
}
print(maxNumber3(num1: 3, num2: 8))


func powerOfTwo(numX: Int) -> Bool {
    if numX % 2 == 0 { // if numX is even, continue
        if numX == 2 { // 2
            return true
        } else { // 2
            return powerOfTwo(numX: numX / 2)
        }
    } else { // if numX is odd, false
        return false
    }
}

print(powerOfTwo(numX: 64))



//
//func isPrime(numY: Int) -> Bool {
////    let count = 0
//    for i in (1...numY) {
//        for j in (2..<numY) {
//            if i % j == 0 {
//                return true
//            } else {
//                return false
//            }
//        }
//    } else {
//        return false
//    }




func isPrime(numY: Int) -> Bool {
    for j in (2..<numY) {
        if numY % j == 0 {
            return false
        } else {
            // continue in the for loop?
        }
        
    }
    return false
}

print(isPrime(numY: 15))



