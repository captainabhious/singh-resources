//
//  Weather.swift
//  whetherAnyWeather
//
//  Created by Abhi Singh on 10/6/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation
import UIKit

//class WeatherStatus {
//    private var temperature = 0.0
//    var conditions: WeatherCondition // enum WC
//
//    init()
//}

protocol WeatherDelegate {
   
    
    func weatherDidUpdate() -> String //WeatherCondition
    func pleaseExecuteDelegate(fromTheServer: String) -> String
}

class weatherService { // delegator & singleton
    static let sharedInstance = weatherService()
   
    var delegate: WeatherDelegate?
    private init () {}
    
 //   func getCurrentWeather() ->  {//WeatherCondition { //
    func thisFuncIsFromSGTON() -> String {
    
        let returnFromUiViewCall = delegate?.weatherDidUpdate()
        let anotherReturn = delegate?.pleaseExecuteDelegate(fromTheServer: "Parameter from server" )
        
        return anotherReturn! + " This is a msg from the server"
      //  let currentTemp = (currentTemperature: Double)
    
    }
    
}

/*
enum WeatherCondition {
    case sunny, cloudy, rainy, snowy, windy
}
*/

    
    // need
    
    //init the class

//instantiate class (create object), add +1 to private var temp and iterate w/ for loop i (1...100) put time in that iteration



