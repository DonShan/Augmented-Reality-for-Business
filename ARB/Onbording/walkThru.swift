
//  walkThru.swift
//  ARB
//
//  Created by Madushan Senavirathna on 2/1/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.


import UIKit

class walkThru: UIPageViewController, UIPageViewControllerDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()

        let pageTitle = ["TIME SAVING", "Automatic location", "FIND OUT VERY EASILY"]
        let pageDiscription = ["Now Simply and Make Interactive Time Saving With AR", "LOCATION BASE SCANING", "DISCOVER AND FIND OUT WITH AR"]
        let pageImages = ["1", "2", "3"]

        var currentIndex = 0

        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            var index = (viewController as! walkThru).index
            index -= 1

            return contentViewController(at: index)
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            var index = (viewController as! walkThru).index
            index += 1

            return contentViewController(at: index)
        }


        func contentViewController(at index: Int) -> walkThru?{
            if index < 0 || index >= pageTitle.count{
                return nil
            }

            //Create new view controller and pass the sutable data
            let storybord = UIStoryboard(name: "onbording", bundle: nil)
            if let pageContentViewController = storybord.instantiateInitialViewController(withIdentifier: walkThru) as?
            walkThru {
                pageContentViewController.pageImages =  imageFile[index]
                 pageContentViewController.pageTitle = titlebar[index]
                pageContentViewController.pageDiscription =  description[index]
                 pageContentViewController.index = index

                return pageContentViewController

            }
            return nil
        }

}
