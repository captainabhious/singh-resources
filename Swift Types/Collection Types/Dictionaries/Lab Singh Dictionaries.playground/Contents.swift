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

func randomBoolean() -> Bool {
    let integer = randomInt()
    
    return integer.isEven()
}

func randomString() -> String {
    
    let intOne = randomInt(from: 1000, to: 999999)
    let intTwo = randomInt(from: 100, to: 9999)
    
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

func randomArrayOfStrings() -> [String] {
    
    let count = randomInt(from: 10, to: 1000)
    
    var array: [String] = []
    
    for _ in 1...count {
        array.append(randomString())
    }
    
    return array
}

func randomDictionaryOfStrings() -> [String : String] {
    
    let count = randomInt(from: 10, to: 100)
    
    var result: [String : String] = [ : ]
    
    for _ in 1...count {
        result[randomString()] = randomString()
    }
    
    return result
}


//=====================================
//MARK: Exercises
//=====================================

let map = randomDictionaryOfStrings()

// 1) Create a Dictionary that contains a list of things you eat on a given day, i.e. "Monday", "Tuesday", etc.
// a) type inference; don't have to declare type of dictionary long as it isn't empty dictionary literal [:]
var listOfMeals = [ //String:Array of Strings
    "Monday" : ["Tacos", "Burritos"],
    "Tuesday" : ["Vegetarian", "Water"],
    "Wednesday" : ["Chicken", "Wings"],
    "Thursday" : ["Fish"],
    "Friday" : ["Beef"],
    "Saturday" : ["Pizza"],
    "Sunday" : ["Asian Food"]
]
print(listOfMeals)


// b) OR by declaration and initialization
var listOfMeals2: [String:String] = [
    "Monday" : "Tacos",
    "Tuesday" : "Vegetarian",
    "Wednesday" : "Chicken",
    "Thursday" : "Fish",
    "Friday" : "Beef",
    "Saturday" : "Pizza",
    "Sunday" : "Asian Food"
]
print(listOfMeals2)


// Write a function that takes two Dictionaries of Strings and returns the combination.
let dict1 = [
    "Milk" : "Cookies",
    "Yin" : "Chocolates"
]

let dict2 = [
    "Yin" : "Yang",
    "Abhi" : "Singh"
]

func combine(first: [String:String], second: [String:String]) -> [String:String] {
    var tempDictionary = first //passing items in a function = immutable (unchangeable) constants; stores dict1
    //print(tempDictionary)
    for (ikey, ivalue) in second { // for every single key in second dict, return the key value pair and do something
        //print(ikey, ivalue)
        tempDictionary[ikey] = ivalue // indexing dictionary, "updating value"
    }
    return tempDictionary
}

print("Combined ...\(combine(first: dict1, second: dict2))")

// * MAP *
// .map creates existing array or dict and for each item, perform this funciton
// .filter give me a new array or dict where only these things are true
// uses closure




// Write a function that takes two Dictionaries and determines whether they are the same (without using map1 == map2).

// Check counts on both dictionary, if not = then return false
// else iterate thru the first dict and check if the k&v are same w/ dict2, if yes continue until finishes
// if not return flase

let sameDictionary1 = ["Oolong" : "Tea", "Oolong1" : "Tea"]
let sameDictionary2 = ["Oolong" : "Tea"]

func areEqual(dict1: [String:String], dict2: [String:String]) -> Bool {
    if (sameDictionary1.count != sameDictionary2.count) {
        return false
    } else {
        for (key1, value) in sameDictionary1 {
            if (sameDictionary2.keys.contains(key1) && (sameDictionary2[key1] == value)) { // . references, [] indexes
            // .keys references properties of sameDict2 and is checking if that contains
                continue
            }
            else {
                return false
            }
        }
        return true
    }
}

//print("Are Equal: " dict1: sameDictionary1, dict2: sameDictionary2)) FINISH


// Write a function that takes two Dictionaries and returns an Array of the Keys they have in common

func sameKeys(dic1: [String:String], dic2: [String:String]) -> [String] {
    var arrayOfMatchingKeys: [String] = [] //empty array "container" to place into
    for (key1,_) in dic1 {
        for (key2,_) in dic2 {
            if key1 == key2 {
                arrayOfMatchingKeys.append(key1) //appends into empty array
            }
        }
    }
    return arrayOfMatchingKeys
}

print(sameKeys(dic1: dict1 , dic2: dict2))

//<> defines type aliases, words that mean types that aren't known until function is called

// Write a function that takes an Array of Ints, and returns a Dictionary [Int: Int] detailing how often a number appeared.



func countDic(_ iArray: [Int]) -> [Int:Int] {
    var newDic: [Int:Int] = [:]

    var counter = 0

for key in iArray {
    if newDic[key] == nil {
        counter = 1
        newDic[key] = counter
    } else {
        counter = newDic[key]! //unwrap optional w/ forced value operator (!)
        counter += 1
        newDic[key] = counter
    }
}
    return newDic
}


// Write a function that takes an Array of Strings and tells the user which one appeared the most.




// Write a function that takes a Dictionary representing a team's season record, and deviously replaces all the wins with losses.









// Write a function that takes an intersection (venn diagram commonalities) of two Dictionaries. *******

//func intersection(right: [String:String], left: [String:String]) -> [String:String] {
//    
//    
//    
//}

// guard = fancy "if"; does second  key exist? 


// guarded considers nil to be a failure









