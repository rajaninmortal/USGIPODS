//
//  ArogyaSanjeevaniMedicalRetrieve_VC.swift
//  UniversalSompo
//
//  Created by yogesh patel on 25/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import SVProgressHUD

class ArogyaSanjeevaniMedicalRetrieve_VC: BaseViewController,UITextFieldDelegate {
    @IBOutlet var policytypeView : UIView!
    @IBOutlet var familyTypeView : UIView!
    @IBOutlet var suminsuredView : UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var totalAmountTxt : UITextField!
    @IBOutlet var totalLbl       : UILabel!
    @IBOutlet var suminsuredLbl  : UILabel!
    @IBOutlet weak var policyTypeTxt: UITextField!
    @IBOutlet var quatationId: UITextField!
    @IBOutlet weak var familyTypeTxt: UITextField!
    @IBOutlet weak var policyTenurTxt: UITextField!
    @IBOutlet weak var sumInsuredTxt: UITextField!
    @IBOutlet weak var discountBtn: UIButton!
    @IBOutlet weak var continueBtn: UIView!
    @IBOutlet weak var policyNbr_Txt: UITextField!
    @IBOutlet weak var policyDiscountLbl: UILabel!
    @IBOutlet weak var disAmount_Txt: UITextField!
    @IBOutlet weak var hideShow_View: UIView!
    @IBOutlet weak var hideShowDoubleeNs: NSLayoutConstraint!
    @IBOutlet weak var hideShowDoubleNs: NSLayoutConstraint!
    @IBOutlet weak var hideShowNs_View: NSLayoutConstraint!
    @IBOutlet weak var discount_View: UIView!
    @IBOutlet weak var discountPermissionBtn: UIButton!
    @IBOutlet weak var adjust_NsView: NSLayoutConstraint!
    @IBOutlet weak var medicalPermission_View: UIView!
    @IBOutlet weak var medicalPermissionBtn: UIButton!
    @IBOutlet weak var monthlyFrequencyAmount_Txt: UITextField!
    var policyNbr = String()
    var suminsured = String(); var policytype = String(); var installmentFrequency = String();var familytype = String()
    
    var fAName = String();var sAName = String();var fCName = String();var sCName = String();var tCName = String();var frCName = String()
    
    var authenticate = [String:Any]()
    var CustomerDetails = [String:Any]()
    var asiQouteInsuredInfo = [[String:Any]](); var fAdult = [String:Any](); var sAdult = [String:Any](); var fChild = [String:Any](); var sChild = [String:Any](); var tChild = [String:Any](); var frChild = [String:Any](); var single = [String:Any](); var InstallmentFrequency = String(); var isloyaltyDiscunt = String(); var existingPolicyCode =  String()
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.retrieveData()
        self.policyNbr_Txt.delegate  = self
        self.isloyaltyDiscunt = "No"
        self.policyNbr_Txt.text = "2825/59102200/00/000"
      
    }
    //MARK: - func for fetch data
    func retrieveData(){
        
        self.familytype =  UserDefaults.standard.string(forKey: "familytype")!
        self.familyTypeTxt .text        =  self.familytype //Bool
        self.policytype = UserDefaults.standard.string(forKey: "policytype")!
        self.policyTypeTxt.text         =  self.policytype //Bool
        self.suminsured = UserDefaults.standard.string(forKey: "suminsured")!
        self.sumInsuredTxt.text         =  self.suminsured //Bool
        self.policyTenurTxt.text        =  UserDefaults.standard.string(forKey: "policytenure") //Bool
        self.totalAmountTxt.text        =  UserDefaults.standard.string(forKey: "totalamount")
        self.quatationId.text           =  UserDefaults.standard.string(forKey: "quotationid")
        self.installmentFrequency = UserDefaults.standard.string(forKey: "InstallmentFrequency")!
        self.monthlyFrequencyAmount_Txt.text = self.installmentFrequency
        
        self.fAName = UserDefaults.standard.string(forKey: "fAName")!
        self.sAName = UserDefaults.standard.string(forKey: "sAName")!
        self.fCName = UserDefaults.standard.string(forKey: "fCName")!
        self.sCName = UserDefaults.standard.string(forKey: "sCName")!
        self.tCName = UserDefaults.standard.string(forKey: "tCName")!
        self.frCName = UserDefaults.standard.string(forKey: "frCName")!
        self.insurerDetail()
    }
    //MARK: - func for the corner radious
    func cornerRadious(){
        self.adjust_NsView.constant = 900
        self.policytypeView .layer.cornerRadius = 20
        self.familyTypeView .layer.cornerRadius = 20
        self.suminsuredView .layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt .layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.quatationId.layer.cornerRadius = 20
        self.discountBtn.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.policyNbr_Txt.layer.cornerRadius = 20
        self.policyDiscountLbl.layer.cornerRadius = 20
        self.disAmount_Txt.layer.cornerRadius = 20
        self.discount_View.layer.cornerRadius = 20
        self.medicalPermission_View.layer.cornerRadius = 20
        self.monthlyFrequencyAmount_Txt.layer.cornerRadius = 20
        self.policyTypeTxt.setLeftPaddingPoints(15)
        self.quatationId.setLeftPaddingPoints(15)
        self.familyTypeTxt.setLeftPaddingPoints(15)
        self.policyTenurTxt.setLeftPaddingPoints(15)
        self.sumInsuredTxt.setLeftPaddingPoints(15)
        self.totalAmountTxt.setLeftPaddingPoints(15)
        self.policyNbr_Txt.setLeftPaddingPoints(15)
        self.disAmount_Txt.setLeftPaddingPoints(15)
        self.monthlyFrequencyAmount_Txt.setLeftPaddingPoints(15)
        //MARK: -  text field desable
        self.policyTypeTxt.isUserInteractionEnabled = false
        self.quatationId.isUserInteractionEnabled = false
        self.totalAmountTxt.isUserInteractionEnabled = false
        self.familyTypeTxt.isUserInteractionEnabled = false
        self.policyTenurTxt.isUserInteractionEnabled = false
        self.sumInsuredTxt.isUserInteractionEnabled = false
        self.borderWidth()
      }
    //MARK: - func for the border width
    func borderWidth(){
        self.policytypeView .layer.borderWidth = 0.5
        self.familyTypeView .layer.borderWidth = 0.5
        self.suminsuredView .layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt .layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.quatationId.layer.borderWidth = 0.5
        self.policyNbr_Txt.layer.borderWidth = 0.5
//        self.policyDiscountLbl.layer.borderWidth = 0.5
        self.disAmount_Txt.layer.borderWidth = 0.5
        self.discount_View.layer.borderWidth = 0.5
        self.medicalPermission_View.layer.borderWidth = 0.5
        self.monthlyFrequencyAmount_Txt.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.hideShow_View.isHidden = true
        self.hideShowNs_View.constant = 0
        self.hideShowDoubleNs.constant = 0
        self.hideShowDoubleNs.constant = 0
    }
    //MARK: -  textfield delegate did end editiong
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.existingPolicyCode = self.policyNbr_Txt.text ?? ""
        self.asiPolicyQuat()
    }
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(){
        UserDefaults.standard.set(self.disAmount_Txt.text, forKey: "loyaltyDiscount")
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "ArogyaSanjeevaniShowBreakup_Vc") as! ArogyaSanjeevaniShowBreakup_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    //MARK: - medical Detail percent button action
    @IBAction func medicalDetailPer(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let medicalBtn = item
            if medicalBtn == "Yes"{
                showWarning("Error", AlertMessage.arogyaSanjeevaniMedical.rawValue)
            }else{
      
            }
            self.medicalPermissionBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - medical Detail percent button action
    @IBAction func discountPermissionAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let medicalBtn = item
            if medicalBtn == "Yes"{
                self.isloyaltyDiscunt = "Yes"
                self.adjust_NsView.constant = 1350
                self.hideShow_View.isHidden = false
                self.hideShowNs_View.constant = 110
                self.hideShowDoubleNs.constant = 10
                self.hideShowDoubleNs.constant = 10
            }else{
                self.isloyaltyDiscunt = "No"
                self.hideShow_View.isHidden = true
                self.hideShowNs_View.constant = 0
                self.hideShowDoubleNs.constant = 0
                self.hideShowDoubleNs.constant = 0

            }
            self.discountPermissionBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
       }
    //MARK: - func for the family detail condition
    func insurerDetail(){
        if self.familytype == "1 Adult"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.asiQouteInsuredInfo.append(self.fAdult)
        }else if self.familytype == "2 Adult"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.sAdult = ["Name":  "yogesh",       //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.sAdult)
        }else if self.familytype == "1 Adult + 1 Child"{
            self.fAdult = ["Name":"yogesh",       //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name": "yogesh",     //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.fChild)
        }else if self.familytype == "1 Adult + 2 Child"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name": "yogesh",       //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.sChild = ["Name": "yogesh",      //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.fChild)
            self.asiQouteInsuredInfo.append(self.sChild)
        }else if self.familytype == "1 Adult + 3 Child"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name": "yogesh",       //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.sChild = ["Name": "yogesh",         //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.tChild = ["Name": "yogesh",        //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.fChild)
            self.asiQouteInsuredInfo.append(self.sChild)
            self.asiQouteInsuredInfo.append(self.tChild)
        }else if self.familytype == "2 Adult + 1 Child"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.sAdult = ["Name":self.sAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name": "yogesh",      //String( ProjectUtils.getUserName()),
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
        }else if self.familytype == "2 Adult + 2 Child"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.sAdult = ["Name":self.sAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name": "yogesh",    //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.sChild = ["Name": "yogesh",    //String( ProjectUtils.getUserName()),
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
        }else if self.familytype == "2 Adult + 3 Child"{
            self.fAdult = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.sAdult = ["Name":self.sAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Self",
                           "SumInsured":self.suminsured ]
            self.fChild = ["Name":self.fAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.sChild = ["Name":self.sAName,
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.tChild = ["Name": "yogesh",        //String( ProjectUtils.getUserName()),
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
        }else if self.familytype == "2 Adult + 4 Child"{
            self.fAdult = ["Name":"yogesh",      //String( ProjectUtils.getUserName()),
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
            self.fChild = ["Name": "yogesh", //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured]
            self.sChild = ["Name": "yogesh",        //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured]
            self.tChild = ["Name": "yogesh",  //String( ProjectUtils.getUserName()),
                           "DOB":"27/01/1995",
                           "Gender":"Male",
                           "HeightInFeet":"6",
                           "HeightInInches":"7",
                           "Weight":"68","BMI":"22.12",
                           "Occupation":"Doctors",
                           "Relation":"Child",
                           "SumInsured":self.suminsured ]
            self.frChild = ["Name":"yogesh",        //String( ProjectUtils.getUserName()),
                            "DOB":"27/01/1995",
                            "Gender":"Male",
                            "HeightInFeet":"6",
                            "HeightInInches":"7",
                            "Weight":"68","BMI":"22.12",
                            "Occupation":"Doctors",
                            "Relation":"Child",
                            "SumInsured":self.suminsured]
            self.asiQouteInsuredInfo.append(self.fAdult)
            self.asiQouteInsuredInfo.append(self.sAdult)
            self.asiQouteInsuredInfo.append(self.fChild)
            self.asiQouteInsuredInfo.append(self.sChild)
            self.asiQouteInsuredInfo.append(self.tChild)
            self.asiQouteInsuredInfo.append(self.frChild)
        }
    }
    //MARK: - continue Action Button
    @IBAction func continueAction(_ sender:UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "ArogyaSAnjeevaniAddressCommunication_VC") as! ArogyaSAnjeevaniAddressCommunication_VC
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
}

//MARK: - extension for the policyquat Api
extension ArogyaSanjeevaniMedicalRetrieve_VC {
    private func asiPolicyQuat() {
        self.asiQouteInsuredInfo = [["Name":self.fAName,
                                             "DOB":"27/01/1995",
                                             "Gender":"Male",
                                             "HeightInFeet":"6",
                                             "HeightInInches":"7",
                                             "Weight":"68","BMI":"22.12",
                                             "Occupation":"Doctors",
                                             "Relation":"Self",
                                             "SumInsured":self.suminsured]]
        self.CustomerDetails = ["CustomerId":"",
                                "CustomerName":self.fAName]
        self.authenticate = ["WebAggregatorCode":"20000001",
                             "WAApplicationCode":"30000011",
                             "WAUserID":"USER01",
                             "WAUserPassword":"pass@123",
                             "WAType":"0"]
        
        let params =  ["authenticate":self.authenticate,
                       "asiQouteInsuredInfo":self.asiQouteInsuredInfo,
                       "CustomerDetails": self.CustomerDetails,
                      "QuoteId":"",
                       "ProductCode":"2851",
                       "PolicyType":self.policytype,
                       "PlanType":self.familytype,
                       "FamilyCombo":"",
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
                       "InstallmentFrequency":self.installmentFrequency,
                       "IsLoyatyDicsount":self.isloyaltyDiscunt,
                       "ExistingPolicyNo": self.existingPolicyCode ,
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
                   
                    if  let NetPremium = response["LoyaltyDiscount"] {
                        self.disAmount_Txt.text = "\(NetPremium)"
                        let totalpremium = response["TotalPremium"]
                        self.totalAmountTxt.text =   "\(totalpremium!)"
//                        self.netPremium.text =  "\(totalpremium!)"
                    }
                }
                CommonMethods.hideHud(aView: self.view)
            }
        }) { (error) in
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
