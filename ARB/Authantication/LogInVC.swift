//
//  LogInVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftOverlays

class LogInVC: UIViewController {
    
     let objAJProgressView = AJProgressView()

    @IBOutlet weak var logInEmail: UITextField!
    @IBOutlet weak var logInPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInBtn(_ sender: Any) {
        
//        let text = "Please wait to log in"
//        self.showWaitOverlayWithText(text)
        
        objAJProgressView.show()
        
        Auth.auth().signIn(withEmail: logInEmail.text!, password: logInPassword.text!) { (user, error) in
            
//            self.removeAllOverlays()
            
            self.objAJProgressView.hide()
            
            if error == nil{
                
               self.performSegue(withIdentifier: "loginToHome", sender: self)
                print("log in success.================================================>")
                
                
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
    

