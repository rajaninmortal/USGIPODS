//
//  RenewalVehicleSummary_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 24/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class RenewalVehicleSummary_Vc: BaseViewController {

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

    var waCode = String(); var vehicleClassCode = String(); var vehicleMake = String()
    var policyNbr = String(); var rtoCode = String()
    var totalAmount = String()
    let datePicker  = UIDatePicker()
    var afterday  = String()
    var today  = String(); var commonYear = String(); var vehicleage = String()
    var yearlater  = String()
    var dateData = Date()
    let dated = Date()
    let formatter = DateFormatter()
    var nameTitle = String()
    var  name = String()
    var email = String()
    var  registration = String()
    var  pincode = String()
    var  city = String()
    var  state = String()
    var presentAdd = String()
    var  presentPincode = String()
    var  presentState = String()
    var  presentCity = String(); var permamentCity = String()
    var  vehicleNbr = String()
    var  chasisNbr = String()
    var  engineNbr = String()
    var RegDate            = String()
    var vehicleCode      = String()
    var modelCode        = String()
    var RegionCode       = String()
    var VehicleBrand     = String()
    var VehicleModel      = String()
    var VehicleRegStates  = String();var productName = String()
    var VehicleRto       = String() ;var productCode = String()
    var selectYear = String(); var renewalQuote = String()
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
        
        self.navigationController?.navigationBar.isHidden = true
        
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
        vc.webUrl = "https://webuat.universalsompo.com/PaymentGatewayUAT/APIPayment.aspx?IdentityNo=" + self.renewalQuote + "&Src=Renewals&SubSrc1=API"



        vc.websiteNameStr = "Policydeal"
        self.navigationController?.pushViewController(vc, animated: true)
        
       // "https://webuat.universalsompo.com/PaymentGatewayUAT/APIPayment.aspx?IdentityNo=" + self.policyNbr + "&Src=Renewals&SubSrc1=API"
    }
}
extension RenewalVehicleSummary_Vc{
    func retrieveData(){
       // self.nameTitle =    UserDefaults.standard.string(forKey: "title")!
        //self.name =  UserDefaults.standard.string(forKey: "name")!
        //self.email =   UserDefaults.standard.string(forKey: "email")!
        //self.registration =   UserDefaults.standard.string(forKey: "registerdText")!
       // self.pincode =   UserDefaults.standard.string( forKey: "pinCode")!
        self.city =   UserDefaults.standard.string(forKey: "city")!
       // self.state =  UserDefaults.standard.string(forKey: "state")!
        self.presentAdd =   UserDefaults.standard.string(forKey: "presentAdd")!
//        self.presentPincode =  UserDefaults.standard.string(forKey: "communiPin")!
        self.presentState =   UserDefaults.standard.string(forKey: "CommunState")!
        self.presentCity =    UserDefaults.standard.string(forKey: "presentAdd")!
        self.permamentCity =    UserDefaults.standard.string(forKey: "permanentAddress")!

        self.vehicleNbr =   UserDefaults.standard.string(forKey: "RegistraionNbr")!
        self.chasisNbr =   UserDefaults.standard.string(forKey: "chesisNbr")!
        self.engineNbr =  UserDefaults.standard.string(forKey: "engineNbr")!
        self.RegDate          =      UserDefaults.standard.string(forKey: "RegDate")!
        self.modelCode        =      UserDefaults.standard.string(forKey: "modelCode")!
        self.VehicleBrand     =      UserDefaults.standard.string(forKey: "VehicleBrand")!
        self.VehicleModel     =      UserDefaults.standard.string(forKey: "VehicleModel")!
        self.VehicleRegStates =      UserDefaults.standard.string(forKey: "VehicleRegStates")!
        self.VehicleRto =    UserDefaults.standard.string(forKey: "VehicleRto")!
        self.selectYear =  UserDefaults.standard.string(forKey: "RegYear")!
        self.productName =  UserDefaults.standard.string(forKey: "productName")!
        self.productCode =  UserDefaults.standard.string(forKey: "productCode")!
        self.commonYear =  UserDefaults.standard.string(forKey: "CommonYear")!
        self.vehicleage =  UserDefaults.standard.string(forKey: "VehicleAge")!
        self.vehicleClassCode =   UserDefaults.standard.string( forKey: "vehicleClassCode")!
        self.vehicleCode =  UserDefaults.standard.string(forKey: "vehicleCode")!
        self.vehicleMake =  UserDefaults.standard.string(forKey: "vehicleMake")!
        self.rtoCode =  UserDefaults.standard.string(forKey: "rtoCode")!
        self.renewalQuote =    UserDefaults.standard.string(forKey: "renewalQuote")!

    }
}

//MARK: - extension for the api service calling
extension RenewalVehicleSummary_Vc {
    private func vehicleMotorProposalAPiService(){
       
let params = ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
             "Uid": "QuylZjh9tBAutCzXpDjkTw==",
             "PosPolicyNo": "QUOTE821991",
             "Permanent_Add_1": self.registration,
             "Permanent_Add_2": self.registration,
             "Permanent_State": self.presentState,            //self.state,
             "Present_Add_1": self.presentAdd,
             "Present_Add_2": self.presentAdd,
             "Present_City": self.presentCity,
             "Present_PinCode": "",
             "Present_State": self.presentState,
             "Permanent_City":  self.permamentCity,
             "Permanent_PinCode": "",
            "ProductName":self.productName,
             "mobileno":"8307728808",
             "useremail":ProjectUtils.getEmailID(),
             "CustomerType":"Individual",
             "DOB":"22/04/1995",
             "Gender":"M",
             "UserName":"Girish",
               "RegistrationNumber":self.vehicleNbr,
               "ProductCode":self.productCode,
             "Product":"",
             "BusinessType":"RollOver",
             "VehicleClassCode": self.vehicleClassCode,
               "VehicleMakeCode":self.vehicleCode,
            "YearofManufacture":self.selectYear,
            "VehicleType":"Old",
            "CubicCapacity":"998",
            "NumberOfWheels":"4",
               "ChassisNumber":self.chasisNbr,
               "EngineNumber":self.engineNbr,
               "VehicleAge":self.vehicleage,
            "VehicleModelCode":self.modelCode,
            "RTOLocationCode" :self.rtoCode,
            "GrossVehicleWeight":"0",
            "PlaceOfRegistration":self.city,
            "VehicleModel":self.VehicleBrand,
            "DateOfFirstRegistration": self.RegDate,
            "DateOfRegistration": self.RegDate,
            "City":self.city,
            "TotalPremium":"19854.00",
            "IDV":"463901.15",
            "FuelType":"Petrol",
            "VehicleMake":self.vehicleMake,
               "PolicyEffectiveFrom":self.today,
               "PolicyEffectiveTo":self.commonYear,
               "PolicyStatus":"Unexpired",
               "InsurerName":"Acko General Insurance Ltd.",
               "PolicyPremium":"1000.00",
               "PolicyNo":"231/5464",
               "CNGLPGKITODStatus":"True",
               "CNGLPGKITTPStatus":"True",
               "BUILTINCNGKIT_LPGKITODStatus":"True",
               "DAILYCASHALLOWANCEStatus":"True",
               "WRONGFUELCOVERStatus":"True",
               "BasicODStatus":"True",
               "ELECTRICALACCESSORYODStatus":"True",
               "NONELECTRICALACCESSORYODStatus":"True",
                   "BasicTP":"True",
                "PACOVERTOEMPLOYEESOFINSUREDStatus":"True",
                "PACOVERTOPASSENGERSStatus":"True",
                 "PACOVERTOPAIDDRIVERStatus":"True",
                 "OtherTPStatus":"True",
                 "FIBERTANKODStatus":"True",
                 "OtherODStatus":"True",
                 "UNNAMEDPACOVERTOPASSENGERSStatus":"True",
                 "PACOVERTOOWNERDRIVERStatus":"True",
                 "LEGALLIABILITYTOPAIDDRIVERStatus":"True",
                 "RoadsideAssistanceStatus":"True",
                 "NilDepreciationWaivercoverStatus":"True",
                 "DAILYCASHALLOWANCENONMETROStatus":"True", "DAILYCASHALLOWANCEMETROStatus":"True",
               "KEYREPLACEMENTStatus":"True",
               "RETURNTOINVOICEStatus":"True",
               "ACCIDENTALHOSPITALIZATIONStatus":"True",
                       "HYDROSTATICLOCKCOVERStatus":"True",
                       "COSTOFCONSUMABLESStatus":"True",
                       "SECURETOWINGStatus":"True",
                       "TyreandRimsecureStatus":"True",
                       "ENGINEPROTECTORPETROLStatus":"True",
                       "ENGINEPROTECTORDIESELStatus":"True",
                       "VehicleExShowroomPrice":"488317.00"] as [String : Any]
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
                        self.totalPremium_Lbl.text = value as! String
                        print( self.totalAmount)
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
