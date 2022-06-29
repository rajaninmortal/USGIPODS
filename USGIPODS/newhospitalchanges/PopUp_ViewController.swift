//
//  PopUp_ViewController.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class PopUp_ViewController: UIViewController {

    @IBOutlet weak var main_View : UIView!
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var netPremium_Txt : UITextField!
    @IBOutlet weak var pcIllness_Txt : UITextField!
    @IBOutlet weak var ppAccdent_Txt : UITextField!
    @IBOutlet weak var pHCash_Txt : UITextField!
    @IBOutlet weak var ltDiscount_Txt : UITextField!
    @IBOutlet weak var lifeSDiscount_Txt : UITextField!
    @IBOutlet weak var sLDiscount_Txt : UITextField!
    @IBOutlet weak var tHDiscount_Txt : UITextField!
    @IBOutlet weak var ePolicyDiscount_Txt : UITextField!
    @IBOutlet weak var gST_Txt : UITextField!
    @IBOutlet weak var totalPremium_Txt : UITextField!
   var netPremiumm = String()
   var totalAmount = String()
   var gstValue = String()
    var epolicyDis = String()
    var sublimitDisc = String()
    var tiredDiscount = String()
//    var personalAccidentTotal = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.borderWidth()
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "netPremiumm")
        self.totalPremium_Txt.text =   UserDefaults.standard.string(forKey: "totalAmount")
        self.gST_Txt.text = UserDefaults.standard.string(forKey: "gstValue")
        self.ePolicyDiscount_Txt.text = UserDefaults.standard.string(forKey: "epolicyDis")
        self.sLDiscount_Txt.text = UserDefaults.standard.string(forKey: "sublimitDiscount")
        self.tHDiscount_Txt.text = UserDefaults.standard.string(forKey: "tiredDiscount")
        self.pcIllness_Txt.text = UserDefaults.standard.string(forKey:"criticalTotal")
        self.ppAccdent_Txt.text = UserDefaults.standard.string(forKey: "personalAccidentTotal")
        self.pHCash_Txt.text =  UserDefaults.standard.string(forKey: "firChildTotal")
        self.lifeSDiscount_Txt.text = UserDefaults.standard.string( forKey: "lifestyleDiscount")
        self.ltDiscount_Txt.text = UserDefaults.standard.string(forKey: "longtermDis")
    }
    //MARK: - func for the corner radious
    func cornerRadious(){
        self.closeBtn.layer.cornerRadius = 20
        self.netPremium_Txt.layer.cornerRadius = 20
        self.pcIllness_Txt.layer.cornerRadius = 20
        self.ppAccdent_Txt.layer.cornerRadius = 20
        self.ltDiscount_Txt.layer.cornerRadius = 20
        self.lifeSDiscount_Txt.layer.cornerRadius = 20
        self.sLDiscount_Txt.layer.cornerRadius = 20
        self.tHDiscount_Txt.layer.cornerRadius = 20
        self.ePolicyDiscount_Txt.layer.cornerRadius = 20
        self.gST_Txt.layer.cornerRadius = 20
        self.totalPremium_Txt.layer.cornerRadius = 20
        self.pHCash_Txt.layer.cornerRadius = 20
        self.totalPremium_Txt.setLeftPaddingPoints(15)
        self.netPremium_Txt.setLeftPaddingPoints(15)
        self.gST_Txt.setLeftPaddingPoints(15)
        self.ePolicyDiscount_Txt.setLeftPaddingPoints(15)
        self.tHDiscount_Txt.setLeftPaddingPoints(15)
        self.sLDiscount_Txt.setLeftPaddingPoints(15)
        self.lifeSDiscount_Txt.setLeftPaddingPoints(15)
        self.ltDiscount_Txt.setLeftPaddingPoints(15)
        self.pHCash_Txt.setLeftPaddingPoints(15)
        self.ppAccdent_Txt.setLeftPaddingPoints(15)
        self.pcIllness_Txt.setLeftPaddingPoints(15)
         }
    //MARK: -  func for  the borderWidth
    func borderWidth(){
        self.closeBtn.layer.borderWidth = 0.5
        self.netPremium_Txt.layer.borderWidth = 0.5
        self.pcIllness_Txt.layer.borderWidth = 0.5
        self.ppAccdent_Txt.layer.borderWidth = 0.5
        self.ltDiscount_Txt.layer.borderWidth = 0.5
        self.lifeSDiscount_Txt.layer.borderWidth = 0.5
        self.sLDiscount_Txt.layer.borderWidth = 0.5
        self.tHDiscount_Txt.layer.borderWidth = 0.5
        self.ePolicyDiscount_Txt.layer.borderWidth = 0.5
        self.gST_Txt.layer.borderWidth = 0.5
        self.totalPremium_Txt.layer.borderWidth = 0.5
        self.pHCash_Txt.layer.borderWidth = 0.5
        self.desableTxtField()
    }
//MARK: - func for the desable the textfield
    func desableTxtField (){
        self.netPremium_Txt.isUserInteractionEnabled = false
        self.pcIllness_Txt.isUserInteractionEnabled = false
        self.ppAccdent_Txt.isUserInteractionEnabled = false
        self.ltDiscount_Txt.isUserInteractionEnabled = false
        self.lifeSDiscount_Txt.isUserInteractionEnabled = false
        self.sLDiscount_Txt.isUserInteractionEnabled = false
        self.tHDiscount_Txt.isUserInteractionEnabled = false
        self.ePolicyDiscount_Txt.isUserInteractionEnabled = false
        self.gST_Txt.isUserInteractionEnabled = false
        self.totalPremium_Txt.isUserInteractionEnabled = false
        self.pHCash_Txt.isUserInteractionEnabled = false
    }
    @IBAction func  closeAction(_ sender:UIButton){

        self.dismiss(animated: false, completion: nil)
    }
    
    
}
