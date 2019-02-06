//
//  OnbordingContainerVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class OnbordingContainerVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!{
        didSet {
            titleLabel.numberOfLines = 0
    }
}
    
    @IBOutlet var discriptionLabel: UILabel!{
        didSet {
            discriptionLabel.numberOfLines = 3
        }
    }
    
    @IBOutlet var imageView: UIImageView!
        
        var index = 0
        var titlebar = ""
        var discription = ""
        var imageFile = ""
        
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titlebar 
        discriptionLabel.text = discription
        imageView.image = UIImage(named: imageFile)

    }
    
}

