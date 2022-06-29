//
//  NewPolicyShowBreakup_Vc.swift
//  UniversalSompo
//
//  Created by Yogi Bhai Mac on 06/05/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class NewPolicyShowBreakup_Vc: UIViewController {

    @IBOutlet weak var netPremium_Txt   : UITextField!
    @IBOutlet weak var basicOd_Txt      : UITextField!
    @IBOutlet weak var basicTp_Txt      : UITextField!
    @IBOutlet weak var additional_Txt   : UITextField!
    @IBOutlet weak var addOn_Txt        : UITextField!
    @IBOutlet weak var gst_Txt          : UITextField!
    @IBOutlet weak var totalPremium_Txt : UITextField!
    @IBOutlet weak var close_Btn : UIButton!

    var newCase = String()
    //MARK: -  view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.retrieveData()
        let nn = newCase
        // Do any additional setup after loading the view.
    }
    //MARK: -  func for the corner radious
    func cornerRadious(){
        self.netPremium_Txt.layer.cornerRadius = 25
        self.basicOd_Txt.layer.cornerRadius = 25
        self.basicTp_Txt.layer.cornerRadius = 25
        self.additional_Txt.layer.cornerRadius = 25
        self.addOn_Txt.layer.cornerRadius = 25
        self.gst_Txt.layer.cornerRadius = 25
        self.totalPremium_Txt.layer.cornerRadius = 25
        self.close_Btn.layer.cornerRadius = 25
        self.borderWidth()
       }
    func borderWidth(){
        self.netPremium_Txt.layer.borderWidth = 0.5
        self.basicOd_Txt.layer.borderWidth = 0.5
        self.basicTp_Txt.layer.borderWidth = 0.5
        self.additional_Txt.layer.borderWidth = 0.5
        self.addOn_Txt.layer.borderWidth = 0.5
        self.gst_Txt.layer.borderWidth = 0.5
        self.totalPremium_Txt.layer.borderWidth = 0.5
        self.close_Btn.layer.borderWidth = 0.5
        self.netPremium_Txt.setLeftPaddingPoints(15)
        self.basicOd_Txt.setLeftPaddingPoints(15)
        self.basicTp_Txt.setLeftPaddingPoints(15)
        self.additional_Txt.setLeftPaddingPoints(15)
        self.addOn_Txt.setLeftPaddingPoints(15)
        self.gst_Txt.setLeftPaddingPoints(15)
        self.totalPremium_Txt.setLeftPaddingPoints(15)
        self.netPremium_Txt.isUserInteractionEnabled = false
        self.basicOd_Txt.isUserInteractionEnabled = false
        self.basicTp_Txt.isUserInteractionEnabled = false
        self.additional_Txt.isUserInteractionEnabled = false
        self.addOn_Txt.isUserInteractionEnabled = false
        self.gst_Txt.isUserInteractionEnabled = false
        self.totalPremium_Txt.isUserInteractionEnabled = false
    }
    //MARK: - func for the  retrieve data
    func retrieveData(){
        self.newCase =     UserDefaults.standard.string(forKey: "PolicyType")!
//        self.newCase =     UserDefaults.standard.string(forKey: "OLdPolicy")!
        if self.newCase == "New Policy"{
        self.gst_Txt.text = UserDefaults.standard.string(forKey: "GST")
        self.totalPremium_Txt.text = UserDefaults.standard.string(forKey: "totalPremium")
        self.basicOd_Txt.text = UserDefaults.standard.string(forKey: "basicOdAmount")
        self.basicTp_Txt.text = UserDefaults.standard.string(forKey: "basicTpAmount")
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "netPremium")
        }else if self.newCase == "Old Policy"{
        self.gst_Txt.text = UserDefaults.standard.string(forKey: "GST")
        self.totalPremium_Txt.text = UserDefaults.standard.string(forKey: "totalPremium")
        self.basicOd_Txt.text = UserDefaults.standard.string(forKey: "basicOdAmount")
        self.basicTp_Txt.text = UserDefaults.standard.string(forKey: "basicTpAmount")
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "netPremium")
        }else{
        self.gst_Txt.text = UserDefaults.standard.string(forKey: "GST")
        self.totalPremium_Txt.text = UserDefaults.standard.string(forKey: "totalPremium")
        self.basicOd_Txt.text = UserDefaults.standard.string(forKey: "basicOdAmount")
        self.basicTp_Txt.text = UserDefaults.standard.string(forKey: "basicTpAmount")
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "netPremium")
        }
    }

    @IBAction func closeAction(_ sender:UIButton){
        self.dismiss(animated: true)
    }
}
