//: Conditionals Lab - Practice using if, else, and switch in Swift.

import UIKit

//MARK: - Random Function
//Use this to create your integers
func randomInteger(from: Int, to: Int) -> Int {
  let difference = to - from
  
  let random = Int(arc4random_uniform(UInt32(difference)))

  let result = from + random
  
  if result < from {
    return from
  } else if result > to {
    return to
  } else {
    return result
  }
}

// Random Boolean Function
func randomBoolean() -> Bool {
  return randomInteger(from: 0, to: 10) % 2 == 0
}

// MARK: - Requirements

// Given an integer, sides, print the name of the polygon with that number of sides
let sides = randomInteger(from: 2, to: 10)

switch sides {
case 2:
    print("line")
case 3:
    print("triangle")
case 4:
    print("quadrilateral")
case 5:
    print("pentagon")
case 6:
    print("hexagon")
case 7:
    print("heptagon")
case 8:
    print("octagon")
case 9:
    print("nonagon")
case 10:
    print("decagon")
default:
    print("none of the above")
}


// Given a temperature (in Fahrenheit), print a suggestion of what to wear
let temperature = randomInteger(from: -459, to: 459)

if temperature >= 68 && temperature <= 88 {
    print("wear summer clothing")
} else if temperature < 68 &&  temperature >= 45 {
    print("bring a jacket")
} else if temperature < 45 {
    print("bring a blanket lol")
} else if temperature > 88 && temperature <= 100 {
    print("wear swimming trunks")
} else if temperature > 100 {
    print("it's too hot, don't go outside")
}


// Given an hour (from 1 to 24), print the time of day.
let timeOfDay = randomInteger(from: 1, to: 24)

switch timeOfDay {
case 1...3:
    print("dawn")
case 4...7:
    print("early morning")
case 8...11:
    print("morning")
case 12...13:
    print("noon")
case 14...17:
    print("afternoon")
case 18...19:
    print("dusk")
case 20...21:
    print("evening")
case 22...24:
    print("night")
default:
    print("twilight??")
}


// Given a person's age, print a String saying what era of their life they are in. For example, someone who is 27 is in their "20s".
let age = randomInteger(from: 1, to: 100)

switch age {
case 1...2:
    print("newborns/toddlers")
case 3...4:
    print("preschoolers")
case 5...8:
    print("school-age children")
case 9...12:
    print("pre-teens")
case 13...19:
    print("teens")
case 20...29:
    print("20's")
case 30...39:
    print("30's")
case 40...49:
    print("40's")
case 50...59:
    print("50's")
case 60...69:
    print("60's")
case 70...79:
    print("70's")
case 80...89:
    print("80's")
case 90...99:
    print("90's")
case 100:
    print("century")
default:
    print("you don't exist")
}

// Given a student's grade for an example, print their Letter grade
let grade = randomInteger(from: 0, to: 100)

switch grade {
case 68...70:
    print("D")
case 71...74:
    print("C-")
case 75...77:
    print("C")
case 78...80:
    print("C+")
case 81...83:
    print("B-")
case 84...87:
    print("B")
case 88...89:
    print("B+")
case 90...93:
    print("A-")
case 94...99:
    print("A")
case 100:
    print("A+")
default:
    print("you flunked the test")
}

// The number 6 is a truly great number. Create two Integers num1, num2, from 1 to 100, and print "Awesome" if either one is 6, or if sum or difference of those two numbers is 6.
let num1 = randomInteger(from: 1, to: 100)
let num2 = randomInteger(from: 1, to: 100)
let sum = num1 + num2
let diff = abs(num1  - num2)

if num1 == 6 || num2 == 6 {
    print("Awesome: \(num1), \(num2)")
} else if sum == 6 {
    print("Awesome: \(num1), \(num2)")
} else if diff == 6 {
    print("Awesome: \(num1), \(num2)")
} else {
    print("nothing")
}


// We have two monkeys, Freddy and Jason, and the variables freddyIsSmiling and jasonIsSmiling indicate if each is smiling. We are in trouble if they are both smiling or if neither of them is smiling. Print "Trouble" if we are in trouble. Otherwise, print "Not in trouble".
let freddyIsSmiling = randomBoolean()
let jasonIsSmiling = randomBoolean()

if freddyIsSmiling && jasonIsSmiling {
    print("trouble")
} else if !freddyIsSmiling && !jasonIsSmiling {
    print("trouble")
} else {
    print("not in trouble")
}


// MARK: - Bonus

// Given 3 integers, a, b, c, print the largest one.
let a = randomInteger(from: 1, to: 100)
let b = randomInteger(from: 1, to: 100)
let c = randomInteger(from: 1, to: 100)


// Now print the smallest


// Given an Integer from 1 - 7, print out the name of the day.
let day = randomInteger(from: 1, to: 7)


// The squirrels in Palo Alto spend most of the day playing. In particular, they play if the temperature is between 60 and 90 (inclusive). Unless it is summer, then the upper limit is 100 instead of 90. Given an Integer temperature and a Bool isSummer, print "Playing" if the squirrels play and "Not Playing" otherwise.
let isSummer = randomBoolean()
let paloAltoTemperature = randomInteger(from: 38, to: 100)


// There are 88 keys in a piano. Given a number from 1 - 88, print out the name of the key, (C, D, E, F, G, H, etc)
let pianoKey = randomInteger(from: 1, to: 88)

