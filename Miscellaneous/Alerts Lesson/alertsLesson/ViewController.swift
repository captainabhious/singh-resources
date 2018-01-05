//
//  ViewController.swift
//  alertsLesson
//
//  Created by Abhi Singh on 10/13/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert01(_ sender: Any) {
        print("hello world")
        
        let alertController = UIAlertController(title: "Warnng, Warning",
                                                message: "Danger Will Robinson",
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: nil))
        alertController.addAction(UIAlertAction(title: "NOT OK...HELP",
                                                style: .default,
                                                handler: nil))
        present(alertController, animated: true, completion: nil)
        
        
        
       
        /*
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .actionSheet) //.alert
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Help me", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil) // presenting alert itself as a subclass of UIView
         */
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

