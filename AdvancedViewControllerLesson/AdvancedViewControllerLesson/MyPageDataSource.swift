//
//  MyPageDataSource.swift
//  AdvancedViewControllerLesson
//
//  Created by Abhi Singh on 10/23/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation
import UIKit

class MyPageDataSource: NSObject, UIPageViewControllerDataSource {
    
    var myViewControllers: [UIViewController]
    
    override init() {
        let blueController = UIViewController()
        blueController.view.backgroundColor = UIColor.blue
        
        let greenController = UIViewController()
        blueController.view.backgroundColor = UIColor.green
        
        myViewControllers = [blueController, greenController]
        
    }
    
    func startingViewController() -> UIViewController {
        return myViewControllers
    }
    
    //
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewController == myViewControllers[0] {
            return myViewControllers[1]
        } else {
         return myViewControllers[0]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == myViewControllers[0] {
            return myViewControllers[1]
        } else {
            return myViewControllers[0]
        }
    }
    
    
    
}

