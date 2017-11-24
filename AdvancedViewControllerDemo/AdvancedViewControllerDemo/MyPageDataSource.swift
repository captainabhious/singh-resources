//
//  MyPageDataSource.swift
//  AdvancedViewControllerDemo
//
//  Created by Jonathan  Fotland on 10/23/17.
//  Copyright © 2017 Jonathan Fotland. All rights reserved.
//

import Foundation
import UIKit

class MyPageDataSource : NSObject, UIPageViewControllerDataSource {
    
    var myViewControllers: [UIViewController]
    
    override init() {
        
        let blueController = UIViewController()
        blueController.view.backgroundColor = UIColor.blue
        
        let greenController = UIViewController()
        greenController.view.backgroundColor = UIColor.green
        
        myViewControllers = [blueController, greenController]
        super.init()
    }
    
    func startingViewController() -> UIViewController {
        return myViewControllers[0]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("Hello!")
        if viewController == myViewControllers[0] {
            return myViewControllers[1]
        } else {
            return myViewControllers[0]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("Goodbye!")
        if viewController == myViewControllers[0] {
            return myViewControllers[1]
        } else {
            return myViewControllers[0]
        }
    }
    
}
