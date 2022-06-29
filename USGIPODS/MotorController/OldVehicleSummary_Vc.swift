//
//  OldVehicleSummary_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 22/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import SwiftyJSON
import SVProgressHUD

class OldVehicleSummary_Vc: BaseViewController {
    @IBOutlet weak var title_Lbl: UILabel?
    @IBOutlet weak var vehicleNbr_Lbl: UILabel!
    @IBOutlet weak var modelNbr_Lbl: UILabel!
    @IBOutlet weak var registrationNbr_Lbl: UILabel!
    @IBOutlet weak var insuredDeclaredAmount_Lbl: UILabel!
    @IBOutlet weak var customerName_Lbl: UILabel!
    @IBOutlet weak var customerEmail_Lbl: UILabel!
    @IBOutlet weak var customerMobileNbr_Lbl: UILabel!
    @IBOutlet weak var customerPin_Lbl: UILabel!
    @IBOutlet weak var policyDate_Lbl: UILabel!
    @IBOutlet weak var policyPlan_Lbl: UILabel!
    @IBOutlet weak var dvAmount_Lbl: UILabel!
    @IBOutlet weak var ncbPercentage_Lbl: UILabel!
    @IBOutlet weak var ownDamage_Lbl: UILabel!
    @IBOutlet weak var addon_Lbl: UITextField!
    @IBOutlet weak var liability_Lbl: UILabel!
    @IBOutlet weak var getpolicy_Btn: UIButton!
    @IBOutlet weak var goGreensBtn: UIButton!
    @IBOutlet weak var totalPremium_Lbl: UILabel!
    @IBOutlet weak var termsConditionBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var vehicleDetail_View  : UIView?
    @IBOutlet weak var vehicleOwnerDetail_View: UIView?
    @IBOutlet weak var comprehensiveplan_View: UIView?
    @IBOutlet weak var totalPremium_view: UIView?
    @IBOutlet weak var disclamier_View: UIView?

    var waCode = String(); var quoteId = String(); var makeCode = String(); var totalPremium = String(); var vehicleAge = String(); var productCode = String(); var vehicleClassCode = String(); var numberofWheel = String(); var productName = String(); var twoWheeler = String()
    var policyNbr = String(); var customerType = String(); var make = String();var model = String()
    var totalAmount = String()
    let datePicker  = UIDatePicker(); var nONELECTRICALACCESSORYODStatus    = String()
    var afterday  = String(); var basicTP                           = String()
    var today  = String(); var pACOVERTOEMPLOYEESOFINSUREDStatus = String()
    var yearlater  = String(); var pACOVERTOPASSENGERSStatus         = String()
    var dateData = Date(); var pACOVERTOPAIDDRIVERStatus         = String()
    let dated = Date(); var otherTPStatus                     = String()
    let formatter = DateFormatter(); var fIBERTANKODStatus                 = String()
    var nameTitle = String(); var otherODStatus                     = String()
    var  name = String(); var uNNAMEDPACOVERTOPASSENGERSStatus  = String()
    var email = String(); var pACOVERTOOWNERDRIVERStatus        = String()
    var  registration = String(); var lEGALLIABILITYTOPAIDDRIVERStatus  = String()
    var  pincode = String(); var roadsideAssistanceStatus          = String()
    var  city = String(); var nilDepreciationWaivercoverStatus  = String()
    var  state = String(); var dAILYCASHALLOWANCENONMETROStatus  = String()
    var presentAdd = String(); var dAILYCASHALLOWANCEMETROStatus     = String()
    var  presentPincode = String(); var kEYREPLACEMENTStatus              = String()
    var  presentState = String(); var rETURNTOINVOICEStatus             = String()
    var  presentCity = String(); var aCCIDENTALHOSPITALIZATIONStatus   = String()
    var  vehicleNbr = String(); var hYDROSTATICLOCKCOVERStatus        = String()
    var  chasisNbr = String(); var cOSTOFCONSUMABLESStatus           = String()
    var  engineNbr = String(); var sECURETOWINGStatus                = String()
    var RegDate            = String(); var tyreandRimsecureStatus            = String()
    var vehicleCode      = String(); var eNGINEPROTECTORPETROLStatus       = String()
    var modelCode        = String(); var eNGINEPROTECTORDIESELStatus       = String()
    var RegionCode       = String(); var basicODStatus                     = String()
    var VehicleBrand     = String(); var eLECTRICALACCESSORYODStatus       = String()
    var VehicleModel      = String(); var showRoomVal = String()
    var VehicleRegStates  = String()
    var VehicleRto       = String()
    var selectYear = String(); var idv = String()
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.retrieveData()
        self.cornerRadious()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: dated)
        print(result)
        dateData = formatter.date(from: result)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.afterday = dateFormatter.string(from: Date.tomorrow)
        self.today = dateFormatter.string(from: Date())
        self.yearlater = dateFormatter.string(from: Date().yearafter)
        
        
        
        self.vehicleMotorProposalAPiService()
        // Do any additional setup after loading the view.
    }
    
    func cornerRadious(){
        self.vehicleDetail_View?.layer.cornerRadius = 10
        self.vehicleOwnerDetail_View?.layer.cornerRadius = 10
        self.comprehensiveplan_View?.layer.cornerRadius = 10
        self.continueBtn?.layer.cornerRadius = 10
        self.disclamier_View?.layer.cornerRadius = 10
        self.disclamier_View?.layer.borderWidth = 0.5
        self.disclamier_View?.layer.borderColor = UIColor.red.cgColor
        self.vehicleDetail_View?.setShadow(shadowRadius: 5)
        self.vehicleOwnerDetail_View?.setShadow(shadowRadius: 5)
        self.comprehensiveplan_View?.setShadow(shadowRadius: 5)
        self.disclamier_View?.setShadow(shadowRadius: 5)
        self.totalPremium_view?.addTopShadow()
    }

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        let story = UIStoryboard(name: "PolicySideMenu", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "CommonWebViewVC") as! CommonWebViewVC
        vc.webUrl =
        "http://124.124.15.42/PaymentGatewayUAT/ExtIntityCallPage.aspx?PosPolicyNo=" + self.policyNbr + "&FinalPremium=" + self.totalAmount + "&Src=WA&SubSrc=" + "20000001"
        vc.websiteNameStr = "Policydeal"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension OldVehicleSummary_Vc{
    func retrieveData(){
        self.nameTitle =    UserDefaults.standard.string(forKey: "title")!
        self.name =  UserDefaults.standard.string(forKey: "name")!
        self.email =   UserDefaults.standard.string(forKey: "email")!
        self.registration =   UserDefaults.standard.string(forKey: "registerdText")!
        self.pincode =   UserDefaults.standard.string( forKey: "pinCode")!
        self.city =   UserDefaults.standard.string(forKey: "city")!
        self.state =  UserDefaults.standard.string(forKey: "state")!
        self.presentAdd =   UserDefaults.standard.string(forKey: "presentAdd")!
        self.presentPincode =  UserDefaults.standard.string(forKey: "communiPin")!
        self.presentState =   UserDefaults.standard.string(forKey: "commuState")!
        self.presentCity =   UserDefaults.standard.string(forKey: "communCity")!
        self.vehicleNbr =   UserDefaults.standard.string(forKey: "regNumber")!
        self.chasisNbr =   UserDefaults.standard.string(forKey: "chesisNbr")!
        self.engineNbr =  UserDefaults.standard.string(forKey: "engineNbr")!
//        self.RegDate          =      UserDefaults.standard.string(forKey: "RegDate")!
//        self.vehicleCode      =      UserDefaults.standard.string(forKey: "vehicleCode")!
//        self.modelCode        =      UserDefaults.standard.string(forKey: "modelCode")!
//        self.RegionCode       =      UserDefaults.standard.string(forKey: "RegionCode")!
//        self.VehicleBrand     =      UserDefaults.standard.string(forKey: "VehicleBrand")!
//        self.VehicleModel     =      UserDefaults.standard.string(forKey: "VehicleModel")!
//        self.VehicleRegStates =      UserDefaults.standard.string(forKey: "VehicleRegStates")!
//        self.VehicleRto       =     UserDefaults.standard.string(forKey: "VehicleRto")!
        self.selectYear       =     UserDefaults.standard.string(forKey: "RegYear")!
        self.quoteId          =     UserDefaults.standard.string(forKey: "QuoteID")!
        self.makeCode         =     UserDefaults.standard.string(forKey: "MakeCode")!
        self.totalPremium     =     UserDefaults.standard.string(forKey: "TotalPremium")!
        self.vehicleAge       =     UserDefaults.standard.string(forKey: "VehicleAge")!
        self.customerType     =  UserDefaults.standard.string(forKey: "CustomerType")!
        self.idv        =   UserDefaults.standard.string(forKey: "IDV")!

        self.twoWheeler    =   UserDefaults.standard.string(forKey: "TwoWheeler")!
        self.productName   =   UserDefaults.standard.string(forKey: "productName")!
        self.productCode   =   UserDefaults.standard.string(forKey: "productCode")!
        self.numberofWheel =   UserDefaults.standard.string(forKey: "NumberofWheel")!
        self.make =   UserDefaults.standard.string(forKey: "VehicleMake")!
        self.model =   UserDefaults.standard.string(forKey: "VehicleModel")!
        self.showRoomVal =   UserDefaults.standard.string(forKey: "showRoomVal")!

     
            self.eLECTRICALACCESSORYODStatus       = "True"
            self.nONELECTRICALACCESSORYODStatus    = "True"
            self.basicTP                           = "True"
            self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "True"
            self.pACOVERTOPASSENGERSStatus         = "True"
            self.pACOVERTOPAIDDRIVERStatus         = "True"
            self.otherTPStatus                     = "False"
            self.fIBERTANKODStatus                 = "False"
            self.otherODStatus                     = "False"
            self.uNNAMEDPACOVERTOPASSENGERSStatus  = "False"
            self.pACOVERTOOWNERDRIVERStatus        = "False"
            self.lEGALLIABILITYTOPAIDDRIVERStatus  = "False"
            self.roadsideAssistanceStatus          = "True"
            self.nilDepreciationWaivercoverStatus  = "True"
            self.dAILYCASHALLOWANCENONMETROStatus  = "False"
            self.dAILYCASHALLOWANCEMETROStatus     = "False"
            self.kEYREPLACEMENTStatus              = "False"
            self.rETURNTOINVOICEStatus             = "False"
            self.aCCIDENTALHOSPITALIZATIONStatus   = "True"
            self.hYDROSTATICLOCKCOVERStatus        = "False"
            self.cOSTOFCONSUMABLESStatus           = "False"
            self.sECURETOWINGStatus                = "False"
            self.tyreandRimsecureStatus            = "False"
            self.eNGINEPROTECTORPETROLStatus         = "True"
            self.eNGINEPROTECTORDIESELStatus        = "True"
            self.basicODStatus                     = "False"
        
        if twoWheeler == "twoWheeler"{
            self.twoWheeler = "twoWheeler"
            self.productName = "TWO WHEELER PACKAGE POLICY"
            self.productCode = "2312"
            self.numberofWheel = "2"
            self.vehicleClassCode = "37"
            self.title_Lbl?.text = "Two Wheeler Insurance"
        }else{
            self.productName = "PRIVATE CAR PACKAGE POLICY"
            self.productCode = "2311"
            self.numberofWheel = "4"
            self.vehicleClassCode = "45"
            self.title_Lbl?.text = "Four Wheeler Insurance"

        }

        
    }
}

//MARK: - extension for the api service calling
extension OldVehicleSummary_Vc {
    private func vehicleMotorProposalAPiService(){
       
let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
               "Uid": "QuylZjh9tBAutCzXpDjkTw==",
             "PosPolicyNo": self.quoteId,
             "Permanent_Add_1": self.registration,
             "Permanent_Add_2": self.registration,
             "Permanent_State": self.state,
             "Present_Add_1": self.presentAdd,
             "Present_Add_2": self.presentAdd,
             "Present_City": self.presentCity,
             "Present_PinCode": self.presentPincode,
             "Present_State": self.presentState,
             "Permanent_City": self.city,
             "Permanent_PinCode": self.pincode,
             "ProductName":self.productName,
             "mobileno":"8307728808",
             "useremail":ProjectUtils.getEmailID(),
             "CustomerType":self.customerType,
             "DOB":"22/04/1995",
             "Gender":"M",
             "UserName":"Girish",
             "RegistrationNumber":self.vehicleNbr ,
             "ProductCode":self.productCode,
             "Product":"",
             "BusinessType":"RollOver",
             "PolicyEffectiveFrom":"26/07/2022",
               "PolicyEffectiveTo":"25/07/2023",
               "PolicyStatus":"Unexpired",
               "PolicyPremium":"1000.00",
             "VehicleClassCode": self.vehicleClassCode,
             "VehicleMakeCode":self.makeCode,
             "YearofManufacture":self.selectYear,
             "VehicleType":"Old",
             "CubicCapacity":"998",
             "NumberOfWheels":self.numberofWheel,
             "ChassisNumber":self.chasisNbr,
             "EngineNumber":self.engineNbr,
            "VehicleAge":self.vehicleAge,
            "VehicleModelCode":self.modelCode,
            "RTOLocationCode" :self.RegionCode,
            "GrossVehicleWeight":"0",
            "PlaceOfRegistration":self.registration,
            "VehicleModel":self.model,
            "DateOfFirstRegistration": self.RegDate,
            "DateOfRegistration": self.RegDate,
            "City":self.city,
            "TotalPremium":self.totalPremium,
               "IDV":self.idv,
            "FuelType":"Petrol",
               "VehicleMake":self.make,
            "Fromdate":self.today,
            "Todate":self.yearlater,
            "CNGLPGKITODStatus":"True",
            "CNGLPGKITTPStatus":"True",
            "BUILTINCNGKIT_LPGKITODStatus":"True",
            "DAILYCASHALLOWANCEStatus":"True",
            "WRONGFUELCOVERStatus":"True",
               "BasicODStatus":self.basicODStatus,
               "ELECTRICALACCESSORYODStatus":self.eLECTRICALACCESSORYODStatus,
               "NONELECTRICALACCESSORYODStatus":self.nONELECTRICALACCESSORYODStatus,
               "BasicTP":self.basicTP,
               "PACOVERTOEMPLOYEESOFINSUREDStatus":self.pACOVERTOEMPLOYEESOFINSUREDStatus,
               "PACOVERTOPASSENGERSStatus":self.pACOVERTOPASSENGERSStatus,
               "PACOVERTOPAIDDRIVERStatus":self.pACOVERTOPAIDDRIVERStatus,
               "OtherTPStatus":self.otherTPStatus,
               "FIBERTANKODStatus":self.fIBERTANKODStatus,
               "OtherODStatus":self.otherTPStatus,
               "UNNAMEDPACOVERTOPASSENGERSStatus":self.uNNAMEDPACOVERTOPASSENGERSStatus,
               "PACOVERTOOWNERDRIVERStatus":self.pACOVERTOOWNERDRIVERStatus,
               "LEGALLIABILITYTOPAIDDRIVERStatus":self.lEGALLIABILITYTOPAIDDRIVERStatus,
               "RoadsideAssistanceStatus":self.roadsideAssistanceStatus,
               "NilDepreciationWaivercoverStatus":self.nilDepreciationWaivercoverStatus,
               "DAILYCASHALLOWANCENONMETROStatus":self.dAILYCASHALLOWANCEMETROStatus,
               "DAILYCASHALLOWANCEMETROStatus":self.dAILYCASHALLOWANCENONMETROStatus,
               "KEYREPLACEMENTStatus":self.kEYREPLACEMENTStatus,
               "RETURNTOINVOICEStatus":self.rETURNTOINVOICEStatus,
               "ACCIDENTALHOSPITALIZATIONStatus":self.aCCIDENTALHOSPITALIZATIONStatus,
               "HYDROSTATICLOCKCOVERStatus":self.hYDROSTATICLOCKCOVERStatus,
               "COSTOFCONSUMABLESStatus":self.cOSTOFCONSUMABLESStatus,
               "SECURETOWINGStatus":self.sECURETOWINGStatus,
               "TyreandRimsecureStatus":self.tyreandRimsecureStatus,
               "ENGINEPROTECTORPETROLStatus":self.eNGINEPROTECTORPETROLStatus,
               "ENGINEPROTECTORDIESELStatus":self.eNGINEPROTECTORDIESELStatus,
               "VehicleExShowroomPrice": self.showRoomVal] as [String : Any]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleMotorProposal.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    if let authenticate = response["Authentication"] as? [String:Any]{
                        if let waCode = authenticate["WACode"] as? String{
//                        self.quotationid = "\(quoteid)"
                            self.waCode = waCode
                        }
                    }
                    
                    if let policyNbr = response["Customer"] as? [String:Any]{
                        if let quoteid = policyNbr["PosPolicyNo"] as? String{
                            self.policyNbr = quoteid
//                        self.quotationid =
                        }
                    }
                    
                    if let data = response["Product"] as? [String:Any]{
                        let Premium = data["PremiumCalculation"] as? [String:Any]
                        let gst = Premium?["IGST"] as? [String:Any]
                        let gstVal = gst!["Value"] as? String
                      //  self.gstValue = gstVal as! String
                        let total = Premium?["TotalPremium"] as? [String:Any]
                        let value = total?["Value"]
                        self.totalAmount = value as! String
                        self.totalPremium_Lbl.text =  value as! String
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
