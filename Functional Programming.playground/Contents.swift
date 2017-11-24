//: Playground - noun: a place where people can play

import UIKit



//On let arrayOfNumbers = [1, 2, 3, 4, 5, 6] return an array of squares




//On let cast = ["Vivien", "Marlon", "Kim", "Karl"] a) return lowercased with the .lowercaseString method, b) return the count with the .count method, c) return uppercased with .uppercaseString



//3: On let fibonacciSequence: Array<NSNumber> = [1,1,2,3,5] return the localizedString of each number with NumberFormatter.localizedString(from:, number: .spellOut)
//On let booleanValues: Array<Bool> = [true, false, true] return the opposite of each value with !



// map goes through every item in the array and applies count to it, returning an array with the count of each name
let cast = ["Vivien", "Marlon", "Kim", "Karl"].map {$0.count}
print(cast)


//3:
let fibonacciSequence: Array<String> = [1.69,1,2,3,5].map { (num) -> String in
    NumberFormatter.localizedString(from: num, number: .spellOut)
}

print(fibonacciSequence)

// 4: On let setOfNumbers: Set = [1, 2, 3, 4, 5, 6] return an array of two times each element

// map always returns an array of same type of ting it gets
let numberSet: Set = [1, 2, 3, 4, 5, 6]
let doubledSet = numberSet.map{($0 + $0)}.sorted()
print(doubledSet)

let dict = ["1":1, "2":2]
let newDict = dict.map { (key, value) -> Int in
    Int(key)! + value
}
// dictionaries are unordered (should've gotten 2, 4); can use .sorted()
print(newDict)






