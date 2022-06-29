//
//  HealthInsuranceRenewalViewController.swift
//  UniversalSompo
//
//  Created by Subesh on 08/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import UIKit

class HealthInsuranceRenewalViewController: UIViewController {
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var renewBtn: UIButton!
    @IBOutlet weak var policynumber: UITextField!
    
    @IBOutlet weak var selct2: UITextField!
    @IBOutlet weak var select1: UITextField!
    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var recalc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
        self.borderWidth()
        self.borderColor()
        self.textPadding()
    }
    func cornerRadius(){
        self.date.layer.cornerRadius = 25
        self.renewBtn.layer.cornerRadius = 25
        self.policynumber.layer.cornerRadius = 25
        self.selct2.layer.cornerRadius = 25
        self.select1.layer.cornerRadius = 25
        self.payBtn.layer.cornerRadius = 25
        self.recalc.layer.cornerRadius = 25
        
        
    }
    func borderWidth(){
        self.date.layer.borderWidth = 0.5
        self.policynumber.layer.borderWidth = 0.5
        self.selct2.layer.borderWidth = 0.5
        self.select1.layer.borderWidth = 0.5
    
    }
    func borderColor(){
//        self.date.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1).cgColor
//        self.policynumber.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1).cgColor
//        self.selct2.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1).cgColor
//        self.select1.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1).cgColor
    }
    func textPadding(){
        self.date.setLeftPaddingPoints(15)
        self.policynumber.setLeftPaddingPoints(15)
        self.selct2.setLeftPaddingPoints(15)
        self.select1.setLeftPaddingPoints(15)
        self.date.setRightPaddingPoints(15)
        self.policynumber.setRightPaddingPoints(15)
        self.selct2.setRightPaddingPoints(15)
        self.select1.setRightPaddingPoints(15)
        
    }
}
