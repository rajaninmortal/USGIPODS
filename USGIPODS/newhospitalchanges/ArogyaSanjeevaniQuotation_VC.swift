//
//  ArogyaSanjeevaniQuotation_VC.swift
//  UniversalSompo
//
//  Created by yogesh patel on 25/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import Alamofire
import SVProgressHUD

class ArogyaSanjeevaniQuotation_VC: BaseViewController {
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var policyTypeBtn: UIButton!
    @IBOutlet var familyBtn: UIButton!
    @IBOutlet var suminsuredBtn: UIButton!
    @IBOutlet var policyyearBtn: UIButton!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var calcutae_View: UIView!
    @IBOutlet var reCalculatedBtn: UIButton!
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet var nextView: UIView!
    @IBOutlet var netPremium: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet weak var popup_View: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var installMentAmount_Txt : UITextField!
    @IBOutlet weak var installmentTenure_Btn : UIButton!
    @IBOutlet weak var installmentAmount_Lbl : UILabel!
    @IBOutlet weak var installmentTenure_View: UIView!
    var policy = String(); var family = String();var suminsured = String();var policytenur  = String();var totalAmount  = String(); var netPremiumm = String();var gstValue = String(); var installment = String()
    
    let datePicker  = UIDatePicker()
    var afterday  = String()
    var today  = String()
    var yearlater  = String()
    var secondYear = String()
    var quotationid = String()
    
    var selectyear = String()
    var pdStatus = String()
    var age = String()
    var newAge = String()
    var amount = String()
    
    let paramDict = NSMutableDictionary()

    var authenticate = [String:Any]()
    var CustomerDetails = [String:Any]()
    var asiQouteInsuredInfo = [[String:Any]](); var fAdult = [String:Any](); var sAdult = [String:Any](); var fChild = [String:Any](); var sChild = [String:Any](); var tChild = [String:Any](); var frChild = [String:Any](); var single = [String:Any](); var InstallmentFrequency = String()
    //MARK: - view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        self.popup_View.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.totalAmountTxt.setLeftPaddingPoints(15)
        let dgdgd = age
        self.InstallmentFrequency = "Monthly"
        self.suminsured = "500000"
        self.policy = "Family Floater"
        self.family = "2 Adult"
        self.newAge = "27/01/1995"
        if age  == "18yrs-35yrs"{
            self.newAge = "27/01/1995"
        }else if age == "36yrs-45yrs"{
            self.newAge = "27/01/1982"
        }else if age == "46yrs-50yrs"{
            self.newAge = "27/01/1974"
        }else if age == "51yrs-55yrs"{
            self.newAge = "27/01/1970"
        }
        
        self.fAdult = ["Name": "yogesh",          //String( ProjectUtils.getUserName()),
                       "DOB":"27/01/1995",
                       "Gender":"Male",
                       "HeightInFeet":"6",
                       "HeightInInches":"7",
                       "Weight":"68","BMI":"22.12",
                       "Occupation":"Doctors",
                       "Relation":"Self",
                       "SumInsured":self.suminsured ]
        self.sAdult = ["Name": "yogesh",      //String( ProjectUtils.getUserName()),
                       "DOB":"27/01/1995",
                       "Gender":"Male",
                       "HeightInFeet":"6",
                       "HeightInInches":"7",
                       "Weight":"68","BMI":"22.12",
                       "Occupation":"Doctors",
                       "Relation":"Self",
                       "SumInsured":self.suminsured ]
        self.asiQouteInsuredInfo.append(self.fAdult)
        self.asiQouteInsuredInfo.append(self.sAdult)
        self.policyQuat()
      }
    //MARK: - save data in userdefault
    func saveUserData(){
        self.family = self.familyBtn.title(for: .normal) ?? ""
        self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        self.policytenur = self.policyyearBtn.title(for: .normal) ?? ""
        self.totalAmount = self.totalAmountTxt.text ?? ""
        self.InstallmentFrequency  = self.installmentTenure_Btn.title(for: .normal) ?? ""
        
        UserDefaults.standard.set(self.family, forKey: "familytype") //Bool
        UserDefaults.standard.set(self.policy, forKey: "policytype") //Bool
        UserDefaults.standard.set(self.suminsured, forKey: "suminsured") //Bool
        UserDefaults.standard.set(self.policytenur, forKey: "policytenure") //Bool
        UserDefaults.standard.set(self.totalAmount, forKey: "totalamount")
        UserDefaults.standard.set(self.quotationid, forKey: "quotationid")
        UserDefaults.standard.set(self.newAge, forKey: "newage")
        UserDefaults.standard.set(self.InstallmentFrequency, forKey: "InstallmentFrequency")
        
        UserDefaults.standard.set(self.netPremiumm, forKey: "netPremiumm")
        UserDefaults.standard.set(self.totalAmount, forKey: "totalAmount")
        UserDefaults.standard.set(self.gstValue, forKey: "gstValue")
        UserDefaults.standard.set(self.family, forKey: "family")
        UserDefaults.standard.set(self.installment, forKey: "installment")
        UserDefaults.standard.set(self.today, forKey: "today") //Bool
        UserDefaults.standard.set(self.afterday, forKey: "tommorow") //Bool
        UserDefaults.standard.set(self.yearlater, forKey: "yearlater")
    }
    //MARK: - func for the cornerRadious
    func cornderRadious(){
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.calcutae_View.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.nextView.layer.cornerRadius = 10
        self.popup_View.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.installMentAmount_Txt .layer.cornerRadius = 20
        self.installmentTenure_Btn .layer.cornerRadius = 20
        self.installmentAmount_Lbl .layer.cornerRadius = 20
        self.installmentTenure_View.layer.cornerRadius = 20
        self.installMentAmount_Txt.setLeftPaddingPoints(15)
        self.popup_View.setShadow(shadowRadius: 5)
        self.borderRadious()
    }
    //MARK: - func for the borderRadious
    func borderRadious(){
        self.policytypeView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.calcutae_View.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.nextView.layer.borderWidth = 0.5
        self.installMentAmount_Txt .layer.borderWidth = 0.5
        self.installmentTenure_Btn .layer.borderWidth = 0.5
        self.installmentAmount_Lbl .layer.borderWidth = 0.5
        self.installmentTenure_View.layer.borderWidth = 0.5
        
    }
    
    @IBAction func ContinueAction(_ sender: Any) {
        self.saveUserData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "ArogyaHealthCareMemberInfo_Vc") as! ArogyaHealthCareMemberInfo_Vc
        nextVc.family = self.family
        nextVc.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        nextVc.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        nextVc.tenure = self.policyyearBtn.title(for: .normal) ?? ""
        nextVc.quotationid = self.quotationid
        self.popup_View.isHidden = true
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    //MARK: - go ahead Action
    @IBAction func goAheadAction(){
        self.popup_View.isHidden = false
    }
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.saveUserData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "ArogyaSanjeevaniShowBreakup_Vc") as! ArogyaSanjeevaniShowBreakup_Vc
        self.present(nextVc, animated: true, completion: nil)
    }
    //MARK: - policy type button action
    @IBAction func policytypeBtnAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as? AnchorView)
        dropDown.dataSource = ["Family Floater","Individual"]
        dropDown.selectionAction = {[unowned self] (index: Int , item:String ) in
            self.policy = String(item)
            self.policyTypeBtn?.setTitle(item, for: .normal)
            
            if policy == "Individual"{
                self.familyBtn?.setTitle("1 Adult", for: .normal)
                
                self.asiQouteInsuredInfo = [["Name":"yogesh", //String( ProjectUtils.getUserName()),
                                             "DOB":"27/01/1995",
                                             "Gender":"Male",
                                             "HeightInFeet":"6",
                                             "HeightInInches":"7",
                                             "Weight":"68","BMI":"22.12",
                                             "Occupation":"Doctors",
                                             "Relation":"Self",
                                             "SumInsured":self.suminsured]]
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
                self.familyBtn.isUserInteractionEnabled = false
            }else{
                self.familyBtn.isUserInteractionEnabled = true
                
                self.policyQuat()
            }
            self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - family floater Action
    @IBAction func familyfloaterAction(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["2 Adult","1 Adult + 1 Child","1 Adult + 2 Child","1 Adult + 3 Child","2 Adult + 1 Child","2 Adult + 2 Child","2 Adult + 3 Child","2 Adult + 4 Child"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.familyBtn.setTitle(item, for: .normal)
            self.family = String(item)
            self.family = self.familyBtn.title(for: .normal) ?? ""
            if family == "2 Adult"{
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", // String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "1 Adult + 1 Child"{
                self.suminsured = "100000"
                
                self.fAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"25/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"5",
                               "HeightInInches":"5",
                               "Weight":"65","BMI":"20.20",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "1 Adult + 2 Child"{
                self.fAdult = ["Name":"yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.asiQouteInsuredInfo.append(self.sChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "1 Adult + 3 Child"{
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.tChild = ["Name":  "yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.asiQouteInsuredInfo.append(self.sChild)
                self.asiQouteInsuredInfo.append(self.tChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "2 Adult + 1 Child"{
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name": "yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "2 Adult + 2 Child"{
                
                self.fAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.sChild = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/2005",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.asiQouteInsuredInfo.append(self.sChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "2 Adult + 3 Child"{
                
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.sChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.tChild = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.asiQouteInsuredInfo.append(self.sChild)
                self.asiQouteInsuredInfo.append(self.tChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else if family == "2 Adult + 4 Child"{
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.fChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.sChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.tChild = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Child",
                               "SumInsured":self.suminsured ]
                self.frChild = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                                "DOB":"27/01/1995",
                                "Gender":"Male",
                                "HeightInFeet":"6",
                                "HeightInInches":"7",
                                "Weight":"68","BMI":"22.12",
                                "Occupation":"Doctors",
                                "Relation":"Child",
                                "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.asiQouteInsuredInfo.append(self.fChild)
                self.asiQouteInsuredInfo.append(self.sChild)
                self.asiQouteInsuredInfo.append(self.tChild)
                self.asiQouteInsuredInfo.append(self.frChild)
                self.policyQuat()
//                self.asiQouteInsuredInfo.removeAll()
            }else{
                
                self.policyQuat()
            }
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - suminsured button Action
    @IBAction func suminsuredAction(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["100000","150000","200000","250000","300000","350000","400000","450000","500000"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.amount = String(item)
            self.suminsuredBtn.setTitle(item, for: .normal)
            if amount == "100000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "150000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "200000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "250000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "300000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "350000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "400000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name": "yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name": "yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if amount == "450000"{
                self.asiQouteInsuredInfo.removeAll()
                self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
                self.fAdult = ["Name": "yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name": "yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
        }else if amount == "500000"{
            self.asiQouteInsuredInfo.removeAll()
            self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
            self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.sAdult)
            self.policyQuat()
        }
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - policy time  type button action
    @IBAction func policytimeAction(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Monthly","Quarterly","Half Yearly","Annually"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.policytenur = String(item)
            if self.policytenur == "Monthly"{
                self.asiQouteInsuredInfo.removeAll()
                self.InstallmentFrequency = self.installmentTenure_Btn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if self.policytenur == "Quarterly"{
                self.asiQouteInsuredInfo.removeAll()
                self.InstallmentFrequency = self.installmentTenure_Btn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh", //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",    //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if self.policytenur == "Half Yearly"{
                self.asiQouteInsuredInfo.removeAll()
                self.InstallmentFrequency = self.installmentTenure_Btn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",   //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            }else if self.policytenur == "Annually"{
                self.asiQouteInsuredInfo.removeAll()
                self.InstallmentFrequency = self.installmentTenure_Btn.title(for: .normal) ?? ""
                self.fAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.sAdult = ["Name":"yogesh",  //String( ProjectUtils.getUserName()),
                               "DOB":"27/01/1995",
                               "Gender":"Male",
                               "HeightInFeet":"6",
                               "HeightInInches":"7",
                               "Weight":"68","BMI":"22.12",
                               "Occupation":"Doctors",
                               "Relation":"Self",
                               "SumInsured":self.suminsured ]
                self.asiQouteInsuredInfo.append(self.fAdult)
                self.asiQouteInsuredInfo.append(self.sAdult)
                self.policyQuat()
            
        }
             self.installmentTenure_Btn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - recalculate button action
    @IBAction func reCalculateAction(_ sender: Any) {
        self.policyQuat()
    }
}
//MARK: - extension for the policyquat Api
extension ArogyaSanjeevaniQuotation_VC {
    private func policyQuat() {
        self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        self.family = self.familyBtn.title(for: .normal) ?? ""
        self.InstallmentFrequency = self.installmentTenure_Btn.title(for: .normal) ?? ""
        self.CustomerDetails = ["CustomerId":"",
                                "CustomerName":""]
        self.authenticate = ["WebAggregatorCode":"20000001",
                             "WAApplicationCode":"30000011",
                             "WAUserID":"USER01",
                             "WAUserPassword":"pass@123",
                             "WAType":"0"]
        
        let params =  ["QuoteId":"",
                       "ProductCode":"2851",
                       "PolicyType":self.policy,
                       "FamilyCombo":"",
                       "PlanType":self.family,
                       "PolicyDuration":"1 Year",
                       "IsPED":"No",
                       "BasicPremium":"",
                       "NetPremium":"",
                       "GST":"",
                       "TotalPremium":"",
                       "UpdateFlag":"",
                       "PageName":"",
                       "RedirectUrl":"",
                       "ProposalNo":"",
                       "PolicyNo":"",
                       "IsSameProposer":"Yes",
                       "ProposerName":"Prafulla",
                       "ProposerRelation":"Brother",
                       "InstallmentFrequency":self.InstallmentFrequency,
                       "IsLoyatyDicsount":"No",
                       "ExistingPolicyNo":"",
                       "asiQouteInsuredInfo":self.asiQouteInsuredInfo,
                       "CustomerDetails": self.CustomerDetails,
                       "authenticate":self.authenticate,
                       "ErrorMessage":""] as! [String:Any]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        // let url = String(format:"%@",SubUrl.sanjeevaniQuate.url)
        let url = "http://124.124.15.42/QuotationAPIUAT/api/HealthASI/SaveQuotationWA"
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            //            let data = JSONResponse
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    if let quoteid = response["QuoteId"]{
                        self.quotationid = "\(quoteid)"
                        let gst = response["GST"]
                        self.gstValue = "\(gst!)"
                    }
                    if  let NetPremium = response["NetPremium"] {
                        self.netPremiumm = "\(NetPremium)"
                        let totalpremium = response["TotalPremium"]
                        self.totalAmountTxt.text =   "\(totalpremium!)"
                        self.netPremium.text =  "\(totalpremium!)"
                    }
                    //self.totalAmount
                    if  let installmentAmount = response["installmentFreq"] as? [[String:Any]]{
                        let totalinstallment = installmentAmount[0]["TotalInstallPremium"] as? String
                        self.installMentAmount_Txt.text = "\(totalinstallment!)"
                        self.installment = "\(totalinstallment!)"
                        
                    }
                }
                CommonMethods.hideHud(aView: self.view)
            }
        }) { (error) in
            print(self.quotationid)
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", AlertMessage.noInternet.rawValue)
            } else {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", error.localizedDescription)
            }
        }
    }
}


