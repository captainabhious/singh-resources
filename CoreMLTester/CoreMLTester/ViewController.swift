//
//  ViewController.swift
//  CoreMLTester
//
//  Created by Abhi Singh on 11/15/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.

/*
Directions:
- first start up camera on device to begin analyzing images (import AVKit)
 

*/

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // START UP CAMERA HERE:
        
        // instantiate AVCaptureSession object to perform a real-time or offline capture
        let captureSession = AVCaptureSession()
        
        // capture device provides input data for capture sesh obj
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return} // accesses back camera of iPhone
        // add appropriate inputs (like AVCaptureDeviceInput), & outputs (like AVCaptureMovieFileOutput)
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return} // try? b/c potential error if no camera on device
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
    }
    
    
}

