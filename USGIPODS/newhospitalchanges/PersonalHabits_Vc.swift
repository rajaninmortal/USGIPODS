//
//  PersonalHabits_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
var nameArr = [String]()


class PersonalHabits_Vc: UIViewController {
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var policy_Txt: UITextField!
    @IBOutlet var family_Txt: UITextField!
    @IBOutlet var suminsure_Txt: UITextField!
    @IBOutlet var policytenure_Txt: UITextField!
    @IBOutlet var totalAmount_Txt : UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet var quotationId_Txt: UITextField!
    @IBOutlet weak var fAAlcohalBtn: UIButton!
    @IBOutlet weak var fAAlcohal_Txt: UITextField!
    @IBOutlet weak var fAAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var fAAlCohalName_Lbl: UILabel!
    @IBOutlet weak var sAAlcohalBtn: UIButton!
    @IBOutlet weak var sAAlcohal_Txt: UITextField!
    @IBOutlet weak var sAAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var sAAlCohalName_Lbl: UILabel!
    @IBOutlet weak var fCAlcohalBtn: UIButton!
    @IBOutlet weak var fCAlcohal_Txt: UITextField!
    @IBOutlet weak var fCAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var fCAlCohalName_Lbl: UILabel!
    @IBOutlet weak var sCAlcohalBtn: UIButton!
    @IBOutlet weak var sCAlcohal_Txt: UITextField!
    @IBOutlet weak var sCAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var sCAlCohalName_Lbl: UILabel!
    @IBOutlet weak var tCAlcohalBtn: UIButton!
    @IBOutlet weak var tCAlcohal_Txt: UITextField!
    @IBOutlet weak var tCAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var tCAlCohalName_Lbl: UILabel!
    @IBOutlet weak var frCAlcohalBtn: UIButton!
    @IBOutlet weak var frCAlcohal_Txt: UITextField!
    @IBOutlet weak var frCAlcohalNsTxt: NSLayoutConstraint!
    @IBOutlet weak var frCAlCohalName_Lbl: UILabel!
    @IBOutlet weak var fATobbacoBtn: UIButton!
    @IBOutlet weak var fATobbaco_Txt: UITextField!
    @IBOutlet weak var fATobbacoNsTxt: NSLayoutConstraint!
    @IBOutlet weak var fATobbacoName_Lbl: UILabel!
    @IBOutlet weak var sATobbacoBtn: UIButton!
    @IBOutlet weak var sATobbaco_Txt: UITextField!
    @IBOutlet weak var sATobbacoNsTxt: NSLayoutConstraint!
    @IBOutlet weak var sATobbacoName_Lbl: UILabel!
    @IBOutlet weak var fCTobbacoBtn: UIButton!
    @IBOutlet weak var fCTobbaco_Txt: UITextField!
    @IBOutlet weak var fCTobbacoNsTxt: NSLayoutConstraint!
    @IBOutlet weak var fCTobbacoName_Lbl: UILabel!
    @IBOutlet weak var sCTobbacoBtn: UIButton!
    @IBOutlet weak var sCTobbaco_Txt: UITextField!
    @IBOutlet weak var sCTobbacoNsTxt: NSLayoutConstraint!
    @IBOutlet weak var sCTobbacoName_Lbl: UILabel!
    @IBOutlet weak var tCTobbacoBtn: UIButton!
    @IBOutlet weak var tCTobbaco_Txt: UITextField!
    @IBOutlet weak var tCTobbacoNsTxt: NSLayoutConstraint!
    @IBOutlet weak var tCTobbacoName_Lbl: UILabel!
    @IBOutlet weak var frCTobbacolBtn: UIButton!
    @IBOutlet weak var frCTobbacol_Txt: UITextField!
    @IBOutlet weak var frCTobbacolNsTxt: NSLayoutConstraint!
    @IBOutlet weak var frCTobbacolName_Lbl: UILabel!
    @IBOutlet weak var fAAlcohal_View: UIView!
    @IBOutlet weak var fAAlcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var sAAlcohal_View: UIView!
    @IBOutlet weak var sAAlcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var fCAlcohal_View: UIView!
    @IBOutlet weak var fCAlcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var sCAlcohal_View: UIView!
    @IBOutlet weak var sCALcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var tCAlcohal_View: UIView!
    @IBOutlet weak var tCAlcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var frCAlcohal_View: UIView!
    @IBOutlet weak var frCAlcohalNs_View: NSLayoutConstraint!
    @IBOutlet weak var fATobbaco_View: UIView!
    @IBOutlet weak var fATobbacoNs_VIew: NSLayoutConstraint!
    @IBOutlet weak var sATobbaco_View: UIView!
    @IBOutlet weak var sATobbacoNs_View: NSLayoutConstraint!
    @IBOutlet weak var fCTobbaco_View: UIView!
    @IBOutlet weak var fCTobbacoNs_View: NSLayoutConstraint!
    @IBOutlet weak var sCTobbaco_View: UIView!
    @IBOutlet weak var sCTobbacoNs_View: NSLayoutConstraint!
    @IBOutlet weak var tCTobbaco_View: UIView!
    @IBOutlet weak var tCTobbacoNs_View: NSLayoutConstraint!
    @IBOutlet weak var frCTobbaco_View: UIView!
    @IBOutlet weak var frCTobbacoNs_View: NSLayoutConstraint!
    @IBOutlet weak var fCAlcohalDoubleNs: NSLayoutConstraint!
    @IBOutlet weak var bottm: NSLayoutConstraint!
    @IBOutlet weak var sCAlcohalDobleNs: NSLayoutConstraint!
    @IBOutlet weak var sCAlcohalDoubleeNs: NSLayoutConstraint!
    @IBOutlet weak var tCAlcohalDoubleNs: NSLayoutConstraint!
    @IBOutlet weak var tCAlcohalDoubleeNs: NSLayoutConstraint!
    @IBOutlet weak var frCAlcohalDoubleeNs: NSLayoutConstraint!
    @IBOutlet weak var frCAlcohalDoubleNs: NSLayoutConstraint!
    @IBOutlet weak var fATobbacoDoubleNs  : NSLayoutConstraint!
    @IBOutlet weak var fATobbacoDoubleeNs : NSLayoutConstraint!
    @IBOutlet weak var sCTobbacoDoubleNs  : NSLayoutConstraint!
    @IBOutlet weak var sCTobbacoDoubleeNs : NSLayoutConstraint!
    @IBOutlet weak var tCTobbacoDoubleNs  : NSLayoutConstraint!
    @IBOutlet weak var tCTobbacoDoubleeNs : NSLayoutConstraint!
    @IBOutlet weak var frCTobbacoDoubleeNs: NSLayoutConstraint!
    @IBOutlet weak var frTobbacoDoubleNs  : NSLayoutConstraint!
    @IBOutlet weak var Adjustable_View  : UIView!

    var titleBtn = String()
    var fAName = String()
    var sAName = String()
    var fCName = String()
    var sCName = String()
    var tCName = String()
    var frCName = String()
    var selectedIndex = 0
    
    let headerTitle = ["Alcohal Consumption(Quantity in ml)","Tobacco (Quantity in gm)"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleBtn = UserDefaults.standard.string(forKey: "family")!
        self.retrievData()
        print(nameArr, "check data")
        self.desableTxt()
        self.cornderRadious()
//        self.familyFloater()
    }
    //MARK: -  retrieve data from userdefaults
    func retrievData(){
        self.policy_Txt.text  = UserDefaults.standard.string(forKey: "policytype")!
        self.family_Txt.text  = UserDefaults.standard.string(forKey: "familytype")!
        self.suminsure_Txt.text  = UserDefaults.standard.string(forKey: "suminsured")!
        self.policytenure_Txt.text = UserDefaults.standard.string(forKey: "selectyear")!
        self.totalAmount_Txt.text = UserDefaults.standard.string(forKey: "totallPremium")!
        self.quotationId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")!
        if titleBtn == "1 Adult"{
            self.Adjustable_View.frame.size.height = 850
            self.sAAlcohal_View.isHidden = true
            self.sAAlcohalNs_View.constant = 0
            self.fCAlcohal_View.isHidden = true
            self.fCAlcohalNs_View.constant = 0
            self.sCAlcohal_View.isHidden = true
            self.sCALcohalNs_View.constant = 0
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = 0
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = true
            self.sATobbacoNs_View.constant = 0
            self.fCTobbaco_View.isHidden = true
            self.fCTobbacoNs_View.constant = 0
            self.sCTobbaco_View.isHidden = true
            self.sCTobbacoNs_View.constant = 0
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fCAlcohalDoubleNs.constant = 0
            self.bottm.constant = 0
            self.sCAlcohalDobleNs.constant = 0
            self.sCAlcohalDoubleeNs.constant = 0
            self.tCAlcohalDoubleNs.constant = 0
            self.tCAlcohalDoubleeNs.constant = 0
            self.fATobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleeNs.constant = 0
            self.sCTobbacoDoubleNs.constant = 0
            self.sCTobbacoDoubleeNs.constant = 0
            self.tCTobbacoDoubleNs.constant = 0
            self.tCTobbacoDoubleeNs.constant = 0
            self.frCTobbacoDoubleeNs.constant = 0
            self.frTobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleeNs.constant = 0
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
        }else if  titleBtn == "2 Adult"{
            self.Adjustable_View.frame.size
                .height = 950
            self.sAAlcohal_View.isHidden = false
            self.sAAlcohalNs_View.constant = 22
            self.fCAlcohal_View.isHidden = true
            self.fCAlcohalNs_View.constant = 0
            self.sCAlcohal_View.isHidden = true
            self.sCALcohalNs_View.constant = -10
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = -10
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = -10
            self.sATobbaco_View.isHidden = false
            self.sATobbacoNs_View.constant = 22
            self.fCTobbaco_View.isHidden = true
            self.fCTobbacoNs_View.constant = 0
            self.sCTobbaco_View.isHidden = true
            self.sCTobbacoNs_View.constant = 0
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fCAlcohalDoubleNs.constant = 0
            self.bottm.constant = 0
            self.sCAlcohalDobleNs.constant = 0
            self.sCAlcohalDoubleeNs.constant = 0
            self.tCAlcohalDoubleNs.constant = 0
            self.tCAlcohalDoubleeNs.constant = 0
            self.fATobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleeNs.constant = 0
            self.sCTobbacoDoubleNs.constant = 0
            self.sCTobbacoDoubleeNs.constant = 0
            self.tCTobbacoDoubleNs.constant = 0
            self.tCTobbacoDoubleeNs.constant = 0
            self.frCTobbacoDoubleeNs.constant = 0
            self.frTobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleNs.constant = 0
            self.fATobbacoDoubleeNs.constant = 0
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.sAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
            self.sATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
        }else if titleBtn == "1 Adult + 1 Child"{
            self.Adjustable_View.frame.size
                .height = 1000
            self.sAAlcohal_View.isHidden = true
            self.sAAlcohalNs_View.constant = 0
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = true
            self.sCALcohalNs_View.constant = 0
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = 0
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = true
            self.sATobbacoNs_View.constant = 0
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = true
            self.sCTobbacoNs_View.constant = 0
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
        }else if titleBtn == "1 Adult + 2 Child"{
            self.Adjustable_View.frame.size
                .height = 1200
            self.sAAlcohal_View.isHidden = true
            self.sAAlcohalNs_View.constant = 0
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = false
            self.sCALcohalNs_View.constant = 22
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = 0
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = true
            self.sATobbacoNs_View.constant = 0
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = false
            self.sCTobbacoNs_View.constant = 22
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
           self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
           self.sCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
           self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
          self.sCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
        }else if titleBtn == "1 Adult + 3 Child"{
            self.Adjustable_View.frame.size
                .height = 1350
            self.sAAlcohal_View.isHidden = true
            self.sAAlcohalNs_View.constant = 0
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = false
            self.sCALcohalNs_View.constant = 22
            self.tCAlcohal_View.isHidden = false
            self.tCAlcohalNs_View.constant = 22
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = true
            self.sATobbacoNs_View.constant = 0
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = false
            self.sCTobbacoNs_View.constant = 22
            self.tCTobbaco_View.isHidden = false
            self.tCTobbacoNs_View.constant = 22
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
            self.sCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
            self.tCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
            self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
            self.sCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
            self.tCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
        }else if titleBtn == "2 Adult + 1 Child"{
            self.Adjustable_View.frame.size
                .height = 1500
            self.sAAlcohal_View.isHidden = false
            self.sAAlcohalNs_View.constant = 22
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = true
            self.sCALcohalNs_View.constant = 0
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = 0
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = false
            self.sATobbacoNs_View.constant = 22
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = true
            self.sCTobbacoNs_View.constant = 0
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.sAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
            self.sATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
            self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
            self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
        }else if titleBtn == "2 Adult + 2 Child"{
            self.Adjustable_View.frame.size
                .height = 1650
            self.sAAlcohal_View.isHidden = false
            self.sAAlcohalNs_View.constant = 22
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = false
            self.sCALcohalNs_View.constant = 22
            self.tCAlcohal_View.isHidden = true
            self.tCAlcohalNs_View.constant = 0
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = false
            self.sATobbacoNs_View.constant = 22
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = false
            self.sCTobbacoNs_View.constant = 22
            self.tCTobbaco_View.isHidden = true
            self.tCTobbacoNs_View.constant = 0
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
           self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.sAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
           self.sATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
           self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
           self.sCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
           self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
           self.sCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
        }else if titleBtn == "2 Adult + 3 Child"{
            self.Adjustable_View.frame.size
                .height = 1800
            self.sAAlcohal_View.isHidden = false
            self.sAAlcohalNs_View.constant = 22
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = false
            self.sCALcohalNs_View.constant = 22
            self.tCAlcohal_View.isHidden = false
            self.tCAlcohalNs_View.constant = 22
            self.frCAlcohal_View.isHidden = true
            self.frCAlcohalNs_View.constant = 0
            self.sATobbaco_View.isHidden = false
            self.sATobbacoNs_View.constant = 22
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = false
            self.sCTobbacoNs_View.constant = 22
            self.tCTobbaco_View.isHidden = false
            self.tCTobbacoNs_View.constant = 22
            self.frCTobbaco_View.isHidden = true
            self.frCTobbacoNs_View.constant = 0
            self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
            self.sAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
            self.sATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
            self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
            self.sCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
            self.tCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
            self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
            self.sCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
            self.tCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
        }else if titleBtn == "2 Adult + 4 Child"{
            self.Adjustable_View.frame.size
                .height = 2000
            self.sAAlcohal_View.isHidden = false
            self.sAAlcohalNs_View.constant = 22
            self.fCAlcohal_View.isHidden = false
            self.fCAlcohalNs_View.constant = 22
            self.sCAlcohal_View.isHidden = false
            self.sCALcohalNs_View.constant = 22
            self.tCAlcohal_View.isHidden = false
            self.tCAlcohalNs_View.constant = 22
            self.frCAlcohal_View.isHidden = false
            self.frCAlcohalNs_View.constant = 22
            self.sATobbaco_View.isHidden = false
            self.sATobbacoNs_View.constant = 22
            self.fCTobbaco_View.isHidden = false
            self.fCTobbacoNs_View.constant = 22
            self.sCTobbaco_View.isHidden = false
            self.sCTobbacoNs_View.constant = 22
            self.tCTobbaco_View.isHidden = false
            self.tCTobbacoNs_View.constant = 22
            self.frCTobbaco_View.isHidden = false
            self.frCTobbacoNs_View.constant = 22
           self.fAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.fATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "fAName")!
           self.sAAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
           self.sATobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sAName")!
           self.fCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
           self.sCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
           self.tCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
           self.frCAlCohalName_Lbl.text = UserDefaults.standard.string(forKey: "frCName")!
           self.fCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "ofCName")!
           self.sCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "sCName")!
           self.tCTobbacoName_Lbl.text = UserDefaults.standard.string(forKey: "tCName")!
           self.frCTobbacolName_Lbl.text = UserDefaults.standard.string(forKey: "frCName")!
        }else{
            self.fAName = self.fAAlCohalName_Lbl.text ?? ""

        }
    }
    
    //MARK: - func for the cornerRadious
    func cornderRadious(){
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmount_Txt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.quotationId_Txt.layer.cornerRadius = 20
        
        self.fAAlcohal_Txt.layer.cornerRadius = 20
        self.sAAlcohal_Txt.layer.cornerRadius = 20
        self.fCAlcohal_Txt.layer.cornerRadius = 20
        self.sCAlcohal_Txt.layer.cornerRadius = 20
        self.tCAlcohal_Txt.layer.cornerRadius = 20
        self.frCAlcohal_Txt.layer.cornerRadius = 20
        self.fATobbaco_Txt.layer.cornerRadius = 20
        self.sATobbaco_Txt.layer.cornerRadius = 20
        self.fCTobbaco_Txt.layer.cornerRadius = 20
        self.sCTobbaco_Txt.layer.cornerRadius = 20
        self.tCTobbaco_Txt.layer.cornerRadius = 20
        self.frCTobbacol_Txt.layer.cornerRadius = 20
        
        
        self.quotationId_Txt.setLeftPaddingPoints(15)
        self.policy_Txt.setLeftPaddingPoints(15)
        self.family_Txt.setLeftPaddingPoints(15)
        self.suminsure_Txt.setLeftPaddingPoints(15)
        self.policytenure_Txt.setLeftPaddingPoints(15)
       self.totalAmount_Txt.setLeftPaddingPoints(15)
        self.borderRadious()
    }
    //MARK: - func for the borderRadious
    func borderRadious(){
        self.policytypeView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmount_Txt.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.quotationId_Txt.layer.borderWidth = 0.5
        self.fAAlcohal_Txt.layer.borderWidth = 0.5
        self.sAAlcohal_Txt.layer.borderWidth = 0.5
        self.fCAlcohal_Txt.layer.borderWidth = 0.5
        self.sCAlcohal_Txt.layer.borderWidth = 0.5
        self.tCAlcohal_Txt.layer.borderWidth = 0.5
        self.frCAlcohal_Txt.layer.borderWidth = 0.5
        self.fATobbaco_Txt.layer.borderWidth = 0.5
        self.sATobbaco_Txt.layer.borderWidth = 0.5
        self.fCTobbaco_Txt.layer.borderWidth = 0.5
        self.sCTobbaco_Txt.layer.borderWidth = 0.5
        self.tCTobbaco_Txt.layer.borderWidth = 0.5
       self.frCTobbacol_Txt.layer.borderWidth = 0.5

    }
    //MARK: - data Fetch
    
    //MARK: - hide view for the
    func desableTxt(){
//        self.fAAlcohal_Txt.isHidden = true
        self.fAAlcohalNsTxt.constant = 0
//        self.sAAlcohal_Txt.isHidden = true
        self.sAAlcohalNsTxt.constant = 0
        self.fCAlcohal_Txt.isHidden = true
        self.fCAlcohalNsTxt.constant = 0
        self.sCAlcohal_Txt.isHidden = true
        self.sCAlcohalNsTxt.constant = 0
        self.tCAlcohal_Txt.isHidden = true
        self.tCAlcohalNsTxt.constant = 0
        self.frCAlcohal_Txt.isHidden = true
        self.frCAlcohalNsTxt.constant = 0
        self.fATobbaco_Txt.isHidden = true
       self.fATobbacoNsTxt.constant = 0
       self.sATobbaco_Txt.isHidden = true
       self.sATobbacoNsTxt.constant = 0
       self.fCTobbaco_Txt.isHidden = true
       self.fCTobbacoNsTxt.constant = 0
       self.sCTobbaco_Txt.isHidden = true
       self.sCTobbacoNsTxt.constant = 0
       self.tCTobbaco_Txt.isHidden = true
       self.tCTobbacoNsTxt.constant = 0
       self.frCTobbacol_Txt.isHidden = true
       self.frCTobbacolNsTxt.constant = 0
    }
    //MARK: - all Check button action
    @IBAction func firstAdultAlcohallicked(_ sender: UIButton){
        if fAAlcohalBtn.isSelected {
            fAAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
//            self.fAAlcohal_Txt.isHidden = false
            self.fAAlcohalNsTxt.constant = 0
        } else {
            fAAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
//            self.fAAlcohal_Txt.isHidden = true
            self.fAAlcohalNsTxt.constant = 50
        }
        fAAlcohalBtn.isSelected = !fAAlcohalBtn.isSelected
    }
    
    @IBAction func secondAdultAlcohallicked(_ sender: UIButton){
        if sAAlcohalBtn.isSelected {
            sAAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
//            self.sAAlcohal_Txt.isHidden = false
            self.sAAlcohalNsTxt.constant = 0
        } else {
            sAAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
//            self.sAAlcohal_Txt.isHidden = true
            self.sAAlcohalNsTxt.constant = 50
        }
        sAAlcohalBtn.isSelected = !sAAlcohalBtn.isSelected
    }
    @IBAction func firstChildAlcohallicked(_ sender: UIButton){
        if fCAlcohalBtn.isSelected {
            fCAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.fCAlcohal_Txt.isHidden = false
            self.fCAlcohalNsTxt.constant = 0
                 } else {
            fCAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
                     self.fCAlcohal_Txt.isHidden = true
                     self.fCAlcohalNsTxt.constant = 50
         }
        fCAlcohalBtn.isSelected = !fCAlcohalBtn.isSelected
    }
    @IBAction func secondChildAlcohallicked(_ sender: UIButton){
        if sCAlcohalBtn.isSelected {
            sCAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.sCAlcohal_Txt.isHidden = false
            self.sCAlcohalNsTxt.constant = 0
        } else {
            sCAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.sCAlcohal_Txt.isHidden = true
            self.sCAlcohalNsTxt.constant = 50
        }
        sCAlcohalBtn.isSelected = !sCAlcohalBtn.isSelected
    }
    @IBAction func thirdChildAlcohallicked(_ sender: UIButton){
        if tCAlcohalBtn.isSelected {
            tCAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.tCAlcohal_Txt.isHidden = false
            self.tCAlcohalNsTxt.constant = 0
            //            self.nextVc()
        } else {
            tCAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.tCAlcohal_Txt.isHidden = true
            self.tCAlcohalNsTxt.constant = 50
        }
        tCAlcohalBtn.isSelected = !tCAlcohalBtn.isSelected
    }
    @IBAction func fourthChildAlcohallicked(_ sender: UIButton){
        if frCAlcohalBtn.isSelected {
            frCAlcohalBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.frCAlcohal_Txt.isHidden = false
            self.frCAlcohalNsTxt.constant = 0
        } else {
            frCAlcohalBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.frCAlcohal_Txt.isHidden = true
            self.frCAlcohalNsTxt.constant = 50
        }
        frCAlcohalBtn.isSelected = !frCAlcohalBtn.isSelected
    }
    @IBAction func firstAdultTobbacolicked(_ sender: UIButton){
        if fATobbacoBtn.isSelected {
            fATobbacoBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.fATobbaco_Txt.isHidden = true
            self.fATobbacoNsTxt.constant = 0
            
        } else {
            fATobbacoBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.fATobbaco_Txt.isHidden = false
            self.fATobbacoNsTxt.constant = 50
        }
        fATobbacoBtn.isSelected = !fATobbacoBtn.isSelected
    }
    @IBAction func secondAdultTobbacolicked(_ sender: UIButton){
        if sATobbacoBtn.isSelected {
            sATobbacoBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.sATobbaco_Txt.isHidden = true
            self.sATobbacoNsTxt.constant = 0
            
        } else {
            sATobbacoBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.sATobbaco_Txt.isHidden = false
            self.sATobbacoNsTxt.constant = 50
        }
        sATobbacoBtn.isSelected = !sATobbacoBtn.isSelected
    }
    @IBAction func firstChildTobbacolicked(_ sender: UIButton){
        if fCTobbacoBtn.isSelected {
            fCTobbacoBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.fCTobbaco_Txt.isHidden = false
            self.fCTobbacoNsTxt.constant = 0
            
        } else {
            fCTobbacoBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.fCTobbaco_Txt.isHidden = true
            self.fCTobbacoNsTxt.constant = 50
        }
        fCTobbacoBtn.isSelected = !fCTobbacoBtn.isSelected
    }
    @IBAction func secondChildTobbacolicked(_ sender: UIButton){
        if sCTobbacoBtn.isSelected {
            sCTobbacoBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.sCTobbaco_Txt.isHidden = false
            self.sCTobbacoNsTxt.constant = 0
            //            self.nextVc()
        } else {
            sCTobbacoBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.sCTobbaco_Txt.isHidden = true
            self.sCTobbacoNsTxt.constant = 50
        }
        sCTobbacoBtn.isSelected = !sCTobbacoBtn.isSelected
    }
    @IBAction func thirdChildTobbacolicked(_ sender: UIButton){
        if tCTobbacoBtn.isSelected {
            tCTobbacoBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.tCTobbaco_Txt.isHidden = false
            self.tCTobbacoNsTxt.constant = 0
            
        } else {
            tCTobbacoBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.tCTobbaco_Txt.isHidden = true
            self.tCTobbacoNsTxt.constant = 50
        }
        tCTobbacoBtn.isSelected = !tCTobbacoBtn.isSelected
    }
    @IBAction func fourthChildTobbacolicked(_ sender: UIButton){
        if frCTobbacolBtn.isSelected {
            frCTobbacolBtn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            self.frCTobbacol_Txt.isHidden = false
            self.frCTobbacolNsTxt.constant = 0
            
        } else {
            frCTobbacolBtn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            self.frCTobbacol_Txt.isHidden = true
            self.frCTobbacolNsTxt.constant = 50
        }
        frCTobbacolBtn.isSelected = !frCTobbacolBtn.isSelected
        }
    //MARK: - func for the validation
    func validation(){
        if fAAlcohalBtn.isSelected == true{
            let hh = UserDefaults.standard.string(forKey: "fAName")!
 alert(message: "\(hh + "is take alcohal so we donot provide insurance")", title: "Message")
        }else if sAAlcohalBtn.isSelected == true{
            self.sAName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "\(self.sAName + "is take alcohal so we donot provide insurance")", title: "Message")
        }else if sAAlcohalBtn.isSelected == true{
            self.fCName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "is take alcohal so we donot provide insurance", title: "Message")
        }else if fCAlcohalBtn.isSelected == true{
            self.sCName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "is take alcohal so we donot provide insurance", title: "Message")
        }else if sCAlcohalBtn.isSelected == true{
            self.tCName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "is take alcohal so we donot provide insurance", title: "Message")
        }else if tCAlcohalBtn.isSelected == true{
            self.frCName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "is take alcohal so we donot provide insurance", title: "Message")
        }else if frCAlcohalBtn.isSelected == true{
            self.fAName = UserDefaults.standard.string(forKey: "fAName")!
            alert(message: "\(self.fAName + "is take alcohal so we donot provide insurance")", title: "Message")
        }else if fATobbacoBtn.isSelected == true{
            self.sAName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "\(self.sAName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else if sATobbacoBtn.isSelected == true{
            self.sAName = UserDefaults.standard.string(forKey: "sAName")!
            alert(message: "\(self.sAName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else if fCTobbacoBtn.isSelected == true{
            self.fCName = UserDefaults.standard.string(forKey: "fCName")!
            alert(message: "\(self.fCName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else if sCTobbacoBtn.isSelected == true{
            self.sCName = UserDefaults.standard.string(forKey: "sCName")!
            alert(message:  "\(self.sCName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else if tCTobbacoBtn.isSelected == true{
            self.tCName = UserDefaults.standard.string(forKey: "tCName")!
            alert(message: "\(self.tCName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else if frCTobbacolBtn.isSelected == true{
            self.frCName = UserDefaults.standard.string(forKey: "frCName")!
            alert(message: "\(self.frCName + "is take Tobbaco so we donot provide insurance")", title: "Message")
        }else{
            print("no any one taking alcohal and tobbaco")
        }
    }
    
    
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        self.present(nextVc, animated: true, completion: nil)
    }
    @IBAction func continueAction(_ sender:UIButton){
        self.validation()
        let nextVC = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "NomineeAndOtherDetails_Vc") as! NomineeAndOtherDetails_Vc
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
