//
//  MyPageViewController.swift
//  AdvancedViewControllerDemo
//
//  Created by Jonathan  Fotland on 10/23/17.
//  Copyright © 2017 Jonathan Fotland. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var myViewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let myDataSource =
        
        let blueController = UIViewController()
        blueController.view.backgroundColor = UIColor.blue
        
        let greenController = UIViewController()
        greenController.view.backgroundColor = UIColor.green
        
        myViewControllers = [blueController, greenController]
        
        dataSource = self
        
        //print(dataSource)
        
        //let startingViewController = (dataSource as! MyPageDataSource).startingViewController()
        
        setViewControllers([blueController], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
