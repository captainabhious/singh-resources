//
//  alertsLessonUITests.swift
//  alertsLessonUITests
//
//  Created by Abhi Singh on 10/13/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import XCTest
@testable import alertsLesson // bringing in alertsLesson app

class alertsLessonUITests: XCTestCase {
 //   @testable import alertsLesson

var sut = ViewController() //testing this system of our app
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testMyAlert() {
        // Setup the UI Test for the Alert ButtonAlert
        // Programaticaly Launch the ViewController
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        
        // Programaticaly Launch the Root window
        UIApplication.shared.keyWindow?.rootViewController = sut
        
        // Programaticaly Click the Button
        sut.showAlert01(UIButton())
        
        // Test that the Alert Controller launched
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
        // Test tht the title in the Alert Controller is correct
        XCTAssertEqual(sut.presentedViewController?.title, "Network Issue")
    }
    
}
