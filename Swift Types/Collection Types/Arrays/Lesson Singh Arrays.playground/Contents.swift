//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Playground - noun: a place where people can play

import UIKit



let names = ["Jun", "Tenny", "Abhi", "Sean", "Shane", "Grishma", "Bob", "Sheeja", "Jared", "Ejaz", "Josh", "Wasay", "Aldo"]

print(names)

for name in names {
    print("Hi there, \(name)")
}


var nothing: [Int] // declaring an array type


let emptyArray = [String]()
print(emptyArray)


let favoriteLetters = ["A", "G", "N", "Z"] // immutable (unchangeable) array b/c let constant
let firstLetter = favoriteLetters[0]
let thirdLetter = favoriteLetters[1]
print(firstLetter + thirdLetter)


// var records: [Float] - type cast
var records = [40.5, 32.6, 81.4] // mutable (changeable) array b/c var variable
records.append(54.2) // adds another item in the mutable array
records += [77.7] // alternative to "append"
records.insert(66.6, at:2) // insert
records.remove(at: 1) // remove
print("\(records)")
// print(records) - same as above



// Example: Create an array that holds the names of the Mount Rushmore Presidents. - Add "Kanye West" to your array. - Remove the second item in your array.
var mountRushmorePresidents = ["Jefferson", "Washington", "Lincoln", "Roosevelt"]
mountRushmorePresidents += ["Kanye West"]
print(mountRushmorePresidents)
mountRushmorePresidents.remove(at: 2)
print(mountRushmorePresidents)


// Example: Create an array that holds the names of the Beatles. - Loop over your array and if the loop encounters the name "Ringo" pring "Oh yeah, Him"
var beatlesNames = ["Lennon", "McCartney", "Ringo", "Harrison", "Best", "Sutcliffe"]
for beatlesName in beatlesNames {
    if beatlesName == "Ringo" {
        print("Oh yeah, Him")
    } else {
        print(beatlesName)
    }
}

var lapTimes = [42.6, 58.3, 33.7, 84.5]
let sortedTimes = lapTimes.sorted { (first, second) -> Bool in
    if first < second {
        return true
    }
    return false
}

print("Sorted times are: \(sortedTimes)")
print("Unsorted times are: \(lapTimes)")






