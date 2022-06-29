//
//  OldVehicleAddons_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 24/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class OldPolicyplanTimeCell : UICollectionViewCell{
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
    
    @IBAction func amountFirst(_ sender : UIButton){
        firstYrBtn?.setImage(UIImage(named:"unSelected" ), for: .normal)
        firstYrBtn?.setImage(UIImage(named: "User"), for: .normal)
    }
    @IBAction func amountSec(_ sender : UIButton){
        thirdYrBtn?.setImage(UIImage(named: "User"), for: .normal)
        thirdYrBtn?.setImage(UIImage(named: "unSelected"), for: .normal)
    }
}
class OldAdditionalDiscountCell : UICollectionViewCell{
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var additionalCover_Lbl : UILabel?
    @IBOutlet weak var planDetail_Lbl : UILabel?
    @IBOutlet weak var additionalCheckBtn : UIButton?
    @IBOutlet weak var amountFirst : UIButton?
    @IBOutlet weak var amountSecond : UIButton?
    @IBOutlet weak var checkImg : UIImageView?
    override func awakeFromNib() {
    super.awakeFromNib()
}
    @IBAction func additionalAddotnAction(_ sender : UIButton){
        if additionalCheckBtn?.isSelected == true{
        additionalCheckBtn?.setImage(UIImage(named: "unchecked"), for: .normal)
//        amountFirst?.setImage(UIImage(named: "unSelected"), for: .normal)
        }else{
            additionalCheckBtn?.setImage(UIImage(named: "checked"), for: .normal)
        }
        additionalCheckBtn!.isSelected = !additionalCheckBtn!.isSelected
    }
}

class OldAddOnCoverageCell : UICollectionViewCell{
    @IBOutlet weak var cashallowence_Lbl : UILabel?
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var addButton : UIButton?
    @IBOutlet weak var bgView : UIView?
}

class OldVehicleAddons_Vc: BaseViewController {
    @IBOutlet weak var title_Lbl: UILabel?

    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var collectionViewA : UICollectionView?
    @IBOutlet weak var collectionViewB : UICollectionView?
    @IBOutlet weak var name_View : UIView?
    @IBOutlet weak var additionalCover_View : UIView?
    @IBOutlet weak var comprehensive_View : UIView?
    @IBOutlet weak var addOn_view : UIView?
    @IBOutlet weak var idv_View : UIView?
    @IBOutlet weak var vehicle_Img : UIImageView?
    @IBOutlet weak var vehicleName_Txt : UITextField?
    @IBOutlet weak var vehicleNbr_Txt  : UITextField?
    @IBOutlet weak var minAmount : UILabel?
    @IBOutlet weak var increasesAmount : UILabel?
    @IBOutlet weak var maxAmount_Lbl : UILabel?
    @IBOutlet weak var totalIdvAmount_Lbl : UILabel?
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
    @IBOutlet weak var additionalBtn: UIButton?
    @IBOutlet weak var getQuoteBtn: UIButton?
    @IBOutlet weak var payment_View: UIView?
    @IBOutlet weak var mSlider: UISlider!
    @IBOutlet weak var saveGetQuote_View: UIView?
    @IBOutlet weak var saveQuoteBtn: UIButton?
    @IBOutlet weak var showQuote_Lbl : UILabel?
    @IBOutlet weak var comprehensiveYear_View: UIView?
    @IBOutlet weak var comprehensiveYearSelection_Btn: UIButton?
    @IBOutlet weak var firstYear_Lbl : UILabel?
    @IBOutlet weak var firstYearOdPlan_Lbl : UILabel?
    @IBOutlet weak var comprehensivetotalPremium : UILabel?
    @IBOutlet weak var percentage_View : UIView?
    var FinancierDetailss = [[String:Any]]()
    var fincOne = [String:Any]()
    var fincTwo = [String:Any]()
    var fincThree = [String:Any]()
    var fincFour = [String:Any]()
    var listArray   = [[String:Any]]()
    var modelArray  = [[String: Any]]()
    var plan = ["Comprehensive Plan", "Third Party Plan", "Own damage(atandalone)"]
    let collection = PolicyplanTimeCell()
    let collectionA = AdditionalDiscountCell()
    var additionalCover = String();  var   eLECTRICALACCESSORYODStatus  = String(); var enginenumber = String();
    var totalPremium = String();     var   nONELECTRICALACCESSORYODStatus  = String(); var chasisNumber = String(); var showRoomVal = String()
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
    var vehicleAge = Int();var vehicleCode = String(); var vehicleModel = String();var totalpremium  = String(); var policyType = String()
    var vehicleClassCode = String(); var numberofWheel = String(); var quotationid = String();var idv = String()
    var commonYear = String(); var customerType = String(); var exShowRoomPrice = String();var registration = String(); var vehicle = String(); var makeCode = String();var make = String(); var model = String(); var state = String(); var calculated = Int();var cityState = String(); var currentYear  = Int();var result = Int(); var regNumber = String(); var regYear = String(); var regDateChange = String();var addresses = String()
    var presentAdd = String(); var permanentAddress = String();var renewalQuote = String()
    var fiveYear = String();var rsDate = String(); var calIdv = String(); var registrationNbr = String()
    
//MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.saveGetQuote_View?.isHidden = true
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionViewA?.delegate = self
        self.collectionViewA?.dataSource = self
        self.collectionViewB?.delegate = self
        self.collectionViewB?.dataSource = self
        self.cornerRadious()
        self.retrieveData()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: dated)
        print(result)
        dateData = formatter.date(from: result)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.afterday = dateFormatter.string(from: Date.tomorrow)
        self.today = dateFormatter.string(from: Date())
        self.yearlater = dateFormatter.string(from: Date().yearafter)
        self.currentYear = Calendar.current.component(.year, from: Date())

        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
//        self.paramset()
          self.setparam()
          self.getRtoDetailsAPi()

    }
    
    
    @objc  func onLuminosityChange(){
        let value = self.mSlider.value
        self.increasesAmount?.text = "\(value)"
    }
    func cornerRadious(){
        self.comprehensive_View?.layer.cornerRadius = 20
        self.comprehensive_View?.layer.borderWidth = 1
        self.comprehensiveYear_View?.layer.cornerRadius = 10
        self.comprehensiveYear_View?.layer.borderWidth = 1
        self.percentage_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
        self.continueBtn?.layer.cornerRadius = 20
        self.name_View?.layer.cornerRadius = 10
        self.getQuoteBtn?.layer.cornerRadius = 20
        self.getQuoteBtn?.layer.borderWidth = 1
        self.getQuoteBtn?.layer.borderColor = UIColor.red.cgColor
        self.name_View?.setShadow(shadowRadius: 10)
        self.saveGetQuote_View?.layer.cornerRadius = 20
        self.saveGetQuote_View?.setShadow(shadowRadius: 10)
//        self.payment_View?.addTopShadow()
        self.vehicleName_Txt?.isUserInteractionEnabled = false
        self.vehicleNbr_Txt?.isUserInteractionEnabled = false
        self.collectionView?.layer.cornerRadius = 20
        self.collectionView?.layer.borderWidth = 1
      }
    @IBAction func contiueAction(){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewPolicyOldVehicleDetails_Vc") as!               NewPolicyOldVehicleDetails_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    //MARK: - button actin for show Breakup
    @IBAction func viewAllAction(_ sender: UIButton){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewPolicyShowBreakup_Vc") as! NewPolicyShowBreakup_Vc
        self.navigationController?.present(nextVc, animated: true)
//        self.dismiss(animated: true)
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
            corporate_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            individual_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for individual Action
    @IBAction func individualAction(_ sender: UIButton){
        if individual_Btn?.isSelected == true{
            individual_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            corporate_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    //MARK: - button actin for show Breakup
    @IBAction func saveandQuote(_ sender: UIButton){
        self.saveGetQuoteApi()
        self.showQuote_Lbl?.text = self.quotationid
        self.saveGetQuote_View?.isHidden = false
    }
    //MARK: -  dissmisss action for the popup
    @IBAction func dismissAction(_ sender: UIButton){
        self.saveGetQuote_View?.isHidden = true
    }
    //MARK: -  slider button action
    @IBAction func clickToSliderPrice(_ sender: UISlider) {
           let value = Float(sender.value)
        self.totalIdvAmount_Lbl?.text = String(format: "%.0f", value)
       }
    
    //MARK: - Button Action
    @objc func firstYrBtnTappded(sender:UIButton){
        let data = coverdata[sender.tag]
        let daaaa = coverdatad[sender.tag]
//        let collection = AdditionalDiscountCell()
//
//
//        if collection.additionalCheckBtn?.isSelected == true{
//            collection.additionalCheckBtn?.setImage(UIImage(named: "checked"), for: .normal)
//        }
        
        
     
    
    }
    
    
    @objc  func firstYrTappde(){
        collection.firstYrBtn?.isSelected = true
        collection.secondtYrBtn?.isSelected = false
        collection.thirdYrBtn?.isSelected = false
        collection.firstYrBtn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
        collection.secondtYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        collection.thirdYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        
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
        collection.firstYrBtn?.isSelected = false
        collection.secondtYrBtn?.isSelected = false
        collection.thirdYrBtn?.isSelected = true
        collection.thirdYrBtn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
        collection.secondtYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        collection.firstYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
    }
  //MARK: - retrieve data
    func retrieveData(){
      self.registrationNbr =    UserDefaults.standard.string(forKey: "RegistrationNbr")!
        self.newPolicy     =   UserDefaults.standard.string(forKey: "NewPolicy")!
        self.twoWheeler    =   UserDefaults.standard.string(forKey: "TwoWheeler")!
        self.newVehicle    =   UserDefaults.standard.string(forKey: "newVehicle")!
        self.oldVehicle    =   UserDefaults.standard.string(forKey: "Vehicle")!
        self.productName   =   UserDefaults.standard.string(forKey: "productName")!
        self.productCode   =   UserDefaults.standard.string(forKey: "productCode")!
        self.numberofWheel =   UserDefaults.standard.string(forKey: "NumberofWheel")!
        
        if twoWheeler == "twoWheeler"{
            self.twoWheeler = "twoWheeler"
            self.productName = "TWO WHEELER PACKAGE POLICY"
            self.productCode = "2312"
            self.numberofWheel = "2"
            self.vehicleClassCode = "37"
            self.title_Lbl?.text = "Two Wheeler Insurance"
            self.firstYearOdPlan_Lbl?.text = " + 5 Year TP"
        }else{
            self.productName = "PRIVATE CAR PACKAGE POLICY"
            self.productCode = "2311"
            self.numberofWheel = "4"
            self.vehicleClassCode = "45"
            self.title_Lbl?.text = "Four Wheeler Insurance"
            self.firstYearOdPlan_Lbl?.text = " + 3 Year TP"

        }
    }
    //MARK: -  save data
    func saveData(){
        self.policyType = "Old Policy"
        UserDefaults.standard.set(self.renewalQuote, forKey: "QuoteID")
        UserDefaults.standard.set(self.regNumber, forKey: "regNumber")
        UserDefaults.standard.set(self.regYear, forKey: "RegYear")
        UserDefaults.standard.set(self.modelCode, forKey: "modelCode")
        UserDefaults.standard.set(self.makecode, forKey: "MakeCode")
        UserDefaults.standard.set(self.totalPremium, forKey: "TotalPremium")
        UserDefaults.standard.set(self.result, forKey: "VehicleAge")
        UserDefaults.standard.set(self.permanentAddress, forKey: "permanentAddress")
        UserDefaults.standard.set(self.presentAdd, forKey: "presentAdd")
        UserDefaults.standard.set(self.make, forKey: "VehicleMake")
        UserDefaults.standard.set(self.model, forKey: "VehicleModel")
        UserDefaults.standard.set(self.idv, forKey: "IDV")
        UserDefaults.standard.set(self.showRoomVal, forKey: "showRoomVal")
        UserDefaults.standard.set(self.policyType, forKey: "OLdPolicy")
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

    
    
    
    
    func paramset(){
        self.eLECTRICALACCESSORYODStatus  = "True"
        self.nONELECTRICALACCESSORYODStatus  = "True"
        self.basicTP  = "True"
        self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "True"
        self.pACOVERTOPASSENGERSStatus  = "True"
        self.pACOVERTOPAIDDRIVERStatus = "True"
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
        self.aCCIDENTALHOSPITALIZATIONStatus = "True"
        self.hYDROSTATICLOCKCOVERStatus = "False"
        self.cOSTOFCONSUMABLESStatus = "False"
        self.sECURETOWINGStatus = "False"
        self.tyreandRimsecureStatus = "False"
        self.eNGINEPROTECTORPETROLStatus = "True"
        self.eNGINEPROTECTORDIESELStatus = "True"
        self.basicODStatus = "False"
    }
    
    //MARK: -  func for the
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
extension OldVehicleAddons_Vc : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        
        if collectionView == self.collectionView{
            return plan.count
            
        }else if  collectionView == self.collectionViewA{
            //   let count = coverdata.count + coverdatad.count
            return coverdatad.count   //coverArray.count
             }else{
                 return coverdata.count
//            return addonCoverdata.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OldPolicyplanTimeCell", for: indexPath) as! OldPolicyplanTimeCell
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
                    self.productName = "PRIVATE CAR - OD";
                    self.productCode="2398";
                    cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
                    self.vehicleMotorGetQuote()
                      }else{
                    self.productName = "TWO WHEELER - OD";
                    self.productCode = "2397"
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
            cell.percentage_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)

//            cell.bgView?.setShadow(shadowRadius: 5)
            cell.firstYrBtn?.tag = indexPath.row
            cell.firstYrBtn?.addTarget(self, action: #selector(firstYrBtnTappded), for: .touchUpInside)
            cell.secondtYrBtn?.addTarget(self, action: #selector(secondYrTappde), for: .touchUpInside)
            cell.thirdYrBtn?.addTarget(self, action: #selector(thirdYrTappde), for: .touchUpInside)
            return cell
    } else  if  collectionView == self.collectionViewA{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OldAdditionalDiscountCell", for: indexPath) as! OldAdditionalDiscountCell
            cell.additionalCover_Lbl?.text  = coverdatad[indexPath.row]
            //"\("₹" + "" + self.additionalCover)";
             cell.planDetail_Lbl?.text = coverdata[indexPath.row]
        
//
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
            return cell
        }else if collectionView == self.collectionViewB{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OldAddOnCoverageCell", for: indexPath) as! OldAddOnCoverageCell
            cell.cashallowence_Lbl?.text = coverdata[indexPath.row]
//            cell.totalAmount_Lbl?.text =  "\("₹" + "" +  addonCoverdata[indexPath.row])"
           
            cell.addButton?.layer.cornerRadius = 20
            cell.addButton?.layer.borderWidth = 0.5
            cell.addButton?.layer.borderColor = UIColor.red.cgColor
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
//            cell.bgView?.setShadow(shadowRadius: 10)
            return cell
        }
       return UICollectionViewCell()
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        if collectionView == self.collectionView{
            return CGSize(width: width - 10, height: 320)
        }else if collectionView == self.collectionViewA{
            return CGSize(width: width - 10, height: 155)
        }else{
            return CGSize(width: width - 10,  height: 130)
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

extension OldVehicleAddons_Vc {
    //MARK: - func for the get state ap
    private func getRtoDetailsAPi() {
        let params = ["rc_no": self.registrationNbr,     //"MH04HQ8035",
                      "consent": "Y",
                      "rc_source": self.vehicleClassCode ]     //  "45"
//        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url =    "https://uat.aadrila.com/api/v1/variant-id"               //String(format:"%@",SubUrl.VehicleMasterRtoLocationZone.url)
        print(url)
        let token = "af90858f6b3b8a3684fd80ad6b7c899e"
        let headers = ["Authorization" : "Bearer af90858f6b3b8a3684fd80ad6b7c899e",
                       "Content-Type": "application/json"]
        
        
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON { [self]
            response in
            switch response.result {
            case .success(let value):
                print(response)
                let json = JSON(value)
                print(json)
                let dataaaa = json["data"]
                print(dataaaa)
                let regDate = dataaaa["rc_regn_dt"]
               self.regDate = "\(regDate)"
              
//                self.calcAge(birthday: self.regDate)
                
                let utcDate =  self.serverToLocal(date:self.regDate)
                        print(utcDate)
                        if let UtcDateFormat = utcDate {
                            let localeDate = self.ConverDateFormate(date: UtcDateFormat)
                            self.regYear = "\(localeDate)"
                            print(localeDate)
//                           print(currentYear)

                            let gg = Int(self.currentYear)
                            let ds = Int(localeDate)

                                self.result = ( self.currentYear - ds!)
                              print(result)
                        }
                let aString =  self.regDate
                let newString = aString.replacingOccurrences(of: "-", with: "/", options: .literal, range: nil)

                self.regDateChange = "\(newString)"
                print(self.regDateChange)

                let makecode = dataaaa["rc_maker_desc"]
                self.make = "\(makecode)"
                self.makeCode = "\(makecode)"
                let engineNbr = dataaaa["rc_eng_no"]
                self.enginenumber = "\(engineNbr)"
                let chasisNbr = dataaaa["rc_chasi_no"]
                self.chasisNumber = "\(chasisNbr)"
                let todate = dataaaa["rc_pucc_upto"]
                let fromdate = dataaaa["rc_insurance_upto"]
                let rtoLocation = dataaaa["rc_rto_code"]
                self.rtoCode = "\(rtoLocation)"
                let fullNameArr =  self.makeCode.components(separatedBy: " ")
                self.vehicle = fullNameArr[0]
                let stCity = dataaaa["rc_registered_at"]
                self.cityState = "\(stCity)"
                let stateCity =  self.cityState.components(separatedBy: " ")
                self.city = stateCity[0]
                self.state = stateCity[1]

                let regnumber = dataaaa["rc_regn_no"]
                self.regNumber = "\(regnumber)"
                let address  = dataaaa["rc_present_address"]
                self.addresses = "\(address)"
                let permamentAddress = dataaaa["rc_permanent_address"]
                self.permanentAddress = "\(permamentAddress)"
                let presentAddress = dataaaa["rc_present_address"]
                self.presentAdd = "\(presentAddress)"

                let passiddata = dataaaa["pass_id_data"]
                
                let model = passiddata[0]["model_id"]
                self.modelCode = "\(model)"
                let make = passiddata[0]["make_id"]
                self.makecode = "\(make)"
                let makeModel = dataaaa["rc_maker_model"]
                self.model = "\(makeModel)"
//                //MARK: -  api callingg
                self.vehicleMotorGetQuote()
//                self.setparam()
                break
            case .failure(let error):
                
                print(error)
            }
        }
}
    //MARK: -  get quote service api
    private func vehicleMotorGetQuote(){
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "ProductName":self.productName,
                       "MobileNo":"",
                       "UserEmail":"",
                       "UserName":"",
                       "RegistrationNumber": self.regNumber,
                       "ProductCode": self.productCode,  //2311
                       "Product":"",
                       "BusinessType":"RollOver",
                       "VehicleClassCode": self.vehicleClassCode,   //45self.vehicleClassCode
                       "VehicleMakeCode": self.makecode,
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
                       "PlaceOfRegistration": self.city,   //"Kalpeni"
                       "VehicleModel":self.model,
                       "DateOfFirstRegistration":self.regDateChange,
                       "DateOfRegistration": "02/11/2016",         //self.regDate,
                       "City":self.city,
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
                        if let idvValue  = cover?["VehicleIDV"] as? [String:Any]{
                            let idvPremium = idvValue["Value"] as? String
                            self.idv = "\(idvPremium!)"
                            self.calIdv = "\(idvPremium!)"
                        self.totalIdvAmount_Lbl?.text  =  idvPremium as? String
                            self.increasesAmount?.text = idvPremium as? String
                            let valueInString = self.calIdv
                            let  num = Float(valueInString)
                            let val = num ?? 0.0 - (num ?? 0.0 * 0.20)
                            let vall = num ?? 0.0 + (num ?? 0.0 * 0.20)
                            self.minAmount?.text = String(val)
                            self.maxAmount_Lbl?.text = String(vall)
                            self.mSlider.minimumValue = val
                            self.mSlider.maximumValue = vall
//                            let addonCover = idvPremium?["AddonCoversData"] as? [[String:Any]]
//                            let data = addonCover![2]["SumInsured"] as? [String:Any]
//                            let valuesum = data?["Value"] as? String
//                            self.totalIdvAmount_Lbl?.text  = "\(valuesum)"
                            let exshow = cover?["VehicleExShowroomPrice"] as? [String:Any]
                            let showRoomPrice = exshow?["Value"] as? String
                            self.showRoomVal = "\(showRoomPrice!)"
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
                        //MARK: -  sum insured resposnse
//                        let sum  = vnvnn["SumInsured"] as? [String:Any]
//                        let suminsValue = sum["Value"] as? String
                        
                        
                        
                        
                        
                        
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
                            self.coverdata.append(cgCoverFirst!)
                            let addonFirstPremium = AddonCoversData?[0]["Premium"] as? [String:Any]
                            let addonFirstPremiumVal = addonFirstPremium?["Value"] as? String
                            if addonFirstPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFirstPremiumVal!)
                            }
                            // MARK: - cover data start from here index 1
                            let addonSecond = AddonCoversData?[1]["CoverGroups"] as? [String:Any]
                            let addonCoverSecond = addonSecond?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonSecondPremium = AddonCoversData?[1]["Premium"] as? [String:Any]
                            let addonSecondPremiumVal = addonSecondPremium?["Value"] as? String
                            if addonSecondPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSecondPremiumVal!)
                            }
                            // MARK: - cover data start from here index 2
                            let addonThird = AddonCoversData?[2]["CoverGroups"] as? [String:Any]
                            let addonCoverThird = addonThird?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonthirdPremium = AddonCoversData?[2]["Premium"] as? [String:Any]
                            let addonThirdPremiumVal = addonthirdPremium?["Value"] as? String
                            
                            if addonThirdPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonThirdPremiumVal!)
                            }
                            // MARK: - cover data start from here index 3
                            let addonFourth = AddonCoversData?[3]["CoverGroups"] as? [String:Any]
                            let addonCoverFourth = addonFourth?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonFourthPremium = AddonCoversData?[3]["Premium"] as? [String:Any]
                            let addonFourthPremiumVal = addonFourthPremium?["Value"] as? String
                            if addonFourthPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFourthPremiumVal!)
                            }
                            // MARK: - cover data start from here index 4
                            let addonFive = AddonCoversData?[4]["CoverGroups"] as? [String:Any]
                            let addonCoverFive = addonFive?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonFivePremium = AddonCoversData?[4]["Premium"] as? [String:Any]
                            let addonFivePremiumVal = addonFivePremium?["Value"] as? String
                            if addonFivePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFivePremiumVal!)
                            }
                            // MARK: - cover data start from here index 5
                            let addonSix = AddonCoversData?[5]["CoverGroups"] as? [String:Any]
                            let addonSixFirst = addonSix?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonSixPremium = AddonCoversData?[5]["Premium"] as? [String:Any]
                            let addonSixPremiumVal = addonSixPremium?["Value"] as? String
                            
                            if addonSixPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSixPremiumVal!)
                            }
                            // MARK: - cover data start from here index 6
                            let addonSeven = AddonCoversData?[6]["CoverGroups"] as? [String:Any]
                            let addonCoverSeven = addonSeven?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonSevenPremium = AddonCoversData?[6]["Premium"] as? [String:Any]
                            let addonSevenPremiumVal = addonSevenPremium?["Value"] as? String
                            if addonSevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSevenPremiumVal!)
                            }
                            // MARK: - cover data start from here index 7
                            let addonEight = AddonCoversData?[7]["CoverGroups"] as? [String:Any]
                            let addonCoverEight = addonEight?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonEightPremium = AddonCoversData?[7]["Premium"] as? [String:Any]
                            let addonEightPremiumVal = addonEightPremium?["Value"] as? String
                            if addonEightPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonEightPremiumVal!)
                            }
                            // MARK: - cover data start from here index 8
                            let addonNine = AddonCoversData?[8]["CoverGroups"] as? [String:Any]
                            let addonCoverNine = addonNine?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonNinePremium = AddonCoversData?[8]["Premium"] as? [String:Any]
                            let addonNinePremiumVal = addonNinePremium?["Value"] as? String
                            if addonNinePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonNinePremiumVal!)
                            }
                            // MARK: - cover data start from here index 9
                            let addonTen = AddonCoversData?[9]["CoverGroups"] as? [String:Any]
                            let addonCoverTen = addonTen?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonTenPremium = AddonCoversData?[9]["Premium"] as? [String:Any]
                            let addonTenPremiumVal = addonTenPremium?["Value"] as? String
                            
                            if addonTenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTenPremiumVal!)
                            }
                            
                            
                            // MARK: - cover data start from here index 10
                            let addonEleven = AddonCoversData?[10]["CoverGroups"] as? [String:Any]
                            let addonCoverEleven = addonEleven?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonElevenPremium = AddonCoversData?[10]["Premium"] as? [String:Any]
                            let addonElevenPremiumVal = addonElevenPremium?["Value"] as? String
                            if addonElevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonElevenPremiumVal!)
                            }
                            
                            
                            // MARK: - cover data start from here index 11
                            let addonTweleve = AddonCoversData?[11]["CoverGroups"] as? [String:Any]
                            let addonCoverTweleve = addonTweleve?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
                            let addonTwelevePremium = AddonCoversData?[11]["Premium"] as? [String:Any]
                            let addonTwelevePremiumVal = addonTwelevePremium?["Value"] as? String
                            if addonTwelevePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTwelevePremiumVal!)
                            }
                            
                            
                            // MARK: - cover data start from here index 12
                            let addonThirteen = AddonCoversData?[12]["CoverGroups"] as? [String:Any]
                            let addonCoverThirteen = addonThirteen?["Value"] as? String
                            self.coverdata.append(cgCoverFirst!)
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
                            self.renewalQuote = quoteid
                            print(quoteid)
                            //                        self.quotationid = "\(quoteid)"
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
    
    //MARK: -
    private func saveGetQuoteApi(){
        self.fincOne   = ["CoverName":"ELECTRICALACCESSORYOD","CoverValue":"2311","TypeValue":"AddOn"]
        self.fincTwo   = ["CoverName":"HYDROSTATICLOCKCOVER","CoverValue":"23122","TypeValue":"CoverData"]
        self.fincThree = ["CoverName":"NONELECTRICALACCESSORYOD","CoverValue":"11","TypeValue":"AddOn"]
        self.fincFour = ["CoverName":"COSTOFCONSUMABLES","CoverValue":"222","TypeValue":"CoverData"]
        
        
        self.FinancierDetailss.append(self.fincOne)
        self.FinancierDetailss.append(self.fincTwo)
        self.FinancierDetailss.append(self.fincThree)
        self.FinancierDetailss.append(self.fincFour)
        
            let params =   ["TokenNo":tokenNo,
                            "Uid":String(ProjectUtils.getUserID()),
                            "QuotationNo":self.quotationid,
                            "PolicyType":self.customerType,
                            "VehicleType":self.vehicle,
                            "VehicleAge": self.vehicleAge,
                            "VehicleNumber":"UP21HN2123",
                            "BrandName":self.VehicleBrand,
                            "BrandCode":self.makecode,
                            "ModelName":self.vehicleModel,
                            "ModelCode":self.modelCode,
                            "DateOfRegistration":self.regDate,
                            "StateName":self.state,
                            "CityName":self.city,
                            "PolicyPlan":self.customerType,
                            "YearOfPlan":self.selectYear,
                            "IDV":"21022",
                            "Category":"New",
                            "PA_Value":"998",
                            "GPA_Value":"4",
                            "DL":"MPL8967YU",
                            "TotalPremium":self.totalPremium,
                            "AddonAndCovers": self.FinancierDetailss]  as [String : Any]
            
            
    CommonMethods.showHud(aView: view, userInteractionAllowed: false)
            print(params)
    let url = String(format:"%@",SubUrl.SaveQuotationDetails.url)
            print(url)
    CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
         print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                    DispatchQueue.main.async {
                let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                            return
                            }
                                                         
//            self.rtoArray = response["VehicleMasterRtoLocationZone"] as! [[String:Any]]
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

