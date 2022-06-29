//
//  NewpolicyVehicleAddons_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD
import CoreMedia

class PolicyplanTimeCell : UICollectionViewCell{
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var precentage_Lbl : UILabel?
    @IBOutlet weak var planType_Lbl : UILabel?
    @IBOutlet weak var firstYearAmount_Lbl : UILabel?
    @IBOutlet weak var secYearAmount_Lbl : UILabel?
    @IBOutlet weak var thirdYearAmount_Lbl : UILabel?
    @IBOutlet weak var fYear_View : UIView?
    @IBOutlet weak var tYear_View : UIView?
    @IBOutlet weak var tYearName_Lbl : UILabel?
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var percentage_View : UIView?
    @IBOutlet weak var firstYrBtn : UIButton?
    @IBOutlet weak var secondtYrBtn : UIButton?
    @IBOutlet weak var thirdYrBtn : UIButton?
    
    @IBAction func oneYearAction(_ sender : UIButton){
        thirdYrBtn?.setImage(UIImage(named:"unSelected"), for: .normal)
        firstYrBtn?.setImage(UIImage(named: "RadioButton"), for: .normal)
    }
    @IBAction func threeYearAction(_ sender : UIButton){
        thirdYrBtn?.setImage(UIImage(named: "RadioButton"), for: .normal)
        firstYrBtn?.setImage(UIImage(named: "unSelected"), for: .normal)
    }
}
class AdditionalDiscountCell : UICollectionViewCell{
    @IBOutlet weak var bgView : UIView?
    @IBOutlet weak var additionalCover_Lbl : UILabel?
    @IBOutlet weak var planDetail_Lbl : UILabel?
    @IBOutlet weak var additionalCheckBtn : UIButton?
    @IBOutlet weak var checkImg : UIImageView?
    @IBOutlet weak var cpersonal_View : UIView?

        override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    @IBAction func additionalAddotnAction(_ sender : UIButton){
        if additionalCheckBtn?.isSelected == true{
        additionalCheckBtn?.setImage(UIImage(named: "checked"), for: .normal)
//        amountFirst?.setImage(UIImage(named: "unSelected"), for: .normal)
        }else{
            additionalCheckBtn?.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        additionalCheckBtn!.isSelected = !additionalCheckBtn!.isSelected
    }
}
class addOnCoverageCell : UICollectionViewCell{
    @IBOutlet weak var cashallowence_Lbl : UILabel?
    @IBOutlet weak var totalAmount_Lbl : UILabel?
    @IBOutlet weak var addButton : UIButton?
    @IBOutlet weak var bgView : UIView?
}
class NewpolicyVehicleAddons_Vc: BaseViewController {
    @IBOutlet weak var title_Lbl: UILabel?
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var collectionViewA : UICollectionView?
    @IBOutlet weak var collectionViewB : UICollectionView?
    @IBOutlet weak var name_View : UIView?
    @IBOutlet weak var additionalCover_View : UIView?
    @IBOutlet weak var additionalCoverNs_View : NSLayoutConstraint?
    @IBOutlet weak var comprehensive_View : UIView?
    @IBOutlet weak var addOn_view : UIView?
    @IBOutlet weak var addOn_NsView : NSLayoutConstraint?
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
    @IBOutlet weak var totalrecomendeAmount_Lbl : UILabel?
    @IBOutlet weak var comprehensivetotalPremium : UILabel?
    @IBOutlet weak var percentage_View : UIView?

    @IBOutlet weak var pacover_View : UIView?
    @IBOutlet weak var pacover_NsView : NSLayoutConstraint?
    @IBOutlet weak var gpacover_View : UIView?
    @IBOutlet weak var gpacover_NsView : NSLayoutConstraint?

    
//    var dataArray = [AddonModel]()
    var FinancierDetailss = [[String:Any]]()
    var fincOne = [String:Any]()
    var fincTwo = [String:Any]()
    var fincThree = [String:Any]()
    var fincFour = [String:Any]()
    var plan = ["Comprehensive Plan"]
    let collection = PolicyplanTimeCell()
    let collectionA = AdditionalDiscountCell()
    var additionalCover = String();  var   eLECTRICALACCESSORYODStatus  = String()
    var totalPremium = String();     var   nONELECTRICALACCESSORYODStatus  = String()
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
    var addonCoverNamedata = [String]();var eNGINEPROTECTORDIESELRate = String()
    var detariffDiscountStatus = String();var eNGINEPROTECTORPETROLRate = String()
    var detariffLoadingStatus  = String();var sECURETOWINGRate = String()
    var wRONGFUELCOVERStatus = String();var nildepreciationwaiverCoverRate = String()
    var dAILYCASHALLOWANCEStatus = String(); var addonCoverRatedata = [String]()
    var bUILTINCNGKIT_LPGKITTPStatus = String()
    var dRIVINGTRAINPROTECTStatus = String()
    var mmANUFACTURERSELLINGPRICEStatus = String()
    var bUILTINCNGKIT_LPGKITODStatus = String()
    var cNGLPGKITTPStatus = String(); var detariffLoadingRate = String()
    var cNGLPGKITODStatus = String(); var detariffDiscountRate = String()
    var vehicleAge = Int();var vehicleCode = String(); var vehicleModel = String()
    var vehicleClassCode = String(); var numberofWheel = String(); var quotationid = String(); var gstValue =  String(); var policytype = String()
    var commonYear = String(); var customerType = String(); var exShowRoomPrice = String(); var fiveYear = String(); var calIdv = String();var vehicle = String();var state = String(); var basicOdAmount = String();  var basicTpAmount = String(); var netPremium = String();var totalIdv = String()
    
    var accidentalhospitalizationRate = String(); var costofConsumableRate = String(); var dailycashallowanceMetroRate = String();var dailycashAllowanceRate = String();
    var drivingtrainprotectRate = String(); var engineprotectDieselRate = String(); var engineprotectorRAte = String(); var hydrostaticlockcoverRate = String(); var keyreplacementRate = String();var manufacturerRate = String(); var nildepritiationwaivercoverRate = String();var returntoinvoiceRate = String();var roadsideAssistance = String()
    
    var pacovertoemployesofInsuredRate = String(); var builtincnglpkitODRate = String()
    var builtincnglpkitTPRate = String();var cnglpgkitODRate = String();var cnglpgkitTPRate = String();var eLECTRICALACCESSORYOD = String();var fIBERTANKODRate = String(); var lEGALLIABILITYTOPAIDDRIVER = String()
    var nOnELECTRICALACCESSORYODRate = String(); var otherodRate = String()
    var otherTPRate = String();var pacovertoownerdriverRate = String();var pacovertopaidDriverRate = String();var pacovertoPassengersRate = String()
    var unnamedPACoverToPAssengers = String()
    
    //MARK: -  view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveGetQuote_View?.isHidden = true
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionViewA?.delegate = self
        self.collectionViewA?.dataSource = self
        self.collectionViewB?.delegate = self
        self.collectionViewB?.dataSource = self
        self.cornerRadious()
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
//        self.commonYear = self.yearlater
//        self.onLuminosityChange()
        self.retrieveData()
        self.vehicleMotorGetQuote()
    }
    //MARK: -  view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.secondTimeSetData()
        self.vehicleMotorRenewQuote()
       
        

//        if count == 0{
//            self.addOn_view?.isHidden = true
//            self.addOn_NsView?.constant = 0
//        }else if countt == 0{
//            self.additionalCover_View?.isHidden = true
//            self.additionalCoverNs_View?.constant = 0
//        }else{
//            self.addOn_view?.isHidden = false
//            self.addOn_NsView?.constant = 140
//            self.additionalCover_View?.isHidden = false
//            self.additionalCoverNs_View?.constant = 160
//        }
      }
    //MARK: - Button Action
    @objc func additionalCheckBtn(sender:UIButton){
//        print("Button")
        
        let collection = AdditionalDiscountCell()
        
        
        if collection.additionalCheckBtn?.isSelected == true{
            collection.additionalCheckBtn?.setImage(UIImage(named: "checked"), for: .normal)
        }
        
        
        let data = coverdata[sender.tag]
        let daaaa = coverdatad[sender.tag]
        if data == "PA COVER TO EMPLOYEES OF INSURED"{
          self.pACOVERTOEMPLOYEESOFINSUREDStatus = "True"
          self.pacovertoemployesofInsuredRate = daaaa
            
            self.vehicleMotorRenewQuote()
        }else if data == "BUILTIN CNGLPG KIT OD"{
          self.bUILTINCNGKIT_LPGKITODStatus = "True"
          self.builtincnglpkitODRate = daaaa
            
            self.vehicleMotorRenewQuote()
        }else if data == "BUILTIN CNGLPG KIT TP"{
            self.bUILTINCNGKIT_LPGKITTPStatus = "True"
            self.builtincnglpkitTPRate = daaaa
            
            self.vehicleMotorRenewQuote()
        }else if data == "CNGLPG KIT OD"{
            self.cNGLPGKITODStatus = "True"
            self.cnglpgkitODRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "NON ELECTRICAL ACCESSORY OD"{
            self.nONELECTRICALACCESSORYODStatus = "True"
            self.nOnELECTRICALACCESSORYODRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "ELECTRICAL ACCESSORY OD"{
            self.eLECTRICALACCESSORYODStatus = "True"
            self.nOnELECTRICALACCESSORYODRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "FIBERTANK OD"{
            self.fIBERTANKODStatus = "True"
            self.fIBERTANKODRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "LEGAL LIABILITY TO PAID DRIVER"{
            self.lEGALLIABILITYTOPAIDDRIVERStatus = "True"
            self.lEGALLIABILITYTOPAIDDRIVER = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "CNGLPG KIT TP"{
            self.cNGLPGKITTPStatus = "True"
            self.cnglpgkitTPRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "Other OD"{
            self.otherODStatus = "True"
            self.otherodRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "Other TP"{
            self.otherTPStatus = "True"
            self.otherTPRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "PA COVER TO OWNER DRIVER"{
            self.pACOVERTOOWNERDRIVERStatus = "True"
            self.pacovertoownerdriverRate = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "UNNAMED PA COVER TO PASSENGERS"{
            self.uNNAMEDPACOVERTOPASSENGERSStatus = "True"
            self.unnamedPACoverToPAssengers = daaaa
            self.vehicleMotorRenewQuote()
        }else if data == "PA COVER TO PASSENGERS"{
            self.pACOVERTOPASSENGERSStatus = "True"
            self.pacovertoPassengersRate = daaaa
            self.vehicleMotorRenewQuote()
        }else{
            self.pACOVERTOPASSENGERSStatus = "False"
            self.pacovertoPassengersRate = "0.0"
            self.uNNAMEDPACOVERTOPASSENGERSStatus = "False"
            self.unnamedPACoverToPAssengers = "0.0"
            self.pACOVERTOOWNERDRIVERStatus = "False"
            self.pacovertoownerdriverRate = "0.0"
            self.otherTPStatus = "False"
            self.otherTPRate = "0.0"
            self.otherODStatus = "False"
            self.otherodRate = "0.0"
            self.cNGLPGKITTPStatus = "False"
            self.cnglpgkitTPRate = "0.0"
            self.lEGALLIABILITYTOPAIDDRIVERStatus = "False"
            self.lEGALLIABILITYTOPAIDDRIVER = "0.0"
            self.fIBERTANKODStatus = "False"
            self.fIBERTANKODRate = "0.0"
            
            self.pACOVERTOEMPLOYEESOFINSUREDStatus = "False"
            self.pacovertoemployesofInsuredRate = "0.0"
            self.bUILTINCNGKIT_LPGKITODStatus = "False"
              self.builtincnglpkitODRate = "0.0"
               self.bUILTINCNGKIT_LPGKITTPStatus = "False"
               self.builtincnglpkitTPRate = "0.0"
               self.cNGLPGKITODStatus = "False"
               self.cnglpgkitODRate = "0.0"
               self.nONELECTRICALACCESSORYODStatus = "False"
               self.nOnELECTRICALACCESSORYODRate = "0.0"
               self.eLECTRICALACCESSORYODStatus = "False"
            self.nOnELECTRICALACCESSORYODRate = "0.0"
        }
       }
    //MARK: - Button Action
    @objc func removeAddon(sender:UIButton){
        let addonRate = addonCoverdata[sender.tag]
        let addonStatus = addonCoverNamedata[sender.tag]
        if addonStatus == "DAILY CASH ALLOWANCE"{
            self.dAILYCASHALLOWANCEStatus = "True"
            self.dailycashAllowanceRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "ACCIDENTAL HOSPITALIZATION"{
            self.aCCIDENTALHOSPITALIZATIONStatus = "True"
            self.accidentalhospitalizationRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "COST OF CONSUMABLE"{
            self.cOSTOFCONSUMABLESStatus = "True"
            self.costofConsumableRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "DAILY CASH ALLOWANCE - METRO"{
            self.dAILYCASHALLOWANCEMETROStatus = "True"
            self.dailycashallowanceMetroRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "DAILY CASH ALLOWANCE - NONMETRO"{
            self.dAILYCASHALLOWANCENONMETROStatus = "True"
//            self.dailycashallowancenon = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "DRIVING TRAIN PROTECT"{
            self.dRIVINGTRAINPROTECTStatus = "True"
            self.drivingtrainprotectRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "KEY REPLACEMENT"{
            self.kEYREPLACEMENTStatus = "True"
            self.keyreplacementRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "MANUFACTURER SELLING PRICE"{
            self.mmANUFACTURERSELLINGPRICEStatus = "True"
            self.manufacturerRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "Nil Depreciation Waiver cover"{
            self.nilDepreciationWaivercoverStatus = "True"
            self.nildepreciationwaiverCoverRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "RETURN TO INVOICE"{
            self.rETURNTOINVOICEStatus = "True"
            self.returntoinvoiceRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "Road side Assistance"{
            self.roadsideAssistanceStatus = "True"
            self.roadsideAssistance = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "ENGINE PROTECTOR - DIESEL"{
            self.eNGINEPROTECTORDIESELStatus = "True"
            self.eNGINEPROTECTORDIESELRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "ENGINE PROTECTOR - PETROL"{
            self.eNGINEPROTECTORPETROLStatus = "True"
            self.eNGINEPROTECTORPETROLRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "HYDROSTATIC LOCK COVER"{
            self.hYDROSTATICLOCKCOVERStatus = "True"
            self.hydrostaticlockcoverRate = addonRate
            self.vehicleMotorRenewQuote()
        }else if addonStatus == "SECURE TOWING"{
            self.sECURETOWINGStatus = "True"
            self.sECURETOWINGRate = addonRate
            self.vehicleMotorRenewQuote()
        }
//        ["DAILY CASH ALLOWANCE", "ACCIDENTAL HOSPITALIZATION", "DAILY CASH ALLOWANCE - METRO", "DAILY CASH ALLOWANCE - NONMETRO", "DRIVING TRAIN PROTECT", "COST OF CONSUMABLES", "KEY REPLACEMENT", "MANUFACTURER SELLING PRICE", "Nil Depreciation Waiver cover", "RETURN TO INVOICE", "Road side Assistance", "ENGINE PROTECTOR - DIESEL", "ENGINE PROTECTOR - PETROL", "HYDROSTATIC LOCK COVER", "SECURE TOWING"]
    }
    //MARK: - func for the corner radious
    func cornerRadious(){
        self.comprehensive_View?.layer.cornerRadius = 20
        self.comprehensive_View?.layer.borderWidth = 1
        self.comprehensiveYear_View?.layer.cornerRadius = 10
        self.comprehensiveYear_View?.layer.borderWidth = 1
        self.percentage_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
        self.saveQuoteBtn?.layer.cornerRadius = 20
        self.continueBtn?.layer.cornerRadius = 20
        self.collectionView?.layer.cornerRadius = 10
        self.name_View?.layer.cornerRadius = 10
        self.getQuoteBtn?.layer.cornerRadius = 20
        self.getQuoteBtn?.layer.borderWidth = 1
        self.getQuoteBtn?.layer.borderColor = UIColor.red.cgColor
        self.name_View?.setShadow(shadowRadius: 10)
        self.vehicleName_Txt?.isUserInteractionEnabled = false
        self.vehicleNbr_Txt?.isUserInteractionEnabled = false
        self.saveGetQuote_View?.layer.cornerRadius = 20
        self.saveGetQuote_View?.setShadow(shadowRadius: 10)
        self.pacover_View?.isHidden = true
        self.pacover_NsView?.constant = 0
        self.gpacover_View?.isHidden = true
        self.gpacover_NsView?.constant = 0
      }
    @IBAction func contiueAction(){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "PrivateCarDetailWithOwner_Vc") as!                   PrivateCarDetailWithOwner_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
       }
    @IBAction func backAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - button actin for the terms and condition
    @IBAction func dlYesAction(_ sender: UIButton){
        if dlYes_Btn?.isSelected == true{
            self.vehicleMotorRenewQuote()
            dlYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            dlNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.pacover_View?.isHidden = false
            self.pacover_NsView?.constant = 96
            self.gpacover_View?.isHidden = false
            self.gpacover_NsView?.constant = 96
             }else{
            self.vehicleMotorRenewQuote()
        }
        }
    //MARK: - button actin for the terms and condition
    @IBAction func dlNoAction(_ sender: UIButton){
        if dlNo_Btn?.isSelected == true{
            dlNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            dlYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.pacover_View?.isHidden = true
            self.pacover_NsView?.constant = 0
            self.gpacover_View?.isHidden = true
            self.gpacover_NsView?.constant = 0
        }
        }
    //MARK: - button actin for the gpa Cover yes Action
    @IBAction func gpaCoverYesAction(_ sender: UIButton){
        if gpaCoverYes_Btn?.isSelected == true{
            self.pACOVERTOOWNERDRIVERStatus = "False"
            self.vehicleMotorRenewQuote()
            gpaCoverYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            gpaCoverNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
           
        }else{
        }
        }
    //MARK: - button actin for the gpa Cover No Action
    @IBAction func gpaCoverNoAction(_ sender: UIButton){
        if gpaCoverNo_Btn?.isSelected == true{
            self.pACOVERTOOWNERDRIVERStatus = "True"
            self.vehicleMotorRenewQuote()
            gpaCoverNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            gpaCoverYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }else{
        }
    }
    //MARK: - button actin for personal covers yes
    @IBAction func personalYesCoverAction(_ sender: UIButton){
        if paCoverYes_Btn?.isSelected == true{
            self.pACOVERTOOWNERDRIVERStatus = "False"
            self.vehicleMotorRenewQuote()
            paCoverYes_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            paCoverNo_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }else{
        }
        }
    //MARK: - button actin for personal covers No
    @IBAction func personalNoCoverAction(_ sender: UIButton){
        if paCoverNo_Btn?.isSelected == true{
            self.pACOVERTOOWNERDRIVERStatus = "True"
            self.vehicleMotorRenewQuote()
            paCoverNo_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            paCoverYes_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }else{
        }
        }
    //MARK: - button actin for the corporate Action
    @IBAction func corporateAction(_ sender: UIButton){
        if corporate_Btn?.isSelected == true{
            self.customerType = "Corporate"
            self.vehicleMotorRenewQuote()
            corporate_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            individual_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }else{
            self.vehicleMotorRenewQuote()

        }
    }
    //MARK: - button actin for individual Action
    @IBAction func individualAction(_ sender: UIButton){
        if individual_Btn?.isSelected == true{
            self.customerType = "Individual"
            self.vehicleMotorRenewQuote()
            individual_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            corporate_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }else{
            self.vehicleMotorRenewQuote()

        }
    }
    //MARK: - button actin for show Breakup
    @IBAction func viewAllAction(_ sender: UIButton){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewPolicyShowBreakup_Vc") as! NewPolicyShowBreakup_Vc
        self.navigationController?.present(nextVc, animated: true)
    }
    //MARK: -  slider button action
    @IBAction func clickToSliderPrice(_ sender: UISlider) {
           let value = Float(sender.value)
        self.totalIdvAmount_Lbl?.text = String(format: "%.0f", value)
        self.totalIdv = self.totalIdvAmount_Lbl?.text ?? ""
        self.vehicleMotorGetQuote()
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
    //MARK: -  button action
    @objc  func firstYrTappde(){
        self.commonYear = yearlater
        if self.twoWheeler == "twoWheeler"{
            self.productName = "TWO WHEELER PACKAGE POLICY"
            self.productCode = "2312"
            self.commonYear = self.fiveYear
            self.vehicleMotorGetQuote()
        }else{
            self.productName = "PRIVATE CAR PACKAGE POLICY"
            self.productCode = "2311"
            self.commonYear = self.threeYear
                self.vehicleMotorGetQuote()
      }
    }
    @objc  func secondYrTappde(){
        collection.firstYrBtn?.isSelected = false
        collection.secondtYrBtn?.isSelected = false
        collection.thirdYrBtn?.isSelected = true
        collection.secondtYrBtn?.setImage(#imageLiteral(resourceName: "seeeeeeeeeleeeeee"), for: .normal)
        collection.firstYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        collection.thirdYrBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
    }
    @objc  func thirdYrTappde(){
        if self.twoWheeler == "twoWheeler"{
            self.productName = "MOTOR - MOTOR TWO WHEELER  - bundled"
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
//MARK: -  retrieve data
    func retrieveData(){
        self.regDate     =   UserDefaults.standard.string(forKey: "RegDate")!
        self.makecode    =   UserDefaults.standard.string(forKey: "vehicleCode")!
        self.modelCode   =    UserDefaults.standard.string(forKey: "modelCode")!
        self.rtoCode     = UserDefaults.standard.string(forKey: "RegionCode")!
        self.city     =  UserDefaults.standard.string(forKey: "RtoLocation")!
        self.state     =  UserDefaults.standard.string(forKey: "VehicleRegStates")!
        self.VehicleBrand =  UserDefaults.standard.string(forKey: "VehicleBrand")!
        self.selectYear  =  UserDefaults.standard.string(forKey: "RegYear")!
        self.newPolicy   =  UserDefaults.standard.string(forKey: "NewPolicy")!
        self.twoWheeler  =  UserDefaults.standard.string(forKey: "TwoWheeler")!
        self.oldVehicle = UserDefaults.standard.string(forKey: "newVehicle")!
        self.vehicleAge =  UserDefaults.standard.integer(forKey: "VehicleAge")
        self.vehicleClassCode =  UserDefaults.standard.string(forKey: "VehicleClassCode")!
        self.productName =  UserDefaults.standard.string(forKey: "productName")!
        self.productCode =  UserDefaults.standard.string(forKey: "productCode")!
        self.vehicleCode =  UserDefaults.standard.string(forKey: "vehicleCode")!
        self.vehicleModel = UserDefaults.standard.string(forKey: "VehicleModel")!
        self.numberofWheel = UserDefaults.standard.string(forKey: "NumberofWheel")!
        self.vehicleName_Txt?.text = self.vehicleModel
        if self.twoWheeler == "twoWheeler"{
            self.title_Lbl?.text = "Two Wheeler Insurance"
            self.productName = "MOTOR - MOTOR TWO WHEELER  - bundled"
            self.vehicle = "TW"
            self.firstYearOdPlan_Lbl?.text = " + 5 Year TP"
            self.commonYear = self.fiveYear
              }else{
            self.title_Lbl?.text = "Four Wheeler Insurance"
                   self.vehicle = "FW"
                  self.productName = "MOTOR - MOTOR PRIVATE CAR - BUNDLED";
//                                  ProductCode="2367";
                   self.firstYearOdPlan_Lbl?.text = " + 3 Year TP"
                  self.commonYear = self.threeYear
              }
    }
    //MARK: -  save data
    func saveData(){
        self.policytype = "New Policy"
        UserDefaults.standard.set(self.quotationid, forKey: "quoteId")
        UserDefaults.standard.set(self.totalPremium, forKey: "totalPremium")
        UserDefaults.standard.set(self.customerType, forKey: "customerType")
        UserDefaults.standard.set( self.exShowRoomPrice, forKey: "ExShowRoomPrice")
        UserDefaults.standard.set(self.gstValue, forKey: "GST")
        UserDefaults.standard.set(self.basicOdAmount, forKey: "basicOdAmount")
        UserDefaults.standard.set(self.basicTpAmount, forKey: "basicTpAmount")
        UserDefaults.standard.set(self.netPremium, forKey: "netPremium")
        UserDefaults.standard.set(self.policytype, forKey: "PolicyType")
        UserDefaults.standard.set(self.commonYear, forKey: "CommonYear")
        UserDefaults.standard.set(self.totalIdv, forKey: "Idv")
        UserDefaults.standard.set(self.eLECTRICALACCESSORYODStatus      ,forKey:"eLECTRICALACCESSORYODStatus")
        UserDefaults.standard.set(self.nONELECTRICALACCESSORYODStatus   ,forKey:"nONELECTRICALACCESSORYODStatus")
        UserDefaults.standard.set(self.basicTP                          ,forKey:"basicTP")
        UserDefaults.standard.set(self.pACOVERTOEMPLOYEESOFINSUREDStatus,forKey:"pACOVERTOEMPLOYEESOFINSUREDStatus")
        UserDefaults.standard.set(self.pACOVERTOPASSENGERSStatus        ,forKey:"pACOVERTOPASSENGERSStatus")
        UserDefaults.standard.set(self.pACOVERTOPAIDDRIVERStatus        ,forKey:"pACOVERTOPAIDDRIVERStatus")
        UserDefaults.standard.set(self.otherTPStatus                    ,forKey:"otherTPStatus")
        UserDefaults.standard.set(self.fIBERTANKODStatus                ,forKey:"fIBERTANKODStatus")
        UserDefaults.standard.set(self.otherODStatus                    ,forKey:"otherODStatus")
        UserDefaults.standard.set(self.uNNAMEDPACOVERTOPASSENGERSStatus ,forKey:"uNNAMEDPACOVERTOPASSENGERSStatus")
        UserDefaults.standard.set(self.pACOVERTOOWNERDRIVERStatus       ,forKey:"pACOVERTOOWNERDRIVERStatus")
        UserDefaults.standard.set(self.lEGALLIABILITYTOPAIDDRIVERStatus ,forKey:"lEGALLIABILITYTOPAIDDRIVERStatus")
        UserDefaults.standard.set(self.roadsideAssistanceStatus         ,forKey:"roadsideAssistanceStatus")
        UserDefaults.standard.set(self.nilDepreciationWaivercoverStatus ,forKey:"nilDepreciationWaivercoverStatus")
        UserDefaults.standard.set(self.dAILYCASHALLOWANCENONMETROStatus ,forKey:"dAILYCASHALLOWANCENONMETROStatus")
        UserDefaults.standard.set(self.dAILYCASHALLOWANCEMETROStatus    ,forKey:"dAILYCASHALLOWANCEMETROStatus")
        UserDefaults.standard.set(self.kEYREPLACEMENTStatus             ,forKey:"kEYREPLACEMENTStatus")
        UserDefaults.standard.set(self.rETURNTOINVOICEStatus            ,forKey:"rETURNTOINVOICEStatus")
        UserDefaults.standard.set(self.aCCIDENTALHOSPITALIZATIONStatus  ,forKey:"aCCIDENTALHOSPITALIZATIONStatus")
        UserDefaults.standard.set(self.hYDROSTATICLOCKCOVERStatus       ,forKey:"hYDROSTATICLOCKCOVERStatus")
        UserDefaults.standard.set(self.cOSTOFCONSUMABLESStatus          ,forKey:"cOSTOFCONSUMABLESStatus")
        UserDefaults.standard.set(self.sECURETOWINGStatus               ,forKey:"sECURETOWINGStatus")
        UserDefaults.standard.set(self.tyreandRimsecureStatus           ,forKey:"tyreandRimsecureStatus")
        UserDefaults.standard.set(self.eNGINEPROTECTORPETROLStatus      ,forKey:"eNGINEPROTECTORPETROLStatus")
        UserDefaults.standard.set(self.eNGINEPROTECTORDIESELStatus      ,forKey:"eNGINEPROTECTORDIESELStatus")
        UserDefaults.standard.set(self.basicODStatus                    ,forKey:"basicODStatus")
        UserDefaults.standard.set(self.detariffDiscountStatus           ,forKey:"detariffDiscountStatus")
        UserDefaults.standard.set(self.detariffLoadingStatus            ,forKey:"detariffLoadingStatus")
        UserDefaults.standard.set(self.wRONGFUELCOVERStatus             ,forKey:"wRONGFUELCOVERStatus")
        UserDefaults.standard.set(self.dAILYCASHALLOWANCEStatus         ,forKey:"dAILYCASHALLOWANCEStatus")
        UserDefaults.standard.set(self.bUILTINCNGKIT_LPGKITTPStatus     ,forKey:"bUILTINCNGKIT_LPGKITTPStatus")
        UserDefaults.standard.set(self.dRIVINGTRAINPROTECTStatus        ,forKey:"dRIVINGTRAINPROTECTStatus")
        UserDefaults.standard.set(self.mmANUFACTURERSELLINGPRICEStatus  ,forKey:"mmANUFACTURERSELLINGPRICEStatus")
        UserDefaults.standard.set(self.bUILTINCNGKIT_LPGKITODStatus     ,forKey:"bUILTINCNGKIT_LPGKITODStatus")
        UserDefaults.standard.set(self.cNGLPGKITTPStatus                ,forKey:"cNGLPGKITTPStatus")
        UserDefaults.standard.set(self.cNGLPGKITODStatus                ,forKey:"cNGLPGKITODStatus")
        UserDefaults.standard.set(self.accidentalhospitalizationRate, forKey: "accidentalhospitalizationRate")
        UserDefaults.standard.set(self.costofConsumableRate, forKey: "costofConsumableRate")
        UserDefaults.standard.set(self.dailycashallowanceMetroRate, forKey: "dailycashallowanceMetroRate")
        UserDefaults.standard.set(self.dailycashAllowanceRate, forKey: "dailycashAllowanceRate")
        UserDefaults.standard.set(self.drivingtrainprotectRate, forKey: "drivingtrainprotectRate")
        UserDefaults.standard.set(self.engineprotectDieselRate, forKey: "engineprotectorRAte")
        UserDefaults.standard.set(self.engineprotectorRAte, forKey: "engineprotectorRAte")
        UserDefaults.standard.set(self.hydrostaticlockcoverRate, forKey: "hydrostaticlockcoverRate")
        UserDefaults.standard.set(self.keyreplacementRate, forKey: "keyreplacementRate")
        UserDefaults.standard.set(self.manufacturerRate, forKey: "manufacturerRate")
        UserDefaults.standard.set(self.nildepritiationwaivercoverRate, forKey: "nildepritiationwaivercoverRate")
        UserDefaults.standard.set(self.returntoinvoiceRate, forKey: "returntoinvoiceRate")
        UserDefaults.standard.set(self.roadsideAssistance, forKey: "roadsideAssistance")
        UserDefaults.standard.set(self.pacovertoemployesofInsuredRate, forKey: "pacovertoemployesofInsuredRate")
        UserDefaults.standard.set(self.builtincnglpkitODRate, forKey: "builtincnglpkitODRate")
        UserDefaults.standard.set(self.builtincnglpkitTPRate, forKey: "builtincnglpkitTPRate")
        UserDefaults.standard.set(self.cnglpgkitODRate, forKey: "cnglpgkitODRate")
        UserDefaults.standard.set(self.cnglpgkitTPRate, forKey: "cnglpgkitTPRate")
        UserDefaults.standard.set(self.nOnELECTRICALACCESSORYODRate, forKey: "nOnELECTRICALACCESSORYODRate")
        UserDefaults.standard.set(self.fIBERTANKODRate, forKey: "fIBERTANKODRate")
        UserDefaults.standard.set(self.lEGALLIABILITYTOPAIDDRIVER, forKey: "lEGALLIABILITYTOPAIDDRIVER")
        UserDefaults.standard.set(self.nOnELECTRICALACCESSORYODRate, forKey: "nOnELECTRICALACCESSORYODRate")
        UserDefaults.standard.set(self.otherodRate, forKey: "otherodRate")
        UserDefaults.standard.set( self.otherTPRate, forKey: "otherTPRate")
        UserDefaults.standard.set(self.pacovertoownerdriverRate, forKey: "pacovertoownerdriverRate")
        UserDefaults.standard.set(self.pacovertopaidDriverRate, forKey: "pacovertopaidDriverRate")
        UserDefaults.standard.set(self.pacovertoPassengersRate, forKey: "pacovertoPassengersRate")
        UserDefaults.standard.set(self.unnamedPACoverToPAssengers, forKey: "unnamedPACoverToPAssengers")
        UserDefaults
            .standard.set(self.nildepreciationwaiverCoverRate, forKey: "nildepreciationwaiverCoverRate")
        UserDefaults.standard.set(self.sECURETOWINGRate, forKey: "sECURETOWINGRate")
        UserDefaults.standard.set(self.eNGINEPROTECTORPETROLRate, forKey: "eNGINEPROTECTORPETROLRate")
        UserDefaults.standard.set( self.eNGINEPROTECTORDIESELRate, forKey: "eNGINEPROTECTORDIESELRate")
        UserDefaults.standard.set(self.detariffDiscountRate, forKey: "detariffDiscountRate")
        UserDefaults.standard.set(self.detariffLoadingRate, forKey: "detariffLoadingRate")
    }
    func fieldsforservice(){
        self.eLECTRICALACCESSORYODStatus        = "True"
        self.nONELECTRICALACCESSORYODStatus     = "True"
        self.basicTP                            = "True"
        self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
        self.pACOVERTOPASSENGERSStatus          = "True"
        self.pACOVERTOPAIDDRIVERStatus          = "True"
        self.otherTPStatus                      = "True"
        self.fIBERTANKODStatus                  = "True"
        self.otherODStatus                      = "True"
        self.uNNAMEDPACOVERTOPASSENGERSStatus   = "True"
        self.pACOVERTOOWNERDRIVERStatus         = "True"
        self.lEGALLIABILITYTOPAIDDRIVERStatus   = "True"
        self.roadsideAssistanceStatus           = "True"
        self.nilDepreciationWaivercoverStatus   = "True"
        self.dAILYCASHALLOWANCENONMETROStatus   = "True"
        self.dAILYCASHALLOWANCEMETROStatus      = "True"
        self.kEYREPLACEMENTStatus               = "True"
        self.rETURNTOINVOICEStatus              = "True"
        self.aCCIDENTALHOSPITALIZATIONStatus    = "True"
        self.hYDROSTATICLOCKCOVERStatus          = "True"
        self.cOSTOFCONSUMABLESStatus             = "True"
        self.sECURETOWINGStatus                  = "True"
        self.tyreandRimsecureStatus            = "True"
        self.eNGINEPROTECTORPETROLStatus       = "True"
        self.eNGINEPROTECTORDIESELStatus       = "True"
        self.basicODStatus                      = "True"
        self.detariffDiscountStatus            = "True"
        self.detariffLoadingStatus             = "True"
        self.wRONGFUELCOVERStatus              = "True"
        self.dAILYCASHALLOWANCEStatus          = "True"
        self.bUILTINCNGKIT_LPGKITTPStatus       = "True"
        self.dRIVINGTRAINPROTECTStatus          = "True"
        self.mmANUFACTURERSELLINGPRICEStatus   = "True"
        self.bUILTINCNGKIT_LPGKITODStatus      =  "True"
        self.cNGLPGKITTPStatus                = "True"
        self.cNGLPGKITODStatus                = "True"
      
    }
    func secondTimeSetData(){
        self.eLECTRICALACCESSORYODStatus        = "False"
        self.nONELECTRICALACCESSORYODStatus     = "False"
        self.basicTP                            = "True"
        self.pACOVERTOEMPLOYEESOFINSUREDStatus  = "False"
        self.pACOVERTOPASSENGERSStatus          = "False"
        self.pACOVERTOPAIDDRIVERStatus          = "False"
        self.otherTPStatus                      = "False"
        self.fIBERTANKODStatus                  = "False"
        self.otherODStatus                      = "False"
        self.uNNAMEDPACOVERTOPASSENGERSStatus   = "False"
        self.pACOVERTOOWNERDRIVERStatus         = "False"
        self.lEGALLIABILITYTOPAIDDRIVERStatus   = "False"
        self.roadsideAssistanceStatus           = "False"
        self.nilDepreciationWaivercoverStatus   = "False"
        self.dAILYCASHALLOWANCENONMETROStatus   = "False"
        self.dAILYCASHALLOWANCEMETROStatus      = "False"
        self.kEYREPLACEMENTStatus               = "False"
        self.rETURNTOINVOICEStatus              = "False"
        self.aCCIDENTALHOSPITALIZATIONStatus    = "False"
        self.hYDROSTATICLOCKCOVERStatus         = "False"
        self.cOSTOFCONSUMABLESStatus            = "False"
        self.sECURETOWINGStatus                 = "False"
        self.tyreandRimsecureStatus             = "False"
        self.eNGINEPROTECTORPETROLStatus        = "False"
        self.eNGINEPROTECTORDIESELStatus        = "False"
        self.basicODStatus                      = "True"
        self.detariffDiscountStatus             = "True"
        self.detariffLoadingStatus              = "True"
        self.wRONGFUELCOVERStatus               = "False"
        self.dAILYCASHALLOWANCEStatus           = "False"
        self.bUILTINCNGKIT_LPGKITTPStatus       = "False"
        self.dRIVINGTRAINPROTECTStatus          = "False"
        self.mmANUFACTURERSELLINGPRICEStatus    = "False"
        self.bUILTINCNGKIT_LPGKITODStatus       =  "False"
        self.cNGLPGKITTPStatus                  = "False"
        self.cNGLPGKITODStatus                  = "False"
    }
}

//MARK: - extension for the collectionview
extension NewpolicyVehicleAddons_Vc : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if  collectionView == self.collectionViewA{
            //   let count = coverdata.count + coverdatad.count
            return coverdatad.count   //coverArray.count
        }else{
            return addonCoverdata.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.collectionView{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolicyplanTimeCell", for: indexPath) as! PolicyplanTimeCell
//
//            if indexPath.row == 0 {
//                cell.fYear_View?.isHidden = false
//                cell.tYear_View?.isHidden = false
//                cell.fYear_View?.layer.cornerRadius = 10
//                cell.tYear_View?.layer.cornerRadius = 10
//                cell.fYear_View?.layer.borderWidth  = 1
//                cell.tYear_View?.layer.borderWidth  = 1
//                cell.firstYrBtn?.addTarget(self, action: #selector(firstYrTappde), for: .touchUpInside)
//                cell.thirdYrBtn?.addTarget(self, action: #selector(thirdYrTappde), for: .touchUpInside)
//                if self.twoWheeler == "twoWheeler"{
//                    cell.tYearName_Lbl?.text = " + 5 Year TP"
//                    }else{
//                    cell.tYearName_Lbl?.text = " + 3 Year TP"
////                    self.productName = "MOTOR - MOTOR PRIVATE CAR - BUNDLED"
////                    self.productCode = "2367"
////                        self.commonYear = fiveYear
////                        self.vehicleMotorGetQuote()
//                   }
//            cell.planType_Lbl?.text = plan[indexPath.row]
//            cell.totalAmount_Lbl?.text = "\("₹" + "" + self.totalPremium)";
//            cell.thirdYearAmount_Lbl?.text = "\("₹" + "" + self.totalPremium)";
//            cell.bgView?.layer.cornerRadius     = 15
//            cell.bgView?.layer.borderWidth      = 1
////            cell.bgView?.setShadow(shadowRadius: 5)
//            cell.percentage_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
//
//            cell.secondtYrBtn?.addTarget(self, action: #selector(secondYrTappde), for: .touchUpInside)
//            return cell
//            }
//        }else
        if  collectionView == self.collectionViewA{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdditionalDiscountCell", for: indexPath) as! AdditionalDiscountCell
            cell.additionalCover_Lbl?.text  = coverdatad[indexPath.row]
            //"\("₹" + "" + self.additionalCover)";
            
             cell.planDetail_Lbl?.text = coverdata[indexPath.row]
        
//
            cell.additionalCheckBtn?.tag = indexPath.row
            cell.additionalCheckBtn!.addTarget(self, action: #selector(additionalCheckBtn), for: .touchUpInside)
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
            cell.cpersonal_View?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
//            cell.bgView?.setShadow(shadowRadius: 10)
            return cell
        }else if collectionView == self.collectionViewB{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addOnCoverageCell", for: indexPath) as! addOnCoverageCell
            cell.totalAmount_Lbl?.text = addonCoverdata[indexPath.row]
            cell.cashallowence_Lbl?.text = addonCoverNamedata[indexPath.row]
            cell.addButton?.layer.cornerRadius = 20
            cell.addButton?.layer.borderWidth = 0.5
            cell.addButton?.layer.borderColor = UIColor.red.cgColor
            cell.bgView?.layer.cornerRadius = 10
            cell.bgView?.layer.borderWidth = 1
            cell.addButton?.tag = indexPath.row
            cell.addButton!.addTarget(self, action: #selector(removeAddon), for: .touchUpInside)
//            cell.bgView?.setShadow(shadowRadius: 10)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
       if collectionView == self.collectionViewA{
            return CGSize(width: width - 20, height: 160)
          }else{
            return CGSize(width: width - 20, height: 140)
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
extension NewpolicyVehicleAddons_Vc {
    private func vehicleMotorGetQuote(){
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "MobileNo":"8877996633",
                       "UserEmail":ProjectUtils.getEmailID(),
                       "UserName":ProjectUtils.getUserName(),
                       "RegistrationNumber": "",
                       "ProductCode":self.productCode,
                       "Product":"",
                       "ProductName": self.productName ,
                       "BusinessType": "New",        //self.newPolicy,
                       "VehicleClassCode": self.vehicleClassCode,
                       "VehicleMakeCode":self.vehicleCode,
                       "YearofManufacture":self.selectYear,
                       "VehicleType":self.oldVehicle,
                       "CubicCapacity":"0",        //"998.00",
                       "NumberOfWheels":self.numberofWheel,
//                       "ChassisNumber":"MA3EWDE1S00E19436",
                       "EngineNumber":"K10BN8096717",
                       "VehicleAge": self.vehicleAge,
                       "VehicleModelCode": self.modelCode, //769,
                       "RTOLocationCode": self.rtoCode,
                       "GrossVehicleWeight":"0",
                       "PlaceOfRegistration":self.city,
                       "VehicleModel":self.vehicleModel,
                       "DateOfFirstRegistration":self.regDate,
                       "DateOfRegistration":self.regDate,
                       "City":self.city,
                       "SumInsured":"",
                       "IDV":"",
                       "FuelType":"Petrol",
                       "VehicleMake":self.VehicleBrand,
                       "Fromdate":self.today,
                       "Todate":self.commonYear,
                       "BasicTP":self.basicTP,
                       "BasicODStatus":self.basicODStatus,
                       "ELECTRICALACCESSORYODStatus":self.eLECTRICALACCESSORYODStatus,
                       "NONELECTRICALACCESSORYODStatus":self.nONELECTRICALACCESSORYODStatus,
                       "PACOVERTOEMPLOYEESOFINSUREDStatus":self.pACOVERTOEMPLOYEESOFINSUREDStatus,
                       "PACOVERTOPASSENGERSStatus":self.pACOVERTOPASSENGERSStatus,
                       "PACOVERTOPAIDDRIVERStatus":self.pACOVERTOPAIDDRIVERStatus,
                       "OtherTPStatus":self.otherTPStatus,
                       "FIBERTANKODStatus":self.fIBERTANKODStatus,
                       "OtherODStatus":self.otherODStatus,
                       "UNNAMEDPACOVERTOPASSENGERSStatus":self.uNNAMEDPACOVERTOPASSENGERSStatus, "PACOVERTOOWNERDRIVERStatus":self.pACOVERTOOWNERDRIVERStatus, "LEGALLIABILITYTOPAIDDRIVERStatus":self.lEGALLIABILITYTOPAIDDRIVERStatus,
                       "RoadsideAssistanceStatus":self.roadsideAssistanceStatus,
                       "NilDepreciationWaivercoverStatus":self.nilDepreciationWaivercoverStatus, "DAILYCASHALLOWANCENONMETROStatus":self.dAILYCASHALLOWANCENONMETROStatus, "DAILYCASHALLOWANCEMETROStatus":self.dAILYCASHALLOWANCEMETROStatus,
                       "KEYREPLACEMENTStatus":self.kEYREPLACEMENTStatus,
                       "RETURNTOINVOICEStatus":self.rETURNTOINVOICEStatus,
                       "ACCIDENTALHOSPITALIZATIONStatus":self.aCCIDENTALHOSPITALIZATIONStatus, "HYDROSTATICLOCKCOVERStatus":self.aCCIDENTALHOSPITALIZATIONStatus,
                       "COSTOFCONSUMABLESStatus":self.cOSTOFCONSUMABLESStatus,
                       "SECURETOWINGStatus":self.sECURETOWINGStatus,
                       "TyreandRimsecureStatus":self.tyreandRimsecureStatus,
                       "ENGINEPROTECTORPETROLStatus":self.eNGINEPROTECTORPETROLStatus,
                       "ENGINEPROTECTORDIESELStatus":self.eNGINEPROTECTORDIESELStatus,
                       "DetariffDiscountStatus": self.detariffDiscountStatus,
                       "DetariffLoadingStatus":self.detariffLoadingStatus,
                       "WRONGFUELCOVERStatus":self.wRONGFUELCOVERStatus,
//                       "DAILYCASHALLOWANCEStatus":self.dAILYCASHALLOWANCEStatus,
                       "BUILTINCNGKIT_LPGKITTPStatus" : self.bUILTINCNGKIT_LPGKITTPStatus,
                       "DRIVINGTRAINPROTECTStatus": self.dRIVINGTRAINPROTECTStatus,
                       "MANUFACTURERSELLINGPRICEStatus": self.mmANUFACTURERSELLINGPRICEStatus,
                       "BUILTINCNGKIT_LPGKITODStatus":self.bUILTINCNGKIT_LPGKITODStatus,
                       "CNGLPGKITTPStatus": self.cNGLPGKITTPStatus,
                       "CNGLPGKITODStatus":self.cNGLPGKITODStatus
        ] as [String : Any]
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
                        let gst = Premium?["CGST"] as? [String:Any]
                        let gstVal = gst!["Value"] as? String
                        self.gstValue = gstVal as! String
                        let total = Premium?["TotalPremium"] as? [String:Any]
                        let value = total?["Value"]
//                        self.totalPremium = value as! String
//                        self.totalpremiumAmount_Lbl?.text = (value  as! String)
//                        self.comprehensivetotalPremium?.text = (value  as! String)
//                        self.totalrecomendeAmount_Lbl?.text = (value  as! String)
                        let netPremium = Premium?["NetPremium"] as? [String:Any]
                        let val = netPremium?["Value"]
                        self.netPremium = "\(val!)"
                        
                        //MARK: - coverage data fetching
                        let cover = data["Risks"] as? [String:Any]
                        let coverr = cover?["Risk"] as? [String:Any]
                        let dd = coverr?["RisksData"] as? [String:Any]
                        
                        let datetarrif = dd?["DetariffDiscounts"] as? [String:Any]
                        let  datetarrifDiscountGroup = datetarrif?["DetariffDiscountGroup"] as? [String:Any]
                        let datetarrifDiscountGroupData =   datetarrifDiscountGroup?["DetariffDiscountGroupData"] as? [String:Any]
                        let datetarrifDiscountGroupPremium =   datetarrifDiscountGroupData?["Premium"] as? [String:Any]
                        let premiumValue =   datetarrifDiscountGroupPremium?["Value"] as? String
                        
                        let datetarrifDiscountRate =   datetarrifDiscountGroupData?["Rate"] as? [String:Any]
                        let datetariffDiscountRateVal = datetarrifDiscountRate?["Value"] as? String
                        self.detariffDiscountRate = datetariffDiscountRateVal ?? ""
                        print(datetariffDiscountRateVal)
                        
                        let datetarrifLoading = dd?["DetariffLoadings"] as? [String:Any]
                        let  datetarrifLoadingGroup = datetarrifLoading?["DetariffLoadingGroup"] as? [String:Any]
                        let datetarrifLoadingGroupData =   datetarrifLoadingGroup?["DetariffLoadingGroupData"] as? [String:Any]
                        let datetarrifLoadingGroupPremium =   datetarrifLoadingGroupData?["Premium"] as? [String:Any]
                        let loadingpremiumValue =   datetarrifLoadingGroupPremium?["Value"] as? String
                        
                        let datetarrifLoadingRate =   datetarrifLoadingGroupData?["Rate"] as? [String:Any]
                        let datetariffLoadingRateVal = datetarrifLoadingRate?["Value"] as? String
                        self.detariffLoadingRate  = datetariffLoadingRateVal ?? ""
                        print(datetariffLoadingRateVal)
                        
                        
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
                            let val = num! - (num! * 0.10)
                            let vall = num! + (num! * 0.10)
                            self.minAmount?.text = String(val)
                            self.maxAmount_Lbl?.text = String(vall)
                            self.mSlider.minimumValue = val
                            self.mSlider.maximumValue = vall
                            
                            
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
//                        self.coverdata.append(ddf!)
                        let fPremium = vnvnn?[0]["Premium"] as? [String:Any]
                        let ff = fPremium?["Value"] as? String
                        self.pacovertoemployesofInsuredRate = ff ?? ""
//                        self.coverdatad.append(ff!)
                        let fRate = vnvnn?[0]["Rate"] as? [String:Any]
                        let fRateValue = fRate?["Value"] as? String
//                        self.addonCoverRatedata.append(fRateValue!)
                        if ff == "0.0"{
                            self.basicTpAmount == "0.0"
                        }else{
                            self.basicTpAmount = "\(fRateValue!)"
                        }
                        //MARK: - cover data start from here index 1
                        let cgFirst = vnvnn?[1]["CoverGroups"] as? [String:Any]
                        let cgCoverFirst = cgFirst?["Value"] as? String
//                        self.coverdata.append(cgCoverFirst!)
                        let cgFirstPremium = vnvnn?[1]["Premium"] as? [String:Any]
                        let cgFirstPremiumVal = cgFirstPremium?["Value"] as? String
                        let cgfirstRate = vnvnn?[1]["Rate"] as? [String:Any]
                        let cgFirstRateVal = cgfirstRate?["Value"] as? String
                        
                        
                        if cgFirstPremiumVal == "0.0"{
                            self.basicOdAmount = "0.0"
                        }else{
                            self.basicOdAmount = "\(cgFirstRateVal!)"
                        }
                        //MARK: - cover data start from here index 2
                        let cgSecond = vnvnn?[2]["CoverGroups"] as? [String:Any]
                        let cgCoverSecond = cgSecond?["Value"] as? String
                        self.coverdata.append(cgCoverSecond!)
                        let cgSecondPremium = vnvnn?[2]["Premium"] as? [String:Any]
                        let cgSecondPremiumVal = cgSecondPremium?["Value"] as? String
                        self.coverdatad.append(cgSecondPremiumVal!)
                        let cgSecondRate = vnvnn?[2]["Rate"] as? [String:Any]
                        let cgSecondRateVal = cgSecondRate?["Value"] as? String
                     
                        
                        //MARK: - cover data start from here index 3
                        let cgThird = vnvnn?[3]["CoverGroups"] as? [String:Any]
                        let cgCoverThird = cgThird?["Value"] as? String
                        self.coverdata.append(cgCoverThird!)
                        let cgThirdPremium = vnvnn?[3]["Premium"] as? [String:Any]
                        let cgThirdPremiumVal = cgThirdPremium?["Value"] as? String
                        self.coverdatad.append(cgThirdPremiumVal!)
                        let cgThirdRate = vnvnn?[3]["Rate"] as? [String:Any]
                        let cgThirdRateValue = cgThirdRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgThirdRateValue!)
                        
//                        self.builtincnglpkitODRate = cgThirdPremiumVal ?? ""
                       
//                        self.basicTpAmount = "\(cgThirdPremiumVal!)"
                        //MARK: - cover data start from here index 4
                        let cgFour = vnvnn?[4]["CoverGroups"] as? [String:Any]
                        let cgCoverfourth = cgFour?["Value"] as? String
                        self.coverdata.append(cgCoverfourth!)
                        let cgFourthPremium = vnvnn?[4]["Premium"] as? [String:Any]
                        let cgFourthPremiumVal = cgFourthPremium?["Value"] as? String
//                        self.builtincnglpkitTPRate = cgFourthPremiumVal ?? ""
                        self.coverdatad.append(cgFourthPremiumVal!)
                        let cgFourRate = vnvnn?[4]["Rate"] as? [String:Any]
                        let cgFourRateValue = cgFourRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgFourRateValue!)
                        if cgFourthPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 5
                        let cgFive = vnvnn?[5]["CoverGroups"] as? [String:Any]
                        let cgCoverFive = cgFive?["Value"] as? String
                        self.coverdata.append(cgCoverFive!)

                        let cgFivePremium = vnvnn?[5]["Premium"] as? [String:Any]
                        let cgFivePremiumVal = cgFivePremium?["Value"] as? String
//                        self.cnglpgkitODRate = cgFivePremiumVal ?? ""
//                        self.basicTpAmount = "\(cgFivePremiumVal!)"
                        let cgFiveRate = vnvnn?[5]["Rate"] as? [String:Any]
                        let cgFiveRateValue = cgFiveRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgFiveRateValue!)
                        if cgFivePremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 6
                        let cgSix = vnvnn?[6]["CoverGroups"] as? [String:Any]
                        let cgCoverSix = cgSix?["Value"] as? String
                        self.coverdata.append(cgCoverSix!)
                        let cgSixPremium = vnvnn?[6]["Premium"] as? [String:Any]
                        let cgSixPremiumVal = cgSixPremium?["Value"] as? String
//                        self.cnglpgkitTPRate = cgSixPremiumVal ?? ""
                        self.coverdatad.append(cgSixPremiumVal!)
                        let cgSixRate = vnvnn?[6]["Rate"] as? [String:Any]
                        let cgSixRateValue = cgSixRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgSixRateValue!)
                        if cgSixPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 7
                        let cgSeven = vnvnn?[7]["CoverGroups"] as? [String:Any]
                        let cgCoverSeven = cgSeven?["Value"] as? String
                        self.coverdata.append(cgCoverSeven!)

                        let cgSevenPremium = vnvnn?[7]["Premium"] as? [String:Any]
                        let cgSevenPremiumVal = cgSevenPremium?["Value"] as? String
//                        self.nOnELECTRICALACCESSORYODRate = cgSevenPremiumVal ?? ""
                        self.coverdatad.append(cgSevenPremiumVal!)
                        let cgSevenRate = vnvnn?[7]["Rate"] as? [String:Any]
                        let cgSevenRateValue = cgSevenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgSevenRateValue!)
                        if cgSevenPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 8
                        let cgEight = vnvnn?[8]["CoverGroups"] as? [String:Any]
                        let cgCoverEight = cgEight?["Value"] as? String
                        self.coverdata.append(cgCoverEight!)
                        let cgEightPremium = vnvnn?[8]["Premium"] as? [String:Any]
                        let cgEightPremiumVal = cgEightPremium?["Value"] as? String
//                        self.fIBERTANKODRate = cgEightPremiumVal ?? ""
                        self.coverdatad.append(cgEightPremiumVal!)
                        let cgEightRate = vnvnn?[8]["Rate"] as? [String:Any]
                        let cgEightRateValue = cgEightRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgEightRateValue!)
                        if cgEightPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 9
                        let cgNine = vnvnn?[9]["CoverGroups"] as? [String:Any]
                        let cgCoverNine = cgNine?["Value"] as? String
                        self.coverdata.append(cgCoverNine!)

                        let cgNinePremium = vnvnn?[9]["Premium"] as? [String:Any]
                        let cgNinePremiumVal = cgNinePremium?["Value"] as? String
//                        self.lEGALLIABILITYTOPAIDDRIVER  = cgNinePremiumVal ?? ""
                      
                        self.coverdatad.append(cgNinePremiumVal!)
                        let cgNineRate = vnvnn?[9]["Rate"] as? [String:Any]
                        let cgNineRateValue = cgNineRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgNineRateValue!)
                        if cgNinePremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 10
                        let cgTen = vnvnn?[10]["CoverGroups"] as? [String:Any]
                        let cgCoverTen = cgTen?["Value"] as? String
                        self.coverdata.append(cgCoverTen!)
                        let cgTensPremium = vnvnn?[10]["Premium"] as? [String:Any]
                        let cgTensPremiumVal = cgTensPremium?["Value"] as? String
//                        self.nOnELECTRICALACCESSORYODRate = cgTensPremiumVal ?? ""
                       
                        self.coverdatad.append(cgTensPremiumVal!)
                        let cgTenRate = vnvnn?[10]["Rate"] as? [String:Any]
                        let cgTenRateValue = cgTenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgTenRateValue!)
                        if cgTensPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 11
                        let cgEleven = vnvnn?[11]["CoverGroups"] as? [String:Any]
                        let cgCoverEleven = cgEleven?["Value"] as? String
                        self.coverdata.append(cgCoverEleven!)

                        let cgElevenPremium = vnvnn?[11]["Premium"] as? [String:Any]
                        let cgElevenPremiumVal = cgElevenPremium?["Value"] as? String
//                        self.otherodRate = cgElevenPremiumVal ?? ""
                        self.coverdatad.append(cgElevenPremiumVal!)
                        let cgElevenRate = vnvnn?[11]["Rate"] as? [String:Any]
                        let cgElevenRateValue = cgElevenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgElevenRateValue!)
                        if cgElevenPremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 12
                        let cgTweleve = vnvnn?[12]["CoverGroups"] as? [String:Any]
                        let cgCoverTweleve = cgTweleve?["Value"] as? String
                        self.coverdata.append(cgCoverTweleve!)
                        let cgTwelevePremium = vnvnn?[12]["Premium"] as? [String:Any]
                        let cgTwelevePremiumVal = cgTwelevePremium?["Value"] as? String
//                        self.otherTPRate = cgTwelevePremiumVal ?? ""
                        self.coverdatad.append(cgTwelevePremiumVal!)
                        let cgTweleveRate = vnvnn?[12]["Rate"] as? [String:Any]
                        let cgTweleveRateValue = cgTweleveRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgTweleveRateValue!)
                        if cgTwelevePremiumVal != "0.00"{
                        }else{
                            //                            self.coverdatad.remove(at: IndexPath)
                        }
                        //MARK: - cover data start from here index 13
                        let cgThirteen = vnvnn?[13]["CoverGroups"] as? [String:Any]
                        let cgCoverThirtien = cgThirteen?["Value"] as? String
                        self.coverdata.append(cgCoverThirtien!)
                        let cgThirtinPremium = vnvnn?[13]["Premium"] as? [String:Any]
                        let cgThirtinPremiumVal = cgThirtinPremium?["Value"] as? String
//                        self.pacovertoownerdriverRate = cgThirtinPremiumVal ?? ""
                        self.coverdatad.append(cgThirtinPremiumVal!)
                        let cgThirteenRate = vnvnn?[13]["Rate"] as? [String:Any]
                        let cgThirteenRateValue = cgThirteenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgThirteenRateValue!)
                        //MARK: - cover data start from here index 14
                        let cgFourteen = vnvnn?[14]["CoverGroups"] as? [String:Any]
                        let cgCoverFourteen = cgFourteen?["Value"] as? String
                        self.coverdata.append(cgCoverFourteen!)
                        let cgFourteenPremium = vnvnn?[14]["Premium"] as? [String:Any]
                        let cgFourteenPremiumVal = cgFourteenPremium?["Value"] as? String
//                        self.pacovertopaidDriverRate = cgFourteenPremiumVal ?? ""
                        self.coverdatad.append(cgFourteenPremiumVal!)
                        let cgFourteenRate = vnvnn?[14]["Rate"] as? [String:Any]
                        let cgFourteenRateValue = cgFourteenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgFourteenRateValue!)
                        //MARK: - cover data start from here index 15
                        let cgFifteen = vnvnn?[15]["CoverGroups"] as? [String:Any]
                        let cgCoverFifteen = cgFifteen?["Value"] as? String
                        self.coverdata.append(cgCoverFifteen!)
                        let cgFifteenPremium = vnvnn?[15]["Premium"] as? [String:Any]
                        let cgFifteenPremiumVal = cgFifteenPremium?["Value"] as? String
//                        self.pacovertoPassengersRate = cgFifteenPremiumVal ?? ""
                        self.coverdatad.append(cgFifteenPremiumVal!)
                        let cgFifteenRate = vnvnn?[15]["Rate"] as? [String:Any]
                        let cgFifteenRateValue = cgFifteenRate?["Value"] as? String
                        self.addonCoverRatedata.append(cgFifteenRateValue!)
                        //MARK: - cover data start from here index 16
//                        let cgSixteen = vnvnn?[16]["CoverGroups"] as? [String:Any]
//                        let cgCoverSixteen = cgSixteen?["Value"] as? String
//                        self.coverdata.append(cgCoverSixteen!)
//                        let cgSixteenPremium = vnvnn?[16]["Premium"] as? [String:Any]
//                        let cgSixteenPremiumVal = cgSixteenPremium?["Value"] as? String
////                        self.unnamedPACoverToPAssengers = cgSixteenPremiumVal ?? ""
//                        self.coverdatad.append(cgSixteenPremiumVal!)
//                        let cgSixteenRate = vnvnn?[16]["Rate"] as? [String:Any]
//                        let cgSixteenRateValue = cgSixteenRate?["Value"] as? String
//                        self.addonCoverRatedata.append(cgSixteenRateValue!)
                        print(self.coverdata)
                        print(self.coverdata)
                        print(self.addonCoverRatedata)

                        self.collectionViewA?.reloadData()
                        
                        //MARK: -  addon cover data
                        if let AddonCoverDetails = dd?["AddonCoverDetails"] as? [String:Any]{
                            let AddonCovers = AddonCoverDetails["AddonCovers"] as? [String:Any]
                            let AddonCoversData = AddonCovers?["AddonCoversData"] as? [[String:Any]]
                            
                            
//
//                            self.dataArray = AddonCoversData!.compactMap({AddonModel(json: JSON(rawValue: $0) ?? 0)})
//                                                   print(self.dataArray.count)
                                                   self.collectionViewB?.reloadData()
                            
                            
                            // MARK: - cover data start from here index 0
                            let addonFirst = AddonCoversData?[0]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverFirst = addonFirst?["Value"] as? String
                            print(addonCoverFirst)
                            self.addonCoverNamedata.append(addonCoverFirst!)
                            let addonFirstPremium = AddonCoversData?[0]["Premium"] as? [String:Any]
                            let addonFirstPremiumVal = addonFirstPremium?["Value"] as? String
//                            self.accidentalhospitalizationRate = addonFirstPremiumVal ?? ""
                          
//                            if addonFirstPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFirstPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 1
                            let addonSecond = AddonCoversData?[1]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverSecond = addonSecond?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverSecond!)
                            let addonSecondPremium = AddonCoversData?[1]["Premium"] as? [String:Any]
                            let addonSecondPremiumVal = addonSecondPremium?["Value"] as? String
//                            self.costofConsumableRate = addonSecondPremiumVal ?? ""
                            
//                            if addonSecondPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSecondPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 2
                            let addonThird = AddonCoversData?[2]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverThird = addonThird?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverThird!)
                            let addonthirdPremium = AddonCoversData?[2]["Premium"] as? [String:Any]
                            let addonThirdPremiumVal = addonthirdPremium?["Value"] as? String
//                            self.dailycashallowanceMetroRate = addonThirdPremiumVal ?? ""
                         
//                            if addonThirdPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonThirdPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 3
                            let addonFourth = AddonCoversData?[3]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverFourth = addonFourth?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverFourth!)
                            let addonFourthPremium = AddonCoversData?[3]["Premium"] as? [String:Any]
                            let addonFourthPremiumVal = addonFourthPremium?["Value"] as? String
//                            self.dailycashAllowanceRate = addonFourthPremiumVal ?? ""
                           
//                            if addonFourthPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFourthPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 4
                            let addonFive = AddonCoversData?[4]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverFive = addonFive?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverFive!)
                            let addonFivePremium = AddonCoversData?[4]["Premium"] as? [String:Any]
                            let addonFivePremiumVal = addonFivePremium?["Value"] as? String
//                            self.drivingtrainprotectRate = addonFivePremiumVal ?? ""
                          
//                            if addonFivePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonFivePremiumVal!)
//                            }
                            // MARK: - cover data start from here index 5
                            let addonSix = AddonCoversData?[5]["AddonCoverGroups"] as? [String:Any]
                            let addonSixFirst = addonSix?["Value"] as? String
                           self.addonCoverNamedata.append(addonSixFirst!)
                            let addonSixPremium = AddonCoversData?[5]["Premium"] as? [String:Any]
                            let addonSixPremiumVal = addonSixPremium?["Value"] as? String
//                            self.engineprotectDieselRate = addonSixPremiumVal ?? ""
//                            if addonSixPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSixPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 6
                            let addonSeven = AddonCoversData?[6]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverSeven = addonSeven?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverSeven!)
                            let addonSevenPremium = AddonCoversData?[6]["Premium"] as? [String:Any]
                            let addonSevenPremiumVal = addonSevenPremium?["Value"] as? String
//                            self.engineprotectorRAte = addonSevenPremiumVal ?? ""
//                            if addonSevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonSevenPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 7
                            let addonEight = AddonCoversData?[7]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverEight = addonEight?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverEight!)
                            let addonEightPremium = AddonCoversData?[7]["Premium"] as? [String:Any]
                            let addonEightPremiumVal = addonEightPremium?["Value"] as? String
//                            self.hydrostaticlockcoverRate = addonEightPremiumVal ?? ""
//                            if addonEightPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonEightPremiumVal!)
//                            }
                            // MARK: - cover data start from here index 8
                            let addonNine = AddonCoversData?[8]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverNine = addonNine?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverNine!)
                            let addonNinePremium = AddonCoversData?[8]["Premium"] as? [String:Any]
                            let addonNinePremiumVal = addonNinePremium?["Value"] as? String
//                            self.keyreplacementRate = addonNinePremiumVal ?? ""
//                            if addonNinePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonNinePremiumVal!)
//                            }
                            // MARK: - cover data start from here index 9
                            let addonTen = AddonCoversData?[9]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverTen = addonTen?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverTen!)
                            let addonTenPremium = AddonCoversData?[9]["Premium"] as? [String:Any]
                            let addonTenPremiumVal = addonTenPremium?["Value"] as? String
//                            self.manufacturerRate = addonTenPremiumVal ?? ""
//                            if addonTenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTenPremiumVal!)
//                            }
                            
                            
                            // MARK: - cover data start from here index 10
                            let addonEleven = AddonCoversData?[10]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverEleven = addonEleven?["Value"] as? String
                            self.addonCoverNamedata.append(addonCoverEleven!)
                            let addonElevenPremium = AddonCoversData?[10]["Premium"] as? [String:Any]
                            let addonElevenPremiumVal = addonElevenPremium?["Value"] as? String
//                            self.nildepritiationwaivercoverRate = addonElevenPremiumVal ?? ""
//                            if addonElevenPremiumVal != "0.00"{
                                self.addonCoverdata.append(addonElevenPremiumVal!)
//                            }
                            
                            
                            // MARK: - cover data start from here index 11
                            let addonTweleve = AddonCoversData?[11]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverTweleve = addonTweleve?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverTweleve!)
                            let addonTwelevePremium = AddonCoversData?[11]["Premium"] as? [String:Any]
                            let addonTwelevePremiumVal = addonTwelevePremium?["Value"] as? String
//                            self.returntoinvoiceRate = addonTwelevePremiumVal ?? ""
//                            if addonTwelevePremiumVal != "0.00"{
                                self.addonCoverdata.append(addonTwelevePremiumVal!)
//                            }
                            
                            // MARK: - cover data start from here index 12
                            let addonThirteen = AddonCoversData?[12]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverThirteen = addonThirteen?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverThirteen!)
                            let addonThirteenPremium = AddonCoversData?[12]["Premium"] as? [String:Any]
                            let addonThirteenPremiumVal = addonThirteenPremium?["Value"] as? String
//                            self.roadsideAssistance = addonThirdPremiumVal ?? ""
                            self.addonCoverdata.append(addonThirteenPremiumVal!)
                            
                            // MARK: - cover data start from here index 13
                            let addonFourteen = AddonCoversData?[13]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverFourteen = addonFourteen?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverFourteen!)
                            let addonFourteenPremium = AddonCoversData?[13]["Premium"] as? [String:Any]
                            let addonFourrteenPremiumVal = addonFourteenPremium?["Value"] as? String
//                            self.roadsideAssistance = addonFourrteenPremiumVal ?? ""
                            self.addonCoverdata.append(addonFourrteenPremiumVal!)
                            
                            // MARK: - cover data start from here index 14
                            let addonFifteen = AddonCoversData?[14]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverFifteen = addonFifteen?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverFifteen!)
                            print("total name", self.addonCoverNamedata)
                            let addonFifteenPremium = AddonCoversData?[14]["Premium"] as? [String:Any]
                            let addonFifteenPremiumVal = addonFifteenPremium?["Value"] as? String
//                            self.roadsideAssistance = addonFourrteenPremiumVal ?? ""
                            self.addonCoverdata.append(addonFifteenPremiumVal!)
                            // MARK: - cover data start from here index 15
                            let addonSixteen = AddonCoversData?[15]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverSixteen = addonSixteen?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverSixteen!)
                            print("total name", self.addonCoverNamedata)
                            let addonSixteenPremium = AddonCoversData?[15]["Premium"] as? [String:Any]
                            let addonSixteenPremiumVal = addonSixteenPremium?["Value"] as? String
                            self.addonCoverdata.append(addonSixteenPremiumVal!)
                            // MARK: - cover data start from here index 15
                            let addonSeventeen = AddonCoversData?[16]["AddonCoverGroups"] as? [String:Any]
                            let addonCoverSeventeen = addonSeventeen?["Value"] as? String
                           self.addonCoverNamedata.append(addonCoverSeventeen!)
                            print("total name", self.addonCoverNamedata)
                            let addonSeventeenPremium = AddonCoversData?[16]["Premium"] as? [String:Any]
                            let addonSeventeenPremiumVal = addonSeventeenPremium?["Value"] as? String
                            self.addonCoverdata.append(addonSeventeenPremiumVal!)
                            print(self.addonCoverdata.count)
//                            if addonThirteenPremiumVal != "0.00"{
//                            }
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
    
    private func vehicleMotorRenewQuote(){
        let params =  ["TokenNo":tokenNo,
                       "Uid":String(ProjectUtils.getUserID()),
                       "MobileNo":"8877996633",
                       "UserEmail":ProjectUtils.getEmailID(),
                       "UserName":ProjectUtils.getUserName(),
                       "RegistrationNumber": "",
                       "ProductCode":self.productCode,
                       "Product":"",
                       "ProductName": self.productName ,
                       "BusinessType": "New",        //self.newPolicy,
                       "VehicleClassCode": self.vehicleClassCode,
                       "VehicleMakeCode":self.vehicleCode,
                       "YearofManufacture":self.selectYear,
                       "VehicleType":self.oldVehicle,
                       "CubicCapacity":"0",        //"998.00",
                       "NumberOfWheels":self.numberofWheel,
//                       "ChassisNumber":"MA3EWDE1S00E19436",
                       "EngineNumber":"K10BN8096717",
                       "VehicleAge": self.vehicleAge,
                       "VehicleModelCode": self.modelCode, //769,
                       "RTOLocationCode": self.rtoCode,
                       "GrossVehicleWeight":"0",
                       "PlaceOfRegistration":self.city,
                       "VehicleModel":self.vehicleModel,
                       "DateOfFirstRegistration":self.regDate,
                       "DateOfRegistration":self.regDate,
                       "City":self.city,
                       "SumInsured":"",
                       "IDV":"",
                       "FuelType":"Petrol",
                       "VehicleMake":self.VehicleBrand,
                       "Fromdate":self.today,
                       "Todate":self.commonYear,
                       "BasicTP":self.basicTP,
                       "BasicODStatus":self.basicODStatus,
                       "ELECTRICALACCESSORYODStatus":self.eLECTRICALACCESSORYODStatus,
                       "NONELECTRICALACCESSORYODStatus":self.nONELECTRICALACCESSORYODStatus,
                       "PACOVERTOEMPLOYEESOFINSUREDStatus":self.pACOVERTOEMPLOYEESOFINSUREDStatus,
                       "PACOVERTOPASSENGERSStatus":self.pACOVERTOPASSENGERSStatus,
                       "PACOVERTOPAIDDRIVERStatus":self.pACOVERTOPAIDDRIVERStatus,
                       "OtherTPStatus":self.otherTPStatus,
                       "FIBERTANKODStatus":self.fIBERTANKODStatus,
                       "OtherODStatus":self.otherODStatus,
                       "UNNAMEDPACOVERTOPASSENGERSStatus":self.uNNAMEDPACOVERTOPASSENGERSStatus, "PACOVERTOOWNERDRIVERStatus":self.pACOVERTOOWNERDRIVERStatus, "LEGALLIABILITYTOPAIDDRIVERStatus":self.lEGALLIABILITYTOPAIDDRIVERStatus,
                       "RoadsideAssistanceStatus":self.roadsideAssistanceStatus,
                       "NilDepreciationWaivercoverStatus":self.nilDepreciationWaivercoverStatus, "DAILYCASHALLOWANCENONMETROStatus":self.dAILYCASHALLOWANCENONMETROStatus, "DAILYCASHALLOWANCEMETROStatus":self.dAILYCASHALLOWANCEMETROStatus,
                       "KEYREPLACEMENTStatus":self.kEYREPLACEMENTStatus,
                       "RETURNTOINVOICEStatus":self.rETURNTOINVOICEStatus,
                       "ACCIDENTALHOSPITALIZATIONStatus":self.aCCIDENTALHOSPITALIZATIONStatus, "HYDROSTATICLOCKCOVERStatus":self.aCCIDENTALHOSPITALIZATIONStatus,
                       "COSTOFCONSUMABLESStatus":self.cOSTOFCONSUMABLESStatus,
                       "SECURETOWINGStatus":self.sECURETOWINGStatus,
                       "TyreandRimsecureStatus":self.tyreandRimsecureStatus,
                       "ENGINEPROTECTORPETROLStatus":self.eNGINEPROTECTORPETROLStatus,
                       "ENGINEPROTECTORDIESELStatus":self.eNGINEPROTECTORDIESELStatus,
                       "DetariffDiscountStatus": self.detariffDiscountStatus,
                       "DetariffLoadingStatus":self.detariffLoadingStatus,
                       "WRONGFUELCOVERStatus":self.wRONGFUELCOVERStatus,
//                       "DAILYCASHALLOWANCEStatus":self.dAILYCASHALLOWANCEStatus,
                       "BUILTINCNGKIT_LPGKITTPStatus" : self.bUILTINCNGKIT_LPGKITTPStatus,
                       "DRIVINGTRAINPROTECTStatus": self.dRIVINGTRAINPROTECTStatus,
                       "MANUFACTURERSELLINGPRICEStatus": self.mmANUFACTURERSELLINGPRICEStatus,
                       "BUILTINCNGKIT_LPGKITODStatus":self.bUILTINCNGKIT_LPGKITODStatus,
                       "CNGLPGKITTPStatus": self.cNGLPGKITTPStatus,
                       "CNGLPGKITODStatus":self.cNGLPGKITODStatus
        ] as [String : Any]
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
                        let gst = Premium?["CGST"] as? [String:Any]
                        let gstVal = gst!["Value"] as? String
                        self.gstValue = gstVal as! String
                        let total = Premium?["TotalPremium"] as? [String:Any]
                        let value = total?["Value"]
                        self.totalPremium = value as! String
                        self.totalpremiumAmount_Lbl?.text = (value  as! String)
                        self.comprehensivetotalPremium?.text = (value  as! String)
                        self.totalrecomendeAmount_Lbl?.text = (value  as! String)
                        let netPremium = Premium?["NetPremium"] as? [String:Any]
                        let val = netPremium?["Value"]
                        self.netPremium = "\(val!)"
                        
                    
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
        self.fincTwo   = ["CoverName":"HYDROSTATICLOCKCOVER","CoverValue":"2312","TypeValue":"CoverData"]
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
