//
//  SignInVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import FirebaseAuth
//import SwiftOverlays



class SignInVC: UIViewController {
    
    let objAJProgressView = AJProgressView()

    @IBOutlet weak var signInName: UITextField!
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
//        let text = "Please wait to log in"
//        self.showWaitOverlayWithText(text)
        objAJProgressView.show()
       
        
            Auth.auth().createUser(withEmail:  signInEmail.text!, password: signInPassword.text!){ (user, error) in
                
                self.objAJProgressView.hide()
//               self.removeAllOverlays()
                
                if error == nil {
                    
              self.performSegue(withIdentifier: "signupToHome", sender: self)
                    print("Log in success.! =======================================>")
                    
                   
                    
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
