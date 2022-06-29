//
//  VehicleAllDetails_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 01/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class VehicleAllDetails_Vc: BaseViewController {
    @IBOutlet weak var title_Lbl: UILabel?
    @IBOutlet weak var vehicleNbr_Lbl: UILabel!
    @IBOutlet weak var makeModel_Lbl: UILabel!
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
    @IBOutlet weak var vehicleNumberr_Lbl: UILabel!
    @IBOutlet weak var vehicleModel_Lbl: UILabel!
    @IBOutlet weak var vehicleBramnd_Lbl: UILabel!
    @IBOutlet weak var totalfinalAmount: UILabel!

    var waCode = String(); var productName = String(); var status = String()
    var policyNbr = String(); var numberofWheel = String()
    var totalAmount = String(); var productCode = String()
    let datePicker  = UIDatePicker(); var quotationid  = String()
    var afterday  = String(); var totalPremium = String()
    var today  = String(); var customerType = String()
    var yearlater  = String(); var exShowRoomPrice = String()
    var threeYear  = String();var fiveYear = String()
    var vehicleModel = String()
    var dateData = Date()
    let dated = Date()
    let formatter = DateFormatter(); var wRONGFUELCOVERRate = String()
    var nameTitle = String(); var dAILYCASHALLOWANCERate = String()
    var  name = String(); var bUILTINCNGKIT_LPGKITTPRate = String()
    var email = String(); var bUILTINCNGKIT_LPGKITODRate = String()
    var  registration = String(); var CNGLPGKITTPRate = String()
    var  pincode = String(); var CNGLPGKITODRate = String()
    var  city = String();var detariffDiscountRate = String()
    var  state = String(); var detariffLoadingRate = String()
    var presentAdd = String(); var mANUFACTURERSELLINGPRICERate = String()
    var  presentPincode = String(); var dRIVINGTRAINPROTECTRate = String()
    var  presentState = String(); var eNGINEPROTECTORDIESELRate = String()
    var  presentCity = String();var tyreandRimsecureRate = String()
    var  vehicleNbr = String(); var sECURETOWINGRate = String()
    var  chasisNbr = String(); var hYDROSTATICLOCKCOVERRate = String()
    var  engineNbr = String(); var aCCIDENTALHOSPITALIZATIONRate = String()
    var RegDate            = String(); var kEYREPLACEMENTRate = String()
    var vehicleCode      = String();  var dAILYCASHALLOWANCEMETRORate = String()
    var modelCode        = String(); var dAILYCASHALLOWANCENONMETRORate = String()
    var RegionCode       = String(); var roadsideAssistanceRate = String()
    var VehicleBrand     = String();var lEGALLIABILITYTOPAIDDRIVERRate = String()
    var VehicleModel      = String(); var otherODRate = String(); var BasicTPRate = String()
    var VehicleRegStates  = String();var otherTPRate = String()
    var VehicleRto       = String(); var uNNAMEDPACOVERTOPASSENGERSRate = String()
    var selectYear        = String(); var pACOVERTOPASSENGERSRate =  String()
    var newPolicy       = String(); var pACOVERTOPAIDDRIVERRate = String()
    var twoWheeler      = String(); var pACOVERTOOWNERDRIVERRate = String()
    var oldVehicle      = String(); var pACOVERTOEMPLOYEESOFINSUREDRate = String()
    var vehicleAge      = Int(); var nONELECTRICALACCESSORYODRate = String()
    var vehicleClassCode = String(); var fIBERTANKODRate = String()
    var newVehicle = String(); var eLECTRICALACCESSORYODRate = String(); var basicODRate = String(); var eNGINEPROTECTORPETROLRate = String();var rETURNTOINVOICERate = String()
    var nilDepreciationWaivercoverRate =  String(); var cOSTOFCONSUMABLESRate = String()
    var detariffDiscountStatus = String(); var detariffLoadingStatus = String();var InsurerName = String(); var PolicyNo = String();var PolicyPremium = String();var PolicyStatus = String();var PolicyEffectiveTo = String();var policyEffectiveFrom = String()
    var VehicleExShowroomPrice = String();var commonYear = String();var idv = String()
    var basicODStatus = String(); var basicOdAmount = String()
    var eLECTRICALACCESSORYODStatus = String()
    var nONELECTRICALACCESSORYODStatus = String()
    var basicTP = String()
    var pACOVERTOEMPLOYEESOFINSUREDStatus = String()
    var pACOVERTOPASSENGERSStatus = String()
    var pACOVERTOPAIDDRIVERStatus = String()
    var otherTPStatus = String()
    var fIBERTANKODStatus = String()
    var cNGLPGKITODStatus = String()
    var otherODStatus = String()
    var uNNAMEDPACOVERTOPASSENGERSStatus = String()
    var pACOVERTOOWNERDRIVERStatus = String()
    var lEGALLIABILITYTOPAIDDRIVERStatus = String()
    var roadsideAssistanceStatus = String()
    var nilDepreciationWaivercoverStatus = String()
    var dAILYCASHALLOWANCENONMETROStatus = String()
    var dAILYCASHALLOWANCEStatus = String()
    var cNGLPGKITTPStatus = String()
    var dAILYCASHALLOWANCEMETROStatus = String()
    var kEYREPLACEMENTStatus = String()
    var bUILTINCNGKIT_LPGKITODStatus = String()
    var rETURNTOINVOICEStatus = String()
    var aCCIDENTALHOSPITALIZATIONStatus = String()
    var hYDROSTATICLOCKCOVERStatus = String()
    var dRIVINGTRAINPROTECTStatus = String()
    var mANUFACTURERSELLINGPRICEStatus = String()
    var cOSTOFCONSUMABLESStatus = String()
    var bUILTINCNGKIT_LPGKITTPStatus = String()
    var sECURETOWINGStatus = String()
    var tyreandRimsecureStatus = String()
    var eNGINEPROTECTORPETROLStatus = String()
    var eNGINEPROTECTORDIESELStatus = String()
    var wRONGFUELCOVERStatus = String()
    var  mmANUFACTURERSELLINGPRICEStatus = String()
    var productname = String()
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.threeYear = dateFormatter.string(from: Date().yearafterThree)
        self.fiveYear = dateFormatter.string(from: Date().yearafterFive)
        self.VehicleModel     =      UserDefaults.standard.string(forKey: "VehicleModel")!
        self.retrieveData()

//        self.commonYear = self.yearlater
        
       
        // Do any additional setup after loading the view.
    }
    //MARK: - view will appear for the api service
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true

        self.vehicleMotorProposalAPiService()
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
        self.addon_Lbl.isUserInteractionEnabled = false
    }

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
       if self.status == "Selected" {
           let story = UIStoryboard(name: "PolicySideMenu", bundle:  nil)
           let vc = story.instantiateViewController(withIdentifier: "CommonWebViewVC") as! CommonWebViewVC
           vc.webUrl =
           "http://124.124.15.42/PaymentGatewayUAT/ExtIntityCallPage.aspx?PosPolicyNo=" + self.policyNbr + "&FinalPremium=" + self.totalAmount + "&Src=WA&SubSrc=" + "20000001"
           vc.websiteNameStr = "New Policy"
           self.navigationController?.pushViewController(vc, animated: true)
            }else{
            alert(message: "Plese Select Terms And Condition ", title: "Messsage")
          }
         }
   }
extension VehicleAllDetails_Vc{
    func retrieveData(){
        self.nameTitle =    UserDefaults.standard.string(forKey: "title")!
        self.name =  UserDefaults.standard.string(forKey: "name")!
        self.email =   UserDefaults.standard.string(forKey: "email")!
        self.registration =   UserDefaults.standard.string(forKey: "registerdText")!
        self.pincode =   UserDefaults.standard.string( forKey: "pinCode")!
        self.city =   UserDefaults.standard.string(forKey: "city")!
        self.state =  UserDefaults.standard.string(forKey: "state")!
        self.presentAdd =   UserDefaults.standard.string(forKey: "coomunicationAddress")!
        self.presentPincode =  UserDefaults.standard.string(forKey: "communiPin")!
        self.presentState =   UserDefaults.standard.string(forKey: "commuState")!
        self.presentCity =   UserDefaults.standard.string(forKey: "communCity")!
        self.vehicleNbr =   UserDefaults.standard.string(forKey: "vehicleNbr")!
        self.chasisNbr =   UserDefaults.standard.string(forKey: "chesisNbr")!
        self.engineNbr =  UserDefaults.standard.string(forKey: "engineNbr")!
        self.RegDate          =      UserDefaults.standard.string(forKey: "RegDate")!
        self.vehicleCode      =      UserDefaults.standard.string(forKey: "vehicleCode")!
        self.modelCode        =      UserDefaults.standard.string(forKey: "modelCode")!
        self.RegionCode       =      UserDefaults.standard.string(forKey: "RegionCode")!
        self.VehicleBrand     =      UserDefaults.standard.string(forKey: "VehicleBrand")!
        self.VehicleRegStates =      UserDefaults.standard.string(forKey: "VehicleRegStates")!
        self.VehicleRto       =    UserDefaults.standard.string(forKey: "VehicleRto")!
        self.selectYear       =  UserDefaults.standard.string(forKey: "RegYear")!
        self.newPolicy        =  UserDefaults.standard.string(forKey: "NewPolicy")!
        self.twoWheeler       =  UserDefaults.standard.string(forKey: "TwoWheeler")!
        self.oldVehicle       = UserDefaults.standard.string(forKey: "Vehicle")!
        self.vehicleAge       =  UserDefaults.standard.integer(forKey: "VehicleAge")
        self.vehicleClassCode =  UserDefaults.standard.string(forKey: "VehicleClassCode")!
        self.newVehicle = UserDefaults.standard.string(forKey: "newVehicle")!
        self.city     =  UserDefaults.standard.string(forKey: "RtoLocation")!
        self.productName =  UserDefaults.standard.string(forKey: "productName")!
        self.vehicleCode =  UserDefaults.standard.string(forKey: "vehicleCode")!
        self.numberofWheel = UserDefaults.standard.string(forKey: "NumberofWheel")!
        self.productCode =  UserDefaults.standard.string(forKey: "productCode")!
        self.quotationid  = UserDefaults.standard.string( forKey: "quoteId")!
        self.totalPremium = UserDefaults.standard.string( forKey: "totalPremium")!
        self.customerType =  UserDefaults.standard.string(forKey: "customerType")!
        self.exShowRoomPrice = UserDefaults.standard.string(forKey: "ExShowRoomPrice")!
//        self.commonYear =   UserDefaults.standard.string(forKey: "CommonYear")!
        self.idv = UserDefaults.standard.string(forKey: "Idv")!
        
        self.eLECTRICALACCESSORYODStatus =  UserDefaults.standard.string( forKey:"eLECTRICALACCESSORYODStatus")!
        self.nONELECTRICALACCESSORYODStatus =   UserDefaults.standard.string(forKey:"nONELECTRICALACCESSORYODStatus")!
        self.basicTP  =   UserDefaults.standard.string(forKey:"basicTP")!
        self.pACOVERTOEMPLOYEESOFINSUREDStatus =   UserDefaults.standard.string(forKey:"pACOVERTOEMPLOYEESOFINSUREDStatus")!
        self.pACOVERTOPASSENGERSStatus =    UserDefaults.standard.string(       forKey:"pACOVERTOPASSENGERSStatus")!
        self.pACOVERTOPAIDDRIVERStatus =   UserDefaults.standard.string(forKey:"pACOVERTOPAIDDRIVERStatus")!
        self.otherTPStatus =   UserDefaults.standard.string(forKey:"otherTPStatus")!
        UserDefaults.standard.set(self.fIBERTANKODStatus                ,forKey:"fIBERTANKODStatus")
        self.otherODStatus = UserDefaults.standard.string(                forKey:"otherODStatus")!
        self.uNNAMEDPACOVERTOPASSENGERSStatus = UserDefaults.standard.string(forKey:"uNNAMEDPACOVERTOPASSENGERSStatus")!
        self.pACOVERTOOWNERDRIVERStatus =   UserDefaults.standard.string(forKey:"pACOVERTOOWNERDRIVERStatus")!
        self.lEGALLIABILITYTOPAIDDRIVERStatus =   UserDefaults.standard.string(forKey:"lEGALLIABILITYTOPAIDDRIVERStatus")!
        self.roadsideAssistanceStatus =    UserDefaults.standard.string(forKey:"roadsideAssistanceStatus")!
        self.nilDepreciationWaivercoverStatus =  UserDefaults.standard.string(forKey:"nilDepreciationWaivercoverStatus")!
        self.dAILYCASHALLOWANCENONMETROStatus =  UserDefaults.standard.string(forKey:"dAILYCASHALLOWANCENONMETROStatus")!
        self.dAILYCASHALLOWANCEMETROStatus = UserDefaults.standard.string(forKey:"dAILYCASHALLOWANCEMETROStatus")!
        self.kEYREPLACEMENTStatus = UserDefaults.standard.string(            forKey:"kEYREPLACEMENTStatus")!
        self.rETURNTOINVOICEStatus =   UserDefaults.standard.string(         forKey:"rETURNTOINVOICEStatus")!
        self.aCCIDENTALHOSPITALIZATIONStatus = UserDefaults.standard.string(forKey:"aCCIDENTALHOSPITALIZATIONStatus")!
        self.hYDROSTATICLOCKCOVERStatus =  UserDefaults.standard.string(forKey:"hYDROSTATICLOCKCOVERStatus")!
        self.cOSTOFCONSUMABLESStatus =  UserDefaults.standard.string(forKey:"cOSTOFCONSUMABLESStatus")!
        self.sECURETOWINGStatus = UserDefaults.standard.string(forKey:"sECURETOWINGStatus")!
        self.tyreandRimsecureStatus =    UserDefaults.standard.string(forKey:"tyreandRimsecureStatus")!
        self.eNGINEPROTECTORPETROLStatus =   UserDefaults.standard.string(forKey:"eNGINEPROTECTORPETROLStatus")!
        self.eNGINEPROTECTORDIESELStatus = UserDefaults.standard.string(forKey:"eNGINEPROTECTORDIESELStatus")!
        self.basicODStatus =  UserDefaults.standard.string(forKey:"basicODStatus")!
        self.detariffDiscountStatus =  UserDefaults.standard.string(forKey:"detariffDiscountStatus")!
        self.detariffLoadingStatus =     UserDefaults.standard.string(forKey:"detariffLoadingStatus")!
        self.wRONGFUELCOVERStatus  =    UserDefaults.standard.string(forKey:"wRONGFUELCOVERStatus")!
        self.dAILYCASHALLOWANCEStatus = UserDefaults.standard.string(forKey:"dAILYCASHALLOWANCEStatus")!
        self.bUILTINCNGKIT_LPGKITTPStatus = UserDefaults.standard.string(forKey:"bUILTINCNGKIT_LPGKITTPStatus")!
        self.dRIVINGTRAINPROTECTStatus = UserDefaults.standard.string(forKey:"dRIVINGTRAINPROTECTStatus")!
        self.mmANUFACTURERSELLINGPRICEStatus =   UserDefaults.standard.string(forKey:"mmANUFACTURERSELLINGPRICEStatus")!
        self.bUILTINCNGKIT_LPGKITODStatus =    UserDefaults.standard.string(forKey:"bUILTINCNGKIT_LPGKITODStatus")!
        self.cNGLPGKITTPStatus  =   UserDefaults.standard.string(forKey:"cNGLPGKITTPStatus")!
        self.cNGLPGKITODStatus = UserDefaults.standard.string(forKey:"cNGLPGKITODStatus")!
 
        self.aCCIDENTALHOSPITALIZATIONRate =   UserDefaults.standard.string(forKey: "accidentalhospitalizationRate")!
        self.cOSTOFCONSUMABLESRate =  UserDefaults.standard.string(forKey: "costofConsumableRate")!
        self.dAILYCASHALLOWANCEMETRORate =   UserDefaults.standard.string(forKey: "dailycashallowanceMetroRate")!
        self.dAILYCASHALLOWANCENONMETRORate =   UserDefaults.standard.string(forKey: "dailycashAllowanceRate")!
        self.dRIVINGTRAINPROTECTRate =  UserDefaults.standard.string(forKey: "drivingtrainprotectRate")!
        self.eNGINEPROTECTORDIESELRate =   UserDefaults.standard.string(forKey: "engineprotectorRAte")!
        self.eNGINEPROTECTORPETROLRate =  UserDefaults.standard.string(forKey: "engineprotectorRAte")!
        self.hYDROSTATICLOCKCOVERRate =  UserDefaults.standard.string(forKey: "hydrostaticlockcoverRate")!
        self.kEYREPLACEMENTRate =  UserDefaults.standard.string(forKey: "keyreplacementRate")!
        self.mANUFACTURERSELLINGPRICERate =   UserDefaults.standard.string(forKey: "manufacturerRate")!
        self.nilDepreciationWaivercoverRate =   UserDefaults.standard.string(forKey: "nildepritiationwaivercoverRate")!
        self.rETURNTOINVOICERate =   UserDefaults.standard.string(forKey: "returntoinvoiceRate")!
        self.roadsideAssistanceRate =  UserDefaults.standard.string(forKey: "roadsideAssistance")!
        
        self.pACOVERTOEMPLOYEESOFINSUREDRate =  UserDefaults.standard.string(forKey: "pacovertoemployesofInsuredRate")!
        self.bUILTINCNGKIT_LPGKITODRate =  UserDefaults.standard.string(forKey: "builtincnglpkitODRate")!
        self.bUILTINCNGKIT_LPGKITTPRate =  UserDefaults.standard.string(forKey: "builtincnglpkitTPRate")!
        self.CNGLPGKITODRate =   UserDefaults.standard.string(forKey: "cnglpgkitODRate")!
        self.CNGLPGKITTPRate =   UserDefaults.standard.string(forKey: "cnglpgkitTPRate")!
        self.nONELECTRICALACCESSORYODRate =  UserDefaults.standard.string(forKey: "nOnELECTRICALACCESSORYODRate")!
        self.fIBERTANKODRate =   UserDefaults.standard.string(forKey: "fIBERTANKODRate")!
        self.lEGALLIABILITYTOPAIDDRIVERRate =    UserDefaults.standard.string(forKey: "lEGALLIABILITYTOPAIDDRIVER")!
        self.nONELECTRICALACCESSORYODRate =   UserDefaults.standard.string(forKey: "nOnELECTRICALACCESSORYODRate")!
        self.otherODRate =    UserDefaults.standard.string(forKey: "otherodRate")!
        self.otherTPRate =   UserDefaults.standard.string(forKey: "otherTPRate")!
        self.pACOVERTOOWNERDRIVERRate =    UserDefaults.standard.string(forKey: "pacovertoownerdriverRate")!
        self.pACOVERTOPAIDDRIVERRate =   UserDefaults.standard.string(forKey: "pacovertopaidDriverRate")!
        self.pACOVERTOPASSENGERSRate =   UserDefaults.standard.string(forKey: "pacovertoPassengersRate")!
        self.uNNAMEDPACOVERTOPASSENGERSRate =  UserDefaults.standard.string(forKey: "unnamedPACoverToPAssengers")!
        self.basicOdAmount = UserDefaults.standard.string(forKey: "basicOdAmount") ?? ""
        self.BasicTPRate = UserDefaults.standard.string(forKey: "basicTpAmount") ?? ""

        self.detariffDiscountRate =    UserDefaults.standard.string(forKey: "detariffDiscountRate") ?? ""
        self.detariffLoadingRate =    UserDefaults.standard.string(forKey: "detariffLoadingRate") ?? ""
        
        if self.twoWheeler == "twoWheeler"{
            self.title_Lbl?.text = "Two Wheeler Insurance"
            self.productName = "MOTOR - MOTOR TWO WHEELER  - bundled"
//            self.vehicle = "TW"
            self.commonYear = self.fiveYear
              }else{
            self.title_Lbl?.text = "Four Wheeler Insurance"
//                   self.vehicle = "FW"
                  self.productName = "MOTOR - MOTOR PRIVATE CAR - BUNDLED";
//                                  ProductCode="2367";
                  self.commonYear = self.threeYear
              }
        self.showData()
    }
    func showData(){
        self.registrationNbr_Lbl.text = self.selectYear
        self.makeModel_Lbl.text = self.VehicleModel
        self.customerName_Lbl.text = self.name
        self.customerEmail_Lbl.text =  "yogeshinmortal@gmail.com"      //ProjectUtils.getEmailID()
        self.customerMobileNbr_Lbl.text = "9986654465"
        self.customerPin_Lbl.text = self.pincode
        self.policyDate_Lbl.text =  self.RegDate
        self.policyPlan_Lbl.text = self.customerType
        self.totalPremium_Lbl.text = self.totalPremium
        self.vehicleNumberr_Lbl.text =  self.vehicleNbr
        self.vehicleModel_Lbl.text =  self.VehicleModel
        self.vehicleBramnd_Lbl.text =   self.VehicleBrand
        self.editDesable()
    }
    func editDesable(){
        self.customerEmail_Lbl.isUserInteractionEnabled = false
        self.customerName_Lbl.isUserInteractionEnabled = false
    }
    @IBAction func termAndConditionAction(_ sender : UIButton){
        if termsConditionBtn!.isSelected == true {
            self.status = "Selected"
            self.termsConditionBtn?.setBackgroundImage(UIImage(named: "checked"), for: .normal)
             } else {
                 self.termsConditionBtn?.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
             }
        termsConditionBtn!.isSelected = !termsConditionBtn!.isSelected
    }
    
    //MARK: - button actin for show Breakup
    @IBAction func viewAllAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewPolicyShowBreakup_Vc") as! NewPolicyShowBreakup_Vc
        self.navigationController?.present(nextVc, animated: true)
//        self.dismiss(animated: true)
    }
}

//MARK: - extension for the api service calling
extension VehicleAllDetails_Vc {
    private func vehicleMotorProposalAPiService(){
let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
               "Uid": "QuylZjh9tBAutCzXpDjkTw==",
    "CustomerType":"Individual",
    "PosPolicyNo":self.quotationid, //"QUOTE882179"
    "TotalPremium":self.totalPremium,
    "ProductName":self.productName ,            //self.productname,
    "mobileno":"9837386104",
    "useremail":"shivaniinmortal@gmail.com",
    "UserName":"shivani",
    "RegistrationNumber":"",
    "ProductCode":self.productCode, //"2397"
    "Product":"",
    "BusinessType":"New",
    "VehicleClassCode":self.vehicleClassCode, //"37"
    "VehicleMakeCode":self.vehicleCode,
    "YearofManufacture":self.selectYear,
    "VehicleType":"New",
    "CubicCapacity":"0",
    "NumberOfWheels":"2",
    "ChassisNumber":self.chasisNbr,
    "EngineNumber":self.engineNbr,
    "VehicleAge":"0",
    "VehicleModelCode": self.modelCode,
    "RTOLocationCode":self.RegionCode,
    "GrossVehicleWeight":"0",
    "PlaceOfRegistration":self.city,
    "VehicleModel": self.VehicleModel,
    "DateOfFirstRegistration":self.today,
    "DateOfRegistration":self.today,
    "City":self.city,
    "SumInsured":"",
    "IDV":self.idv,
    "FuelType":"Petrol",
    "VehicleMake":self.VehicleBrand,    //"BAJAJ",
    "Fromdate":self.today,
    "Todate":self.commonYear,
    "VehicleExShowroomPrice":self.exShowRoomPrice,
    "PolicyEffectiveFrom":self.today,
    "PolicyEffectiveTo":self.commonYear,
    "BasicODStatus":"True",
               "ELECTRICALACCESSORYODStatus":self.eLECTRICALACCESSORYODStatus,
               "NONELECTRICALACCESSORYODStatus":self.nONELECTRICALACCESSORYODStatus,
               "BasicTP":self.basicTP,
               "PACOVERTOEMPLOYEESOFINSUREDStatus":self.pACOVERTOEMPLOYEESOFINSUREDStatus,
               "PACOVERTOPASSENGERSStatus":self.pACOVERTOPASSENGERSStatus,
               "PACOVERTOPAIDDRIVERStatus":self.pACOVERTOPAIDDRIVERStatus,
               "OtherTPStatus":otherTPStatus,
               "FIBERTANKODStatus": "False",     //self.fIBERTANKODStatus,
               "CNGLPGKITODStatus":self.cNGLPGKITODStatus,
               "OtherODStatus":self.otherODStatus,
               "UNNAMEDPACOVERTOPASSENGERSStatus": "False",  //self.uNNAMEDPACOVERTOPASSENGERSRate,
               "PACOVERTOOWNERDRIVERStatus":"False",
               "LEGALLIABILITYTOPAIDDRIVERStatus":self.lEGALLIABILITYTOPAIDDRIVERStatus,
               "RoadsideAssistanceStatus":self.roadsideAssistanceStatus,
               "NilDepreciationWaivercoverStatus":self.nilDepreciationWaivercoverStatus,
               "DAILYCASHALLOWANCENONMETROStatus":self.dAILYCASHALLOWANCENONMETROStatus,
               "DAILYCASHALLOWANCEStatus":self.dAILYCASHALLOWANCEStatus,
               "CNGLPGKITTPStatus":self.cNGLPGKITTPStatus,
               "DAILYCASHALLOWANCEMETROStatus":self.dAILYCASHALLOWANCEMETROStatus,
               "KEYREPLACEMENTStatus":self.kEYREPLACEMENTStatus,
               "BUILTINCNGKIT_LPGKITODStatus":self.bUILTINCNGKIT_LPGKITODStatus,
               "RETURNTOINVOICEStatus":self.rETURNTOINVOICEStatus,
               "ACCIDENTALHOSPITALIZATIONStatus":self.aCCIDENTALHOSPITALIZATIONStatus,
               "HYDROSTATICLOCKCOVERStatus":self.hYDROSTATICLOCKCOVERStatus,
               "DRIVINGTRAINPROTECTStatus":self.dRIVINGTRAINPROTECTStatus,
               "MANUFACTURERSELLINGPRICEStatus":self.mANUFACTURERSELLINGPRICEStatus,
               "COSTOFCONSUMABLESStatus":self.cOSTOFCONSUMABLESStatus,
               "BUILTINCNGKIT_LPGKITTPStatus":self.bUILTINCNGKIT_LPGKITTPStatus,
               "SECURETOWINGStatus":self.sECURETOWINGStatus,
               "TyreandRimsecureStatus":self.tyreandRimsecureStatus,
               "ENGINEPROTECTORPETROLStatus":self.eNGINEPROTECTORPETROLStatus,
               "ENGINEPROTECTORDIESELStatus":self.eNGINEPROTECTORDIESELStatus,
               "WRONGFUELCOVERStatus": self.wRONGFUELCOVERStatus,
               "PolicyStatus":"Unexpired",
               "PolicyPremium":"",
               "PolicyNo":"",
               "InsurerName":"",
               "DetariffLoadingStatus":"False",
               "DetariffDiscountStatus":"True",
               "COSTOFCONSUMABLESRate":self.cOSTOFCONSUMABLESRate,
               "NilDepreciationWaivercoverRate":self.nilDepreciationWaivercoverRate,
               "RETURNTOINVOICERate":self.rETURNTOINVOICERate,
               "ENGINEPROTECTORPETROLRate":self.eNGINEPROTECTORPETROLRate,
               "BasicODRate": self.basicOdAmount, //"0.02"
               "ELECTRICALACCESSORYODRate":self.eLECTRICALACCESSORYODRate,
               "FIBERTANKODRate":self.fIBERTANKODRate,
               "NONELECTRICALACCESSORYODRate":self.nONELECTRICALACCESSORYODRate,
               "PACOVERTOEMPLOYEESOFINSUREDRate":self.pACOVERTOEMPLOYEESOFINSUREDRate,
               "PACOVERTOOWNERDRIVERRate":self.pACOVERTOOWNERDRIVERRate,
               "PACOVERTOPAIDDRIVERRate":self.pACOVERTOPAIDDRIVERRate,
               "PACOVERTOPASSENGERSRate":self.pACOVERTOPASSENGERSRate,
               "UNNAMEDPACOVERTOPASSENGERSRate":self.uNNAMEDPACOVERTOPASSENGERSRate,
               "BasicTPRate": self.BasicTPRate,
               "OtherTPRate":self.otherTPRate,
               "OtherODRate":self.otherODRate,
               "LEGALLIABILITYTOPAIDDRIVERRate":self.lEGALLIABILITYTOPAIDDRIVERRate,
               "RoadsideAssistanceRate":self.roadsideAssistanceRate,
               "DAILYCASHALLOWANCENONMETRORate":self.dAILYCASHALLOWANCENONMETRORate,
               "DAILYCASHALLOWANCEMETRORate":self.dAILYCASHALLOWANCEMETRORate,
               "KEYREPLACEMENTRate":self.kEYREPLACEMENTRate,
               "ACCIDENTALHOSPITALIZATIONRate":self.aCCIDENTALHOSPITALIZATIONRate,
               "HYDROSTATICLOCKCOVERRate":self.hYDROSTATICLOCKCOVERRate,
               "SECURETOWINGRate":"",
               "TyreandRimsecureRate":"",
               "ENGINEPROTECTORDIESELRate":self.eNGINEPROTECTORDIESELRate,
               "DRIVINGTRAINPROTECTRate":self.dRIVINGTRAINPROTECTRate,
               "MANUFACTURERSELLINGPRICERate":self.mANUFACTURERSELLINGPRICERate,
               "DetariffLoadingRate" :self.detariffLoadingRate,
               "DetariffDiscountRate":self.detariffDiscountRate,
               "CNGLPGKITODRate":self.CNGLPGKITODRate,
               "CNGLPGKITTPRate":self.CNGLPGKITTPRate,
               "BUILTINCNGKIT_LPGKITODRate":self.bUILTINCNGKIT_LPGKITTPRate,
               "BUILTINCNGKIT_LPGKITTPRate":self.bUILTINCNGKIT_LPGKITODRate,
               "DAILYCASHALLOWANCERate":self.dAILYCASHALLOWANCERate,
               "WRONGFUELCOVERRate":"0"] as [String : Any]
        
//        "BasicODStatus":"True
//        "BasicTP":"True
//        VERTOOWNERDRIVERStatus":"True
//        DetariffLoadingRate":"True
//        "DetariffLoadingStatus":"True","DetariffDiscountRate":"True",ariffDiscountStatus":"True
        
        
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
                        self.totalfinalAmount.text  = value as! String
//                        self.totalPremium_Lbl.text = value as! String
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


