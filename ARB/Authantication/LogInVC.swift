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
        
         //activity indicator show method
         objAJProgressView.show()
        
        Auth.auth().signIn(withEmail: logInEmail.text!, password: logInPassword.text!) { (user, error) in
            
            //activity indicator when the sync is succcess it will show and hide
            self.objAJProgressView.hide()
            
            if error == nil{
                
               self.performSegue(withIdentifier: "loginToHome", sender: self)
                print("log in success.================================================>")
                //root view controller pass
                
                
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
    

