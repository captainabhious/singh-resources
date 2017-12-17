//: Playground - noun: a place where people can play

import UIKit


// You are given two arrays of Ints with no repeating Integers within the arrays. Write a function that returns true if array1 is a subset of array 2, or false if it isn’t.

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
            //return false
        }
    }
    // if counter ticks as many times as the count of the array -> return true
    if counter == smallerArr.count {
        return true
    } else {
        return false
    }
    
}

// function call
print(subsetChecker(arr1: [1, 3, 5, 3], arr2: [5, 3, 1, 4]))

