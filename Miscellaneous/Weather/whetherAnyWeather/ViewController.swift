//
//  ViewController.swift
//  whetherAnyWeather
//
//  Created by Abhi Singh on 10/6/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherDelegate {
    
    
    func pleaseExecuteDelegate(fromTheServer: String) -> String {
        
                print(fromTheServer) // indepath.row
                return " My info up to the server" // the cell
        
                //
    }
    
    
    
    
    func weatherDidUpdate() -> String {
        return "This is a text coming from the UIVIEW"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService.sharedInstance.delegate = self
        let myreturn = weatherService.sharedInstance.thisFuncIsFromSGTON()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
