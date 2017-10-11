//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1) Use a for loop to print the numbers from 1 - 100 (inclusive)

// a) for version:
for i in (1...100) {
    print(i)
}

// b) while version:
var starting = 1

while starting <= 100 {
    print(starting)
    starting += 1
}



// 2) Use a for loop to print the numbers from 1 - 100 (exclusive). print "Odd" if the number is odd, "Even" if it is even.

// a) for version:
for i in (1...100) {
    if i % 2 == 0 {
        print("even - \(i)")
    } else {
        print("odd - \(i)")
    }
}

// b) while version:
var startingNumber = 1

while startingNumber <= 100{
    if startingNumber % 2 == 0 {
        print("even - \(startingNumber)")
    } else {
        print("odd - \(startingNumber)")
    }
    startingNumber += 1
}



//3)The famous FizzBuzz problem! Write a program that loops through numbers 1 to 100: For numbers that are multiples of three print “Fizz”; for numbers that are multiples of five, print “Buzz”; for numbers that are multiples of both three and five print “FizzBuzz”; and for number that don't meet any of those requirements, just print the number.

for i in (1...100) {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}



// 4) Using the Harmonic Series formula, compute the value for n = 5,000.
var sum: Float = 0

for i in (1...5000) {
    sum = sum + (1/Float(i))
}
print(sum)


// 5) Use a loop to print all of the prime numbers from 1 to p for p = 2,000
var count = 0

for i in (1...2000) {
    for j in (1...i) {
        if i % j == 0 {
            count += 1
        }
    }
    if count == 2 {
        print (i)
    }
    count = 0
}



// 6) Use a loop to calculate 15! (Factorial).
var factorial = 15
for i in (1...14).reversed() {
    factorial *= i
}
print("15! is \(factorial)")


// 7) Print an Airplane seating arrangement (1a through 1h) for 26 rows of seats

for row in 1...26 {
    print("\(row)a \(row)b \(row)c  \(row)d \(row)e  \(row)f \(row)g \(row)h")
}


