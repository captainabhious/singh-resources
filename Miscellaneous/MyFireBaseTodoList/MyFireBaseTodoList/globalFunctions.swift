//
//  globalFunctions.swift
//  MyFireBaseTodoList
//
//  Created by Tennyson Pinheiro on 10/24/17.
//  Copyright © 2017 Tennyson Pinheiro. All rights reserved.
//

import Foundation

protocol alertSignON {
    func alertSucess()
    func alertFailure()
    func alertSignOff()
}

class AlertsSignOnSGLTon {
    static let sharedInstance = AlertsSignOnSGLTon()
    var delegate: alertSignON?
    private init() {}
    
    func signedInAlert() {
        delegate?.alertSucess()
    }
    func signedOutAlert() {
        delegate?.alertSignOff()
    }
    func signedInFailureAlert() {
        delegate?.alertFailure()
    }
}
