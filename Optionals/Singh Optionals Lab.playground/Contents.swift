//: Playground - noun: a place where people can play

import UIKit

//=====================================
//MARK: Library
//=====================================

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

func randomIntOptional() -> Int? {
    
    let int = randomInt(from: 20, to: 2000)
    
    if int.isDivisibleBy(10) {
        return nil
    }
    
    if int.isDivisibleBy(3) {
        return nil
    }
    
    return int
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

func randomStringOptional() -> String? {
    
    let intOne = randomInt(from: 0, to: 9999999)
    
    if intOne.isDivisibleBy(3) || intOne.isDivisibleBy(8) {
        return nil
    }
    
    let intTwo = randomInt()
    
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

func randomArrayOfIntOptionals() -> [Int?] {
    
    let count = randomInt(from: 100, to: 1000)
    
    var array: [Int?] = []
    
    for _ in 1...count {
        array.append(randomIntOptional())
    }
    
    return array
}

func randomArrayOfStringOptionals() -> [String?] {
    
    let count = randomInt(from: 100, to: 1000)
    
    var array: [String?] = []
    
    for _ in 1...count {
        array.append(randomStringOptional())
    }
    
    return array
}

//=====================================
//MARK: Exercises - Writing Type-Safe Code
//=====================================

//NOTE: Use these arrays with your functions

let integers = randomArrayOfIntOptionals()
let strings = randomArrayOfStringOptionals()

//=====================================


//Exercise 1:
//Write a function that takes an Array of Int? and returns their sum

//Exercise 1:
func totalSum(_ input:[Int?] ) -> Int {
    
    var sum = 0
    
    for i in input {// iterating thru input array [Int?] via for-in allows us to obtain ALL the array's values; i = each singular optionalInteger? iteration in an array of multiple optionalIntegers?
        if let integer = i { // if-let unwrapping of optional: create a new let constant "integer" (type Int) and compare to each singular iteration "i" (type Int?), which can hold 2 values: Int or nil
            sum += integer // if passes let statement (types match Int = Int) add & updates var "sum" for each iteration; add-like terms
        } // no else statement bc don't care to assign nil value to anything
    }
    return sum
}
print(totalSum([1, 2, nil, 4]))



//Exercise 2:
//Write a function that takes an Array of Int? and returns their average. Don't count nil values.

func takeAverage(_ optionalNumbersInArray : [Int?]) -> Double {
    var sum = 0 // for numerator
    var count = 0 // for denominator, counts every instance of Int (no nils included)
    
    for optionalNum in optionalNumbersInArray { // for each Int? in [Int?]..
        if let realNum = optionalNum  {// if Int = Int (* optionalNum = either Int or nil)
            sum += realNum// add like-terms (Int + int) & update var sum's value 
            count += 1
        }
    }
    let average = Double(sum) / Double(count) //array count cannot change
    return average
}

print(takeAverage([1, 2, 3, 4, 7, 11, nil])) // doesn't account for nil in denominator


//Exercise 3:
//Write a function that takes an Array of Int? and returns their average. Count nils as 0.

func takeNilAverage(_ optionalNumbersInArray : [Int?]) -> Double {
    
    var sum = 0
    
    for optionalNum in optionalNumbersInArray { // optionalNum type = Int?
        if let realNum = optionalNum  {// compare Int to the optional Int? ; whereas optionalNumberInArray is [Int?] - [array] of optional? integers
            sum += realNum// adding like types together ( int and int)
        }
    }
    let average = Double(sum) / Double(optionalNumbersInArray.count) //.count accounts for nil in denominator
    return average
}

print(takeNilAverage([1, 2, 3, 4, 7, 11, nil]))

//Exercise 4:
//Write a function that takes two String Optionals and checks if they are equal.

func isEqual(phrase1: String?, phrase2: String?) -> Bool{
    
    guard let realPhrase1 = phrase1, let realPhrase2 = phrase2 else { // checking if phrase1/2 (type String?) = String
        return phrase1 == nil && phrase2 == nil // if above guard parameters not met -> else return true if phrase1 (type String?) = nil && phrase2 (type String?) = nil
    }
    return realPhrase1.lowercased() == realPhrase2.lowercased() // if guard parameters met -> return true if the Strings.lowercased are == to one another
}

print(isEqual(phrase1: nil, phrase2: nil))
print(isEqual(phrase1: "testing", phrase2: "tEsTing"))



//Exercise 5:
//Write a function that takes an Array of String? and creates a new string that joins
//them. If the string is an optional, substitute it for an '_'. 
//For example: ["M", nil, "Kay", nil, "Tray"] -> "M_Kay_Tray"


func newJointString(arrayOfOptionalStrings: [String?]) -> String {
    var newEmptyString = ""
    
    for optionalString in arrayOfOptionalStrings {
    guard let realString = optionalString else {
        newEmptyString.append("_")
        continue
    }
        newEmptyString.append(realString)
    }
    return newEmptyString
}

print(newJointString(arrayOfOptionalStrings: ["M", nil, "Kay", nil, "Tray"]))


//Exercise 6:
//Write a function that takes a String and an Array of String?
//This function checks whether the array contains the specified String



//func checker(phrase: String, arrayOfOptionalStrings: [String?]) -> Bool {
//
//    for optionalString in arrayOfOptionalStrings {
//        guard let realString = optionalString else {
//            continue
//        }
//        return realString.lowercased() == phrase.lowercased()
//    }
//    return true
//}
//
//
//print(checker(phrase: "yo", arrayOfOptionalStrings: [nil, "bro", "tho", nil, "yo"]))
//
//
//
//else {
//    return false
//}

//Exercise 7:
//Write a function that takes an Array of String? and returns the number of elements
//that are not nil.


//Exercise 8:
//Write a function that takes an Array of String? and returns the number of elements
//that are nil.


//Exercise 9:
//Write a function that takes a String? and returns a String
//if the String argument is nil, return the empty string ""
//otherwise return the string itself
//For example: "Glasses" -> "Glasses" , nil -> ""



//=====================================
//MARK: Exercises - Fixing Type-Unsafe Code
//=====================================

//Exercise 9:
//Fix this function

/*

func addTwoNumbers(_ one: Int?, _ two: Int?) -> Int {
    
    return one! + two!
}

_ = {
    let one = randomIntOptional()
    let two = randomIntOptional()
    
    
    let result = addTwoNumbers(one, two)
    print("\(one) + \(two) = \(result)")
}()


//Exercise 10:
//Fix this function
func numberOfCharacters(in string: String?) -> Int {
    return string!.characters.count
}

//Exercise 11:
//Rewrite this function to use Optional Binding
func alternativeNumberOfCharacters(in string: String?) -> Int {
    
    if string == nil {
        return 0
    }
    else {
        return string!.characters.count
    }
}

//Exercise 12:
//Rewrite this function to use a guard statement
func squareOf(number: Int?) -> Int {
    
    return number! * number!
}

//Exercise 13:
//Rewrite this function to use Optional Chaining and the '??' operator
func sizeOf(array: [AnyObject?]?) -> Int {
    
    if let array = array {
        return array.count
    }
    else {
        return 0
    }
    
}


//=====================================
//MARK: Bonus
//=====================================


let objects: [AnyObject?] = {
    
    var array: [AnyObject?] = []
    
    let strings = randomArrayOfStringOptionals()
        .map({ s in s as? AnyObject })
    
    array += strings
    
    let numbers = randomArrayOfIntOptionals()
        .map({ s in s as? AnyObject })
    array += numbers
    
    return array
}()


//Exercise 14:
//Write a function that takes an Array of AnyObject? and returns the number of Strings present


//Exercise 15:
//Write a function that takes an Array of AnyObject? and returns the sum of all the integers

//Exercise 16:
//Write a function that takes a number and an Array of AnyObject?
//and returns true if the array contains the number,
//false otherwise


//Exercise 17:
//Write a function that takes an Array of AnyObject?
//and returns a single String that joins all of the elements
//while ignoring nil values

 */

