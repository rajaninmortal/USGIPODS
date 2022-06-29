//
//  SuperHealthCareShowBreakup_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 08/03/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class SuperHealthCareShowBreakup_Vc: UIViewController {
    @IBOutlet weak var main_View : UIView!
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var netPremium_Txt : UITextField!
    @IBOutlet weak var pcIllness_Txt : UITextField!
    @IBOutlet weak var ppAccdent_Txt : UITextField!
    @IBOutlet weak var tHDiscount_Txt : UITextField!
    @IBOutlet weak var ePolicyDiscount_Txt : UITextField!
    @IBOutlet weak var gST_Txt : UITextField!
    @IBOutlet weak var totalPremium_Txt : UITextField!
    @IBOutlet weak var suminsured_Lbl: UITextField!
    @IBOutlet weak var deductible_Lbl: UITextField!
    
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
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "basicPRemium")!
        self.gST_Txt.text = UserDefaults.standard.string(forKey: "gstValue")!
        self.tHDiscount_Txt.text = UserDefaults.standard.string(forKey: "employeDiscount")
        self.ePolicyDiscount_Txt.text = UserDefaults.standard.string(forKey: "loyaltydiscount")
        self.tHDiscount_Txt.text = UserDefaults.standard.string(forKey: "tiredDiscount")
        self.pcIllness_Txt.text = UserDefaults.standard.string(forKey:"criticalTotal")
        self.ppAccdent_Txt.text = UserDefaults.standard.string(forKey: "personalAccidentTotal")
        self.ePolicyDiscount_Txt.text = UserDefaults.standard.string(forKey: "employeDiscount")
        self.totalPremium_Txt.text = UserDefaults.standard.string(forKey: "totalPRemium")!
        self.suminsured_Lbl.text = UserDefaults.standard.string(forKey: "suminsured")
        self.deductible_Lbl.text = UserDefaults.standard.string(forKey: "deductible")
    }
    //MARK: - func for the corner radious
    func cornerRadious(){
        self.closeBtn.layer.cornerRadius = 20
        self.netPremium_Txt.layer.cornerRadius = 20
        self.pcIllness_Txt.layer.cornerRadius = 20
        self.ppAccdent_Txt.layer.cornerRadius = 20
       
        self.tHDiscount_Txt.layer.cornerRadius = 20
        self.ePolicyDiscount_Txt.layer.cornerRadius = 20
        self.gST_Txt.layer.cornerRadius = 20
        self.totalPremium_Txt.layer.cornerRadius = 20
        self.suminsured_Lbl.layer.cornerRadius = 20
        self.deductible_Lbl.layer.cornerRadius = 20
        self.totalPremium_Txt.setLeftPaddingPoints(15)
        self.netPremium_Txt.setLeftPaddingPoints(15)
        self.gST_Txt.setLeftPaddingPoints(15)
        self.ePolicyDiscount_Txt.setLeftPaddingPoints(15)
        self.tHDiscount_Txt.setLeftPaddingPoints(15)
        self.suminsured_Lbl.setLeftPaddingPoints(15)
        self.deductible_Lbl.setLeftPaddingPoints(15)
        self.ppAccdent_Txt.setLeftPaddingPoints(15)
        self.pcIllness_Txt.setLeftPaddingPoints(15)
        self.deductible_Lbl
         }
    //MARK: -  func for  the borderWidth
    func borderWidth(){
        self.closeBtn.layer.borderWidth = 0.5
        self.netPremium_Txt.layer.borderWidth = 0.5
        self.pcIllness_Txt.layer.borderWidth = 0.5
        self.ppAccdent_Txt.layer.borderWidth = 0.5
      
        self.tHDiscount_Txt.layer.borderWidth = 0.5
        self.ePolicyDiscount_Txt.layer.borderWidth = 0.5
        self.gST_Txt.layer.borderWidth = 0.5
        self.totalPremium_Txt.layer.borderWidth = 0.5
       
        self.suminsured_Lbl.layer.borderWidth = 0.5
        self.deductible_Lbl.layer.borderWidth = 0.5
        self.desableTxtField()
    }
//MARK: - func for the desable the textfield
    func desableTxtField (){
        self.netPremium_Txt.isUserInteractionEnabled = false
        self.pcIllness_Txt.isUserInteractionEnabled = false
        self.ppAccdent_Txt.isUserInteractionEnabled = false
       
        self.tHDiscount_Txt.isUserInteractionEnabled = false
        self.ePolicyDiscount_Txt.isUserInteractionEnabled = false
        self.gST_Txt.isUserInteractionEnabled = false
        self.totalPremium_Txt.isUserInteractionEnabled = false
  
    }
    @IBAction func  closeAction(_ sender:UIButton){

        self.dismiss(animated: false, completion: nil)
    }
    
}
