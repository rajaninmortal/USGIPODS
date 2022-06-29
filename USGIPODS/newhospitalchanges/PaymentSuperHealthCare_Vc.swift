//
//  PaymentSuperHealthCare_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD


class PaymentSuperHealthCare_Vc: BaseViewController {
    
    @IBOutlet weak var total_View: UIView!
    @IBOutlet weak var totalRs_Lbl: UILabel!
    @IBOutlet var next_Btn: UIView!
    @IBOutlet weak var quotatinId_Txt: UITextField!
    
    var quotationId = String(); var totalAmount = String()
    
    var refrence = HealthMemberInfo_Vc()
    
    var today = String()
    var tomarow = String()
    var yearlater = String()
    
    var name = String()
    var mobileNo = String()
    var email = String()
    var adultgender = String(); var adultdob = String(); var adultoccupation = String()
    var spousesname = String(); var spousesdob = String(); var spousesgender = String();var spousesoccupation = String()
    var fAName     = String(); var BIStatus  = String();     var paStatus      = String()
    var sAName     = String(); var BIStatus1 = String();     var ciStatus      = String()
    var fCName     = String(); var BIStatus2 = String();     var dhcStatus     = String()
    var sCName     = String(); var BIStatus3 = String();     var paStatus1     = String()
    var tCName     = String(); var BIStatus4 = String();     var ciStatus1     = String()
    var frCName    = String(); var BIStatus5 = String();     var dhcStatus1    = String()
    var fADob      = String(); var policyType = String();    var paStatus2     = String()
    var sADob      = String(); var familyType = String();    var ciStatus2     = String()
    var fCDob      = String(); var sumInsured = String();    var dhcStatus2    = String()
    var sCDob      = String(); var suminsured = String();    var paStatus3     = String()
    var tCDob      = String(); var policyTenr = String();    var ciStatus3     = String()
    var frCDob     = String(); var premiumm  = String();     var dhcStatus3    = String()
    var fAOccpation = String(); var addressline1 = String(); var paStatus4     = String()
    var sAOccpation = String(); var addressline2 = String(); var ciStatus4     = String()
    var fCOccpation = String(); var houseNumber = String();  var dhcStatus4    = String()
    var sCOccpation = String(); var state = String();        var paStatus5     = String()
    var tCOccpation = String(); var city  = String();        var ciStatus5     = String()
    var frOccpation = String(); var pincode  = String();     var dhcStatus5    = String()
    var fAGender   = String();var fABmi = String();          var Sub_Type      = String()
    var sAGender   = String();var sABmi = String();          var Sub_Status    = String()
    var fCGender   = String();var fCBmi = String();          var sublimit      = String()
    var sCGender   = String();var sCBmi = String();          var Esale_Status  = String()
    var tCGender   = String(); var tCBmi = String();           var Life_Status = String()
    var frGender   = String();var frBmi = String();              var PD_Status = String()
    var fARelation = String();                                    var pdStatus = String()
    var sARelation = String();
    var fCRelation = String();
    var sCRelation = String()
    var tCRelation = String()
    var frRelation = String(); var Tiered_Status = String()
    var PosPolicyNo = String()
    var TotalValue = String()
    var WACode = String()
    var  fAbloodSugar         = Int()
    var  fAbloodpressure      = String()
    var  fAbloodsugarPressure = String(); var insuredType = String()
    var  fAcholostral         = String(); var insuredType1 = String()
    var  sAbloodSugar         = String(); var insuredType2 = String()
    var  sAbloodpressure      = String(); var insuredType3 = String()
    var  sAbloodsugarPressure = String(); var insuredType4 = String()
    var  sAcholostral         = String(); var insuredType5 = String()
    var  fCbloodSugar         = String()
    var  fCbloodpressure      = String()
    var  fCbloodsugarPressure = String()
    var  fCcholostral         = String()
    var  sCbloodSugar         = String()
    var  sCbloodpressure      = String()
    var  sCbloodsugarPressure = String()
    var  sCcholostral         = String()
    var  tCbloodSugar         = String()
    var  tCbloodpressure      = String()
    var  tCbloodsugarPressure = String()
    var  tCcholostral         = String()
    var  frCbloodSugar        = String()
    var  frCbloodpressure     = String()
    var  frCbloodsugarPressure = String()
    var  frCcholostral        = String()
    var suminsureAmount      = String()
    var policytenure         = String()
    var titleBtn             = String()
    
    var webUrl = "https://www.google.com/"
    var chilpolicyweb = ""
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.retrieve()
        self.retrieveData()
        self.paStatus      = "False"; self.insuredType   = "Adult"
        self.ciStatus      = "False"; self.insuredType1 = "Adult"
        self.dhcStatus     = "False"; self.insuredType2 = ""
        self.paStatus1     = "False"; self.insuredType3 = ""
        self.ciStatus1     = "False"; self.insuredType4 = ""
        self.dhcStatus1    = "False"; self.insuredType5 = ""
        self.paStatus2     = "False"
        self.ciStatus2     = "False"
        self.dhcStatus2    = "False"
        self.paStatus3     = "False"
        self.ciStatus3     = "False"
        self.dhcStatus3    = "False"
        self.paStatus4     = "False"
        self.ciStatus4     = "False"
        self.dhcStatus4    = "False"
        self.paStatus5     = "False"
        self.ciStatus5     = "False"
        self.dhcStatus5    = "False"
        self.Sub_Type      = "False"
        self.Sub_Status    = "False"
        self.sublimit      = "False"
        self.Esale_Status  = "False"
        self.Life_Status   = "False"
        self.PD_Status     = "False"
        self.pdStatus      = "False"
        self.Esale_Status  = "False"
        self.sAGender = "";self.fCGender = "";self.sCGender = "";self.tCGender = "";self.frGender = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.tomarow = dateFormatter.string(from: Date.tomorrow) // Date.tomorrow
        self.today = dateFormatter.string(from: Date()) //Date()
        self.yearlater = dateFormatter.string(from: Date().yearafter)
        self.buPolicy()

    }
    //MARK: - Retrieve data for the fetching
    func retrieveData(){
        self.fAName      = UserDefaults.standard.string( forKey: "fAName")!
        self.sAName      = UserDefaults.standard.string( forKey: "sAName")!
        self.fCName      = UserDefaults.standard.string( forKey: "fCName")!
        self.sCName      = UserDefaults.standard.string( forKey: "sCName")!
        self.tCName      = UserDefaults.standard.string( forKey: "tCName")!
        self.frCName     = UserDefaults.standard.string( forKey: "frCName")!
        self.fADob       = UserDefaults.standard.string( forKey: "fADob")!
        self.sADob       = UserDefaults.standard.string( forKey: "sADob")!
        self.fCDob       = UserDefaults.standard.string( forKey: "fCDob")!
        self.sCDob       = UserDefaults.standard.string( forKey: "sCDob")!
        self.tCDob       = UserDefaults.standard.string( forKey: "tCDob")!
        self.frCDob      = UserDefaults.standard.string( forKey: "frCDob")!
        self.fAOccpation = UserDefaults.standard.string( forKey: "fAOccpation")!
        self.sAOccpation = UserDefaults.standard.string( forKey: "sAOccpation")!
        self.fCOccpation = UserDefaults.standard.string( forKey: "fCOccpation")!
        self.sCOccpation = UserDefaults.standard.string( forKey: "sCOccpation")!
        self.tCOccpation = UserDefaults.standard.string( forKey: "tCOccpation")!
        self.frOccpation = UserDefaults.standard.string( forKey: "frOccpation")!
        self.fAGender    = UserDefaults.standard.string( forKey: "fAGender")!
        self.sAGender    = UserDefaults.standard.string( forKey: "sAGender")!
        self.fCGender    = UserDefaults.standard.string( forKey: "fCGender")!
        self.sCGender    = UserDefaults.standard.string( forKey: "sCGender")!
        self.tCGender    = UserDefaults.standard.string( forKey: "tCGender")!
        self.frGender    = UserDefaults.standard.string( forKey: "frGender")!
        self.fAOccpation = UserDefaults.standard.string( forKey: "fAOccpation")!
        self.fARelation  = UserDefaults.standard.string( forKey: "fARelation")!
        self.sARelation  = UserDefaults.standard.string( forKey: "sARelation")!
        self.fCRelation  = UserDefaults.standard.string( forKey: "fCRelation")!
        self.sCRelation  = UserDefaults.standard.string( forKey: "sCRelation")!
        self.tCRelation  = UserDefaults.standard.string( forKey: "tCRelation")!
        self.frRelation  = UserDefaults.standard.string( forKey: "frRelation")!
        self.fARelation  = UserDefaults.standard.string( forKey: "fARelation")!
        self.BIStatus  = UserDefaults.standard.string(forKey: "BIStatus ")!
        self.BIStatus1 = UserDefaults.standard.string(forKey: "BIStatus1")!
        self.BIStatus2 = UserDefaults.standard.string(forKey: "BIStatus2")!
        self.BIStatus3 = UserDefaults.standard.string(forKey: "BIStatus3")!
        self.BIStatus4 = UserDefaults.standard.string(forKey: "BIStatus4")!
        self.BIStatus5 = UserDefaults.standard.string(forKey: "BIStatus5")!
        self.policyType = UserDefaults.standard.string(forKey: "policytype")!
        self.familyType = UserDefaults.standard.string(forKey: "familytype")!
        self.sumInsured = UserDefaults.standard.string(forKey: "suminsured")!
        self.policyTenr = UserDefaults.standard.string(forKey: "policytenure")!
        self.premiumm = UserDefaults.standard.string(forKey: "totalamount")!
        self.addressline1 = UserDefaults.standard.string(forKey: "addressline1")!
        self.addressline2 = UserDefaults.standard.string(forKey: "addressline2")!
        self.houseNumber = UserDefaults.standard.string(forKey: "houseNumber")!
        self.state = UserDefaults.standard.string(forKey: "state")!
        self.city = UserDefaults.standard.string(forKey: "city")!
        self.pincode = UserDefaults.standard.string(forKey: "pincode")!
        self.fABmi   = UserDefaults.standard.string(forKey: "fABmi")!
        self.sABmi   = UserDefaults.standard.string(forKey: "sABmi")!
        self.fCBmi   = UserDefaults.standard.string(forKey: "fCBmi")!
        self.sCBmi   = UserDefaults.standard.string(forKey: "sCBmi")!
        self.tCBmi   = UserDefaults.standard.string(forKey: "tCBmi")!
        self.frBmi   = UserDefaults.standard.string(forKey: "frBmi")!
        self.fABmi   = UserDefaults.standard.string(forKey: "fABmi")!
        self.sABmi   = UserDefaults.standard.string(forKey: "sABmi")!
        self.paStatus   =  UserDefaults.standard.string(forKey: "paStatus")!
        self.ciStatus   =  UserDefaults.standard.string(forKey: "ciStatus")!
        self.dhcStatus  =  UserDefaults.standard.string(forKey: "dhcStatus")!
        self.paStatus1  =  UserDefaults.standard.string(forKey: "paStatus1")!
        self.ciStatus1  =  UserDefaults.standard.string(forKey: "ciStatus1")!
        self.dhcStatus1 =  UserDefaults.standard.string(forKey: "dhcStatus1")!
        self.paStatus2  =  UserDefaults.standard.string(forKey: "paStatus2")!
        self.ciStatus2  =  UserDefaults.standard.string(forKey: "ciStatus2")!
        self.dhcStatus2 =  UserDefaults.standard.string(forKey: "dhcStatus2")!
        self.paStatus3  =  UserDefaults.standard.string(forKey: "paStatus3")!
        self.ciStatus3  =  UserDefaults.standard.string( forKey: "ciStatus3")!
        self.dhcStatus3 =  UserDefaults.standard.string(forKey: "dhcStatus3")!
        self.paStatus4  =  UserDefaults.standard.string(forKey: "paStatus4")!
        self.ciStatus4  =  UserDefaults.standard.string( forKey: "ciStatus4")!
        self.dhcStatus4 =  UserDefaults.standard.string(forKey: "dhcStatus4")!
        self.paStatus5  =  UserDefaults.standard.string(forKey: "paStatus5")!
        self.ciStatus5  =  UserDefaults.standard.string( forKey: "ciStatus5")!
        self.dhcStatus5 =  UserDefaults.standard.string(forKey: "dhcStatus5")!
        self.Sub_Type  =  UserDefaults.standard.string( forKey: "Sub_Type")!
        self.Sub_Status =  UserDefaults.standard.string(forKey: "Sub_Status")!
        self.sublimit  =  UserDefaults.standard.string( forKey: "sublimit")!
        self.fAbloodSugar       =  UserDefaults.standard.integer(forKey: "fAbloodSugar")
        self.fAbloodsugarPressure       =  UserDefaults.standard.string(forKey:"fAbloodsugarPressure")!
        self.fAbloodpressure  =  UserDefaults.standard.string(forKey: "fAbloodpressure")!
        self.fAcholostral          =  UserDefaults.standard.string(forKey: "fAcholostral")!
        self.sAbloodSugar          =  UserDefaults.standard.string(forKey: "sAbloodSugar")!
        self.sAbloodpressure       =  UserDefaults.standard.string(forKey: "sAbloodpressure")!
        self.sAbloodsugarPressure  =  UserDefaults.standard.string(forKey: "sAbloodsugarPressure")!
        self.sAcholostral          =  UserDefaults.standard.string(forKey: "sAcholostral")!
        self.fCbloodSugar          =  UserDefaults.standard.string(forKey:"fCbloodSugar")!
        self.fCbloodpressure       =  UserDefaults.standard.string(forKey: "fCbloodpressure")!
        self.fCbloodsugarPressure  =  UserDefaults.standard.string(forKey:"fCbloodsugarPressure")!
        self.fCcholostral          =  UserDefaults.standard.string(forKey: "fCcholostral")!
        self.sCbloodSugar          =  UserDefaults.standard.string(forKey: "sCbloodSugar")!
        self.sCbloodpressure       =  UserDefaults.standard.string(forKey: "sCbloodpressure")!
        self.sCbloodsugarPressure  =  UserDefaults.standard.string(forKey: "sCbloodsugarPressure")!
        self.sCcholostral          =  UserDefaults.standard.string(forKey: "sCcholostral")!
        self.tCbloodSugar          =  UserDefaults.standard.string(forKey: "tCbloodSugar")!
        self.tCbloodpressure       =  UserDefaults.standard.string(forKey: "tCbloodpressure")!
        self.tCbloodsugarPressure  =  UserDefaults.standard.string(forKey: "tCbloodsugarPressure")!
        self.tCcholostral          =  UserDefaults.standard.string(forKey: "tCcholostral")!
        self.frCbloodSugar         =  UserDefaults.standard.string(forKey: "frCbloodSugar")!
        self.frCbloodpressure      =  UserDefaults.standard.string(forKey: "frCbloodpressure")!
    self.frCbloodsugarPressure =  UserDefaults.standard.string(forKey:"frCbloodsugarPressure")!
        self.frCcholostral         =  UserDefaults.standard.string(forKey: "frCcholostral")!
        self.pdStatus   = UserDefaults.standard.string(forKey: "pdStatus")!
        self.Esale_Status =  UserDefaults.standard.string(forKey: "Esale_Status")!
        self.Life_Status =  UserDefaults.standard.string(forKey: "Life_Status")!
        self.PD_Status   =  UserDefaults.standard.string(forKey: "PD_Status")!
        self.Tiered_Status =    UserDefaults.standard.string(forKey: "Tiered_Status")!
        self.policyType  = UserDefaults.standard.string(forKey: "policytype")!
        self.familyType  = UserDefaults.standard.string(forKey: "familytype")!
        self.suminsureAmount  = UserDefaults.standard.string(forKey: "suminsured")!
        self.policytenure = UserDefaults.standard.string(forKey: "policytenure")!
        self.totalAmount = UserDefaults.standard.string(forKey: "totallPremium")!
        self.totalRs_Lbl.text =  self.totalAmount
        self.titleBtn = UserDefaults.standard.string(forKey: "family")!

    }
    
    //MARK: - func for data Retrive
    func retrieve(){
        self.quotatinId_Txt.text =  UserDefaults.standard.string(forKey: "quotationid")!
        self.totalRs_Lbl.text = totalAmount
//        self.name  = "yogesh",   // String( ProjectUtils.getUserName())
        self.mobileNo  = String(describing:ProjectUtils.getMobileNo()!)
        self.email = String(describing: ProjectUtils.getEmailID())
    }
    //MARK: - func for corner radious
    func cornerRadious(){
        self.total_View.layer.cornerRadius = 20
        self.quotatinId_Txt.layer.cornerRadius = 20
        self.next_Btn.layer.cornerRadius = 20
        self.quotatinId_Txt.setLeftPaddingPoints(15)
        self.borderWidth()
    }
    func borderWidth(){
        self.total_View.layer.borderWidth = 0.5
        self.quotatinId_Txt.layer.borderWidth = 0.5
    }
    @IBAction func nextAction(_ sender:UIButton){
        let story = UIStoryboard(name: "PolicySideMenu", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "CommonWebViewVC") as! CommonWebViewVC
        vc.webUrl = "http://124.124.15.42/PaymentGatewayUAT/ExtIntityCallPage.aspx?PosPolicyNo=" + self.PosPolicyNo + "&FinalPremium=" + self.TotalValue + "&Src=WA&SubSrc=" + self.WACode
        vc.websiteNameStr = "Policydeal"
        self.navigationController?.pushViewController(vc, animated: true)
                self.buPolicy()
        
    }
}

//MARK: - extension for the api
extension PaymentSuperHealthCare_Vc {
    private func buPolicy() {
        let params   =   ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                          "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                          "Name" : self.fAName,
                          "PhoneNo": self.mobileNo,
                          "Emailid": self.email ,
                          "DOB":"09/02/1998",
                          "gender":"Male",
                          "Occupation" : self.fAOccpation,
                          "Spouse_Name":self.sAName,
                          "Spouse_DOB":self.sADob,
                          "Spouse_Gender":self.sAGender,
                          "Spouse_Occupation":self.sAOccpation,
                          "Total_Premium":self.totalAmount,
                          "Proposal_Date":self.today,
                          "From_Date":self.tomarow,
                          "To_Date":self.yearlater,
                          "Plan_Type":self.policyType,
                          "Floater_Type":self.familyType,
                          "Sum_Insured":"500000",
                          "Policy_Duration":  "1",        //self.policyTenr,
                          "Esale_Status":self.Esale_Status,
                          "Life_Status":self.Life_Status,
                          "PD_Status":self.pdStatus,
                          "Sub_Status":self.Sub_Status,
                          "Tiered_Status":self.Tiered_Status,
                          "Sub_Type":self.Sub_Type,
                          "DOB1":self.sADob,
                          "DOB2":self.fCDob,
                          "DOB3":self.sCDob,
                          "DOB4":self.tCDob,
                          "DOB5":self.frCDob,
                          "PA_Status"  :self.paStatus,
                          "CI_Status"  :self.ciStatus,
                          "DHC_Status" :self.dhcStatus,
                          "PA_Status1" :self.paStatus1,
                          "CI_Status1" :self.ciStatus1,
                          "DHC_Status1":self.dhcStatus1,
                          "PA_Status2" :self.paStatus2,
                          "CI_Status2" :self.ciStatus2,
                          "DHC_Status2":self.dhcStatus2,
                          "PA_Status3" :self.paStatus3,
                          "CI_Status3" :self.ciStatus3,
                          "DHC_Status3":self.dhcStatus3,
                          "PA_Status4" :self.paStatus4,
                          "CI_Status4" :self.ciStatus4,
                          "DHC_Status4":self.dhcStatus4,
                          "PA_Status5" :self.paStatus5,
                          "CI_Status5" :self.ciStatus5,
                          "DHC_Status5":self.dhcStatus5,
                          "Policy_Type": "Essential",          //self.policyType,
                          "InsuredType":self.insuredType,
                          "FirstName":self.fAName,
                          "LastName":"",
                          "Relationship":"Self",
                          "Nominee_Relation":"Spouse",
                          "pre_exist_Disease":"N",
                          "BloodSugar":self.fAbloodSugar,
                          "BloodpressureSys": self.fAbloodpressure,
                          "BloodpressureDia":self.fAbloodsugarPressure,
                          "Colestrol":self.fAcholostral,
                          "BMI":self.fABmi,
                          "Tobacco_Alcohol":"N",
                          "Comorbidity":"N",
                          "InsuredType1":self.insuredType1,
                          "FirstName1":self.sAName,
                          "LastName1":"",
                          "gender1":self.sAGender,
                          "Occupation1":self.sAOccpation,
                          "Relationship1":self.sARelation,
                          "pre_exist_Disease1":"N",
                          "BloodSugar1":self.sAbloodSugar,
                          "BloodpressureSys1":self.sAbloodpressure,
                          "BloodpressureDia1":self.sAbloodsugarPressure,
                          "Colestrol1":self.sAcholostral,
                          "BMI1":self.sABmi,
                          "Tobacco_Alcohol1":"N",
                          "Comorbidity1":"N",
                          "Present_Add_1":self.addressline1,
                          "Present_Add_2":self.addressline2,
                          "Present_State":self.state,
                          "Present_City":self.city,
                          "Present_PinCode":self.pincode,
                          "Permanent_Add_1":self.addressline1,
                          "Permanent_Add_2":self.addressline2,
                          "Permanent_State":self.state,
                          "Permanent_City":self.city,
                          "Permanent_PinCode":self.pincode,
                          "InsuredType2":self.insuredType2,
                          "FirstName2":self.fCName,
                          "LastName2":"",
                          "gender2":self.fCGender,
                          "Occupation2":self.fCOccpation,
                          "Relationship2":self.fCRelation,
                          "pre_exist_Disease2":"N",
                          "BloodSugar2":self.fCbloodSugar,
                          "BloodpressureSys2":self.fCbloodpressure,
                          "BloodpressureDia2":self.fCbloodsugarPressure,
                          "Colestrol2":self.fCcholostral,
                          "BMI2":self.fCBmi,
                          "Tobacco_Alcohol2":"N",
                          "Comorbidity2":"N",
                          "InsuredType3":self.insuredType3,
                          "FirstName3":self.sCName,
                          "LastName3":"",
                          "gender3":self.sCGender,
                          "Occupation3":self.sCOccpation,
                          "Relationship3":self.sCRelation,
                          "pre_exist_Disease3":"N",
                          "BloodSugar3":self.sCbloodSugar,
                          "BloodpressureSys3": self.sCbloodpressure,
                          "BloodpressureDia3":self.sCbloodsugarPressure,
                          "Colestrol3":self.sCcholostral,
                          "BMI3":self.sCBmi,
                          "Tobacco_Alcohol3":"N",
                          "Comorbidity3":"N",
                          "InsuredType4":self.insuredType4,
                          "FirstName4":self.tCName,
                          "gender4":self.tCGender,
                          "LastName4":"",
                          "Occupation4":self.tCOccpation,
                          "Relationship4":self.tCRelation,
                          "pre_exist_Disease4":"N",
                          "BloodSugar4":self.tCbloodSugar,
                          "BloodpressureSys4":self.tCbloodpressure,
                          "BloodpressureDia4":self.tCbloodsugarPressure,
                          "Colestrol4":self.tCcholostral,"BMI4": "",
                          "Tobacco_Alcohol4":"N",
                          "Comorbidity4":"N",
                          "InsuredType5":self.insuredType5,
                          "FirstName5":self.frCName,
                          "LastName5":"",
                          "gender5":self.frGender,
                          "Occupation5":self.frOccpation,
                          "Relationship5":self.frRelation,
                          "pre_exist_Disease5":"N",
                          "BloodSugar5":self.frCbloodSugar,
                          "BloodpressureSys5": self.frCbloodpressure ,
                          "BloodpressureDia5":self.frCbloodsugarPressure,
                          "Colestrol5":self.frCcholostral,"BMI5":"",
                          "Tobacco_Alcohol5":"N",
                          "Comorbidity5":"N",
                          "BI_Status": self.BIStatus,
                          "BI_Status1":self.BIStatus1,
                          "BI_Status2":self.BIStatus2,
                          "BI_Status3":self.BIStatus3,
                          "BI_Status4":self.BIStatus4,
                          "BI_Status5":self.BIStatus5
        ] as [String : Any]
        
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.buyPolicy.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                    }
                    if let data = response["Authentication"] as? [String:Any]{
                        let Premium = data["WACode"] as? String
                        self.WACode = Premium!
                        print(self.WACode)
                    }
                    if let idd = response["Customer"] as? [String:Any]{
                        var pospolicy = idd["PosPolicyNo"] as? String
                        self.PosPolicyNo = pospolicy!
                        print(self.PosPolicyNo)
                    }
                    if let data = response["Product"] as? [String:Any]{
                        let Premiumm = data["PremiumCalculation"] as? [String:Any]
                        let totall = Premiumm?["TotalPremium"] as? [String:Any]
                        let value = totall?["Value"] as? String
                        print(value)
                        self.TotalValue =  value!
                        
                    }
                    CommonMethods.hideHud(aView: self.view)
                }
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

