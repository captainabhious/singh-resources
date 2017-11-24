//
//  ViewController.swift
//  PlatformTest
//
//  Created by Abhi Singh on 11/2/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        MyTestModel.sharedInstance.data = sender.text
        let defaults = UserDefaults(suiteName: "group.zsoadfj.platformTesting")
        defaults?.set(sender.text, forKey: "text")
    }   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

