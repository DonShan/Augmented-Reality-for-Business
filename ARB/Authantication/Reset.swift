//
//  Reset.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import FirebaseAuth

class Reset: UIViewController {

    let objAJProgressView = AJProgressView()
    
    @IBOutlet weak var resetEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        
        //activity indicator show method
        objAJProgressView.show()
        
        Auth.auth().sendPasswordReset(withEmail: resetEmail.text!) { error in
            
            //activity indicator when the sync is succcess it will show and hide
            self.objAJProgressView.hide()
            
            DispatchQueue.main.async {
                if self.resetEmail.text?.isEmpty==true || error != nil {
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                    
                    self.performSegue(withIdentifier: "toLogIn", sender: self)
                }
                if error == nil && self.resetEmail.text?.isEmpty==false{
                    let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                    resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetEmailAlertSent, animated: true, completion: nil)
     
    }
        
    }
}
}
}



