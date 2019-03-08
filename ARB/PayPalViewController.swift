//
//  PayPalViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 3/7/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class PayPalViewController: UIViewController {

    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var pfImage: UIImageView!
    @IBOutlet weak var cardNumberText: UITextField!
    @IBOutlet weak var augustText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var cvcText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Profile picture conner radious
         profileImage.layer.cornerRadius = profileImage.frame.size.width/2
         pfImage.layer.cornerRadius = pfImage.frame.size.width/2
        
        //Textfield boder color
         let myColor: UIColor = UIColor.gray
         cardNumberText.layer.borderColor = myColor.cgColor
         augustText.layer.borderColor = myColor.cgColor
         yearText.layer.borderColor = myColor.cgColor
         cvcText.layer.borderColor = myColor.cgColor
    }
    


}
