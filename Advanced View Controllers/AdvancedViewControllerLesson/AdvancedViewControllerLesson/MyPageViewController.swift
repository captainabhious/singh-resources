//
//  MyPageViewController.swift
//  AdvancedViewControllerLesson
//
//  Created by Abhi Singh on 10/23/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let myDataSource = MyPageDataSource()
        
        dataSource = myDataSource
        
        
        let startingViewController = (dataSource as! MyPageDataSource).startingViewController()
        
        // initial view controller(s)
        // completion callback when done
        setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
