//
//  PayPalViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 3/7/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import IQDropDownTextField


class PayPalViewController: UIViewController {

    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var pfImage: UIImageView!
    @IBOutlet weak var cardNumberText: UITextField!
    @IBOutlet weak var augustText: IQDropDownTextField!
    @IBOutlet weak var yearText: IQDropDownTextField!
    

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
        
        //Add picker view
        augustText.isOptionalDropDown = false
        augustText.itemList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "programmer", "Octomber", "November", "December"]
        
        yearText.isOptionalDropDown = false
        yearText.itemList = ["2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030"]
    }
    


}
