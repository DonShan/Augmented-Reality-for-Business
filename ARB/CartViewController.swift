//
//  CartViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 3/7/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var pfImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

         profileImage.layer.cornerRadius = profileImage.frame.size.width/2
         pfImage.layer.cornerRadius = pfImage.frame.size.width/2
    }
    

 

}
