//
//  File.swift
//  PlatformTest
//
//  Created by Abhi Singh on 11/2/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation




class MyTestModel {
    static let sharedInstance = MyTestModel()
    
    var data: String? = ""
    private init() {
        
    }
    
}
