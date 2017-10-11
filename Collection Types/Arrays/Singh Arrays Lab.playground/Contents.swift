//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Playground - noun: a place where people can play


import UIKit

//===============================================================================================================
//MARK: Library
//===============================================================================================================


extension Int {
    
    func isEven() -> Bool {
        return self.isDivisibleBy(2)
    }
    
    func isDivisibleBy(_ number: Int) -> Bool {
        return self % number == 0
    }
}

func randomInt(from: Int = 0, to: Int = 100) -> Int {
    
    guard from < to else { return 0 }
    
    let distance = to - from
    
    let randomValue = arc4random_uniform(UInt32(distance))
    let result: Int = from + Int(randomValue)
    
    return result > to ? to : result
}

func randomBoolean() -> Bool {
    let integer = randomInt()
    
    return integer.isEven()
}

func randomString() -> String {
    
    let intOne = randomInt(from: 1000, to: 999999)
    let intTwo = randomInt(from: 100, to: 9999)
    
    return "\(intOne) - \(intTwo)"
}

func randomArrayOfInts() -> [Int] {
    
    let count = randomInt(from: 10, to: 1000)
    
    var array: [Int] = []
    
    for _ in 1...count {
        array.append(randomInt(from: 0, to: 1000))
    }
    
    return array
}

func randomArrayOfStrings() -> [String] {
    
    let count = randomInt(from: 10, to: 1000)
    
    var array: [String] = []
    
    for _ in 1...count {
        array.append(randomString())
    }
    
    return array
}

//===============================================================================================================
//MARK: Exercises
//===============================================================================================================

// BASIC:
// Write a function that takes an Int, and returns an Int Array with that size. Any numbers will do.

func randomArrayOfInts(size: Int) -> [Int] {

    var array: [Int] = [] // declares an empty array of integers

    for _ in 1...size {
        array.append(randomInt(from: 1, to: size))
    }

    return array
}

print(randomArrayOfInts(size: 11))


// Write a function numbersUpTo(Int) -> [Int] that takes an Int, and returns an Array of Ints containing the numbers from 0 up to, but not including, the argument.

func numbersUpTo(upto: Int) -> [Int] {
    var array: [Int] = [] //creates empty array
    for index in 0..<upto { // "containing the numbers from 0 upto, but not including, argument "upto""
        array.append(index) // appends the numbers in the range to var array
    }
    return array
}

print(numbersUpTo(upto: 8))



// Write a function numbersBetween(Int, Int) -> [Int] that returns an Array with all of the numbers between the two arguments (inclusively).

func numbersBetween(from: Int = 3, to: Int = 7) -> [Int] {
    var array: [Int] = [] //creates empty array
    for num in from...to { // inclusive
        array.append(num)
    }
    return array
}
print(numbersBetween())

// OR:

func numbersBetween2(from: Int, to: Int) -> [Int] {
    var array: [Int] = [] //creates empty array
    for num in from...to { // inclusive
        array.append(num)
    }
    return array
}
print(numbersBetween2(from: 2, to: 9))



// Write a function that takes an Array of Ints and swaps the first and the last elements with each other.

func reverse(arrayOfInts: [Int]) -> [Int] {
    var arrayOfInts = arrayOfInts // changed array of ints from constant immutable to var mutable
    arrayOfInts.swapAt(0, arrayOfInts.count - 1)
    return arrayOfInts
}

print(reverse(arrayOfInts: [2, 4, 6, 8, 10, 12, 14, 16, 18]))

//print(reverse(arrayOfInts: [2, 4, 6, 8, 10]))


// Write a function that takes an Array of Ints. For each number that is a multiple of 5, it doubles it.

//func multiple(arrayOfInts: [Int]) -> [Int] {
//    var copyOfArrayOfInts = arrayOfInts
//    for (index, value) in copyOfArrayOfInts {
//        if i % 5 == 0 {
//            print(i)
//    
//        

//    
//    for i in copyOfArrayOfInts {
//        if i % 5 == 0 {
//            print(i)}
//        else {
//            return arrayOfInts
//        }
//    }
//return arrayOfInts
//}
//print(multiple(arrayOfInts: [12, 14, 16, 18, 20, 25]))





























//NOTE: You can use these arrays with your functions or create your own
/*
let integers = randomArrayOfInts()
let strings = randomString()
*/
