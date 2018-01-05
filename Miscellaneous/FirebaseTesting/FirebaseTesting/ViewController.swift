//
//  ViewController.swift
//  FirebaseTesting
//
//  Created by Abhi Singh on 10/24/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {


    @IBOutlet weak var emailLoginField: UITextField!
    @IBOutlet weak var passwordLoginField: UITextField!
    @IBAction func signUpButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "New User", message: "Sign up", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
            Auth.auth().signIn(withEmail: self.emailLoginField.text!, password: self.passwordLoginField.text!)
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)

    }

    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
          // get user info
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                
            }
 
        }
        
        // sign up new user
        Auth.auth().createUser(withEmail: "randomemailguy@gmail.com", password: "123456789") { (user, error) in
            print(error)
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    
    
}

