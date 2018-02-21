//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var numberOfLegs = [0, 1, 2, 3, 4, 5, 6]

for numberOfLeg in numberOfLegs {
    
    
    switch numberOfLeg {
    case 0:
        print("I'm a snake probably")
    case 2:
        print("I am a biped")
    case 4:
        print("I am a quadruped")
    case 6:
        print("I am an insect")
    case 8:
        print("I am a spider")
    case 100:
        print("I am a centipede")
    default:
        print("Run! An alien!")
    }
    
}

for i in (0...10) {
    //access numbers 0-10
    print(i)
    
// for i in stride(from: 0, through/to: 200, by: 10)
// print(i)
    
}



// Find EVEN numbers 0 - 100 

for i in (1...100) {
    if i % 2 == 0 {
        print("\(i) is an even number")
    } else {
        print("\(i) is an odd number")
    }
}


/*
Find PRIME numbers:
- pick a number, divide it by every number
    
for i in 4...100 {
    for j in 2..<i {
        if i % j != 0 {
            print(i)
        }
    }
        
}
*/


// CLOSURES:
// 3 things closures can do:

// EMPTY PARAMETERS
let daClosure: () -> Int = {return 5} // (closure that doesn't take any parameter)

print(daClosure())


//
let daClosure2: (String, Int) -> String = { // daClosure type (String) -> Int
  str, num1 in // in = keyword; everything left = parameters, right = instruction for code to be executed
    
    return "\(str) you did it \(num1)"
    
    }

print(daClosure2("Yo,", 1017))


//
let daClosure3: (String, Int) -> String = {
    
    return $0 + " you did it \($1)"
    // $0=String, $1=Int
    
}

print(daClosure3("Yo,", 1017))
//

func sum(x: Int, y: Int) -> Int {
    return x + y
}

print(sum(x: 6, y: 11))



// Write a func that takes a number represented as a String and converts it to an Int.



let horseName = " "
if horseName.isEmpty {
    print("I've been through the desert on a horse with no name.")
} else {
    print("Hi ho, \(horseName)!")
}
// Prints "Hi ho, Silver!")


// JSON

var usa = ["state" : "New York", "country" : "USA"]
print(usa.keys.first!)
print(Array(usa.keys)[1])

for (keys, values) in usa {
    print("the key: \(keys), the value: \(values)")
}

var JSON = [
    "first": [
        "state" : "Washington",
        "country" : "USA"
    ],
    "second": [
        "state" : "New York",
        "country" : "US"
    ]
]


//for key in JSON {
//    let kvalues = key.value
//    let vkvalues = kvalues.value
//    for (key, value) in vkvalues {
//        print(value)
//    }
//}


//JSONWeatherData
var JSONWeatherData = [
    "query": [
        "count": 1,
        "created": "2017-10-03T18:05:32Z",
        "lang": "en-us",
        "results": [
            "channel": [
                "units": [
                    "distance": "mi",
                    "pressure": "in",
                    "speed": "mph",
                    "temperature": "F"
                ],
                "title": "Yahoo! Weather - Nome, AK, US",
                "link": "http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/",
                "description": "Yahoo! Weather for Nome, AK, US",
                "language": "en-us",
                "lastBuildDate": "Tue, 03 Oct 2017 10:05 AM AKDT",
                "ttl": "60",
                "location": [
                    "city": "Nome",
                    "country": "United States",
                    "region": " AK"
                ],
                "wind": [
                    "chill": "37",
                    "direction": "338",
                    "speed": "11"
                ],
                "atmosphere": [
                    "humidity": "90",
                    "pressure": "1001.0",
                    "rising": "0",
                    "visibility": "15.5"
                ],
                "astronomy": [
                    "sunrise": "9:17 am",
                    "sunset": "8:23 pm"
                ],
                "image": [
                    "title": "Yahoo! Weather",
                    "width": "142",
                    "height": "18",
                    "link": "http://weather.yahoo.com",
                    "url": "http://l.yimg.com/a/i/brand/purplelogo//uh/us/news-wea.gif"
                ],
                "item": [
                    "title": "Conditions for Nome, AK, US at 09:00 AM AKDT",
                    "lat": "64.499474",
                    "long": "-165.405792",
                    "link": "http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/",
                    "pubDate": "Tue, 03 Oct 2017 09:00 AM AKDT",
                    "condition": [
                        "code": "26",
                        "date": "Tue, 03 Oct 2017 09:00 AM AKDT",
                        "temp": "42",
                        "text": "Cloudy"
                    ],
                    "forecast": [
                        [
                            "code": "12",
                            "date": "03 Oct 2017",
                            "day": "Tue",
                            "high": "44",
                            "low": "40",
                            "text": "Rain"
                        ],
                        [
                            "code": "39",
                            "date": "04 Oct 2017",
                            "day": "Wed",
                            "high": "44",
                            "low": "37",
                            "text": "Scattered Showers"
                        ],
                        [
                            "code": "11",
                            "date": "05 Oct 2017",
                            "day": "Thu",
                            "high": "45",
                            "low": "39",
                            "text": "Showers"
                        ],
                        [
                            "code": "28",
                            "date": "06 Oct 2017",
                            "day": "Fri",
                            "high": "44",
                            "low": "37",
                            "text": "Mostly Cloudy"
                        ],
                        [
                            "code": "26",
                            "date": "07 Oct 2017",
                            "day": "Sat",
                            "high": "41",
                            "low": "37",
                            "text": "Cloudy"
                        ],
                        [
                            "code": "28",
                            "date": "08 Oct 2017",
                            "day": "Sun",
                            "high": "39",
                            "low": "34",
                            "text": "Mostly Cloudy"
                        ],
                        [
                            "code": "12",
                            "date": "09 Oct 2017",
                            "day": "Mon",
                            "high": "41",
                            "low": "32",
                            "text": "Rain"
                        ],
                        [
                            "code": "11",
                            "date": "10 Oct 2017",
                            "day": "Tue",
                            "high": "43",
                            "low": "42",
                            "text": "Showers"
                        ],
                        [
                            "code": "26",
                            "date": "11 Oct 2017",
                            "day": "Wed",
                            "high": "42",
                            "low": "41",
                            "text": "Cloudy"
                        ],
                        [
                            "code": "23",
                            "date": "12 Oct 2017",
                            "day": "Thu",
                            "high": "42",
                            "low": "41",
                            "text": "Breezy"
                        ]
                    ],
                    "description": "<![CDATA[<img src=\"http://l.yimg.com/a/i/us/we/52/26.gif\"/>\n<BR />\n<b>Current Conditions:</b>\n<BR />Cloudy\n<BR />\n<BR />\n<b>Forecast:</b>\n<BR /> Tue - Rain. High: 44Low: 40\n<BR /> Wed - Scattered Showers. High: 44Low: 37\n<BR /> Thu - Showers. High: 45Low: 39\n<BR /> Fri - Mostly Cloudy. High: 44Low: 37\n<BR /> Sat - Cloudy. High: 41Low: 37\n<BR />\n<BR />\n<a href=\"http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/\">Full Forecast at Yahoo! Weather</a>\n<BR />\n<BR />\n<BR />\n]]>",
                    "guid": [
                        "isPermaLink": "false"
                    ]
                ]
            ]
        ]
    ]
]


let query = JSONWeatherData["query"]!
//print(query)
let results = query["results"] as! Dictionary<String, AnyObject>
//print(results)
let channel = results["channel"] as! Dictionary<String, AnyObject>
//print(channel)
let wind = channel["wind"] as! Dictionary<String, AnyObject>
//print(wind)
let chill = wind["chill"]!
print("The Wind Chill is: \(chill)")






