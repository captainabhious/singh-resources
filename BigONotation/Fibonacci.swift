//
//  Fibonacci.swift
//  BigONotation
//
//  Created by Abhi Singh on 11/20/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation

protocol Fibonacci {
    
    func fibonacci(at position: Int) -> Int
}

class RecursiveFibonacci: Fibonacci {
    func fibonacci(at position: Int) -> Int {
        
        if position == 0 {
            return 0
        }
        if position == 1 {
            return 1
        }

        return fibonacci(at: position - 1) + fibonacci(at: position - 2)
    }

}

class IterativeFibonacci: Fibonacci {
    
    var storageArray = [0, 1]
    
    func fibonacci(at position: Int) -> Int {
        
        for (index, value) in storageArray.enumerated() {
            
        }
        
        
    }
    

        
        
    
}



