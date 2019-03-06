//
//  SignInVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

//import SwiftOverlays

class SignInVC: UIViewController, GIDSignInUIDelegate{
    
    let objAJProgressView = AJProgressView()

    @IBOutlet weak var signInName: UITextField!
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    
    @IBOutlet var googleLoginButton: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        googleLoginButton.style = .wide
        

        
    }
    
    @IBAction func signInBtn(_ sender: Any) {
      
                //activity indicator show method
                objAJProgressView.show()
       
            Auth.auth().createUser(withEmail:  signInEmail.text!, password: signInPassword.text!){ (user, error) in
                
                //activity indicator when the sync is succcess it will show and hide
                self.objAJProgressView.hide()
                
                if error == nil {
                    
              self.performSegue(withIdentifier: "signupToHome", sender: self)
                    print("Sign in in success.! =======================================>")
                    
                   
                    
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
}
