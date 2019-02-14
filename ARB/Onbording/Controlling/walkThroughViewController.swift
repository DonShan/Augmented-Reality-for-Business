//
//  walkThroughViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 2/6/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class walkThroughViewController: UIViewController, WalkThroughPageViewControllerDelegate {

    //Mark : outlets
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var skipButton: UIButton!
    var WalkThroughPageViewController: WalkThroughPageViewController?
    
    @IBAction func skipButton(sender: UIButton) {
//         UserDefaults.standard.set(true, forKey: "ViewController")
//        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "skipButton", sender: self)
    }
    
    @IBAction func nectButtonTapped(sender: UIButton){
        if let index = WalkThroughPageViewController?.currentIndex{
            switch index{
            case 0...1: WalkThroughPageViewController?.fowordPage()
            case 2:
//                UserDefaults.standard.set(true, forKey: "ViewController")
//                dismiss(animated: true, completion: nil)
                 self.performSegue(withIdentifier: "skipButton", sender: self)
            default: break
            }
        }
      updateUI()
    }
        func updateUI(){
            if let index = WalkThroughPageViewController?.currentIndex{
            switch index{
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                nextButton.isHidden = false
                
            case 2:
                nextButton.setTitle("GET START", for: .normal)
                nextButton.isHidden = false
            
            default: break
            }
                pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    // Mark - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Mark - Navigation
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destination = segue.destination
        if let pageViewController = destination as? WalkThroughPageViewController{
            WalkThroughPageViewController = pageViewController
            WalkThroughPageViewController?.walkthrougtDelegate = self
      }
    }
  }

