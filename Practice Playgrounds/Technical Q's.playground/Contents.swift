//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
// Write a function that takes an [Int] array and returns the Int that occurs most often.

//func mostCommonInt (array: [Int]) {
//
//    //array.filter{$0 == array}.count
//
//    var countOfNumber = [Int: Int]()
//
//    for i in array {
//
//
//
//    }
//
//
//}
//
//
//mostCommonInt(array: [3, 3, 4, 5, 6 , 6, 4])


arr = [1, 2, 2, 3, 1, 4, 5, 4]
//
//func mostCommonInt (arr: [Int]) -> Int {
//    var count = 0
//    for i in arr {
//        count = 0
//        for j in arr {
//            if j == i {
//                count += 1
//            }
//
//            if j > 1 {
//                return count
//            }
//
//        }
//    }
//    return 0
//}
//
//mostCommonInt(arr: arr1)

//
//extension Array where Element: Hashable {
//
//    func countForElements() -> [Element: Int] {
//        var counts = [Element: Int]()
//        for element in self {
//            counts[element] = (counts[element] ?? 0) + 1
//        }
//        return counts
//    }
//
//}


// Write a function that takes an array of ints and returns the consecutive subarray with the largest sum.
//print(arr.index(1, offsetBy: 2))
//var startIndex = arr.index(0, offsetBy: 1)


var arr = [-1, 2, -3, 6, -2, 8]


// n^3 solution
func largestSum(arr: [Int]) -> [Int] {
    var bestSum = Int.min
    var start = 0, end = 0
    for i in 0..<arr.count {
        for j in i..<arr.count {
            // use reduce to get the sume
            let sum = arr[i...j].reduce(0, +)
            // compare results
            if sum > bestSum {
                bestSum = sum
                start = i
                end = j
            }
        }
    }
    // get the biggest one out
    return [Int](arr[start...end])
}

print(largestSum(arr: arr))


func largestSumON(arr: [Int]) -> [Int] {
    var largestStart = 0
    var largestEnd = 0
    var currentStart = 0
    
    for i in 0..<arr.count {
        currentSum += arr[i]
        if currentSum > largestSum {
            largestStart = currentStart
            largestSum = currentSum
            largestEnd = i
        }
        
        if cucrrentSum < 0 {
            currentSum = 0
            currentStart = i + i
        }
        
    }
    
    let subArray = [Int](arr[largestStart....largestEnd])
    return subArray
}





func largestSumArray (array: [Int]) -> [Int] {
var counter = 0
    
    for num in counter...array.count {
        counter += 1
    }

    for i in arr {
        for j in arr {
            while j != i { // ideally want to index j by skipping i.index
            var maxValue = i + j
            // check maxValue to previous iterations
            
        }


    }


}
*/

/*
func generateTally(n: Int ) -> [Int] {
    var result: [Int] = []
    for i in 0..<n {
        result.append(Int(arc4random_uniform(2))+1)
    }
    return result
}




func checkWin (board: [[Int]]) {
    var spaces = 3
    var ticTacToe = ""
    
    for i in 1...spaces {
        for j in 1...spaces {
            var arr = generateTally(n: 1)
            for k in arr{
                if k == 1 {
                    ticTacToe = "X"
                } else {
                    ticTacToe = "O"
                }
               print("\(ticTacToe) | ", terminator: "")
            }
        }
        print("")
    }
}

print(checkWin(board: [[]]))
*/

// You are tasked with writing a program to make change. Given an array of coin denominations (Ints) and an amount of money. Return the nubmer of combinations of coins to reach the desired amount.


var myCoinsArr = [5, 2, 3]
var myDesiredAmount = 8
var myEmptyArr = [Int]()
var counter = 0

func makeChange(coinsArr: [Int], desiredAmount: Int) -> Int {

    // check to see if myDesiredAmount is evenly divisible by each i in myCoinsArr (remainder == 0)
    for i in coinsArr {
        if desiredAmount % i == 0 {
            counter += 1
            myEmptyArr.append(i)
            print("update counter: \(counter)")
        }
        else {
            print("\(desiredAmount) is not evenly divisible by \(i)")
            
            var divNQ = desiredAmount/i
            print("\(i) evenly goes into \(desiredAmount) just \(divNQ) times")
            print(divNQ)
            
            var remainingAmt = desiredAmount - (divNQ * i)
            print("Remaining quotient to match: \(remainingAmt)")
        }
        
    }
    return counter

}


makeChange(coinsArr: myCoinsArr, desiredAmount: myDesiredAmount)


func fibonnaciInt(input: [Int]) -> Int {
    
    
    
    
}


