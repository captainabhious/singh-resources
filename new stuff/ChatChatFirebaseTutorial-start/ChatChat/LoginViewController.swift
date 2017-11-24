/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var bottomLayoutGuideConstraint: NSLayoutConstraint!
  
  // MARK: View Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  

    // to log in to chat, the app will need to authenticate using the Firebase authentication service
  @IBAction func loginDidTouch(_ sender: AnyObject) {
    // 1: check to confirm not !empty name field
    if nameField?.text != "" {
        // 2: use Firebase Auth API to anon sign-in. method takes a completion handler which is passed a user and, if needed, an error
        Auth.auth().signInAnonymously(completion: { (user, error) in
            // 3: in CH, check to see if you have any auth errors. if so, abort
            if let err = error {
                print("Error Here: \(err.localizedDescription)")
                return
            }
// if signInAnonymouslyWithCompletion: method completes without error, you can get the anonymous user's account data from the FIRUser object:
            if user!.isAnonymous {
                let uid = user!.uid
                print(uid)
            }
            // 4: finally, if no errors. trigger segue -> ChannelListViewController
            self.performSegue(withIdentifier: "LoginToChat", sender: nil)
        })
    }
  }
  
  // MARK: - Notifications
  
  func keyboardWillShowNotification(_ notification: Notification) {
    let keyboardEndFrame = ((notification as NSNotification).userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let convertedKeyboardEndFrame = view.convert(keyboardEndFrame, from: view.window)
    bottomLayoutGuideConstraint.constant = view.bounds.maxY - convertedKeyboardEndFrame.minY
  }
  
  func keyboardWillHideNotification(_ notification: Notification) {
    bottomLayoutGuideConstraint.constant = 48
  }
    
    // MARK: Navigation
    // best place to get senderDisplayName is here, where user first enters their name when they log in
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // 1: retrieve destination VC from segue & cast it to a UINavigationController
        let navVc = segue.destination as! UINavigationController
        // 2: Cast the first VC of UINavigationController to a ChannelListViewController
        let channelVc = navVc.viewControllers.first as! ChannelListViewController
        // 3: set the senderDisplayName in ChannelListViewController to the name provided in the nameField by the user
        channelVc.senderDisplayName = nameField?.text
    }
  
}

