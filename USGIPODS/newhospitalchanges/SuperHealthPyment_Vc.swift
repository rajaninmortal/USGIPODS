//
//  SuperHealthPyment_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 07/03/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class SuperHealthPyment_Vc: BaseViewController {
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
    
    
    var genPropInformation = [String:Any]()
    var GenPropCommInfo = [String:Any]()
    var authenticate = [String:Any]()
    var pOSAgent = [String:Any]()
    var PreviousPolicyDetails = [String:Any]()
    var Customer = [String:Any]()
    var FinancierDetails = [String:Any]()
    var FinancierDetailss = [[String:Any]]()
    var fincOne = [String:Any]()
    var fincTwo = [String:Any]()
//    var genPropInformation = [String:Any]()
    var distributionChannel = [String:Any]()
    var Branchdetails = [String:Any]()
    var SPDetails = [String:Any]()
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
//        self.retrieve()
        self.retrieveData()
  
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
        self.paStatus  =  UserDefaults.standard.string(forKey: "paStatus")!
        self.ciStatus  =  UserDefaults.standard.string(forKey: "ciStatus")!
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
        self.totalAmount = UserDefaults.standard.string(forKey: "totalamount")!
        self.titleBtn = UserDefaults.standard.string(forKey: "family")!
        
        self.quotationId =  UserDefaults.standard.string(forKey: "quoteId")!


    }
    
    //MARK: - func for data Retrive
    func retrieve(){
        self.quotatinId_Txt.text = quotationId
        self.totalRs_Lbl.text = totalAmount
//        self.name  = "yogesh",     // String( ProjectUtils.getUserName())
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
        vc.webUrl =
        "http://124.124.15.42/PaymentGatewayUAT/ExtIntityCallPage.aspx?PosPolicyNo=" + self.PosPolicyNo + "&FinalPremium=" + self.totalAmount + "&Src=WA&SubSrc=" + "20000001"
        vc.websiteNameStr = "Policydeal"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
//MARK: - extension for the api
extension SuperHealthPyment_Vc {
    private func buPolicy() {
        self.authenticate = ["WACode":"20000026","WAAppCode":"30000028"]
        self.pOSAgent = ["Name":"Pos Agent","PAN":"BOPPU3928E","Aadhar":"334522335566","email":"pos@pos.com","MobileNo":"9800783311","Location":"Mumbai","Information1":"sample string 7","Information2":"sample string 8"]
        self.PreviousPolicyDetails = ["ClaimSettled":"","ClaimAmount":"","DateofLoss":"","NatureofLoss":"","ClaimNo":"","PolicyEffectiveTo":"","PolicyEffectiveFrom":"","DateOfInspection":"","PolicyPremium":"","PolicyYear":"","OfficeCode":"","PolicyStatus":"","CorporateCustomerId":"","InsurerName":"","InsurerAddress":"","PreviousPolicyType":"","OfficeAddress":""]
        self.Customer = ["CustomerType":"Individual","CustomerName":"yogesh","MobileNo":"9837386104","emailid":"yogeshinmortal@gmail.com","DOB":"07-03-1998","Gender":"Male","CanBeParent":"0","ContactTelephoneSTD":"","PresentAddressLine1":"noida","PresentAddressLine2":"sector 64 ","PermanentStateName":"UTTAR PRADESH","PresentCityDistCode":"GHAZIABAD","PresentPinCode":"201304","PermanentAddressLine1":"noida","PermanentAddressLine2":"sector 64 ","PresentStateName":"UTTAR PRADESH","PresentStateCode":"UTTAR PRADESH","PermanentStateCode":"UTTAR PRADESH","PermanentCityDistCode":"GHAZIABAD","PermanentPinCode":"201304","ProductName":"Super HealthCare Insurance","IsPresentSameAsPermanent":"True","InstrumentNo":"","InstrumentDate":"","BankID":"","PosPolicyNo":"","ProductCode":"2850","WAURN":"","NomineeName":"tester","NomineeRelation":"Spouse"]

            self.Branchdetails =  ["IMDBranchName":"","IMDBranchCode":"","SPName":"","SPCode":""]
            self.SPDetails  = [:]
            self.distributionChannel = ["Branchdetails":self.Branchdetails,"SPDetails":self.SPDetails]
            self.fincOne = ["FinancierCode":"","AgreementType":"","BranchName":"","FinancierName":"","SrNo":""]
            self.fincTwo = ["FinancierCode":"","AgreementType":"","BranchName":"","FinancierName":"","SrNo":""]
        self.FinancierDetailss.append(self.fincOne)
        self.FinancierDetailss.append(self.fincTwo)

        self.FinancierDetails = ["FinancierDetails": self.FinancierDetailss]
        self.GenPropCommInfo = ["QuotationId":self.quotationId,"policystartdate":"08/03/2022","policyedndate":"07/03/2023","starttime":"00:00","endtime":"23:59","typeofbuisness":"NEW","channelnumber":"","internediarycode":"","intermediaryname":"","branchname":"MUMBAI","PolicyNumberChar":"","IsPreviousPOlicyDtls":"N","UsgiQuotation":"","DistributionChannel":self.distributionChannel,"FinancierDetails":self.FinancierDetails,"PreviousPolicyDetails":self.PreviousPolicyDetails]
       
        self.genPropInformation = ["GenPropCommInfo":self.GenPropCommInfo,"Customer":self.Customer]

        let params   =   ["Authenticate":self.authenticate,
                          "POSAgent":self.pOSAgent,
                          "GenPropInformation":self.genPropInformation
                           ] as [String : Any]
        
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = "http://14.141.41.50:81/AL_Mobile_App.svc/SuperHealthCareProposal"                                            //String(format:"%@",SubUrl.buyPolicy.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                    }
                    if let data = response["Roots"] as? [String:Any]{
                        print(data)
                        
                        if let Premium = data["GrossPremium"] as? String {
                            self.totalAmount = Premium
                        }
                        if let GenPropInformation = data["GenPropInformation"] as? [String:Any]{
                            print(GenPropInformation)
                        
                            if let idd = GenPropInformation["Customer"] as? [String:Any]{
                                var pospolicy = idd["PosPolicyNo"] as? String
                                self.PosPolicyNo = pospolicy!
                                print(self.PosPolicyNo)
                            }
                        }
                        
                        
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






    
