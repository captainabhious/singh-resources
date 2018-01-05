//
//  ViewController.swift
//  MyFireBaseTodoList
//
//  Created by Tennyson Pinheiro on 10/24/17.
//  Copyright © 2017 Tennyson Pinheiro. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
//import FirebaseAuth

class ViewController: UIViewController, GIDSignInUIDelegate, alertSignON {
    
    
    func alertSucess() {
        let alertController = UIAlertController(title: "Logged in", message: "User logged sucessfully", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertFailure() {
        
    }
    
    func alertSignOff() {
        let alertController = UIAlertController(title: "Logged out", message: "User logged outsucessfully", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

  var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var signOutStd: UIButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        AlertsSignOnSGLTon.sharedInstance.delegate = self
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        signInButton.style = .wide
        
        handle = Auth.auth().addStateDidChangeListener {(auth,user) in
        }
    }
    

    @IBAction func signOutSTD(_ sender: UIButton) {
        
        
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        /*
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Goodbye!")
        } catch let signOutError as Error {
            print ("Error signing out: %@", signOutError)
        }
        */
        
        //That's the code!!
        GIDSignIn.sharedInstance().signOut()
        AlertsSignOnSGLTon.sharedInstance.signedOutAlert()
    }
    
    func signUPSuccessfully() {
        let alertControl = UIAlertController(title: "User signed in", message: "successfully", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alertControl.addAction(alertAction)
        
        self.present(alertControl, animated: true, completion: nil)
    }
    
    @IBAction func loginHit(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if let user = user {
                if error == nil {
                    print(user, user.uid, user.email ?? "none")
                    let alertController = UIAlertController(title: "Logged in", message: "User logged sucessfully", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func Create(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            //print(error)
            //..
            
            if error == nil {
                let alertController = UIAlertController(title: "Create", message: "User created sucessfully", preferredStyle: UIAlertControllerStyle.alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(alertAction)
                
                self.present(alertController, animated: true, completion: nil)

            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
 
    }

    override func viewWillDisappear(_ animated: Bool) {
       Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// sign in with a user
//        Auth.auth().signIn(withEmail: "333@google.com", password: "666666") { (user, error) in


/* creates a user
 Auth.auth().createUser(withEmail: "333@google.com", password: "666666") { (user, error) in
 print(error)
 //..
 }
 */
