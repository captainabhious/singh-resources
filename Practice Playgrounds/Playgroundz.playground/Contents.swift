//: Playground - noun: a place where people can play

import UIKit
/*
var number = 7
var array = [2, 4, 6, 8, 9, 17, 99]

var count = array.count
print(count)
var median = count/2
print(median)
print(array[median])


func splitter (anArray: [Int]) {
    var mid = anArray.count/2
    print(mid)
    if number < anArray[mid] {
        print("ye")
    }
  //  return splitArray
    
}
print(splitter(anArray: [2, 6, 12, 18, 20, 44, 56, 200, 456, 2345]))


if number > array[median] {
    for i in median...count {
        if number == i {
            print("tru")
          //  return true
        }
    }
} else { // number < array's median value
    //for i in array[0]...median {
        
    }



var sampleArray = [9, 12, 134, 234, 66, 0, 3]

//func bubbleSort (array: [Int]) {
//    let arrayCount = array.count
//
//    for i in 0...arrayCount {
//        for j in 1...arrayCount-2{
//            if array[j-1] > array[j] {
//                let largerValue = array[j-1]
//                array[j-1] = array[j]
//                array[j] = largerValue
//            }
//        }
//    }
//}
//
//bubbleSort(array: [2, 1, 5, 8, 4, 9, 44, 23])


// Nested Functions: http://fuckingswiftblocksyntax.com/
func jediTrainer () -> ((String, Int) -> String) {
    func train(name: String, times: Int) -> (String) {
        return "\(name) has been trained in the Force \(times) times"
    }
    return train
}
let train = jediTrainer()
train("Obi Wan", 3)


// Closures
// sorted(by:) method sorts items in an array
// here it will sort based on first character of each string (s1, s2)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// func syntax
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedFuncNames = names.sorted(by: backward)
print(reversedFuncNames)

// closure syntax
// assign closure to var in order to call it like a func
var reversedClosureNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedClosureNames)

// concise closure syntax - type inference
var reversedConciseClosureNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
print(reversedConciseClosureNames)

// omit return keyword b/c func type of sorted by is a Bool & bc s1>s2 indicates Bool
//reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )


var longNumber: Double = 0.64155629

var change = String(format: "%.2f", longNumber)


let minValue = UInt8.max
print(minValue)


print("========== Filter, Map, Reduce ================")

// EXAMPLE:

struct Device { // Apple Device Blueprint
    var type: String
    var price: Float
    var color: String
}

var myiMacPro       = Device(type: "iMac Pro", price: 4999.00, color: "Space Grey")
var myiPhone6Plus   = Device(type: "iPhone", price: 799.00, color: "White")
var myiPhone7       = Device(type: "iPhone", price: 699.00, color: "Black")
var myiPad          = Device(type: "iPad", price: 599.00, color: "Space Grey")
var myAppleWatch    = Device(type: "Apple Watch", price: 349.00, color: "Space Grey")
var myAppleTV       = Device(type: "Apple TV", price: 199.00, color: "Black")

let myDevices = [myiMacPro, myiPhone6Plus, myiPhone7, myiPad, myAppleWatch, myAppleTV]


// OLD METHOD: iterate each item in an array via a for loop, use if logic to check property .type, append such device to new array

var myLoopFilteredPhones: [Device] = []

for device in myDevices {
    if device.type == "iPhone"{
        myLoopFilteredPhones.append(device)
    }
}

print(myLoopFilteredPhones) // prints properties of iPhone 6+, iPhone 7


// FILTER:

let iPhones = myDevices.filter({return $0.type == "iPhone"})
// $0: same as i; placeholder for obj iterating
// implicit paramater type b/c myDevices is [array]
// return type Boolean; only appends (filters) to iPhones constant if $0 == "iPhone"
print(iPhones) // same as myLoopFilteredPhones




// MAP: iterate over entire array and apply an operation/transformation to every obj in the array
// use map when you need to transform an array
// returns an array 

// convert from $US price -> Canadian price
let canadianPrices: [Float] = myDevices.map({ return $0.price * 1.2 })
// manipulating each obj by whatever desired operation
print(canadianPrices)

// example:
let arrayOfNumbers = [1, 2, 3, 4]
let arrayOfString = arrayOfNumbers.map { "\($0)" }
print(arrayOfString)


// http://www.mokacoding.com/blog/when-to-use-map-flatmap-for/

// FLATMAP: when need to transform the contents of an array of arrays into a linear array







// OLD METHOD: iterate through each i (price) in [canadianPrices], append to new var (totalPrice)

var totalPrice: Float = 0.0

for price in canadianPrices {
    totalPrice += price
}
print(totalPrice)


// REDUCE: combines all values into one
// combined closure example: takes in initial value (0.0) and then add an operator (+)
let totalCanadianPrice: Float = canadianPrices.reduce(0.0, +)
print(totalCanadianPrice)







// Write a function to reverse an array in place.

func reverse (arr: [Int]) {
    
    var theArray = arr
   // print(theArray)
    var theArraysCount = theArray.count
    let theArraysLastIndex = theArraysCount - 1
    var theArraysFirstIndex = theArray.first
   // let mapArray = theArray.map({_ in return theArray.swapAt(iIndex, <#T##j: Int##Int#>)  })
    
 
    
  //  while theArray[theArraysLastIndex] != theArraysFirstIndex
    var iIndex = 0
    var counter = 0
    let ting = [0...7]
    
 //   while iIndex < theArraysLastIndex {
   // while theArray[theArraysFirstIndex!] != theArray[theArraysLastIndex] {
   // while counter < 7 {
    for i in ting {
        iIndex = 0
//        counter = 0
        for i in theArray {
            //guard let iIndex = theArray.index(of: i) else {return}
            print("This is the index: \(iIndex)")
            var nextIndex = iIndex + 1
            theArray.swapAt(iIndex, nextIndex)
            print(theArray)
            iIndex += 1
            counter += 1
            print("this is counter: \(counter)")
 
        }
    }
}

//print(reverse(arr: [2, 4, 6, 8]))
*/


//1 2 3 4
//2 1 3 4
//2 3 1 4
//2 3 4 1
//
//3 2 4 1
//3 4 2 1
//
//4 3 2 1


func subsetChecker (arr1: [Int], arr2: [Int]) -> Bool {
    
    var smallerArr = [Int]()
    var largerArr = [Int]()
    var array1 = [Int]()
    var array2 = [Int]()
    
    
    // checks to make sure there are items in the array, then sorts them
    if arr1.count == 0 || arr2.count == 0 {
        return false
    } else {
        array1 = arr1.sorted()
        print("array 1 sorted: \(array1)")
        array2 = arr2.sorted()
        print("array 2 sorted: \(array2)")
    }
    
    
    // assigns arrays to smallerArray/largerArray based on size
    if array1.count <= array2.count {
        smallerArr = array1
        largerArr = array2
    } else {
        smallerArr = array2
        largerArr = array1
    }
    
    // counter that +1's everytime there's a match
    var counter = 0
    
    // iterate thru each i in smallerArray & each j in largerArray; check if i == j
    for i in smallerArr {
        for j in largerArr {
            if i == j {
                counter += 1
                break
            } else {
                continue
            }
            return false
        }
    }
    // if counter ticks as many times as the count of the array -> return true
    if counter == smallerArr.count {
        return true
    } else {
        return false
    }

}
    
    

print(subsetChecker(arr1: [1, 3, 5, 4], arr2: [5, 3, 1, 2, 7, 8]))

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

print(threeDoubleQuotationMarks)

//let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
//print(wiseWords)



let greeting = "Hi there! It's nice to meet you! 👋"
let endOfSentence = greeting.index(of: "!")!
print(endOfSentence)
let firstSentence = greeting[...endOfSentence]
print(firstSentence)
