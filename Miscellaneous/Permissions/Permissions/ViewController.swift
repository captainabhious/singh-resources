//
//  ViewController.swift
//  Permissions
//
//  Created by Jonathan  Fotland on 10/25/17.
//  Copyright © 2017 Jonathan Fotland. All rights reserved.
//

import UIKit
import Photos
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //askForPhotoPermission()
    }

    func askForPhotoPermission() {
        PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
            switch authorizationStatus {
            case .authorized:
                print("authorized")
            case .denied:
                print("denied")
            case .notDetermined:
                print("not determined")
            case .restricted:
                print("resticted")
            }
        }
    }
    
    @IBAction func doPhotoThingsClicked(_ sender: Any) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            //Do photo work
            //PhotoPicker.getAThing()
            print("hi")
        default:
            //Cry
            print("Thanks for nothing, jerk")
        }
    }
    
    @IBAction func didClickPhotos(_ sender: Any) {
        
        let alert = UIAlertController.init(title: "Photos", message: "We need access to your photos!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            self.askForPhotoPermission()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        //askForPhotoPermission()
    }
    
    @IBAction func didClickMap(_ sender: Any) {
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

