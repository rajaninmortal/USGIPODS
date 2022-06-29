//
//  ArogyaSanjeevaniShowBreakup_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 03/03/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class ArogyaSanjeevaniShowBreakup_Vc: UIViewController {
    @IBOutlet weak var main_View : UIView!
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var netPremium_Txt : UITextField!
    @IBOutlet weak var loyalty_Txt : UITextField!
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
        self.netPremium_Txt.text =  UserDefaults.standard.string(forKey: "netPremiumm")!
        self.totalPremium_Txt.text =   UserDefaults.standard.string(forKey: "totalAmount")
        self.gST_Txt.text = UserDefaults.standard.string(forKey: "gstValue")!
        self.loyalty_Txt.text = UserDefaults.standard.string(forKey: "loyaltyDiscount")
    }
    //MARK: - func for the corner radious
    func cornerRadious(){
        self.closeBtn.layer.cornerRadius = 20
        self.netPremium_Txt.layer.cornerRadius = 20
        self.loyalty_Txt.layer.cornerRadius = 20
        self.gST_Txt.layer.cornerRadius = 20
        self.totalPremium_Txt.layer.cornerRadius = 20
        self.totalPremium_Txt.setLeftPaddingPoints(15)
        self.netPremium_Txt.setLeftPaddingPoints(15)
        self.gST_Txt.setLeftPaddingPoints(15)
        self.loyalty_Txt.setLeftPaddingPoints(15)
         }
    //MARK: -  func for  the borderWidth
    func borderWidth(){
        self.closeBtn.layer.borderWidth = 0.5
        self.netPremium_Txt.layer.borderWidth = 0.5
        self.loyalty_Txt.layer.borderWidth = 0.5
        self.gST_Txt.layer.borderWidth = 0.5
        self.totalPremium_Txt.layer.borderWidth = 0.5
        self.desableTxtField()
    }
//MARK: - func for the desable the textfield
    func desableTxtField (){
        self.netPremium_Txt.isUserInteractionEnabled = false
        self.loyalty_Txt.isUserInteractionEnabled = false
        self.gST_Txt.isUserInteractionEnabled = false
        self.totalPremium_Txt.isUserInteractionEnabled = false
    }
    @IBAction func  closeAction(_ sender:UIButton){

        self.dismiss(animated: false, completion: nil)
    }
    
    
}

