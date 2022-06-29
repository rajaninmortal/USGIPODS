//
//  RenewalPolicyVehicleDetails_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 20/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD



struct Example: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
class RenewalPolicyplanTimeCell : UICollectionViewCell{
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var precentage_Lbl : UILabel?
    @IBOutlet weak var planType_Lbl : UILabel?
    @IBOutlet weak var firstYearAmount_Lbl : UILabel?
    @IBOutlet weak var secYearAmount_Lbl : UILabel?
    @IBOutlet weak var thirdYearAmount_Lbl : UILabel?
    @IBOutlet weak var tYearName_Lbl : UILabel?
    @IBOutlet weak var fYear_View : UIView?
    @IBOutlet weak var sYear_View : UIView?
    @IBOutlet weak var tYear_View : UIView?
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var percentage_View : UIView?
    @IBOutlet weak var firstYrBtn : UIButton?
    @IBOutlet weak var secondtYrBtn : UIButton?
    @IBOutlet weak var thirdYrBtn : UIButton?
    @IBAction func oneYearAction(_ sender : UIButton){
        thirdYrBtn?.setImage(UIImage(named:"unSelected" ), for: .normal)
        firstYrBtn?.setImage(UIImage(named: "User"), for: .normal)
    }
    @IBAction func threeYearAction(_ sender : UIButton){
        thirdYrBtn?.setImage(UIImage(named: "User"), for: .normal)
        firstYrBtn?.setImage(UIImage(named: "unSelected"), for: .normal)
    }
}
class RenewalAdditionalDiscountCell : UICollectionViewCell{
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var additionalCover_Lbl : UILabel?
    @IBOutlet weak var planDetail_Lbl : UILabel?
    @IBOutlet weak var additionalCheckBtn : UIButton?
    @IBOutlet weak var checkImg : UIImageView?

        override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    @IBAction func additionalAddotnAction(_ sender : UIButton){
        additionalCheckBtn?.setImage(UIImage(named: "User"), for: .normal)
//        amountFirst?.setImage(UIImage(named: "unSelected"), for: .normal)
    }
}
class RenewalAddOnCoverageCell : UICollectionViewCell{
    @IBOutlet weak var cashallowence_Lbl : UILabel?
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var addButton : UIButton?
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var additionalCheckBtn : UIButton?

    override func awakeFromNib() {
    super.awakeFromNib()
}

@IBAction func additionalAddotnAction(_ sender : UIButton){
    additionalCheckBtn?.setImage(UIImage(named: "User"), for: .normal)
//        amountFirst?.setImage(UIImage(named: "unSelected"), for: .normal)
}
}

class RenewalPolicyVehicleDetails_Vc: BaseViewController {
    @IBOutlet weak var adjusent_View : UIView?
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var collectionViewA : UICollectionView?
    @IBOutlet weak var collectionANs_View : NSLayoutConstraint?
    @IBOutlet weak var collectionViewB : UICollectionView?
    @IBOutlet weak var collectionBNs_View : NSLayoutConstraint?
    @IBOutlet weak var name_View : UIView?
    @IBOutlet weak var additionalCover_View : UIView?
    @IBOutlet weak var comprehensive_View : UIView?
    @IBOutlet weak var addOn_view : UIView?
    @IBOutlet weak var idv_View : UIView?
    @IBOutlet weak var vehicle_Img : UIImageView?
    @IBOutlet weak var vehicleName_Txt : UITextField?
    @IBOutlet weak var vehicleNbr_Txt : UITextField?
    @IBOutlet weak var minAmount : UILabel?
    @IBOutlet weak var increasesAmount : UILabel?
    @IBOutlet weak var maxAmount_Lbl : UILabel?
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var totalpremiumAmount_Lbl : UILabel?
    @IBOutlet weak var individual_Btn : UIButton?
    @IBOutlet weak var corporate_Btn : UIButton?
    @IBOutlet weak var paCoverYes_Btn : UIButton?
    @IBOutlet weak var paCoverNo_Btn : UIButton?
    @IBOutlet weak var gpaCoverYes_Btn : UIButton?
    @IBOutlet weak var gpaCoverNo_Btn: UIButton?
    @IBOutlet weak var dlYes_Btn: UIButton?
    @IBOutlet weak var dlNo_Btn: UIButton?
    @IBOutlet weak var saveGetQuote: UIButton?
    @IBOutlet weak var continueBtn: UIButton?
    @IBOutlet weak var coverageTypeStack_View: UIStackView!
    @IBOutlet weak var additionalBtn: UIButton?
    @IBOutlet weak var getQuoteBtn: UIButton?
    @IBOutlet weak var payment_View: UIView?
    @IBOutlet weak var mSlider: UISlider!
    @IBOutlet weak var renewalTerms_View: UIView?
    @IBOutlet weak var customizeBTn: UIButton?
    @IBOutlet weak var collectionViewNsLayout: NSLayoutConstraint!
    @IBOutlet weak var idvNsView: NSLayoutConstraint!
    @IBOutlet weak var coverageTypeNsStack: NSLayoutConstraint!
    @IBOutlet weak var collectionViewANs: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBNs: NSLayoutConstraint!
    @IBOutlet weak var addon_View: UIView?
    @IBOutlet weak var additionalCovers_View: UIView?
    @IBOutlet weak var addon_NSView: NSLayoutConstraint!
    @IBOutlet weak var additionalCovers_NSView: NSLayoutConstraint!
    @IBOutlet weak var totalIdvAmount_Lbl: UILabel!

    
    @IBOutlet weak var hiddenView: UIView?
    @IBOutlet weak var hiddenViewNS: NSLayoutConstraint!

    @IBOutlet weak var hideenDoubleNs_View: UIView!
    @IBOutlet weak var hiddenDoubleeNs_View: NSLayoutConstraint!
    @IBOutlet weak var ownerName_Lbl : UILabel?
    @IBOutlet weak var expiryDate_Lbl : UILabel?
    @IBOutlet weak var expiryCountDays_Lbl : UILabel?
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var renewalIdv_Lbl: UILabel!
    @IBOutlet weak var liability_Lbl: UILabel!
    @IBOutlet weak var addon_Lbl: UILabel!
    
    @IBOutlet weak var gst_Lbl: UILabel!
    @IBOutlet weak var onDamage_Lbl: UILabel!
    @IBOutlet weak var ncb_Lbl: UILabel!
    @IBOutlet weak var netPremium_Lbl: UILabel!
    @IBOutlet weak var planType_Lbl: UILabel!
    
    @IBOutlet weak var vehicleVarient_Lbl: UILabel!
    @IBOutlet weak var vehicleModelYr_LBl: UILabel!
    @IBOutlet weak var regsitraionYear: UILabel!
    
    var listArray   = [[String:Any]]()
    var modelArray  = [[String: Any]]()
    var plan = ["Comprehensive Plan", "Third Party Plan", "Own damage(atandalone)"]
    let collection = PolicyplanTimeCell()
    let collectionA = AdditionalDiscountCell()
    var additionalCover = String();  var   eLECTRICALACCESSORYODStatus  = String(); var enginenumber = String();
    var totalPremium = String();     var   nONELECTRICALACCESSORYODStatus  = String(); var chasisNumber = String()
    var makecode = String();         var   basicTP  = String()
    var modelCode = String();        var   pACOVERTOEMPLOYEESOFINSUREDStatus  = String()
    var rtoCode = String();          var   pACOVERTOPASSENGERSStatus  = String()
    var city = String();             var   pACOVERTOPAIDDRIVERStatus = String()
    var regDate = String();          var   otherTPStatus = String()
    var coverdata = [String]();      var   fIBERTANKODStatus = String()
    var coverdatad = [String]();     var   otherODStatus = String()
    var addonCoverdata = [String](); var   uNNAMEDPACOVERTOPASSENGERSStatus = String()
    let datePicker  = UIDatePicker(); var  pACOVERTOOWNERDRIVERStatus = String()
    var afterday  = String();        var   lEGALLIABILITYTOPAIDDRIVERStatus = String()
    var today  = String();           var   roadsideAssistanceStatus = String()
    var yearlater  = String();       var   nilDepreciationWaivercoverStatus = String()
    var threeYear = String();        var   dAILYCASHALLOWANCENONMETROStatus = String()
    var dateData = Date();           var   dAILYCASHALLOWANCEMETROStatus = String()
    let dated = Date();              var   kEYREPLACEMENTStatus = String()
    let formatter = DateFormatter(); var   rETURNTOINVOICEStatus = String()
    var selectYear = String();       var   aCCIDENTALHOSPITALIZATIONStatus = String()
    var VehicleBrand = String();     var   hYDROSTATICLOCKCOVERStatus = String()
    var productName = String();      var   cOSTOFCONSUMABLESStatus = String()
    var productCode = String();      var   sECURETOWINGStatus = String()
    var  newPolicy   = String();     var   tyreandRimsecureStatus = String()
    var twoWheeler  = String();      var   eNGINEPROTECTORPETROLStatus = String()
    var newVehicle  = String();      var   eNGINEPROTECTORDIESELStatus = String()
    var oldVehicle  = String();      var   basicODStatus = String()
    var vehicleAge = Int();var vehicleCode = String(); var vehicleModel = String();var totalpremium  = String()
    var vehicleClassCode = String(); var numberofWheel = String(); var quotationid = String();var idv = String(); var registrationNbr = String()
    var commonYear = String(); var customerType = String(); var exShowRoomPrice = String();var registration = String(); var vehicle = String(); var makeCode = String();var make = String(); var model = String(); var state = String(); var calculated = Int();var cityState = String(); var currentYear  = Int();var result = Int(); var regNumber = String(); var regYear = String(); var regDateChange = String();var addresses = String()
    var presentAdd = String(); var permanentAddress = String();var renewalQuote = String()
    var fiveYear = String();var rsDate = String(); var calIdv = String()
    //MARK: -  view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionViewA?.delegate = self
        self.collectionViewA?.dataSource = self
        self.collectionViewB?.delegate = self
        self.collectionViewB?.dataSource = self
        self.cornerRadious()
        self.retrieveData()
        self.fieldsforservice()
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

        self.commonYear = self.today
        self.currentYear = Calendar.current.component(.year, from: Date())

//        self.hiddenView?.isHidden = true
//        self.hiddenViewNS?.constant = 0
        self.getJson { (json) in
            print("ID: \(json.title)")
        }
//        self.adjusent_View?.frame.size.height = 800
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        self.navigationController?.navigationBar.isHidden = true
//        self.mSlider.addTarget(self, action: #selector(NewpolicyVehicleAddons_Vc.onLuminosityChange), for: UIControl.Event.valueChanged)
//        self.getRtoDetailsAPi()
        
        
        
        let count = addonCoverdata.count
        let countt = coverdatad.count

        if count == 0{
            self.collectionViewB?.isHidden = true
            self.collectionBNs_View?.constant = 0
        }else if countt == 0{
            self.collectionViewA?.isHidden = true
            self.collectionANs_View?.constant = 0
           
        }else{
            self.collectionViewB?.isHidden = false
            self.collectionBNs_View?.constant = 140
            self.collectionViewA?.isHidden = true
            self.collectionANs_View?.constant = 160
        }
        
        mSlider.minimumValue = 0
        mSlider.maximumValue =   Float(self.calIdv) ?? 0
        
    }
    
    
//   @objc  func onLuminosityChange(){
//        let value = self.mSlider.value
//       self.increasesAmount?.text = "\(value)"
//    }
//
    func hidden(){
        self.hiddenView?.isHidden = true
        self.hiddenViewNS.constant = 0
//        self.adjusent_View?.frame.size.height = 800
    }
    func retrieve(){
      let OwnerName = UserDefaults.standard.string(forKey: "Name")
        self.ownerName_Lbl?.text =  "\("Hello!" + "  " + OwnerName!)"
        self.registrationNbr  = UserDefaults.standard.string(forKey: "RegistrationNbr")!

      }
    func cornerRadious(){
        self.saveGetQuote?.layer.cornerRadius = 20
        self.saveGetQuote?.layer.borderWidth = 0.5
        self.continueBtn?.layer.cornerRadius = 20
        self.name_View?.layer.cornerRadius = 10
        self.renewalTerms_View?.layer.cornerRadius = 10
        self.getQuoteBtn?.layer.cornerRadius = 20
        self.getQuoteBtn?.layer.borderWidth = 1
        self.getQuoteBtn?.layer.borderColor = UIColor.red.cgColor
        self.customizeBTn?.layer.cornerRadius = 20
        self.customizeBTn?.layer.borderWidth = 1
        self.customizeBTn?.layer.borderColor = UIColor.red.cgColor
        self.name_View?.setShadow(shadowRadius: 5)
        self.renewalTerms_View?.setShadow(shadowRadius: 5)
        self.renewalTerms_View?.setShadow(shadowRadius: 5)
        self.payment_View?.addTopShadow()
        }
    @IBAction func customizeCategoryAction(_ sender: UIButton){
        self.hiddenView?.isHidden = false
        self.hiddenViewNS?.constant = 1460
            self.adjusent_View?.frame.size.height = 2230
        self.tableView.tableHeaderView?.frame.size.height = 4200
        self.setparam()
    }
    
    @IBAction func contiueAction(){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "RenewalVehicleSummary_Vc") as!   RenewalVehicleSummary_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    @IBAction func backAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - button actin for the terms and condition
    @IBAction func dlYesAction(_ sender: UIButton){
        if dlYes_Btn?.isSelected == true{
            dlYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            dlNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for the terms and condition
    @IBAction func dlNoAction(_ sender: UIButton){
        if dlNo_Btn?.isSelected == true{
            dlNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            dlYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for the gpa Cover yes Action
    @IBAction func gpaCoverYesAction(_ sender: UIButton){
        if gpaCoverYes_Btn?.isSelected == true{
            gpaCoverYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            gpaCoverNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for the gpa Cover No Action
    @IBAction func gpaCoverNoAction(_ sender: UIButton){
        if gpaCoverNo_Btn?.isSelected == true{
            gpaCoverNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            gpaCoverYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for personal covers yes
    @IBAction func personalYesCoverAction(_ sender: UIButton){
        if paCoverYes_Btn?.isSelected == true{
            paCoverYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            paCoverNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for personal covers No
    @IBAction func personalNoCoverAction(_ sender: UIButton){
        if paCoverNo_Btn?.isSelected == true{
            paCoverNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            paCoverYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for the corporate Action
    @IBAction func corporateAction(_ sender: UIButton){
        if corporate_Btn?.isSelected == true{
            self.customerType = "Corporate"
            corporate_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            individual_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for individual Action
    @IBAction func individualAction(_ sender: UIButton){
        if individual_Btn?.isSelected == true{
            self.customerType = "Individual"
            individual_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            corporate_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    
    //MARK: -  slider button action
    @IBAction func clickToSliderPrice(_ sender: UISlider) {
           
           let value = Float(sender.value)
           
        self.totalIdvAmount_Lbl?.text = String(format: "%.0f", value)
           
           
       }
    //MARK: -  retrieve data
        func retrieveData(){
            
//            self.regDate          =   UserDefaults.standard.string(forKey: "RegDate")!
//            self.makecode         =   UserDefaults.standard.string(forKey: "vehicleCode")!
//            self.modelCode        =    UserDefaults.standard.string(forKey: "modelCode")!
//            self.rtoCode          =   UserDefaults.standard.string(forKey: "RegionCode")!
//            self.city             =  UserDefaults.standard.string(forKey: "RtoLocation")!
//            self.VehicleBrand     =  UserDefaults.standard.string(forKey: "VehicleBrand")!
//            self.newPolicy        =  UserDefaults.standard.string(forKey: "NewPolicy")!
//            self.twoWheeler       =  UserDefaults.standard.string(forKey: "TwoWheeler")!
//            self.oldVehicle       = UserDefaults.standard.string(forKey: "newVehicle")!
//            self.vehicleAge       =  UserDefaults.standard.integer(forKey: "VehicleAge")
//            self.vehicleClassCode =  UserDefaults.standard.string(forKey: "VehicleClassCode")!
//            self.productName      =  UserDefaults.standard.string(forKey: "productName")!
//            self.productCode      =  UserDefaults.standard.string(forKey: "productCode")!
//            self.vehicleCode      =  UserDefaults.standard.string(forKey: "vehicleCode")!
//            self.vehicleModel     = UserDefaults.standard.string(forKey: "VehicleModel")!
//            self.numberofWheel    = UserDefaults.standard.string(forKey: "NumberofWheel")!
            
            self.make  =    UserDefaults.standard.string(forKey: "Make")!
            self.model =    UserDefaults.standard.string(forKey: "Model")!
            
            self.vehicle =     UserDefaults.standard.string(forKey: "VehicleType")!
            if self.vehicle == "FW"{
                self.vehicleClassCode = "45"
                self.numberofWheel = "4"
                self.productCode = "2311"
                self.productName = "TWO WHEELER PACKAGE POLICY"
            }else{
                self.vehicleClassCode = "37"
                self.numberofWheel = "2"
                self.productCode = "2312"
                self.productName = "TWO WHEELER PACKAGE POLICY"
            }
            self.selectYear  =   UserDefaults.standard.string(forKey: "manufacturingYear")!
            let policyNumber =  UserDefaults.standard.string(forKey: "policyNumber")!
            let policyType   = UserDefaults.standard.string(forKey: "policyType")!
            let insCompName  =   UserDefaults.standard.string(forKey: "insCompName")!
            let policyStartDate =  UserDefaults.standard.string(forKey: "policyStartDate")!
            let variant         = UserDefaults.standard.string(forKey: "variant")!
            let policyID =  UserDefaults.standard.string(forKey: "policyID")!
            let clientUserID =    UserDefaults.standard.string(forKey: "clientUserID")!
            let coverageDetails =   UserDefaults.standard.string(forKey: "coverageDetails")!
//            self.registration =   UserDefaults.standard.string(forKey: "registration")!

//            self.enginenumber =  UserDefaults.standard.string( forKey: "engineNo")!
//            self.chasisNumber =  UserDefaults.standard.string( forKey: "chasisNo")!
            self.totalpremium = UserDefaults.standard.string(forKey: "totalpremium")!
            self.idv =  UserDefaults.standard.string(forKey: "idv")!
            self.vehicleName_Txt?.text = self.vehicleModel
            self.ownerName_Lbl?.text =  UserDefaults.standard.string(forKey: "Name")!
            self.registrationNbr  = UserDefaults.standard.string(forKey: "RegistrationNbr")!
        }
    //MARK: - field for the service
    func fieldsforservice(){
        self.eLECTRICALACCESSORYODStatus  = "True"
        self.nONELECTRICALACCESSORYODStatus  = "True"
        self.basicTP  = "True"
        self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "True"
        self.pACOVERTOPASSENGERSStatus  = "True"
        self.pACOVERTOPAIDDRIVERStatus = "True"
        self.otherTPStatus = "True"
        self.fIBERTANKODStatus = "True"
        self.otherODStatus = "True"
        self.uNNAMEDPACOVERTOPASSENGERSStatus = "True"
        self.pACOVERTOOWNERDRIVERStatus = "True"
        self.lEGALLIABILITYTOPAIDDRIVERStatus = "True"
        self.roadsideAssistanceStatus = "True"
        self.nilDepreciationWaivercoverStatus = "True"
        self.dAILYCASHALLOWANCENONMETROStatus = "True"
        self.dAILYCASHALLOWANCEMETROStatus = "True"
        self.kEYREPLACEMENTStatus = "True"
        self.rETURNTOINVOICEStatus = "True"
        self.aCCIDENTALHOSPITALIZATIONStatus = "True"
        self.hYDROSTATICLOCKCOVERStatus = "True"
        self.cOSTOFCONSUMABLESStatus = "True"
        self.sECURETOWINGStatus = "True"
        self.tyreandRimsecureStatus = "True"
        self.eNGINEPROTECTORPETROLStatus = "True"
        self.eNGINEPROTECTORDIESELStatus = "True"
        self.basicODStatus = "True"
    }
    func saveData(){
        UserDefaults.standard.set(self.quotationid, forKey: "quoteId")
        UserDefaults.standard.set(self.totalPremium, forKey: "totalPremium")
        UserDefaults.standard.set(self.customerType, forKey: "customerType")
        UserDefaults.standard.set( self.exShowRoomPrice, forKey: "ExShowRoomPrice")
        UserDefaults.standard.set(self.addresses, forKey: "Address")
        UserDefaults.standard.set(self.state, forKey: "CommunState")
        UserDefaults.standard.set(self.commonYear, forKey: "CommonYear")
        UserDefaults.standard.set(self.result, forKey: "VehicleAge")
        UserDefaults.standard.set(self.enginenumber, forKey: "engineNbr")
        UserDefaults.standard.set(self.chasisNumber, forKey: "chesisNbr")
        UserDefaults.standard.set(self.vehicleNbr_Txt?.text, forKey: "RegistraionNbr")
        UserDefaults.standard.set(self.productCode, forKey: "productCode")
        UserDefaults.standard.set(self.regDate, forKey: "RegYear")
        UserDefaults.standard.set(self.regDateChange, forKey: "RegDate")
        UserDefaults.standard.set(self.vehicleClassCode, forKey: "vehicleClassCode")
        UserDefaults.standard.set(self.vehicleCode, forKey: "vehicleCode")
        UserDefaults.standard.set(self.make, forKey: "vehicleMake")
        UserDefaults.standard.set(self.city, forKey: "city")
        UserDefaults.standard.set( self.permanentAddress, forKey: "permanentAddress")
        UserDefaults.standard.set(self.presentAdd, forKey: "presentAdd")
        UserDefaults.standard.set(self.rtoCode, forKey: "rtoCode")
        UserDefaults.standard.set(self.renewalQuote, forKey: "renewalQuote")

        

    }
    //MARK: -  func for the set status
    func setparam(){
        if self.make == "MARUTI" || self.model == "ALTO 800 LXI"{
                 if self.result <= 10  &&  self.result <= 5 {
                     self.eLECTRICALACCESSORYODStatus  = "False"
                     self.nONELECTRICALACCESSORYODStatus  = "False"
                     self.basicTP  = "False"
                     self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                     self.pACOVERTOPASSENGERSStatus  = "False"
                     self.pACOVERTOPAIDDRIVERStatus = "False"
                     self.otherTPStatus = "False"
                     self.fIBERTANKODStatus = "False"
                     self.otherODStatus = "False"
                     self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                     self.pACOVERTOOWNERDRIVERStatus = "False"
                     self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                     self.roadsideAssistanceStatus = "True"
                     self.nilDepreciationWaivercoverStatus = "True"
                     self.dAILYCASHALLOWANCENONMETROStatus = "False"
                     self.dAILYCASHALLOWANCEMETROStatus = "False"
                     self.kEYREPLACEMENTStatus = "False"
                     self.rETURNTOINVOICEStatus = "True"
                     self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                     self.hYDROSTATICLOCKCOVERStatus = "False"
                     self.cOSTOFCONSUMABLESStatus = "True"
                     self.sECURETOWINGStatus = "False"
                     self.tyreandRimsecureStatus = "False"
                     self.eNGINEPROTECTORPETROLStatus = "True"
                     self.eNGINEPROTECTORDIESELStatus = "False"
                     self.basicODStatus = "False"
                     self.vehicleMotorGetQuote()
                 }  else if self.result <= 10 && self.result >= 5 {
                     self.eLECTRICALACCESSORYODStatus  = "False"
                     self.nONELECTRICALACCESSORYODStatus  = "False"
                     self.basicTP  = "False"
                     self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                     self.pACOVERTOPASSENGERSStatus  = "False"
                     self.pACOVERTOPAIDDRIVERStatus = "False"
                     self.otherTPStatus = "False"
                     self.fIBERTANKODStatus = "False"
                     self.otherODStatus = "False"
                     self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                     self.pACOVERTOOWNERDRIVERStatus = "False"
                     self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                     self.roadsideAssistanceStatus = "True"
                     self.nilDepreciationWaivercoverStatus = "True"
                     self.dAILYCASHALLOWANCENONMETROStatus = "False"
                     self.dAILYCASHALLOWANCEMETROStatus = "False"
                     self.kEYREPLACEMENTStatus = "False"
                     self.rETURNTOINVOICEStatus = "False"
                     self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                     self.hYDROSTATICLOCKCOVERStatus = "False"
                     self.cOSTOFCONSUMABLESStatus = "True"
                     self.sECURETOWINGStatus = "False"
                     self.tyreandRimsecureStatus = "False"
                     self.eNGINEPROTECTORPETROLStatus = "False"
                     self.eNGINEPROTECTORDIESELStatus = "False"
                     self.basicODStatus = "False"
                     self.vehicleMotorGetQuote()
                 }else{
                     self.eLECTRICALACCESSORYODStatus  = "False"
                     self.nONELECTRICALACCESSORYODStatus  = "False"
                     self.basicTP  = "False"
                     self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                     self.pACOVERTOPASSENGERSStatus  = "False"
                     self.pACOVERTOPAIDDRIVERStatus = "False"
                     self.otherTPStatus = "False"
                     self.fIBERTANKODStatus = "False"
                     self.otherODStatus = "False"
                     self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                     self.pACOVERTOOWNERDRIVERStatus = "False"
                     self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                     self.roadsideAssistanceStatus = "False"
                     self.nilDepreciationWaivercoverStatus = "False"
                     self.dAILYCASHALLOWANCENONMETROStatus = "False"
                     self.dAILYCASHALLOWANCEMETROStatus = "False"
                     self.kEYREPLACEMENTStatus = "False"
                     self.rETURNTOINVOICEStatus = "False"
                     self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                     self.hYDROSTATICLOCKCOVERStatus = "False"
                     self.cOSTOFCONSUMABLESStatus = "False"
                     self.sECURETOWINGStatus = "False"
                     self.tyreandRimsecureStatus = "False"
                     self.eNGINEPROTECTORPETROLStatus = "False"
                     self.eNGINEPROTECTORDIESELStatus = "False"
                     self.basicODStatus = "False"
                     self.vehicleMotorGetQuote()
                 }
                 }else if self.make == "Honda"{
                     if self.result <= 5 && self.result <= 7 {
                         self.eLECTRICALACCESSORYODStatus  = "False"
                         self.nONELECTRICALACCESSORYODStatus  = "False"
                         self.basicTP  = "False"
                         self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                         self.pACOVERTOPASSENGERSStatus  = "False"
                         self.pACOVERTOPAIDDRIVERStatus = "False"
                         self.otherTPStatus = "False"
                         self.fIBERTANKODStatus = "False"
                         self.otherODStatus = "False"
                         self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                         self.pACOVERTOOWNERDRIVERStatus = "False"
                         self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                         self.roadsideAssistanceStatus = "False"
                         self.nilDepreciationWaivercoverStatus = "True"
                         self.dAILYCASHALLOWANCENONMETROStatus = "True"
                         self.dAILYCASHALLOWANCEMETROStatus = "True"
                         self.kEYREPLACEMENTStatus = "True"
                         self.rETURNTOINVOICEStatus = "True"
                         self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                         self.hYDROSTATICLOCKCOVERStatus = "False"
                         self.cOSTOFCONSUMABLESStatus = "False"
                         self.sECURETOWINGStatus = "False"
                         self.tyreandRimsecureStatus = "True"
                         self.eNGINEPROTECTORPETROLStatus = "False"
                         self.eNGINEPROTECTORDIESELStatus = "False"
                         self.basicODStatus = "False"
                         self.vehicleMotorGetQuote()
                        }else if self.result <= 7 && self.result >= 5{
                            self.eLECTRICALACCESSORYODStatus  = "False"
                            self.nONELECTRICALACCESSORYODStatus  = "False"
                            self.basicTP  = "False"
                            self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                            self.pACOVERTOPASSENGERSStatus  = "False"
                            self.pACOVERTOPAIDDRIVERStatus = "False"
                            self.otherTPStatus = "False"
                            self.fIBERTANKODStatus = "False"
                            self.otherODStatus = "False"
                            self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                            self.pACOVERTOOWNERDRIVERStatus = "False"
                            self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                            self.roadsideAssistanceStatus = "False"
                            self.nilDepreciationWaivercoverStatus = "False"
                            self.dAILYCASHALLOWANCENONMETROStatus = "False"
                            self.dAILYCASHALLOWANCEMETROStatus = "False"
                            self.kEYREPLACEMENTStatus = "False"
                            self.rETURNTOINVOICEStatus = "False"
                            self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                            self.hYDROSTATICLOCKCOVERStatus = "False"
                            self.cOSTOFCONSUMABLESStatus = "False"
                            self.sECURETOWINGStatus = "False"
                            self.tyreandRimsecureStatus = "False"
                            self.eNGINEPROTECTORPETROLStatus = "False"
                            self.eNGINEPROTECTORDIESELStatus = "False"
                            self.basicODStatus = "False"
                            self.vehicleMotorGetQuote()
                        }else{
                            self.eLECTRICALACCESSORYODStatus  = "False"
                            self.nONELECTRICALACCESSORYODStatus  = "False"
                            self.basicTP  = "False"
                            self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                            self.pACOVERTOPASSENGERSStatus  = "False"
                            self.pACOVERTOPAIDDRIVERStatus = "False"
                            self.otherTPStatus = "False"
                            self.fIBERTANKODStatus = "False"
                            self.otherODStatus = "False"
                            self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                            self.pACOVERTOOWNERDRIVERStatus = "False"
                            self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                            self.roadsideAssistanceStatus = "False"
                            self.nilDepreciationWaivercoverStatus = "False"
                            self.dAILYCASHALLOWANCENONMETROStatus = "False"
                            self.dAILYCASHALLOWANCEMETROStatus = "False"
                            self.kEYREPLACEMENTStatus = "False"
                            self.rETURNTOINVOICEStatus = "False"
                            self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                            self.hYDROSTATICLOCKCOVERStatus = "False"
                            self.cOSTOFCONSUMABLESStatus = "False"
                            self.sECURETOWINGStatus = "False"
                            self.tyreandRimsecureStatus = "False"
                            self.eNGINEPROTECTORPETROLStatus = "False"
                            self.eNGINEPROTECTORDIESELStatus = "False"
                            self.basicODStatus = "False"
                            self.vehicleMotorGetQuote()
                        }
                 }else if self.make == "Tata" || self.make == "TATA MOTORS LIMITED"{
                     if self.result <= 10 && self.result <= 5 && self.result <= 7 {
                         self.eLECTRICALACCESSORYODStatus  = "False"
                         self.nONELECTRICALACCESSORYODStatus  = "False"
                         self.basicTP  = "False"
                         self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                         self.pACOVERTOPASSENGERSStatus  = "False"
                         self.pACOVERTOPAIDDRIVERStatus = "False"
                         self.otherTPStatus = "False"
                         self.fIBERTANKODStatus = "False"
                         self.otherODStatus = "False"
                         self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                         self.pACOVERTOOWNERDRIVERStatus = "False"
                         self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                         self.roadsideAssistanceStatus = "True"
                         self.nilDepreciationWaivercoverStatus = "True"
                         self.dAILYCASHALLOWANCENONMETROStatus = "False"
                         self.dAILYCASHALLOWANCEMETROStatus = "False"
                         self.kEYREPLACEMENTStatus = "True"
                         self.rETURNTOINVOICEStatus = "True"
                         self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                         self.hYDROSTATICLOCKCOVERStatus = "False"
                         self.cOSTOFCONSUMABLESStatus = "True"
                         self.sECURETOWINGStatus = "True"
                         self.tyreandRimsecureStatus = "False"
                         self.eNGINEPROTECTORPETROLStatus = "False"
                         self.eNGINEPROTECTORDIESELStatus = "True"
                         self.basicODStatus = "False"
                         self.vehicleMotorGetQuote()
                            }
                     else if self.result <= 10 && self.result <= 7 && self.result > 5 {
                         self.eLECTRICALACCESSORYODStatus  = "False"
                         self.nONELECTRICALACCESSORYODStatus  = "False"
                         self.basicTP  = "False"
                         self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                         self.pACOVERTOPASSENGERSStatus  = "False"
                         self.pACOVERTOPAIDDRIVERStatus = "False"
                         self.otherTPStatus = "False"
                         self.fIBERTANKODStatus = "False"
                         self.otherODStatus = "False"
                         self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                         self.pACOVERTOOWNERDRIVERStatus = "False"
                         self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                         self.roadsideAssistanceStatus = "True"
                         self.nilDepreciationWaivercoverStatus = "True"
                         self.dAILYCASHALLOWANCENONMETROStatus = "False"
                         self.dAILYCASHALLOWANCEMETROStatus = "False"
                         self.kEYREPLACEMENTStatus = "True"
                         self.rETURNTOINVOICEStatus = "True"
                         self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                         self.hYDROSTATICLOCKCOVERStatus = "False"
                         self.cOSTOFCONSUMABLESStatus = "True"
                         self.sECURETOWINGStatus = "True"
                         self.tyreandRimsecureStatus = "False"
                         self.eNGINEPROTECTORPETROLStatus = "True"
                         self.eNGINEPROTECTORDIESELStatus = "False"
                         self.basicODStatus = "False"
                         self.vehicleMotorGetQuote()
                }else if self.result <= 10 && self.result > 7 && self.result > 5{
                    self.eLECTRICALACCESSORYODStatus  = "False"
                    self.nONELECTRICALACCESSORYODStatus  = "False"
                    self.basicTP  = "False"
                    self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                    self.pACOVERTOPASSENGERSStatus  = "False"
                    self.pACOVERTOPAIDDRIVERStatus = "False"
                    self.otherTPStatus = "False"
                    self.fIBERTANKODStatus = "False"
                    self.otherODStatus = "False"
                    self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                    self.pACOVERTOOWNERDRIVERStatus = "False"
                    self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                    self.roadsideAssistanceStatus = "True"
                    self.nilDepreciationWaivercoverStatus = "False"
                    self.dAILYCASHALLOWANCENONMETROStatus = "False"
                    self.dAILYCASHALLOWANCEMETROStatus = "False"
                    self.kEYREPLACEMENTStatus = "False"
                    self.rETURNTOINVOICEStatus = "False"
                    self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                    self.hYDROSTATICLOCKCOVERStatus = "False"
                    self.cOSTOFCONSUMABLESStatus = "False"
                    self.sECURETOWINGStatus = "False"
                    self.tyreandRimsecureStatus = "False"
                    self.eNGINEPROTECTORPETROLStatus = "True"
                    self.eNGINEPROTECTORDIESELStatus = "False"
                    self.basicODStatus = "False"
                    self.vehicleMotorGetQuote()
                          }else{
                    self.eLECTRICALACCESSORYODStatus  = "False"
                    self.nONELECTRICALACCESSORYODStatus  = "False"
                    self.basicTP  = "False"
                    self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                    self.pACOVERTOPASSENGERSStatus  = "False"
                    self.pACOVERTOPAIDDRIVERStatus = "False"
                    self.otherTPStatus = "False"
                    self.fIBERTANKODStatus = "False"
                    self.otherODStatus = "False"
                    self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                    self.pACOVERTOOWNERDRIVERStatus = "False"
                    self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                    self.roadsideAssistanceStatus = "False"
                    self.nilDepreciationWaivercoverStatus = "False"
                    self.dAILYCASHALLOWANCENONMETROStatus = "False"
                    self.dAILYCASHALLOWANCEMETROStatus = "False"
                    self.kEYREPLACEMENTStatus = "False"
                    self.rETURNTOINVOICEStatus = "False"
                    self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                    self.hYDROSTATICLOCKCOVERStatus = "False"
                    self.cOSTOFCONSUMABLESStatus = "False"
                    self.sECURETOWINGStatus = "False"
                    self.tyreandRimsecureStatus = "False"
                    self.eNGINEPROTECTORPETROLStatus = "True"
                    self.eNGINEPROTECTORDIESELStatus = "False"
                    self.basicODStatus = "False"
                              self.vehicleMotorGetQuote()
                          }
                       }else if self.result <= 10 && self.result <= 5 && self.result  <= 7 {
                        self.eLECTRICALACCESSORYODStatus  = "False"
                        self.nONELECTRICALACCESSORYODStatus  = "False"
                        self.basicTP  = "False"
                        self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                        self.pACOVERTOPASSENGERSStatus  = "False"
                        self.pACOVERTOPAIDDRIVERStatus = "False"
                        self.otherTPStatus = "False"
                        self.fIBERTANKODStatus = "False"
                        self.otherODStatus = "False"
                        self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                        self.pACOVERTOOWNERDRIVERStatus = "False"
                        self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                        self.roadsideAssistanceStatus = "True"
                        self.nilDepreciationWaivercoverStatus = "True"
                        self.dAILYCASHALLOWANCENONMETROStatus = "True"
                        self.dAILYCASHALLOWANCEMETROStatus = "True"
                        self.kEYREPLACEMENTStatus = "True"
                        self.rETURNTOINVOICEStatus = "False"
                        self.aCCIDENTALHOSPITALIZATIONStatus = "True"
                        self.hYDROSTATICLOCKCOVERStatus = "False"
                        self.cOSTOFCONSUMABLESStatus = "True"
                        self.sECURETOWINGStatus = "True"
                        self.tyreandRimsecureStatus = "False"
                        self.eNGINEPROTECTORPETROLStatus = "True"
                        self.eNGINEPROTECTORDIESELStatus = "True"
                        self.basicODStatus = "False"
                           self.vehicleMotorGetQuote()
                }else if self.result <= 10 && self.result <= 7 && self.result > 5{
                                             self.eLECTRICALACCESSORYODStatus  = "False"
                                             self.nONELECTRICALACCESSORYODStatus  = "False"
                                             self.basicTP  = "False"
                                             self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                                             self.pACOVERTOPASSENGERSStatus  = "False"
                                             self.pACOVERTOPAIDDRIVERStatus = "False"
                                             self.otherTPStatus = "False"
                                             self.fIBERTANKODStatus = "False"
                                             self.otherODStatus = "False"
                                             self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                                             self.pACOVERTOOWNERDRIVERStatus = "False"
                                             self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                                             self.roadsideAssistanceStatus = "True"
                                             self.nilDepreciationWaivercoverStatus = "True"
                                             self.dAILYCASHALLOWANCENONMETROStatus = "False"
                                             self.dAILYCASHALLOWANCEMETROStatus = "False"
                                             self.kEYREPLACEMENTStatus = "False"
                                             self.rETURNTOINVOICEStatus = "False"
                                             self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                                             self.hYDROSTATICLOCKCOVERStatus = "False"
                                             self.cOSTOFCONSUMABLESStatus = "True"
                                             self.sECURETOWINGStatus = "False"
                                             self.tyreandRimsecureStatus = "False"
                                             self.eNGINEPROTECTORPETROLStatus = "True"
                                             self.eNGINEPROTECTORDIESELStatus = "True"
                                             self.basicODStatus = "False"
                                            self.vehicleMotorGetQuote()
                                         }
                                         else if self.result <= 10 && self.result > 7 && self.result  > 5{
                                             self.eLECTRICALACCESSORYODStatus  = "False"
                                             self.nONELECTRICALACCESSORYODStatus  = "False"
                                             self.basicTP  = "False"
                                             self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                                             self.pACOVERTOPASSENGERSStatus  = "False"
                                             self.pACOVERTOPAIDDRIVERStatus = "False"
                                             self.otherTPStatus = "False"
                                             self.fIBERTANKODStatus = "False"
                                             self.otherODStatus = "False"
                                             self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                                             self.pACOVERTOOWNERDRIVERStatus = "False"
                                             self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                                             self.roadsideAssistanceStatus = "True"
                                             self.nilDepreciationWaivercoverStatus = "False"
                                             self.dAILYCASHALLOWANCENONMETROStatus = "False"
                                             self.dAILYCASHALLOWANCEMETROStatus = "False"
                                             self.kEYREPLACEMENTStatus = "False"
                                             self.rETURNTOINVOICEStatus = "False"
                                             self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                                             self.hYDROSTATICLOCKCOVERStatus = "False"
                                             self.cOSTOFCONSUMABLESStatus = "False"
                                             self.sECURETOWINGStatus = "False"
                                             self.tyreandRimsecureStatus = "False"
                                             self.eNGINEPROTECTORPETROLStatus = "False"
                                             self.eNGINEPROTECTORDIESELStatus = "False"
                                             self.basicODStatus = "False"
                                             self.vehicleMotorGetQuote()
                                         }
                                         else{
                                             self.eLECTRICALACCESSORYODStatus  = "False"
                                             self.nONELECTRICALACCESSORYODStatus  = "False"
                                             self.basicTP  = "False"
                                             self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
                                             self.pACOVERTOPASSENGERSStatus  = "False"
                                             self.pACOVERTOPAIDDRIVERStatus = "False"
                                             self.otherTPStatus = "False"
                                             self.fIBERTANKODStatus = "False"
                                             self.otherODStatus = "False"
                                             self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
                                             self.pACOVERTOOWNERDRIVERStatus = "False"
                                             self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
                                             self.roadsideAssistanceStatus = "False"
                                             self.nilDepreciationWaivercoverStatus = "False"
                                             self.dAILYCASHALLOWANCENONMETROStatus = "False"
                                             self.dAILYCASHALLOWANCEMETROStatus = "False"
                                             self.kEYREPLACEMENTStatus = "False"
                                             self.rETURNTOINVOICEStatus = "False"
                                             self.aCCIDENTALHOSPITALIZATIONStatus = "False"
                                             self.hYDROSTATICLOCKCOVERStatus = "False"
                                             self.cOSTOFCONSUMABLESStatus = "False"
                                             self.sECURETOWINGStatus = "False"
                                             self.tyreandRimsecureStatus = "False"
                                             self.eNGINEPROTECTORPETROLStatus = "False"
                                             self.eNGINEPROTECTORDIESELStatus = "False"
                                             self.basicODStatus = "False"
                                             self.vehicleMotorGetQuote()
                                         }
                                     }

         
                
    //MARK: -  cell button check
    @objc  func firstYrTappde(){
        self.commonYear = yearlater
    }
    @objc  func secondYrTappde(){
        collection.firstYrBtn?.isSelected = false
        collection.secondtYrBtn?.isSelected = false
        collection.thirdYrBtn?.isSelected = true
        collection.secondtYrBtn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
        collection.firstYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        collection.thirdYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
    }
    @objc  func thirdYrTappde(){
        if self.twoWheeler == "twoWheeler"{
            self.productName = "MOTOR - MOTOR TWO WHEELER  - BUNDLED"
            self.productCode = "2369"
            self.commonYear = fiveYear
            self.vehicleMotorGetQuote()
        }else{
            self.productName = "MOTOR - MOTOR PRIVATE CAR - BUNDLED"
            self.productCode = "2367"
                self.commonYear = threeYear
                self.vehicleMotorGetQuote()
    }
    }
    func serverToLocal(date:String) -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let localDate = dateFormatter.date(from: date)
            return localDate
        }
        func ConverDateFormate(date:Date) -> String{
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy"
           let myDate = formatter.string(from:date)
           return myDate
       }

   
}
//MARK: - extension for the collectionview
extension RenewalPolicyVehicleDetails_Vc : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            return plan.count
        }else if  collectionView == self.collectionViewA{
            //   let count = coverdata.count + coverdatad.count
            return coverdatad.count   //coverArray.count
        }else{
            return addonCoverdata.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RenewalPolicyplanTimeCell", for: indexPath) as! RenewalPolicyplanTimeCell
            
            if indexPath.row == 0 {
                cell.fYear_View?.isHidden = false
                cell.tYear_View?.isHidden = false
                cell.fYear_View?.layer.cornerRadius = 5
                cell.tYear_View?.layer.cornerRadius = 5
                cell.fYear_View?.layer.borderWidth  = 1
                cell.tYear_View?.layer.borderWidth  = 1
                if self.twoWheeler == "twoWheeler"{
                    cell.tYearName_Lbl?.text = "5 Year"
                   
                    }else{
                    cell.tYearName_Lbl?.text = "3 Year"
//                    self.productName = "MOTOR - MOTOR PRIVATE CAR - BUNDLED"
//                    self.productCode = "2367"
//                        self.commonYear = fiveYear
//                        self.vehicleMotorGetQuote()
                   }
            }else if indexPath.row == 1{
                cell.fYear_View?.isHidden = false
                cell.tYear_View?.isHidden = true
                cell.fYear_View?.layer.cornerRadius = 5
                cell.tYear_View?.layer.cornerRadius = 5
                cell.fYear_View?.layer.borderWidth  = 1
                cell.tYear_View?.layer.borderWidth  = 1
                if self.twoWheeler == "fourWheeler"{
                    self.productName = "PRIVATE CAR PACKAGE POLICY"
                    self.productCode="2311"
                    cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
                    self.vehicleMotorGetQuote()
                    }else{
                        self.productName="TWO WHEELER PACKAGE POLICY";
                        self.productCode="2312"
                        cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
                        self.vehicleMotorGetQuote()
                   }
                
            }else if indexPath.row == 2{
                cell.fYear_View?.isHidden = false
                cell.tYear_View?.isHidden = true
                cell.fYear_View?.layer.cornerRadius = 5
                cell.tYear_View?.layer.cornerRadius = 5
                cell.fYear_View?.layer.borderWidth  = 1
                cell.tYear_View?.layer.borderWidth  = 1
                if self.twoWheeler == "fourWheeler"{
                    self.productName="PRIVATE CAR - OD";
                    self.productCode="2398";
                    cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
                    self.vehicleMotorGetQuote()
                      }else{
                    self.productName = "TWO WHEELER - OD";
                    self.productCode="2397"
                          cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
                    self.vehicleMotorGetQuote()
                   }
            }else{
                cell.fYear_View?.isHidden = false
                cell.tYear_View?.isHidden = true
                cell.fYear_View?.layer.cornerRadius = 5
                cell.tYear_View?.layer.cornerRadius = 5
                cell.fYear_View?.layer.borderWidth  = 1
                cell.tYear_View?.layer.borderWidth  = 1
            }
            cell.planType_Lbl?.text = plan[indexPath.row]
            cell.totalAmount_Lbl?.text = "\("₹" + "" + self.totalPremium)";
            cell.fYear_View?.layer.cornerRadius = 5
            cell.sYear_View?.layer.cornerRadius = 5
            cell.tYear_View?.layer.cornerRadius = 5
            cell.fYear_View?.layer.borderWidth  = 1
            cell.sYear_View?.layer.borderWidth  = 1
            cell.tYear_View?.layer.borderWidth  = 1
            cell.bgView?.layer.cornerRadius     = 15
            cell.bgView?.layer.borderWidth      = 1
            cell.bgView?.setShadow(shadowRadius: 5)
            cell.percentage_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
            cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
            cell.secondtYrBtn?.addTarget(self, action: #selector(secondYrTappde), for: .touchUpInside)
            cell.thirdYrBtn?.addTarget(self, action: #selector(thirdYrTappde), for: .touchUpInside)
            return cell
        }else if  collectionView == self.collectionViewA{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RenewalAdditionalDiscountCell", for: indexPath) as! RenewalAdditionalDiscountCell
            cell.additionalCover_Lbl?.text  = coverdatad[indexPath.row]
            //"\("₹" + "" + self.additionalCover)";
             cell.planDetail_Lbl?.text = coverdata[indexPath.row]
        
//
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
            cell.bgView?.setShadow(shadowRadius: 10)
            return cell
        }else if collectionView == self.collectionViewB{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RenewalAddOnCoverageCell", for: indexPath) as! RenewalAddOnCoverageCell
            cell.totalAmount_Lbl?.text = addonCoverdata[indexPath.row]
            cell.addButton?.layer.cornerRadius = 20
            cell.addButton?.layer.borderWidth = 0.5
            cell.addButton?.layer.borderColor = UIColor.red.cgColor
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
            cell.bgView?.setShadow(shadowRadius: 10)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        if collectionView == self.collectionView{
            return CGSize(width: width - 20, height: 270)
        }else if collectionView == self.collectionViewA{
            return CGSize(width: width - 20, height: 170)
          }else{
            return CGSize(width: width - 20, height: 130)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
}
//MARK: - extension for the api service calling
extension RenewalPolicyVehicleDetails_Vc {
//    //MARK: - func for the get state ap
//    private func getRtoDetailsAPi() {
//        let params = ["rc_no": self.registrationNbr,
//                      "consent": "Y",
//                      "rc_source": self.vehicleClassCode]
////        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
//        print(params)
//        let url =    "https://uat.aadrila.com/api/v1/variant-id"               //String(format:"%@",SubUrl.VehicleMasterRtoLocationZone.url)
//        print(url)
//        let token = "af90858f6b3b8a3684fd80ad6b7c899e"
//        let headers = ["Authorization" : "Bearer af90858f6b3b8a3684fd80ad6b7c899e",
//                       "Content-Type": "application/json"]
//
//
//        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON { [self]
//            response in
//            switch response.result {
//            case .success(let value):
//                print(response)
//                let json = JSON(value)
//                print(json)
//                let dataaaa = json["data"]
//                print(dataaaa)
//                let regDate = dataaaa["rc_regn_dt"]
//               self.regDate = "\(regDate)"
//
////                self.calcAge(birthday: self.regDate)
//
//                let utcDate =  self.serverToLocal(date:self.regDate)
//                        print(utcDate)
//                        if let UtcDateFormat = utcDate {
//                            let localeDate = self.ConverDateFormate(date: UtcDateFormat)
//                            self.regYear = "\(localeDate)"
//                            print(localeDate)
//                           print(currentYear)
//
//                            let gg = Int(self.currentYear)
//                            let ds = Int(localeDate)
//
//                                self.result = ( self.currentYear - ds!)
//                              print(result)
//                        }
//                let aString =  self.regDate
//                let newString = aString.replacingOccurrences(of: "-", with: "/", options: .literal, range: nil)
//
//                self.regDateChange = "\(newString)"
//                print(self.regDateChange)
//
//                let makecode = dataaaa["rc_maker_desc"]
//                self.makeCode = "\(makecode)"
//                let engineNbr = dataaaa["rc_eng_no"]
//                self.enginenumber = "\(engineNbr)"
//                let chasisNbr = dataaaa["rc_chasi_no"]
//                self.chasisNumber = "\(chasisNbr)"
//                let todate = dataaaa["rc_pucc_upto"]
//                let fromdate = dataaaa["rc_insurance_upto"]
//                let rtoLocation = dataaaa["rc_rto_code"]
//                self.rtoCode = "\(rtoLocation)"
//                let fullNameArr =  self.makeCode.components(separatedBy: " ")
//                self.vehicle = fullNameArr[0]
//                let stCity = dataaaa["rc_registered_at"]
//                self.cityState = "\(stCity)"
//                let stateCity =  self.cityState.components(separatedBy: " ")
//                self.city = stateCity[0]
//                self.state = stateCity[1]
//
//                let regnumber = dataaaa["rc_regn_no"]
//                self.regNumber = "\(regnumber)"
//                let address  = dataaaa["rc_present_address"]
//                self.addresses = "\(address)"
//                let permamentAddress = dataaaa["rc_permanent_address"]
//                self.permanentAddress = "\(permamentAddress)"
//                let presentAddress = dataaaa["rc_present_address"]
//                self.presentAdd = "\(presentAddress)"
//
//                //MARK: -  api callingg
//                self.VehicleManufacturerMaster()
//                break
//            case .failure(let error):
//
//                print(error)
//            }
//        }
//
//
//}
    private func VehicleManufacturerMaster() {
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "VEHICLECLASSCODE": self.vehicleClassCode, // for two wheel 37 and for
                       "Type": self.make   // self.makeCode
                        ]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleManufacturerMaster.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
                  let data =  response["VehicleMake"] as! [[String:Any]]
                    let bike = data[0]["VEHICLEMANUFACTURERNAME"]
                      let bikecode = data[0]["VEHICLEMANUFACTURERCODE"]

                    let bikeName = "\(bike!)"
                    self.vehicleCode = "\(bikecode!)"
                  //                        self.array = data.compactMap({MotorBrandModel(json: JSON(rawValue: $0) ?? 0)})
//                     }   print(self.array.count)
//                            for item in self.array {
//                                self.brandname.append("card\(item)")
//                                print(self.brandname)
//                        }

                    
                    self.getModelDetailsAPi(params:["TokenNo":tokenNo,
                        "Uid":String(ProjectUtils.getUserID()),
                        "MANUFACTURERNAME": self.make,
                        "ModelType": self.model ])    //self.makeCode
                  
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
    
 
 //MARK: - model api service
    private func getModelDetailsAPi(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleModelMaster.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
                  let data =  response["VehicleModel"] as! [[String:Any]]
                    let bikemodel = data[0]["VEHICLEMODEL"]
                      let bikeModelCode = data[0]["VEHICLEMODELCODE"]
                     self.modelCode = "\(bikeModelCode!)"
                    //MARK: -  api service for quotation
//                    self.vehicleMotorGetQuote()

//                    self.modelArray = response["VehicleModel"] as! [[String:Any]]
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
    //MARK: -  link for rthe renewal api service
    func getJson(completion: @escaping (Example)-> ()){
        let urlString = "http://124.124.15.42/RenewalWebAPI/api/PolicyDtls?strInputParameter=2312/50572196/10/B00&WACode=20000001&WAAppCode=30000004&DocType=WebAPI"
        
        Alamofire.request(urlString,headers:nil).responseJSON { (responseObject) -> Void in
            switch(responseObject.result)
            {
            case .success(_):
                //                    CommonMethods.hideHud()
                let resJson = JSON(responseObject.result.value!)
                print(resJson)
                
                let quote = resJson["QuoteID"]
                self.renewalQuote = "\(quote)"
                let regNbr = resJson["RegistrationNo"]
                self.vehicleNbr_Txt?.text = "\(regNbr)"
                let rSD  = resJson["RSD"]
                self.rsDate = "\(rSD)"
                let vehiclename  = resJson["VehicleModel"]
                self.vehicleName_Txt?.text = "\(vehiclename)"
                let data  = resJson["RenewalPolicyNo"]
                let manufatureName  = resJson["ManufatureName"].rawString()
                let idv  = resJson["Idv"]
                let idvv = idv as? String
                self.renewalIdv_Lbl.text =  "\(idvv)"
                let netPremium  = resJson["NetPremium"] as? String
                self.netPremium_Lbl.text = "\(netPremium)"
                let nCB = resJson["NCB"]
                self.ncb_Lbl.text = "\(nCB)"
                let finalPremium = resJson["FinalPremium"]
                self.liability_Lbl.text = "\(finalPremium)"
                let policyType = resJson["PolicyType"]
                self.planType_Lbl.text = "\(policyType)"
                
                let utcDate =  self.serverToLocal(date:  self.rsDate)
                        print(utcDate)
                        if let UtcDateFormat = utcDate {
                            let localeDate = self.ConverDateFormate(date: UtcDateFormat)
                        let sd = "\(localeDate)"
                            print(sd)
                            
                            self.vehicleModelYr_LBl.text = "\(localeDate)"
                            self.regsitraionYear.text = "\(localeDate)"
//                           print(currentYear)
                
                        }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
//                    success(resJson)
               
                }
                break
                
            case .failure(_):
                //                    CommonMethods.hideHud()
                let error : Error = responseObject.result.error!
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
//                    failure(error)
                }
                break
            }
        }
    }
    
    
 //MARK: - vehicle motor get quote api service
    private func vehicleMotorGetQuote(){
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "ProductName":"Private Car Package Policy",
                       "MobileNo":"",
                       "UserEmail":"",
                       "UserName":"",
                       "RegistrationNumber":   self.registration,     //self.regNumber,
                       "ProductCode": self.productCode,
                       "Product":"",
                       "BusinessType":"RollOver",
                       "VehicleClassCode": self.vehicleClassCode,
                       "VehicleMakeCode": self.vehicleCode,       //self.vehicleCode,
                       "YearofManufacture":self.regYear,
                       "VehicleType":"Old",
                       "CubicCapacity":"998.00",
                       "NumberOfWheels":self.numberofWheel,
                       "ChassisNumber": self.chasisNumber,
                       "EngineNumber": self.enginenumber,
                       "VehicleAge": self.result,  //(reslt is string where age calculate)
                       "VehicleModelCode": self.modelCode,
                       "RTOLocationCode": self.rtoCode,
                       "GrossVehicleWeight":"0",
                       "PlaceOfRegistration":  "Kalpeni",        //self.city,
                       "VehicleModel":self.model,
                       "DateOfFirstRegistration":self.regDateChange,
                       "DateOfRegistration":self.regDate,
                       "City":"Kalpeni",
                       "SumInsured":"",
                       "IDV":"",
                       "FuelType":"Petrol",
                       "VehicleMake":self.make,
                       "Fromdate":self.today,
                       "Todate":self.yearlater,
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
                       "ENGINEPROTECTORDIESELStatus":self.eNGINEPROTECTORDIESELStatus] as [String : Any]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleMotorQuotation.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                    }
                    if let data = response["Product"] as? [String:Any]{
                        let Premium = data["PremiumCalculation"] as? [String:Any]
                        let gst = Premium?["IGST"] as? [String:Any]
                        let gstVal = gst!["Value"] as? String
                        //  self.gstValue = gstVal as! String
                        let total = Premium?["TotalPremium"] as? [String:Any]
                        let value = total?["Value"]
                        self.totalPremium = value as! String
                        self.totalpremiumAmount_Lbl?.text = (value  as! String)
                        let netPremium = Premium?["NetPremium"] as? [String:Any]
                        let val = netPremium?["Value"]
                        // self.netPremiumm = val as! String
                        // self.netPremium.text = (val as! String)
                        
                        //MARK: - coverage data fetching
                        let cover = data["Risks"] as? [String:Any]
                        let coverr = cover?["Risk"] as? [String:Any]
                        let dd = coverr?["RisksData"] as? [String:Any]
                        //MARK: - idv Value
                      let exshowroom = cover?["VehicleExShowroomPrice"] as? [String:Any]
                        let exshowRoomPrice = exshowroom?["Value"]
                        self.exShowRoomPrice = exshowRoomPrice as! String

                        if let idvValue  = cover?["VehicleIDV"] as? [String:Any]{
                            let idvPremium = idvValue["Value"] as? String
                            self.calIdv = "\(idvPremium!)"
                            self.totalIdvAmount_Lbl?.text  =  idvPremium as? String
                            self.increasesAmount?.text = idvPremium as? String
                            
                            let valueInString = self.calIdv
                            let  num = Float(valueInString)
//                            let val = num! - (num! * 0.10)
//                            let vall = num! + (num! * 0.10)
//                            self.minAmount?.text = String(val)
//                            self.maxAmount_Lbl?.text = String(vall)
//                            self.mSlider.minimumValue = val
//                            self.mSlider.maximumValue = vall
//                            let addonCover = idvPremium?["AddonCoversData"] as? [[String:Any]]
//                            let data = addonCover![2]["SumInsured"] as? [String:Any]
//                            let valuesum = data?["Value"] as? String
//                            self.totalIdvAmount_Lbl?.text  = "\(valuesum)"
                        }
                        
                        //MARK: -  data for the other discount
                        let otherdiscount = dd?["OtherDiscounts"] as? [String:Any]
                        let otherdiscountGroup = otherdiscount?["OtherDiscountGroup"] as? [String:Any]
                        let otherdiscGroupData = otherdiscountGroup?["OtherDiscountGroupData"] as? [[String:Any]]
                        let descritption = otherdiscGroupData?[0]["Premium"] as? [String:Any]
                        self.additionalCover = descritption?["Value"] as! String
                        let coverdetail = dd?["CoverDetails"] as? [String:Any]
                        let coverrr = coverdetail?["Covers"] as? [String:Any]
                        let vnvnn = coverrr?["CoversData"] as? [[String:Any]]
                        //MARK: - cover data start from here index 0
                        let dfdf = vnvnn?[0]["CoverGroups"] as? [String:Any]
                        let ddf = dfdf?["Value"] as? String
                        self.coverdata.append(ddf!)
                        let fPremium = vnvnn?[0]["Premium"] as? [String:Any]
                        let ff = fPremium?["Value"] as? String
                        
                        if ff != "0.00"{
                            self.coverdatad.append(ff!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 1
                        let cgFirst = vnvnn?[1]["CoverGroups"] as? [String:Any]
                        let cgCoverFirst = cgFirst?["Value"] as? String
                        self.coverdata.append(cgCoverFirst!)
                        let cgFirstPremium = vnvnn?[1]["Premium"] as? [String:Any]
                        let cgFirstPremiumVal = cgFirstPremium?["Value"] as? String
                        if cgFirstPremiumVal != "0.00"{
                            self.coverdatad.append(cgFirstPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 2
                        let cgSecond = vnvnn?[2]["CoverGroups"] as? [String:Any]
                        let cgCoverSecond = cgSecond?["Value"] as? String
                        self.coverdata.append(cgCoverSecond!)

                        let cgSecondPremium = vnvnn?[2]["Premium"] as? [String:Any]
                        let cgSecondPremiumVal = cgSecondPremium?["Value"] as? String
                        if cgSecondPremiumVal != "0.00"{
                            self.coverdatad.append(cgSecondPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 3
                        let cgThird = vnvnn?[3]["CoverGroups"] as? [String:Any]
                        let cgCoverThird = cgThird?["Value"] as? String
                        self.coverdata.append(cgCoverThird!)

                        let cgThirdPremium = vnvnn?[3]["Premium"] as? [String:Any]
                        let cgThirdPremiumVal = cgThirdPremium?["Value"] as? String
                        if cgThirdPremiumVal != "0.00"{
                            self.coverdatad.append(cgThirdPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 4
                        let cgFour = vnvnn?[4]["CoverGroups"] as? [String:Any]
                        let cgCoverfourth = cgFour?["Value"] as? String
                        self.coverdata.append(cgCoverfourth!)

                        let cgFourthPremium = vnvnn?[4]["Premium"] as? [String:Any]
                        let cgFourthPremiumVal = cgFourthPremium?["Value"] as? String
                        if cgFourthPremiumVal != "0.00"{
                            self.coverdatad.append(cgFourthPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 5
                        let cgFive = vnvnn?[5]["CoverGroups"] as? [String:Any]
                        let cgCoverFive = cgFive?["Value"] as? String
                        self.coverdata.append(cgCoverFive!)

                        let cgFivePremium = vnvnn?[5]["Premium"] as? [String:Any]
                        let cgFivePremiumVal = cgFivePremium?["Value"] as? String
                        if cgFivePremiumVal != "0.00"{
                            self.coverdatad.append(cgFivePremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 6
                        let cgSix = vnvnn?[6]["CoverGroups"] as? [String:Any]
                        let cgCoverSix = cgSix?["Value"] as? String
                        self.coverdata.append(cgCoverSix!)

                        let cgSixPremium = vnvnn?[6]["Premium"] as? [String:Any]
                        let cgSixPremiumVal = cgSixPremium?["Value"] as? String
                        if cgSixPremiumVal != "0.00"{
                            self.coverdatad.append(cgSixPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 7
                        let cgSeven = vnvnn?[7]["CoverGroups"] as? [String:Any]
                        let cgCoverSeven = cgSeven?["Value"] as? String
                        self.coverdata.append(cgCoverSeven!)

                        let cgSevenPremium = vnvnn?[7]["Premium"] as? [String:Any]
                        let cgSevenPremiumVal = cgSevenPremium?["Value"] as? String
                        if cgSevenPremiumVal != "0.00"{
                            self.coverdatad.append(cgSevenPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 8
                        let cgEight = vnvnn?[8]["CoverGroups"] as? [String:Any]
                        let cgCoverEight = cgEight?["Value"] as? String
                        self.coverdata.append(cgCoverEight!)

                        let cgEightPremium = vnvnn?[8]["Premium"] as? [String:Any]
                        let cgEightPremiumVal = cgEightPremium?["Value"] as? String
                        if cgEightPremiumVal != "0.00"{
                            self.coverdatad.append(cgEightPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 9
                        let cgNine = vnvnn?[9]["CoverGroups"] as? [String:Any]
                        let cgCoverNine = cgNine?["Value"] as? String
                        self.coverdata.append(cgCoverNine!)

                        let cgNinePremium = vnvnn?[9]["Premium"] as? [String:Any]
                        let cgNinePremiumVal = cgNinePremium?["Value"] as? String
                        if cgNinePremiumVal != "0.00"{
                            self.coverdatad.append(cgNinePremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 10
                        let cgTen = vnvnn?[10]["CoverGroups"] as? [String:Any]
                        let cgCoverTen = cgTen?["Value"] as? String
                        self.coverdata.append(cgCoverTen!)

                        let cgTensPremium = vnvnn?[10]["Premium"] as? [String:Any]
                        let cgTensPremiumVal = cgTensPremium?["Value"] as? String
                        if cgTensPremiumVal != "0.00"{
                            self.coverdatad.append(cgTensPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 11
                        let cgEleven = vnvnn?[11]["CoverGroups"] as? [String:Any]
                        let cgCoverEleven = cgEleven?["Value"] as? String
                        self.coverdata.append(cgCoverEleven!)

                        let cgElevenPremium = vnvnn?[11]["Premium"] as? [String:Any]
                        let cgElevenPremiumVal = cgElevenPremium?["Value"] as? String
                        if cgElevenPremiumVal != "0.00"{
                            self.coverdatad.append(cgElevenPremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 12
                        let cgTweleve = vnvnn?[12]["CoverGroups"] as? [String:Any]
                        let cgCoverTweleve = cgTweleve?["Value"] as? String
                        self.coverdata.append(cgCoverTweleve!)
                        let cgTwelevePremium = vnvnn?[12]["Premium"] as? [String:Any]
                        let cgTwelevePremiumVal = cgTwelevePremium?["Value"] as? String
                        if cgTwelevePremiumVal != "0.00"{
                            self.coverdatad.append(cgTwelevePremiumVal!)
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        print(self.coverdata.count)
                        print(self.coverdata)
                        self.collectionViewA?.reloadData()
                        
                        //MARK: -  addon cover data
                        if let AddonCoverDetails = dd?["AddonCoverDetails"] as? [String:Any]{
                            let AddonCovers = AddonCoverDetails["AddonCovers"] as? [String:Any]
                            let AddonCoversData = AddonCovers?["AddonCoversData"] as? [[String:Any]]
                            
                            
                            
                            // MARK: - cover data start from here index 0
                            let addonFirst = AddonCoversData?[0]["CoverGroups"] as? [String:Any]
                            let addonCoverFirst = addonFirst?["Value"] as? String
//                            self.coverdata.append(addonCoverFirst!)
                            let addonFirstPremium = AddonCoversData?[0]["Premium"] as? [String:Any]
                            let addonFirstPremiumVal = addonFirstPremium?["Value"] as? String
                            if addonFirstPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFirstPremiumVal!)
                            }
                            // MARK: - cover data start from here index 1
                            let addonSecond = AddonCoversData?[1]["CoverGroups"] as? [String:Any]
                            let addonCoverSecond = addonSecond?["Value"] as? String
//                            self.coverdata.append(addonCoverSecond!)
                            let addonSecondPremium = AddonCoversData?[1]["Premium"] as? [String:Any]
                            let addonSecondPremiumVal = addonSecondPremium?["Value"] as? String
                            if addonSecondPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSecondPremiumVal!)
                            }
                            // MARK: - cover data start from here index 2
                            let addonThird = AddonCoversData?[2]["CoverGroups"] as? [String:Any]
                            let addonCoverThird = addonThird?["Value"] as? String
//                            self.coverdata.append(addonCoverThird!)
                            let addonthirdPremium = AddonCoversData?[2]["Premium"] as? [String:Any]
                            let addonThirdPremiumVal = addonthirdPremium?["Value"] as? String
                            
                            if addonThirdPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonThirdPremiumVal!)
                            }
                            // MARK: - cover data start from here index 3
                            let addonFourth = AddonCoversData?[3]["CoverGroups"] as? [String:Any]
                            let addonCoverFourth = addonFourth?["Value"] as? String
//                            self.coverdata.append(addonCoverFourth!)
                            let addonFourthPremium = AddonCoversData?[3]["Premium"] as? [String:Any]
                            let addonFourthPremiumVal = addonFourthPremium?["Value"] as? String
                            if addonFourthPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFourthPremiumVal!)
                            }
                            // MARK: - cover data start from here index 4
                            let addonFive = AddonCoversData?[4]["CoverGroups"] as? [String:Any]
                            let addonCoverFive = addonFive?["Value"] as? String
//                            self.coverdata.append(addonCoverFive!)
                            let addonFivePremium = AddonCoversData?[4]["Premium"] as? [String:Any]
                            let addonFivePremiumVal = addonFivePremium?["Value"] as? String
                            if addonFivePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFivePremiumVal!)
                            }
                            // MARK: - cover data start from here index 5
                            let addonSix = AddonCoversData?[5]["CoverGroups"] as? [String:Any]
                            let addonSixFirst = addonSix?["Value"] as? String
//                            self.coverdata.append(addonSixFirst!)
                            let addonSixPremium = AddonCoversData?[5]["Premium"] as? [String:Any]
                            let addonSixPremiumVal = addonSixPremium?["Value"] as? String
                            
                            if addonSixPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSixPremiumVal!)
                            }
                            // MARK: - cover data start from here index 6
                            let addonSeven = AddonCoversData?[6]["CoverGroups"] as? [String:Any]
                            let addonCoverSeven = addonSeven?["Value"] as? String
//                            self.coverdata.append(addonCoverSeven!)
                            let addonSevenPremium = AddonCoversData?[6]["Premium"] as? [String:Any]
                            let addonSevenPremiumVal = addonSevenPremium?["Value"] as? String
                            if addonSevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSevenPremiumVal!)
                            }
                            // MARK: - cover data start from here index 7
                            let addonEight = AddonCoversData?[7]["CoverGroups"] as? [String:Any]
                            let addonCoverEight = addonEight?["Value"] as? String
//                            self.coverdata.append(addonCoverEight!)
                            let addonEightPremium = AddonCoversData?[7]["Premium"] as? [String:Any]
                            let addonEightPremiumVal = addonEightPremium?["Value"] as? String
                            if addonEightPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonEightPremiumVal!)
                            }
                            // MARK: - cover data start from here index 8
                            let addonNine = AddonCoversData?[8]["CoverGroups"] as? [String:Any]
                            let addonCoverNine = addonNine?["Value"] as? String
//                            self.coverdata.append(addonCoverNine!)
                            let addonNinePremium = AddonCoversData?[8]["Premium"] as? [String:Any]
                            let addonNinePremiumVal = addonNinePremium?["Value"] as? String
                            if addonNinePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonNinePremiumVal!)
                            }
                            // MARK: - cover data start from here index 9
                            let addonTen = AddonCoversData?[9]["CoverGroups"] as? [String:Any]
                            let addonCoverTen = addonTen?["Value"] as? String
//                            self.coverdata.append(addonCoverTen!)
                            let addonTenPremium = AddonCoversData?[9]["Premium"] as? [String:Any]
                            let addonTenPremiumVal = addonTenPremium?["Value"] as? String
                            
                            if addonTenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTenPremiumVal!)
                            }
                            
                            
                            // MARK: - cover data start from here index 10
                            let addonEleven = AddonCoversData?[10]["CoverGroups"] as? [String:Any]
                            let addonCoverEleven = addonEleven?["Value"] as? String
//                            self.coverdata.append(addonCoverEleven!)
                            let addonElevenPremium = AddonCoversData?[10]["Premium"] as? [String:Any]
                            let addonElevenPremiumVal = addonElevenPremium?["Value"] as? String
                            if addonElevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonElevenPremiumVal!)
                            }
                            // MARK: - cover data start from here index 11
                            let addonTweleve = AddonCoversData?[11]["CoverGroups"] as? [String:Any]
                            let addonCoverTweleve = addonTweleve?["Value"] as? String
//                            self.coverdata.append(addonCoverTweleve!)
                            let addonTwelevePremium = AddonCoversData?[11]["Premium"] as? [String:Any]
                            let addonTwelevePremiumVal = addonTwelevePremium?["Value"] as? String
                            if addonTwelevePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTwelevePremiumVal!)
                            }
                            
                            
                            // MARK: - cover data start from here index 12
                            let addonThirteen = AddonCoversData?[12]["CoverGroups"] as? [String:Any]
                            let addonCoverThirteen = addonThirteen?["Value"] as? String
//                            self.coverdata.append(addonCoverThirteen!)
                            let addonThirteenPremium = AddonCoversData?[12]["Premium"] as? [String:Any]
                            let addonThirteenPremiumVal = addonThirteenPremium?["Value"] as? String
                            if addonThirteenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonThirteenPremiumVal!)
                            }
                            self.collectionViewB?.reloadData()
                            
                        }
                        
                        
                        
                        
                        
                        //                        print( "yoges\(epolicyy)")
                        //  self.extraDiscount = epolicyy! as! String
                        
                        //                        if self.extraDiscount == "E-sale Discount"{
                        //                            let epolicyAmountt = otherdiscGroupData?[5]["Premium"] as? [String:Any]
                        //                            let epolicyy = epolicyAmountt?["Value"]
                        //                            self.epolicyDis = epolicyy as! String
                        //                        }else if self.extraDiscount == "Policy Duration Discount"{
                        //                            let sublimitDiscount = otherdiscGroupData?[5]["Premium"] as? [String:Any]
                        //                            let epolicyVal = sublimitDiscount?["Value"]
                        //                            self.longtermDis = epolicyVal as! String
                        //                        }
                    }
                    
                    if let policyNbr = response["Customer"] as? [String:Any]{
                        if let quoteid = policyNbr["PosPolicyNo"] as? String{
                           self.quotationid = "\(quoteid)"
                        }
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
