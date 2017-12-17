//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// Painted Lady Home Example:
class paintedLadyHome {
    var type = "victorian"
    var roof = "composite"
    var foundation = "crawl space"
    var exterior = "wood siding"
    var garage = "1 car"
    
}

let myHome = paintedLadyHome() // creating an instance of this class
print("The roof on my home is \(myHome.roof)")

// Point Example:
class Point {
    var x = 0.0 // sets the default value of x to 0
    var y = 0.0 // sets the default value of x to 0
}

// this creates a new Point instance using the default initializer
var point = Point()

point.x = 100 // sets the x property to 100
print(point.x)
point.y = 200 // sets the y propery to 200
print(point.y)


// Apple Swift Programming Lang

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

someVideoMode.frameRate = 30
print(someVideoMode.frameRate)


// Learn Swift 3

class FastCar { // no arguments or parameters here
    var topSpeed: Int //155 //property (var/let)
    
// use intializer - method that gets called whenever class is instantiated (or used to make obj)
    init(topSpeed2: Int) {
        self.topSpeed = topSpeed2
        // self.topSeed refers to var topSpeed
    }
    func getTopSpeed () -> Int {
        return self.topSpeed
    }
    
}

var myCar = FastCar(topSpeed2: 220) // instance; that uses bp of class to create itself therefore it has all properties & functions inside that car
print(myCar.getTopSpeed()) // (.property)









