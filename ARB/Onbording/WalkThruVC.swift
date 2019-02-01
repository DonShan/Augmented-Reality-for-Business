//
//  WalkThruVC.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/30/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.


import UIKit

class WalkThruVC: UIViewController, UIPageViewControllerDataSource{

    let pageTitle = ["TIME SAVING", "Automatic location", "FIND OUT VERY EASILY"]
    let pageDiscription = ["Now Simply and Make Interactive Time Saving With AR", "LOCATION BASE SCANING", "DISCOVER AND FIND OUT WITH AR"]
    let pageImages = ["1", "2", "3"]

    var currentIndex = 0

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThruVC).index
        index -= 1

        return contentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThruVC).index
        index += 1

        return contentViewController(at: index)
    }

    func contentViewController(at index: Int) -> WalkThruVC?{
        if index < 0 || index >= pageDiscription.count{
            return nil
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // need to do eny aditional setup after loading the view


    }




}
