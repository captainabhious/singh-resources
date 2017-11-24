//
//  ViewController.swift
//  PermissionsLab
//
//  Created by Abhi Singh on 10/25/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    
    @IBOutlet weak var customTextView: UITextView!
    
    let contactManager = CNContactStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        customTextView.layer.borderWidth = 1.5
        customTextView.layer.borderColor = UIColor.white.cgColor
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    class func authorizationStatus(for entityType: CNEntityType) -> CNAuthorizationStatus {
//        return
//    }

    
    let authStatus = CNContactStore.authorizationStatus(for: .contacts)


    
    
    func authorizeContactsPermission() {
//
//        switch authStatus {
//        case .authorized:
//        case .denied:
//        case .notDetermined:
//
//        }
        
            contactManager.requestAccess(for: .contacts) { (bool, error) in
                guard error == nil else {return}
                if bool {
                    print("contacts authorized")
                }
                else {
                    print(" contacts denied")
                }
            }
        }


//
//func checkAuthorization() {
//
//    let authStatus = CNContactStore.authorizationStatus(for: .contacts)
//    switch authStatus {
//        case .authorized:
//        case .denied:
//        case .notDetermined:
//    }
//
//
//}
    
//    func checkCamera() {
//        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
//        switch authStatus {
//        case .authorized: callCamera() // Do your stuff here i.e. callCameraMethod()
//        case .denied: alertToEncourageCameraAccessInitially()
//        case .notDetermined: alertPromptToAllowCameraAccessViaSetting()
//        default: alertToEncourageCameraAccessInitially()
//        }
//    }
////    func authorizationStatus() {
//        CNContactStore.authorizationStatus(for: <#T##CNEntityType#>)
//        print(CNContactStore.authorizationStatus(for: .contacts))
//    }
    
    
    
    
    
    @IBAction func accessButtonWasClicked(_ sender: UIButton) {
        switch authStatus {
 //       case .authorized: accessButtonWasClicked.(sender: self)
        case .denied: UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
            
        case .notDetermined:
        let alert = UIAlertController.init(title: "Contacts", message: "In order to show your contacts, we need your permission! 🙏🏽", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nah", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Sure thang", style: .default, handler: {(action) in
            self.authorizeContactsPermission()
        }))
        self.present(alert, animated: true, completion: nil)
            
        default: print("shit")
        }
        

        
    }
    
    


}


