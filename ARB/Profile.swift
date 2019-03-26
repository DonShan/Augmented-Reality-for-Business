//
//  Profile.swift
//  ARB
//
//  Created by Madushan Senavirathna on 3/9/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class Profile: UIViewController {

    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var pfImage: UIImageView!
    @IBOutlet weak var mainPfImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         profileImage.layer.cornerRadius = profileImage.frame.size.width/2
         pfImage.layer.cornerRadius = profileImage.frame.size.width/2
         mainPfImage.layer.cornerRadius = profileImage.frame.size.width/0.60

      
    }
    
    
    

  

}
