//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var closure: () -> String = {
    return "Hello everybody"
}

func closureFunction() -> String {
    return "Hello everybody"
}


print(closureFunction())

//Get filename
//Asynronously download file "filename" in the background
//Open the file
//Print the first line of the file
/*
URLSession.shared.dataTask(with: "google", completionHandler: {
    (data, response, error) in
    //Do stuff with the data
}) */

/*
var betterClosure: (String, String) -> String = {
    name, otherName in
    return "Hello " + name + " " + otherName
} */
/*
var shortClosure = { $0 + $1 + 1 }

print(shortClosure(0, 5))

var someInts = [2,3,5,7,8,10]

var someOtherInts = someInts.filter({
    number in
    return number % 2 == 0
})

var someSmallInts = someInts.filter() {
    return $0 < 5
}

print(someOtherInts)
print(someSmallInts)

func doAThing(name: String) {
    
}
 */
/*
func doSomethingEventually(closure: () -> String) {
    print("Give me a minute")
    sleep(5)
    closure()
}


doSomethingEventually(closure: {
    print("I'm ready")
}) */

//0 1 1 2 3 5 8 13 21 34

func fibonnaci(sequenceNum: Int) -> Int {
    
     if sequenceNum < 1 {
     return 0 //Go away, jokers
     }
     if sequenceNum == 1 {
     return 0
     }
     if sequenceNum == 2 {
     return 1
     }
    return fibonnaci(sequenceNum: sequenceNum - 1) + fibonnaci(sequenceNum: sequenceNum - 2)
}

//print(fibonnaci(sequenceNum: 5))


func factorio(startNum: Int) -> Int {
    if startNum == 1 {
        return 1
    }
    return factorio(startNum: startNum - 1) * startNum
}

print(factorio(startNum: 15))
