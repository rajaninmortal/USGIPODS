//
//  SuperHealthCareMedicalRetrieve_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 28/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD
import DropDown

class SuperHealthCareMedicalRetrieve_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet weak var policyTypeTxt: UITextField!
    @IBOutlet var quatationId: UITextField!
    @IBOutlet weak var familyTypeTxt: UITextField!
    @IBOutlet weak var policyTenurTxt: UITextField!
    @IBOutlet weak var sumInsuredTxt: UITextField!
    @IBOutlet weak var deductibleAmount_Txt :UITextField!
    @IBOutlet weak var deductibleAmount_Lbl: UILabel!
    
    //MARK: - Hide Show outlet
    @IBOutlet weak var discountBtn: UIButton!
    @IBOutlet weak var addoncoverBtn: UIButton!
    @IBOutlet weak var medicalPermissionBtn: UIButton!
    @IBOutlet weak var medicalPermissionView: UIView!
    //MARK: - critical illness view details
    @IBOutlet weak var global_Lbl: UILabel!
    @IBOutlet weak var globalNs_Lbl: NSLayoutConstraint!
    @IBOutlet weak var criSelfDetailLbl: UILabel!
    @IBOutlet weak var criSelfperBtn: UIButton!
    @IBOutlet weak var criFirstView: UIView!
    @IBOutlet weak var criFirstNsView: NSLayoutConstraint!
    @IBOutlet weak var criSpousesView: UIView!
    @IBOutlet weak var criSpousesNsView: NSLayoutConstraint!
    @IBOutlet weak var criSpousesPerBtn: UIButton!
    @IBOutlet weak var criSpousesspineImg: UIImageView!
    @IBOutlet weak var criSpousesDetailLbl: UILabel!
    @IBOutlet weak var criFirstChildView: UIView!
    @IBOutlet weak var criFirstChildNsView: NSLayoutConstraint!
    @IBOutlet weak var criFirstChildPerBtn: UIButton!
    @IBOutlet weak var criFirstChildspineImg: UIImageView!
    @IBOutlet weak var criFirstChildDetailLbl: UILabel!
    @IBOutlet weak var criSecondChildView: UIView!
    @IBOutlet weak var criSecondChildNsView: NSLayoutConstraint!
    @IBOutlet weak var criSecondChildPerBtn: UIButton!
    @IBOutlet weak var criSecondChildspineImg: UIImageView!
    @IBOutlet weak var criSecondChildDetailLbl: UILabel!
    @IBOutlet weak var criThirdChildView: UIView!
    @IBOutlet weak var criThirdChildNsView: NSLayoutConstraint!
    @IBOutlet weak var criThirdChildPerBtn: UIButton!
    @IBOutlet weak var criThirdChildspineImg: UIImageView!
    @IBOutlet weak var criThirdChildDetailLbl: UILabel!
    @IBOutlet weak var criFourthChildView: UIView!
    @IBOutlet weak var criFourthChildNsView: NSLayoutConstraint!
    @IBOutlet weak var criFourthChildPerBtn: UIButton!
    @IBOutlet weak var criFourthChildspineImg: UIImageView!
    @IBOutlet weak var criFourthChildDetailLbl: UILabel!
    @IBOutlet weak var criselfDoubleNs_View: NSLayoutConstraint!
    @IBOutlet weak var criselfDoubleeNs_View: NSLayoutConstraint!
    @IBOutlet weak var spouseDoubleNs_View: NSLayoutConstraint!
    @IBOutlet weak var firstDoubleNs_View: NSLayoutConstraint!
    @IBOutlet weak var secondDoubleNs_View: NSLayoutConstraint!
    @IBOutlet weak var thirdDoubleNs_View: NSLayoutConstraint!
    @IBOutlet weak var fourthDoubleeNS_View: NSLayoutConstraint!
    //MARK: - personal Accident view details
    @IBOutlet weak var pAccdntSelfDetailLbl: UILabel!
    @IBOutlet weak var pAccdntSelfperBtn: UIButton!
    @IBOutlet weak var pAccdntFirstView: UIView!
    @IBOutlet weak var pAccdntFirstNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntSpousesView: UIView!
    @IBOutlet weak var pAccdntSpousesNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntSpousesPerBtn: UIButton!
    @IBOutlet weak var pAccdntSpousesDetailLbl: UILabel!
    @IBOutlet weak var pAccdntFirstChildView: UIView!
    @IBOutlet weak var pAccdntFirstChildNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntFirstChildPerBtn: UIButton!
    @IBOutlet weak var pAccdntFirstChildDetailLbl: UILabel!
    @IBOutlet weak var pAccdntSecondChildView: UIView!
    @IBOutlet weak var pAccdntSecondChildNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntSecondChildPerBtn: UIButton!
    @IBOutlet weak var pAccdntSecondChildDetailLbl: UILabel!
    @IBOutlet weak var pAccdntThirdChildView: UIView!
    @IBOutlet weak var pAccdntThirdChildNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntThirdChildPerBtn: UIButton!
    @IBOutlet weak var pAccdntThirdChildDetailLbl: UILabel!
    @IBOutlet weak var pAccdntFourthChildView: UIView!
    @IBOutlet weak var pAccdntFourthChildNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntFourthChildPerBtn: UIButton!
    @IBOutlet weak var pAccdntFourthChildDetailLbl: UILabel!
    @IBOutlet weak var PersonalAccSpousesspineImg : UIImageView!
    @IBOutlet weak var PersonalAccFirstChildspineImg : UIImageView!
    @IBOutlet weak var PersonalAccSecondChildspineImg : UIImageView!
    @IBOutlet weak var PersonalAccThirdChildspineImg : UIImageView!
    @IBOutlet weak var PersonalAccFourthChildspineImg : UIImageView!
    
    @IBOutlet weak var firstDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var spouseDouble_NsView : NSLayoutConstraint!
    @IBOutlet weak var secondDoublee_NsView : NSLayoutConstraint!
    @IBOutlet weak var thirdDoublee_NsView  : NSLayoutConstraint!
    @IBOutlet weak var fourthDoubleNs_view  : NSLayoutConstraint!
    @IBOutlet weak var firstCDouble_NsView: NSLayoutConstraint!
    
   
    
    //MARK: - medical details Permission for the
  

    @IBOutlet weak var employe_Lbl: UILabel!
    @IBOutlet weak var employeeDisAmount_Lbl: UITextField!
    @IBOutlet weak var employePermissionBtn: UIButton!
    @IBOutlet weak var employeePer_View: UIView!
    @IBOutlet weak var employeeCode_Txt: UITextField!
    @IBOutlet weak var employeeCodeNs_Txt: NSLayoutConstraint!
    @IBOutlet weak var loyaltyDisPer_View: UIView!
    @IBOutlet weak var loyaltyPer_Btn: UIButton!
    @IBOutlet weak var loyaltyHideShow_View: UIView!
    @IBOutlet weak var loyaltyCode_Txt: UITextField!
    @IBOutlet weak var loyalty_Lbl: UILabel!
    @IBOutlet weak var loyaltyDiscountAmount_Txt: UITextField!
    @IBOutlet weak var loyaltyDisNs_View: NSLayoutConstraint!
    
    //MARK: - controller view
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var adjustinView: UIView!

    //MARK: - child age from back save data
    var TitleBtn = String(); var firstAdultCriLLness = String(); var firstAdultPerAccident = String(); var firstAdultHCash = String(); var totalAge = Int()
    var totalAmountCount = Int() ; var criAmountUnderage = Double(); var personalAccident = Double(); var hospitalCashOverAge = Double(); var hospitalCashUnderAge = Double()
    
    var policytype = String(); var familytype = String(); var suminsured = String(); var policytenur = String(); var totalPremium = String(); var totallPremium = String(); var quotationId = String()
    
    
    var criAmountOverage = String();var premiumm = String(); var spouse = String()
    
    
    var adultDob = String();var adultGender = String();var adultOccupation = String(); var sublimit = String();var extradiscount = String(); var extraa = String(); var sublimitDis = String()

    var criticaldetailsSelf = String();var personalAccidentDetail = String();var hospitalCashDetail = String()

    var todayDate = String();var tommarow = String();var yearlater = String();var newage = String()
    var quotationid  = String()
    //MARK: - value variable
    var fAdultArray = [String:Any]()
    var sAdultArray = [String:Any]()
    var fChildArray = [String:Any]()
    var sChildArray = [String:Any]()
    var tChildArray = [String:Any]()
    var frChildArray = [String:Any]()
    
    var empty = "0.00"
    var fAName = String();var fChild = Int()
    var sAName = String();var sChild = Int()
    var fCName = String();var tChild = Int()
    var sCName = String();var frChild = Int()
    var tCName = String()
    var frCName = String()
    var fADob = String()
    var sADob = String()
    var fCDob = String()
    var sCDob = String()
    var tCDob = String()
    var frCDob = String()
    var firstAdult = false
    var secAdult = false
    var firstChild = false
    var secChail = false
    var thardChild = false
    var fourthChaild = false
    var firstAdultValu  = Int()
    var firstTotal = Double();var secAdTotal = Double();var firChildTotal = Double();var secChildTotal = Double(); var thirdChildTotal = Double();var fourthChildTotal = Double();var sublimitDiscount = String(); var tiredDiscount = String(); var criticalTotal = Double(); var personalAccidentTotal = Double(); var hospitalCashTotal = Double();var lifestyleDiscount = String()

    var amount = String();var deductible = String(); var Authenticate = [String:Any]();var QuotationDtls = [String:Any]();var Riskdtls = [[String:Any]]();var fAdult = [String:Any]();var sAdult = [String:Any](); var age = String()
    var newAge = String();var selectyear = String(); var employeeCode = String(); var loyalteeCode = String(); var IsEmployee = String(); var isloyalcustomer = String(); var employeDiscount = String(); var loyaltydiscount = String(); var selectedPlantype = String(); var iswellness = String(); var isglobal = String(); var gstValue = String(); var basicPRemium = String(); var totalPRemium = String(); var quoteId = String()
    
    //MARK: - view life cyclevar sAdult = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.employeeCode_Txt.delegate = self
        self.loyaltyCode_Txt.delegate = self
        self.retrieveData()
        self.cornerRadious()
        self.insuredDetails()
        self.criticalSpinnerDesable()
        self.personalAccidentSpinnerDesable()
        
//        self.selectyear = "1"
//        self.policytype = "Family Floater"
//        self.familytype = "2 Adult"
//        self.policytenur = "1"
//        self.suminsured = "500000"
        self.IsEmployee = "N"
        self.isloyalcustomer = "N"
        self.iswellness = "N"
        self.isglobal = "N"
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
        
        self.fetchData()
        }
    
    func retrieveData(){
      
        self.quatationId.text =  UserDefaults.standard.string(forKey: "quoteId")!
        self.policytype = UserDefaults.standard.string(forKey: "policytype")!
        self.policyTypeTxt.text =  self.policytype
        self.familyTypeTxt.text  = UserDefaults.standard.string(forKey: "familytype")!
        self.sumInsuredTxt.text  = UserDefaults.standard.string(forKey: "suminsured")!
        self.suminsured  = UserDefaults.standard.string(forKey: "suminsured")!
        self.deductibleAmount_Txt.text = UserDefaults.standard.string(forKey: "deductible")!
        self.deductible = UserDefaults.standard.string(forKey: "deductible")!
        self.selectyear = UserDefaults.standard.string(forKey: "selectyear")!
        self.totalAmountTxt.text = UserDefaults.standard.string(forKey: "totalPRemium")!
        self.selectedPlantype = UserDefaults.standard.string(forKey: "typeLabel")!
        self.todayDate = UserDefaults.standard.string(forKey: "today")!
        self.tommarow = UserDefaults.standard.string(forKey: "tommorow")!
        self.yearlater = UserDefaults.standard.string(forKey: "yearlater")!
        self.newage = UserDefaults.standard.string(forKey: "newage")!
        self.fAName  =  UserDefaults.standard.string(forKey: "fAName")!
        self.sAName  =  UserDefaults.standard.string(forKey: "sAName")!
        self.fCName  =  UserDefaults.standard.string(forKey: "fCName")!
        self.sCName  =  UserDefaults.standard.string(forKey: "sCName")!
        self.tCName  =  UserDefaults.standard.string(forKey: "tCName")!
        self.frCName =  UserDefaults.standard.string(forKey: "frCName")!
        self.fADob   =  UserDefaults.standard.string(forKey: "fADob")!
        self.sADob   =  UserDefaults.standard.string(forKey: "sADob")!
        self.fCDob   =  UserDefaults.standard.string(forKey: "fCDob")!
        self.sCDob   =  UserDefaults.standard.string(forKey: "sCDob")!
        self.tCDob   =  UserDefaults.standard.string(forKey: "tCDob")!
        self.frCDob  =  UserDefaults.standard.string(forKey: "frCDob")!
        self.fAName  =  UserDefaults.standard.string(forKey: "fAName")!
        self.fChild  = UserDefaults.standard.integer( forKey: "fChild")
        self.sChild  = UserDefaults.standard.integer(forKey: "sChild")
        self.tChild  = UserDefaults.standard.integer( forKey: "tChild")
        self.frChild = UserDefaults.standard.integer(forKey:"frChild")
    }
    
    //MARK: - func for the desabel spinner for the critical inless
    func criticalSpinnerDesable(){
        self.criSpousesspineImg.isHidden = true
        self.criFirstChildspineImg.isHidden = true
        self.criSecondChildspineImg.isHidden = true
        self.criThirdChildspineImg.isHidden = true
        self.criFourthChildspineImg.isHidden = true
        self.criSpousesPerBtn.isEnabled = false
        self.criFirstChildPerBtn.isEnabled = false
        self.criSecondChildPerBtn.isEnabled = false
        self.criThirdChildPerBtn.isEnabled = false
        self.criFourthChildPerBtn.isEnabled = false
    }
    //MARK: - func for the desabel spinner for the critical inless
    func criticalSpinnerEnable(){
        self.criSpousesspineImg.isHidden = false
        self.criFirstChildspineImg.isHidden = false
        self.criSecondChildspineImg.isHidden = false
        self.criThirdChildspineImg.isHidden = false
        self.criFourthChildspineImg.isHidden = false
        self.criSpousesPerBtn.isEnabled = true
        self.criFirstChildPerBtn.isEnabled = true
        self.criSecondChildPerBtn.isEnabled = true
        self.criThirdChildPerBtn.isEnabled = true
        self.criFourthChildPerBtn.isEnabled = true
    }

    //MARK: - func for the desabel spinner for the Personal Accident
    func personalAccidentSpinnerDesable(){
        self.PersonalAccSpousesspineImg.isHidden = true
        self.PersonalAccFirstChildspineImg.isHidden = true
        self.PersonalAccSecondChildspineImg.isHidden = true
        self.PersonalAccThirdChildspineImg.isHidden = true
        self.PersonalAccFourthChildspineImg.isHidden = true
        self.pAccdntSpousesPerBtn.isEnabled = false
        self.pAccdntFirstChildPerBtn.isEnabled = false
        self.pAccdntSecondChildPerBtn.isEnabled = false
        self.pAccdntThirdChildPerBtn.isEnabled = false
        self.pAccdntFourthChildPerBtn.isEnabled = false
    }
    //MARK: - func for the desabel spinner for the Hospital Cash
    func personalAccidentSpinnerEnable(){
        self.PersonalAccSpousesspineImg.isHidden = false
        self.PersonalAccFirstChildspineImg.isHidden = false
        self.PersonalAccSecondChildspineImg.isHidden = false
        self.PersonalAccThirdChildspineImg.isHidden = false
        self.PersonalAccFourthChildspineImg.isHidden = false
        self.pAccdntSpousesPerBtn.isEnabled = true
        self.pAccdntFirstChildPerBtn.isEnabled = true
        self.pAccdntSecondChildPerBtn.isEnabled = true
        self.pAccdntThirdChildPerBtn.isEnabled = true
        self.pAccdntFourthChildPerBtn.isEnabled = true
    }
    //MARK: -  func for corner radious
    func cornerRadious(){
        self.medicalPermissionView.layer.cornerRadius = 20
        self.pAccdntSelfperBtn.layer.cornerRadius = 20
        self.pAccdntSpousesPerBtn.layer.cornerRadius = 20
        self.pAccdntFirstChildPerBtn.layer.cornerRadius = 20
        self.pAccdntSecondChildPerBtn.layer.cornerRadius = 20
        self.pAccdntThirdChildPerBtn.layer.cornerRadius = 20
        self.pAccdntFourthChildPerBtn.layer.cornerRadius = 20
       
        self.criSelfperBtn.layer.cornerRadius = 20
        self.criSpousesPerBtn.layer.cornerRadius = 20
        self.criFirstChildPerBtn.layer.cornerRadius = 20
        self.criSecondChildPerBtn.layer.cornerRadius = 20
        self.criThirdChildPerBtn.layer.cornerRadius = 20
        self.criFourthChildPerBtn.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.discountBtn.layer.cornerRadius = 20
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.addoncoverBtn.layer.cornerRadius = 20
        self.quatationId.layer.cornerRadius = 20
        self.loyaltyDisPer_View.layer.cornerRadius = 20
       // self.loyaltyDis_View.layer.cornerRadius = 20
        self.loyaltyCode_Txt.layer.cornerRadius = 20
        self.loyalty_Lbl.layer.cornerRadius = 20
        self.loyaltyDiscountAmount_Txt.layer.cornerRadius = 20
        self.employe_Lbl.layer.cornerRadius = 20
        self.employeeDisAmount_Lbl.layer.cornerRadius = 20
        self.employeePer_View.layer.cornerRadius = 20
        self.employeeCode_Txt.layer.cornerRadius = 20
        self.deductibleAmount_Txt.layer.cornerRadius = 20
        self.deductibleAmount_Lbl.layer.cornerRadius = 20
        self.deductibleAmount_Txt.layer.cornerRadius = 20
        self.quatationId.setLeftPaddingPoints(15)
        self.totalAmountTxt.setLeftPaddingPoints(15)
        self.policyTypeTxt.setLeftPaddingPoints(15)
        self.familyTypeTxt.setLeftPaddingPoints(15)
        self.sumInsuredTxt.setLeftPaddingPoints(15)
        self.policyTenurTxt.setLeftPaddingPoints(15)
        self.employeeCode_Txt.setLeftPaddingPoints(15)
        self.employeeDisAmount_Lbl.setLeftPaddingPoints(15)
        self.borderwidth()
        self.desable()
        //MARK: - text desable
        self.policyTypeTxt.isUserInteractionEnabled = false
        self.policyTenurTxt.isUserInteractionEnabled = false
        self.familyTypeTxt.isUserInteractionEnabled = false
        self.totalAmountTxt.isUserInteractionEnabled = false
        self.sumInsuredTxt.isUserInteractionEnabled = false
        self.deductibleAmount_Txt.isUserInteractionEnabled = false
        }
    //MARK: - func for border width
    func borderwidth(){
        self.pAccdntSelfperBtn.layer.borderWidth = 0.5
        self.pAccdntSpousesPerBtn.layer.borderWidth = 0.5
        self.pAccdntFirstChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntSecondChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntThirdChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntFourthChildPerBtn.layer.borderWidth = 0.5
        self.criSelfperBtn.layer.borderWidth = 0.5
        self.criSpousesPerBtn.layer.borderWidth = 0.5
        self.criFirstChildPerBtn.layer.borderWidth = 0.5
        self.criSecondChildPerBtn.layer.borderWidth = 0.5
        self.criThirdChildPerBtn.layer.borderWidth = 0.5
        self.criFourthChildPerBtn.layer.borderWidth = 0.5
        self.continueBtn.layer.borderWidth = 0.5
        self.discountBtn.layer.borderWidth = 0.5
        self.policytypeView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.medicalPermissionView.layer.borderWidth = 0.5
        self.quatationId.layer.borderWidth = 0.5
        self.employe_Lbl.layer.borderWidth = 0.5
        self.employeeDisAmount_Lbl.layer.borderWidth = 0.5
        self.employeePer_View.layer.borderWidth = 0.5
        self.employeeCode_Txt.layer.borderWidth = 0.5
        self.loyaltyDisPer_View.layer.borderWidth = 0.5
       // self.loyaltyDis_View.layer.borderWidth = 0.5
        self.loyaltyCode_Txt.layer.borderWidth = 0.5
        self.loyalty_Lbl.layer.borderWidth = 0.5
        self.loyaltyDiscountAmount_Txt.layer.borderWidth = 0.5
        self.deductibleAmount_Txt.layer.borderWidth = 0.5
        self.deductibleAmount_Lbl.layer.borderWidth = 0.5
    }
    //MARK: -  func foe the save data for
    func savedata(){
        UserDefaults.standard.set(self.sublimit ,forKey: "sublimit")
        UserDefaults.standard.set(self.totallPremium, forKey: "totallPremium")
        UserDefaults.standard.set(self.quotationid, forKey: "quotationid")
        UserDefaults.standard.set(self.sublimitDiscount, forKey: "sublimitDiscount")
        UserDefaults.standard.set(self.tiredDiscount, forKey: "tiredDiscount")
       UserDefaults.standard.set(self.criticalTotal, forKey: "criticalTotal")
        UserDefaults.standard.set(self.personalAccidentTotal, forKey: "personalAccidentTotal")
        UserDefaults.standard.set(self.firChildTotal, forKey: "firChildTotal")
        UserDefaults.standard.set(self.lifestyleDiscount, forKey: "lifestyleDiscount")
        UserDefaults.standard.set( self.employeDiscount, forKey: "employeDiscount")
        UserDefaults.standard.set(self.loyaltydiscount, forKey: "loyaltydiscount")
        UserDefaults.standard.set(self.gstValue, forKey: "gstValue")
        UserDefaults.standard.set(self.totalPRemium, forKey: "totalPRemium")
        UserDefaults.standard.set(self.basicPRemium, forKey: "basicPRemium")
        UserDefaults.standard.set(self.quoteId, forKey: "quoteId")

        }
    func childAge(){
        if  self.fChild <= 5{
            self.pAccdntFirstChildPerBtn.isEnabled = false
        }else if self.fChild >= 5{
            self.pAccdntFirstChildPerBtn.isEnabled = true
       }
       }
    func secondChild(){
        if self.sChild <= 5{
            self.pAccdntSecondChildPerBtn.isEnabled = false
        }else if self.sChild >= 5{
            self.pAccdntSecondChildPerBtn.isEnabled = true
    }
    }
    func thirdChild(){
        if self.tChild <= 5{
            self.pAccdntThirdChildPerBtn.isEnabled = false
        }else if self.tChild >= 5{
            self.pAccdntThirdChildPerBtn.isEnabled = true
    }
    }
    func fourthChild(){
        if self.frChild <= 5{
            self.pAccdntFourthChildPerBtn.isEnabled = false
        }else if self.frChild >= 5{
            self.pAccdntFourthChildPerBtn.isEnabled = true
    }
    }
    func fetchData(){
        self.criSelfDetailLbl.text = "\(self.fAName + "  " + "is covered under Global Cover")"
        self.criSpousesDetailLbl.text = "\(self.sAName + "  " + "is covered under Global Cover")"
        self.criFirstChildDetailLbl.text = "\(self.fCName + "  " + "is covered under Global Cover")"
        self.criSecondChildDetailLbl.text = "\(self.sCName + "  " + "is covered under Global Cover")"
        self.criThirdChildDetailLbl.text = "\(self.tCName + "  " + "is covered under Global Cover")"
        self.criFourthChildDetailLbl.text = "\(self.frCName + "  " + "is covered under Global Cover")"
        
        self.pAccdntSelfDetailLbl.text = "\(self.fAName + "  " + "is covered under Disease Management")"
        self.pAccdntSpousesDetailLbl.text = "\(self.sAName + "  " + "is covered under Disease Management")"
        self.pAccdntFirstChildDetailLbl.text = "\(self.fCName + "  " + "is covered under Disease Management")"
        self.pAccdntSecondChildDetailLbl.text = "\(self.sCName + "  " + "is covered under Disease Management")"
        self.pAccdntThirdChildDetailLbl.text = "\(self.tCName + "  " + "is covered under Disease Management")"
        self.pAccdntFourthChildDetailLbl.text = "\(self.frCName + "  " + "is covered under Disease Management")"
      }
   //MARK: - uitextfield delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.employeeCode =  self.employeeCode_Txt.text ?? ""
        self.loyalteeCode = self.loyaltyCode_Txt.text ?? ""
        self.superHealthcareQuote()
    }
    //MARK: - func for desable button action
    func desable(){
        policyTypeTxt.isUserInteractionEnabled = false
        familyTypeTxt.isUserInteractionEnabled = false
        sumInsuredTxt.isUserInteractionEnabled = false
        totalAmountTxt.isUserInteractionEnabled = false
        policyTenurTxt.isUserInteractionEnabled = false
        quatationId.isUserInteractionEnabled = false
        self.hide()
        self.showdetail()
    }
    //MARK: - func  for the show data from back
    func showdetail(){
        self.policyTypeTxt.text = policytype
        self.familyTypeTxt.text = TitleBtn
        self.sumInsuredTxt.text = suminsured
        self.policyTenurTxt.text = policytenur
        self.totalAmountTxt.text = totalPremium
        self.totallPremium = self.totalAmountTxt.text ?? ""
        self.quatationId.text = quotationId

    }
    
    //MARK: - func for the hide show view
    func hide(){
        self.criSpousesView.isHidden = true
        self.criSpousesNsView.constant = 0
        self.criFirstChildView.isHidden = true
        self.criFirstChildNsView.constant = 0
        self.criSecondChildView.isHidden = true
        self.criSecondChildNsView.constant = 0
        self.criThirdChildView.isHidden = true
        self.criThirdChildNsView.constant = 0
        self.criFourthChildView.isHidden = true
        self.criFourthChildNsView.constant = 0
        self.pAccdntSpousesView.isHidden = true
        self.pAccdntSpousesNsView.constant = 0
        self.pAccdntFirstChildView.isHidden = true
        self.pAccdntFirstChildNsView.constant = 0
        self.pAccdntSecondChildView.isHidden = true
        self.pAccdntSecondChildNsView.constant = 0
        self.pAccdntThirdChildView.isHidden = true
        self.pAccdntThirdChildNsView.constant = 0
        self.pAccdntFourthChildView.isHidden = true
        self.pAccdntFourthChildNsView.constant = 0
        self.loyaltyHideShow_View.isHidden = true
        self.loyaltyDisNs_View.constant = 0
        self.employeeCode_Txt.isHidden = true
        self.employeeCodeNs_Txt.constant = 0
        self.criselfDoubleNs_View.constant = 0
        self.criselfDoubleeNs_View.constant = 0
        self.spouseDoubleNs_View.constant = 0
        self.firstDoubleNs_View.constant = 0
        self.secondDoubleNs_View .constant = 0
        self.thirdDoubleNs_View.constant = 0
        self.fourthDoubleeNS_View.constant = 0
        self.firstDouble_NsView  .constant = 0
        self.spouseDouble_NsView .constant = 0
        self.firstCDouble_NsView  .constant = 0
        self.secondDoublee_NsView.constant = 0
        self.thirdDoublee_NsView .constant = 0
        self.fourthDoubleNs_view .constant = 0
       
    }
    //MARK: - gold and platinum selecttion for the hide and show the screen
    func hideGlobal(){
        if selectedPlantype == "Gold"{
            self.global_Lbl.isHidden = true
            self.globalNs_Lbl.constant = 0
            self.criFirstView.isHidden = true
            self.criFirstNsView.constant = 0
            self.criSpousesView.isHidden = true
            self.criSpousesNsView.constant = 0
            self.criFirstChildView.isHidden = true
            self.criFirstChildNsView.constant = 0
            self.criSecondChildView.isHidden = true
            self.criSecondChildNsView.constant = 0
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            }else{
//            self.insuredDetails()

        }
        }
    
    //MARK: - medical Detail percent button action
    @IBAction func medicalDetailPer(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let medicalBtn = item
            if medicalBtn == "Yes"{
//                self.policyQuat()
                self.continueBtn.isHidden = true
            }else{
//                self.policyQuat()
                self.continueBtn.isHidden = false
            }
            self.medicalPermissionBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    
    //MARK: - medical Detail percent button action
    @IBAction func employeeDiscountAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let employeeDiscount = item
            if employeeDiscount == "Yes"{
                self.IsEmployee = "Y"

                self.employeeCode_Txt.isHidden = false
                self.employeeCodeNs_Txt.constant = 50
//                self.Life_Status = "False"
//                self.policyQuat()
//                self.continueBtn.isHidden == true
            }else{
                self.IsEmployee = "N"
                self.employeeCode_Txt.isHidden = true
                self.employeeCodeNs_Txt.constant = 0
//                self.Life_Status = "True"
//                self.policyQuat()
//                self.continueBtn.isHidden == false
            }
            self.employePermissionBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    
    //MARK: - medical Detail percent button action
    @IBAction func loyalteeDiscountAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let loyaltyDiscount = item
            if loyaltyDiscount == "Yes"{
                self.isloyalcustomer = "Y"
                self.loyaltyHideShow_View.isHidden = false
                self.loyaltyDisNs_View.constant = 110
                }else{
                self.isloyalcustomer = "N"
                self.loyaltyHideShow_View.isHidden = true
                 self.loyaltyDisNs_View.constant = 0

            }
            self.loyaltyPer_Btn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //////////**********************************////////
    //MARK: - critical illness permsion button action
    //////////**********************************////////
    @IBAction func CritiIllSelfPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.criticaldetailsSelf = item
            if criticaldetailsSelf == "Yes"{
                self.firstAdult = true
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.criticalSpinnerEnable()
                self.isglobal = "Y"
                self.superHealthcareQuote()
                 }else{
            
                self.criSpousesPerBtn.setTitle("No", for: .normal)
                self.criFirstChildPerBtn.setTitle("No", for: .normal)
                self.criSecondChildPerBtn.setTitle("No", for: .normal)
                self.criThirdChildPerBtn.setTitle("No", for: .normal)
                self.criFourthChildPerBtn.setTitle("No", for: .normal)
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.criticalSpinnerDesable()
                self.isglobal = "N"
                self.superHealthcareQuote()
               
            }
            self.criSelfperBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func CritiIllSpousesPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = true
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
                 }else{
//                self.policyQuat()
            }
            self.criSpousesPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func CritiIllFirstChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.criticaldetailsSelf = item
            if criticaldetailsSelf == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = true
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.criFirstChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func CritiIllsecondChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.criticaldetailsSelf = item
            if criticaldetailsSelf == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = true
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
                 }else{
//                self.policyQuat()
            }
            self.criSecondChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func CritiIllThirdChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.criticaldetailsSelf = item
            if criticaldetailsSelf == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = true
                self.fourthChaild = false
//                self.policyQuat()
                //MARK: - v
//                if firstAdult == false{
//                self.criThirdChildPerBtn.setTitle("No", for: .normal)
//                self.ciStatus4 = "False"
//                self.policyQuat()
//                }
            }else{
//                self.policyQuat()
            }
            self.criThirdChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func CritiIllFourthChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.criticaldetailsSelf = item
            if criticaldetailsSelf == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = true
//                self.policyQuat()
//                if firstAdult == false{
//                self.criFourthChildPerBtn.setTitle("No", for: .normal)
//                self.ciStatus5 = "False"
//                self.policyQuat()
//                }
            }else{
//                self.policyQuat()
            }
            self.criFourthChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //////////**********************************////////
    //MARK: - personal accident permsion button action
    //////////**********************************////////
    @IBAction func personalAccidentSelfPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = true
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.iswellness = "Y"
                self.insuredDetails()
                self.personalAccidentSpinnerEnable()
                self.superHealthcareQuote()
                self.childAge()
                self.secondChild()
                self.thirdChild()
                self.fourthChild()
                 }else{
            
                self.pAccdntSpousesPerBtn.setTitle("No", for: .normal)
                self.pAccdntFirstChildPerBtn.setTitle("No", for: .normal)
                self.pAccdntSecondChildPerBtn.setTitle("No", for: .normal)
                self.pAccdntThirdChildPerBtn.setTitle("No", for: .normal)
                self.pAccdntFourthChildPerBtn.setTitle("No", for: .normal)
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                     self.iswellness = "N"
                self.personalAccidentSpinnerDesable()
                     self.superHealthcareQuote()
                }
            self.pAccdntSelfperBtn.setTitle(item, for: .normal)
                }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func personalAccidentSpousesPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = true
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.pAccdntSpousesPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func personalAccidentFirstChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = true
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.pAccdntFirstChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func personalAccidentsecondChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = true
                self.thardChild = false
                self.fourthChaild = false
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.pAccdntSecondChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func personalAccidentThirdChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = true
                self.fourthChaild = false
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.pAccdntThirdChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func personalAccidentFourthChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.personalAccidentDetail = item
            if personalAccidentDetail == "Yes"{
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = true
//                self.policyQuat()
            }else{
//                self.policyQuat()
            }
            self.pAccdntFourthChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //MARK: - func for all hide show details
    func insuredDetails(){
        if TitleBtn == "1 Adult" && selectedPlantype == "Gold"{
            self.adjustinView.frame.size.height = 1600
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.criFirstView.isHidden = true
            self.criFirstNsView.constant = 0
            self.criSpousesView.isHidden = true
            self.criSpousesNsView.constant = 0
            self.criFirstChildView.isHidden = true
            self.criFirstChildNsView.constant = 0
            self.criSecondChildView.isHidden = true
            self.criSecondChildNsView.constant = 0
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = true
            self.pAccdntSpousesNsView.constant = 0
            self.pAccdntFirstChildView.isHidden = true
            self.pAccdntFirstChildNsView.constant = 0
            self.pAccdntSecondChildView.isHidden = true
            self.pAccdntSecondChildNsView.constant = 0
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 0
            self.criselfDoubleeNs_View.constant = 0
            self.spouseDoubleNs_View.constant = 0
            self.firstDoubleNs_View.constant = 0
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 0
            self.spouseDouble_NsView .constant = 0
            self.firstCDouble_NsView  .constant = 0
            self.secondDoublee_NsView.constant = 0
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
        }else if self.TitleBtn == "2 Adult"{
            self.adjustinView.frame.size.height = 2000
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criSpousesView.isHidden = false
            self.criSpousesNsView.constant = 110
            self.criFirstChildView.isHidden = true
            self.criFirstChildNsView.constant = 0
            self.criSecondChildView.isHidden = true
            self.criSecondChildNsView.constant = 0
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = false
            self.pAccdntSpousesNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = true
            self.pAccdntFirstChildNsView.constant = 0
            self.pAccdntSecondChildView.isHidden = true
            self.pAccdntSecondChildNsView.constant = 0
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 0
            self.firstDoubleNs_View.constant = 0
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 0
            self.secondDoublee_NsView.constant = 0
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sAdultArray =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.sAdultArray)
        }else if self.TitleBtn == "1 Adult + 1 Child"{
            self.adjustinView.frame.size.height = 1850
            self.criSpousesView.isHidden = true
            self.criSpousesNsView.constant = 0
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = true
            self.criSecondChildNsView.constant = 0
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = true
            self.pAccdntSpousesNsView.constant = 0
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = true
            self.pAccdntSecondChildNsView.constant = 0
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 0
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 0
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.fChildArray)
        }else if TitleBtn == "1 Adult + 2 Child"{
            self.adjustinView.frame.size.height = 2200
            self.criSpousesView.isHidden = true
            self.criSpousesNsView.constant = 0
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = false
            self.criSecondChildNsView.constant = 110
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = true
            self.pAccdntSpousesNsView.constant = 0
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = false
            self.pAccdntSecondChildNsView.constant = 110
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 0
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 8
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 0
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 8
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sChildArray = ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.fChildArray)
            self.Riskdtls.append(self.sChildArray)
        }else if TitleBtn == "1 Adult + 3 Child"{
            self.adjustinView.frame.size.height = 2700
            self.criSpousesView.isHidden = true
            self.criSpousesNsView.constant = 0
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = false
            self.criSecondChildNsView.constant = 110
            self.criThirdChildView.isHidden = false
            self.criThirdChildNsView.constant = 110
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = true
            self.pAccdntSpousesNsView.constant = 0
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = false
            self.pAccdntSecondChildNsView.constant = 110
            self.pAccdntThirdChildView.isHidden = false
            self.pAccdntThirdChildNsView.constant = 110
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 0
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 8
            self.secondDoubleNs_View .constant = 8
            self.thirdDoubleNs_View.constant = 8
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 0
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 8
            self.thirdDoublee_NsView .constant = 8
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sChildArray = ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.tChildArray =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.fChildArray)
            self.Riskdtls.append(self.sChildArray)
            self.Riskdtls.append(self.tChildArray)
        }else if TitleBtn == "2 Adult + 1 Child"{
            self.adjustinView.frame.size.height = 2100
            self.criSpousesView.isHidden = false
            self.criSpousesNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = true
            self.criSecondChildNsView.constant = 0
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = false
            self.pAccdntSpousesNsView.constant = 110
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = true
            self.pAccdntSecondChildNsView.constant = 0
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
             //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 0
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 0
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sAdultArray =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.sAdultArray)
            self.Riskdtls.append(self.fChildArray)
           
        }else if TitleBtn == "2 Adult + 2 Child"{
            self.adjustinView.frame.size.height = 2350
            self.criSpousesView.isHidden = false
            self.criSpousesNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = false
            self.criSecondChildNsView.constant = 110
            self.criThirdChildView.isHidden = true
            self.criThirdChildNsView.constant = 0
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = false
            self.pAccdntSpousesNsView.constant = 110
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = false
            self.pAccdntSecondChildNsView.constant = 110
            self.pAccdntThirdChildView.isHidden = true
            self.pAccdntThirdChildNsView.constant = 0
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 8
            self.secondDoubleNs_View .constant = 0
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 8
            self.thirdDoublee_NsView .constant = 0
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sAdultArray =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sChildArray = ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.sAdultArray)
            self.Riskdtls.append(self.fChildArray)
            self.Riskdtls.append(self.sChildArray)
        }else if TitleBtn == "2 Adult + 3 Child"{
            self.adjustinView.frame.size.height = 2550
            self.criSpousesView.isHidden = false
            self.criSpousesNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = false
            self.criSecondChildNsView.constant = 110
            self.criThirdChildView.isHidden = false
            self.criThirdChildNsView.constant = 110
            self.criFourthChildView.isHidden = true
            self.criFourthChildNsView.constant = 0
            self.pAccdntSpousesView.isHidden = false
            self.pAccdntSpousesNsView.constant = 110
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = false
            self.pAccdntSecondChildNsView.constant = 110
            self.pAccdntThirdChildView.isHidden = false
            self.pAccdntThirdChildNsView.constant = 110
            self.pAccdntFourthChildView.isHidden = true
            self.pAccdntFourthChildNsView.constant = 0
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 8
            self.secondDoubleNs_View .constant = 8
            self.thirdDoubleNs_View.constant = 0
            self.fourthDoubleeNS_View.constant = 0
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 8
            self.thirdDoublee_NsView .constant = 8
            self.fourthDoubleNs_view .constant = 0
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sAdultArray =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sChildArray = ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.tChildArray =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.sAdultArray)
            self.Riskdtls.append(self.fChildArray)
            self.Riskdtls.append(self.sChildArray)
            self.Riskdtls.append(self.tChildArray)
        }else if TitleBtn == "2 Adult + 4 Child"{
            self.adjustinView.frame.size.height = 2800
            self.criSpousesView.isHidden = false
            self.criSpousesNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
            self.criFirstChildView.isHidden = false
            self.criFirstChildNsView.constant = 110
            self.criSecondChildView.isHidden = false
            self.criSecondChildNsView.constant = 110
            self.criThirdChildView.isHidden = false
            self.criThirdChildNsView.constant = 110
            self.criFourthChildView.isHidden = false
            self.criFourthChildNsView.constant = 110
            self.pAccdntSpousesView.isHidden = false
            self.pAccdntSpousesNsView.constant = 110
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.pAccdntFirstChildView.isHidden = false
            self.pAccdntFirstChildNsView.constant = 110
            self.pAccdntSecondChildView.isHidden = false
            self.pAccdntSecondChildNsView.constant = 110
            self.pAccdntThirdChildView.isHidden = false
            self.pAccdntThirdChildNsView.constant = 110
            self.pAccdntFourthChildView.isHidden = false
            self.pAccdntFourthChildNsView.constant = 110
            //MARK: - gapping cover
            self.criselfDoubleNs_View.constant = 8
            self.criselfDoubleeNs_View.constant = 8
            self.spouseDoubleNs_View.constant = 8
            self.firstDoubleNs_View.constant = 8
            self.secondDoubleNs_View .constant = 8
            self.thirdDoubleNs_View.constant = 8
            self.fourthDoubleeNS_View.constant = 8
            self.firstDouble_NsView  .constant = 8
            self.spouseDouble_NsView .constant = 8
            self.firstCDouble_NsView  .constant = 8
            self.secondDoublee_NsView.constant = 8
            self.thirdDoublee_NsView .constant = 8
            self.fourthDoubleNs_view .constant = 8
            self.hideGlobal()
            self.Riskdtls.removeAll()
            self.fAdultArray =  ["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible":self.deductible ,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sAdultArray =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.fChildArray =      ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.sChildArray = ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.tChildArray =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.frChildArray =    ["InsuredName":"shivani","DateOfBirth":"25-02-2009","Gender":"Male","Occupation":"Doctors","Relation":"child4","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"NomineeName":"","NomineeRelation":""]
            self.Riskdtls.append(self.fAdultArray)
            self.Riskdtls.append(self.sAdultArray)
            self.Riskdtls.append(self.fChildArray)
            self.Riskdtls.append(self.sChildArray)
            self.Riskdtls.append(self.tChildArray)
            self.Riskdtls.append(self.frChildArray)
        }
        }
    
    
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.savedata()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthCareShowBreakup_Vc") as! SuperHealthCareShowBreakup_Vc
        self.present(nextVc, animated: true, completion: nil)
    }
    
    
    //MARK: - continue Btn Action for go to next page
    @IBAction func continiue(){
        self.savedata()
        if medicalPermissionBtn.title(for: .normal) == "Select"{
            alert(message: "Please Select Any Details",title: "Message")
        }else if medicalPermissionBtn.title(for: .normal) == "No"{
            let nextVc = UIStoryboard.init(name: "Health", bundle:  nil).instantiateViewController(withIdentifier: "SuperHealthcareAddressCommunication_Vc") as! SuperHealthcareAddressCommunication_Vc
            self.navigationController?.pushViewController(nextVc, animated: true)
            
        }else if medicalPermissionBtn.title(for: .normal) == "Yes"{
            showWarning("Error", AlertMessage.superhealthcare.rawValue)

        }
    }
}


//MARK: - extension for the policyquat Api
extension SuperHealthCareMedicalRetrieve_Vc {
    private func superHealthcareQuote() {
        self.Authenticate = ["WACode":"20000001","WAAppCode":"30000011"]
//        self.Riskdtls = [["InsuredName":self.fAName,"DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":"500000","deductible":"500000" ,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]]
//        self.sAdult = ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":"500000","deductible":"500000" ,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
//        self.Riskdtls.append(self.sAdult)
        self.QuotationDtls = ["strproposerName":self.fAName,"mobileno":"9837386104","email_id":"shivaniinmortal@gmail.com","ProductType":self.policytype ,"IsLoyalCustomer":self.isloyalcustomer,"IsEmployee":IsEmployee,"EmployeeCode":self.employeeCode,"ExistingHealthPolicyNo":self.loyalteeCode,"IsWellnessProgram":self.iswellness,"GlobalCoverApplicable":self.isglobal,"PolicyTenure":"1","PlanType":"Super Top Up","SubPlanType":"Gold","Riskdtls":self.Riskdtls]

        
        let params =  ["Authenticate":self.Authenticate,
                       "QuotationDtls" : self.QuotationDtls] as! [String:Any]
        
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = "http://14.141.41.50:81/AL_Mobile_App.svc/SuperHealthCareQuote"
//        let url = String(format:"%@",SubUrl.sanjeevaniQuate.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    if let data = response["usgiSuperHealthCare"] as? [String:Any]{
                        print(data)
                        if let gst = data["GST"] as? String{
                            self.gstValue = (gst)
                        }
                        if  let employeeDiscount = data["EmployeeDiscount"] as? String{
                        self.employeDiscount = "\(employeeDiscount)"
                        self.employeeDisAmount_Lbl.text =  self.employeDiscount
                            let loyal = data["LoyaltyDiscount"] as? String
                            self.loyaltydiscount = "\(loyal)"
                            self.loyaltyDiscountAmount_Txt.text = self.loyaltydiscount
                        }
                        if  let GrossPremium    = data["GrossPremium"] as? String {
                        self.totalAmountTxt.text = GrossPremium          //"\(GrossPremium)"
                        self.totalPRemium = GrossPremium
                        }
                        if let QuotationId    = data["QuotationId"] as? String{
                        self.quoteId =  "\(QuotationId)"
                            if let TotalNetPremium    = data["TotalNetPremium"] as? String{
                                self.basicPRemium = (TotalNetPremium)
                       
                        print(TotalNetPremium)
                            }
                        }
                    }
                    CommonMethods.hideHud(aView: self.view)
                }
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
