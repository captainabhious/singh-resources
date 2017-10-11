//: Playground - noun: a place where people can play

import UIKit



//MARK: Basic


func yo() {
    print("yo")
}

func callMultipleTimes(repeatCount: Int, function: () -> ()) {
    
    guard repeatCount >= 1 else { return }
    
    for _ in 1...repeatCount {
        function()
    }
}

callMultipleTimes(repeatCount: 100, function: yo)
callMultipleTimes(repeatCount: 5, function: yo)
callMultipleTimes(repeatCount: 1, function: yo)
callMultipleTimes(repeatCount: 0, function: yo)
callMultipleTimes(repeatCount: -1, function: yo)

callMultipleTimes(repeatCount: 10) {
    print("Ripples Accross the Globe")
}

//Coffee

func isOpen(hour: Int) -> Bool {
    
    switch hour {
        case 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18:
            return true
        default :
            return false
    }
    
}

func enter(hour: Int, isOpenFunction: (Int) -> (Bool)) {
    
    if isOpenFunction(hour) {
        print("Come on in!")
    }
    else {
        print("Sorry! We're closed.")
    }
}

enter(hour: 7, isOpenFunction: isOpen)
enter(hour: 10, isOpenFunction: isOpen)
enter(hour: 00, isOpenFunction: isOpen)
enter(hour: 15, isOpenFunction: isOpen)
enter(hour: 12, isOpenFunction: isOpen)
enter(hour: 15, isOpenFunction: isOpen)
enter(hour: 12, isOpenFunction: isOpen)

//MARK: Strings

//Recursive String reverse
func reverseString(_ string: String) -> String {
    
    //Base case
    if string.isEmpty || string.characters.count == 1 {
        return string
    }
    
    let lastCharacter = string.characters.last!
    
    let substringIndex = string.index(before: string.endIndex)
    
    
    let subString = string.substring(to: substringIndex)
    
    return "\(lastCharacter)" + reverseString(subString)
}

reverseString("Batman")
reverseString("Woes")
reverseString("Alibaba")
reverseString("Turn your critical eye")

//Count String appearences
//Recursive

func substringCount(substring: String, text: String) -> Int {
    
    let substringSize = substring.characters.count
    let textSize = text.characters.count
    
    if textSize < substringSize {
        return 0
    }
    
    if textSize == substringSize {
        return text == substring ? 1 : 0
    }
    
    let endIndex = text.index(text.startIndex, offsetBy: substringSize)
    let subText = text.substring(to:  endIndex)
    
    let count = substring == subText ? 1 : 0
    
    let newTextIndex = text.index(after: text.startIndex)
    let newText = text.substring(from: newTextIndex)
    
    return count + substringCount(substring: substring, text: newText)
}

substringCount(substring: "abc", text: "abcadeabc")
substringCount(substring: "abc", text: "defghijklmnop")
substringCount(substring: "12", text: "abefd1212vdsf12")
substringCount(substring: "oo", text: "Boom came to the Moon and came with a spoon but left too soon")


//Coffee making rates
func mondayRate() -> Int {
    
    let customersPerHour = 10
    return customersPerHour
}

func fridayRate() -> Int {
    
    let customersPerHour: Double = (45 / 30) * 60
    return Int(customersPerHour)
}

func otherDaysRate() -> Int {
    
    let customersPerHour = 55
    return customersPerHour
}

func rateForDay(day: String) -> Int {
    
    switch day {
        case "Monday" :
            return mondayRate()
        case "Friday" :
            return fridayRate()
        default :
            return otherDaysRate()
    }
}

func customerCalculation(day: String, rateCalculator: (String) -> (Int) ) {
    
    let customersPerHour = Double(rateCalculator(day))
    
    let hours: Double = (500 / customersPerHour)
    
    print("On \(day), it would take \(hours) hours to serve 500 customers")
}

customerCalculation(day: "Monday", rateCalculator: rateForDay)
customerCalculation(day: "Tuesday", rateCalculator: rateForDay)
customerCalculation(day: "Wednesday", rateCalculator: rateForDay)
customerCalculation(day: "Thursday", rateCalculator: rateForDay)
customerCalculation(day: "Friday", rateCalculator: rateForDay)

//MARK: Math

//Incrementer

func createIncrementer(start: Int, step: Int) -> () -> Int {
    
    var counter = start
    
    return {
        let currentCount = counter
        counter += step
        return currentCount
    }
}

let incrementer = createIncrementer(start: 0, step: 2)

for _ in 1...10 {
    let count = incrementer()
    print(count)
}

//Factorial

func factorial(of number: Int) -> Int {
    
    switch number {
        case 0, 1:
            return 1
        default:
            break
    }
    
    return number * factorial(of: number - 1)
}

factorial(of: 0)
factorial(of: 1)
factorial(of: 2)
factorial(of: 3)
factorial(of: 4)
factorial(of: 5)
factorial(of: 6)
factorial(of: 7)


//Math Fuctions
func identity(number: Int) -> Int {
    return number
}

func square(number: Int) -> Int {
    return number * number
}

func cube(number: Int) -> Int {
    return number * number * number
}

func squareRoot(number: Int) -> Int {
    let doubleValue = Double(number)
    
    return Int(sqrt(doubleValue))
}

func exponent(of number: Int) -> Int {
    
    var result = number
    
    for _ in 1..<number {
        result *= number
    }
    
    return result
}

exponent(of: 4)
exponent(of: 8)

func printResult(number: Int, function: (Int) -> (Int)) {
    print("The result for \(number) is \(function(number))")
}

printResult(number: 4, function: identity)
printResult(number: 4, function: square)
printResult(number: 4, function: cube)
printResult(number: 4, function: squareRoot)
printResult(number: 4, function: exponent)
