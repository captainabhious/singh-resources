//: Playground - noun: a place where people can play

import UIKit

// COLLECTION TYPES: Swift provides 3 primary collection types - arrays, dictionaries, & sets - for storing collections of values

// Mutability of Collections
// assigning any of these 3 types to a variable (mutable) vs constant (immutable)





// ARRAYS: ordered collection of same-type values
// - same value can appear in array multiple times @ diff positions

// Creating Empty Array
var someInts = [Int]() // []
someInts.append(3) // [3]
someInts = [] // []; but type-inferred to still be [Int]

// Pre-Initialized Array (w/ fixed # of default values)
var digitCounts = Array(repeating: 6, count: 3)
print(digitCounts) // [6, 6, 6]

// Accessing Array Values via Iteration
for digit in digitCounts {
    print(digit)
}

// Array Properties
// - '.isEmpty' or '.count' : checks whether any elements w/in array
// - '.first' or '.last' : safe access to value of array's first * last elements; if empty array, nil

// Single Element Addition
// - can use .append property or alternatively use +=
digitCounts.append(9)
// Multiple Element Addition
digitCounts.append(contentsOf: [10, 11])
// Inserting Element in Middle
digitCounts.insert(10, at: 5)

// Subscripts
print((digitCounts[3]))

// Single Element Removal
digitCounts.remove(at: 4)
// - '.removelast()' : removes last element
// - '.removeSubrange(_:)' : removes subrange based on specified index Range; i.e: (0...2)

var students = ["Jun", "Tennyson", "Abhi"]
// Replace Element
if let i = students.index(of: "Tennyson") { // find match with index of: "Tenny"
    students[i] = "Tenny" // assigned new value "Tenny" to via subscript
    students
}

// Growing Size of An Array
// reserveCapacity(_:) method: https://developer.apple.com/documentation/swift/array

// Modifying Copies of Arrays
// - Arrays are 
























var lapTimes = [42.6, 58.3, 33.7, 84.5]
let sortedTimes = lapTimes.sorted { (first, second) -> Bool in
    if first < second {
        return true
    }
    return false
}

print("Sorted times are: \(sortedTimes)")
print("Unsorted times are: \(lapTimes)")




