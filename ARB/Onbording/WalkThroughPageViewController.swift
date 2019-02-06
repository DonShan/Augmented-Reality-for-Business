//
//  WalkThroughPageViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 2/6/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class WalkThroughPageViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    
    // mark - proprerties
    let pageTitle = ["TIME SAVING", "AUTOMATIC LOACTION", "FIND OUT VERY EASILY"]
    let pageDiscription = ["NOW SIMPLY AND MAKE INTERACTIVE TIME SAVING WITH AR", "LOCATION BASE SCANING", "DISCOVER AND FIND OUT WITH AR"]
    let pageImages = ["1", "2", "3"]
    
    var currentIndex = 0
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! OnbordingContainerVC).index
        index -= 1
        
        return contentViewController(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! OnbordingContainerVC).index
        index += 1
        
        return contentViewController(index: index)
    }
    
    func contentViewController(index: Int) -> OnbordingContainerVC? {
        if index < 0 || index >= pageTitle.count{
            return nil
        }
        
        //Create a new view controller and pass suitable data
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewControler = storybord.instantiateViewController(withIdentifier: "OnbordingContainerVC") as? OnbordingContainerVC{
            pageContentViewControler.imageFile = pageImages[index]
            pageContentViewControler.titlebar = pageTitle[index]
            pageContentViewControler.discription = pageDiscription[index]
            pageContentViewControler.index = index
            
            return pageContentViewControler
        }
        return nil
    }
    
    func fowordPage(){
        currentIndex += 1
        if let nextViewController = contentViewController(index: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the data source it self
        dataSource = self
        
        //Create first walk through screan
        if let StratingViewController = contentViewController(index: 0) {
            setViewControllers([StratingViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    

  

}
