//
//  SignInVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftOverlays


class SignInVC: UIViewController {

    @IBOutlet weak var signInName: UITextField!
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signInBtn(_ sender: Any) {

        
            Auth.auth().createUser(withEmail:  signInEmail.text!, password: signInPassword.text!){ (user, error) in
                if error == nil {
              self.performSegue(withIdentifier: "signupToHome", sender: self)
                    
                    let text = "Please wait to log in"
                    self.showWaitOverlayWithText(text)
                    
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
