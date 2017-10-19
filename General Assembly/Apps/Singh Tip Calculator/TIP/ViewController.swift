//
//  ViewController.swift
//  TIP
//
//  Created by Abhi Singh on 9/25/17.
//  Copyright © 2017 Captain Abhious. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var txtBillAmt: UITextField!
    @IBOutlet weak var txtTipPer: UITextField!
    @IBOutlet weak var lblTotalAmt: UILabel!
    @IBOutlet weak var lblTipAmt: UILabel!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCalPress(_ sender: Any) {
    
    let tipPer = Double(txtTipPer.text!)
    let billAmt = Double(txtBillAmt.text!)
    let tipAmt = billAmt! * tipPer!/100
    let totalPay = tipAmt + billAmt!
    let totalPayFormatted = Double(totalPay * 100)/100
    
    lblTotalAmt.text = "Your total bill: $\(totalPayFormatted)"
    lblTipAmt.text = "Your tip: $\(tipAmt) "

    
        
        
    }
    
    


}

