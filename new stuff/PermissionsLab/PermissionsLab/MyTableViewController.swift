//
//  MyTableViewController.swift
//  PermissionsLab
//
//  Created by Abhi Singh on 10/25/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit
import Contacts

class MyTableViewController: UITableViewController {

    @IBOutlet var SubView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        customTextView.layer.borderWidth = 1.5
        //        customTextView.layer.borderColor = UIColor.white.cgColor
    }

    
    let contactManager = CNContactStore()
    


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
    
    
    
    

    

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
