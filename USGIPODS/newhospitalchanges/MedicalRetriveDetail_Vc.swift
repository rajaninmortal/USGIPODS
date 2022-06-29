//
//  MedicalRetriveDetail_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import SVProgressHUD

class MedicalRetriveDetail_Vc: BaseViewController {
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
    //MARK: - Hide Show outlet
    @IBOutlet weak var sublimitDisCount_Lbl: UILabel!
    @IBOutlet weak var hideShowView: UIView!
    @IBOutlet weak var hideShowNsView: NSLayoutConstraint!
    @IBOutlet weak var extraDiscountBtn: UIButton!
    @IBOutlet weak var sublimitSelectBtn: UIButton!
    @IBOutlet weak var discountAmountTxt: UITextField!
    @IBOutlet weak var extraDiscountView: UIView!
    @IBOutlet weak var sublimitView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var discountBtn: UIButton!
    @IBOutlet weak var addoncoverBtn: UIButton!
    @IBOutlet weak var medicalPermissionBtn: UIButton!
    @IBOutlet weak var medicalPermissionView: UIView!
    @IBOutlet weak var discountAmountLbl: UILabel!
    @IBOutlet weak var sublimit_Txt: UITextField!
    @IBOutlet weak var sumlimit_Lbl: UILabel!

    //MARK: - critical illness view details
    @IBOutlet weak var critotalAmount: UITextField!
    @IBOutlet weak var criTotalAmountLbl: UILabel!
    @IBOutlet weak var criSelectAmountView: UIView!
    @IBOutlet weak var criSelectAmountTxt: UITextField!
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
    
    @IBOutlet weak var criSelfDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var spouseDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var crifirst_NsView: NSLayoutConstraint!
    @IBOutlet weak var criSecond_NsView: NSLayoutConstraint!
    @IBOutlet weak var criThird_NsView: NSLayoutConstraint!
    @IBOutlet weak var criFourthDouble_NsView: NSLayoutConstraint!
    

    //MARK: - personal Accident view details
    @IBOutlet weak var pAccdnttotalAmount: UITextField!
    @IBOutlet weak var pAccdntTotalAmountLbl: UILabel!
    @IBOutlet weak var pAccdntSelfDetailLbl: UILabel!
    @IBOutlet weak var pAccdntSelfperBtn: UIButton!
    @IBOutlet weak var pAccdntFirstView: UIView!
    @IBOutlet weak var pAccdntFirstNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntSpousesView: UIView!
    @IBOutlet weak var pAccdntSpousesNsView: NSLayoutConstraint!
    @IBOutlet weak var pAccdntSpousesPerBtn: UIButton!
    @IBOutlet weak var pAccdntSpousesDetailLbl: UILabel!
    @IBOutlet weak var pAccdntFirstChildView: UIView!
    @IBOutlet weak var pAccdntTotalSelectedLbl: UILabel!
    @IBOutlet weak var pAccDntSelectedAmountTxt: UITextField!
    @IBOutlet weak var pAccselectedAmountView: UIView!
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
    
    @IBOutlet weak var paSelfDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var paSpouseDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var paFirstDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var paThirdDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var paFourthDouble_NsView: NSLayoutConstraint!
    @IBOutlet weak var paSecondDouble_NsView: NSLayoutConstraint!
  
    
    //MARK: - Hospital Cash view details
    @IBOutlet weak var hCashtotalAmount: UITextField!
    @IBOutlet weak var hCashTotalAmountLbl: UILabel!
    @IBOutlet weak var hCashSelectAmountTxt: UITextField!
    @IBOutlet weak var hCashSelectAmountView: UIView!
    @IBOutlet weak var hCashSelfDetailLbl: UILabel!
    @IBOutlet weak var hCashSelfperBtn: UIButton!
    @IBOutlet weak var hCashFirstView: UIView!
    @IBOutlet weak var hCashFirstNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashSpousesView: UIView!
    @IBOutlet weak var hCashSpousesNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashSpousesPerBtn: UIButton!
    @IBOutlet weak var hCashSpousesDetailLbl: UILabel!
    @IBOutlet weak var hCashFirstChildView: UIView!
    @IBOutlet weak var hCashFirstChildNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashFirstChildPerBtn: UIButton!
    @IBOutlet weak var hCashFirstChildDetailLbl: UILabel!
    @IBOutlet weak var hCashSecondChildView: UIView!
    @IBOutlet weak var hCashSecondChildNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashSecondChildPerBtn: UIButton!
    @IBOutlet weak var hCashSecondChildDetailLbl: UILabel!
    @IBOutlet weak var hCashThirdChildView: UIView!
    @IBOutlet weak var hCashThirdChildNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashThirdChildPerBtn: UIButton!
    @IBOutlet weak var hCashThirdChildDetailLbl: UILabel!
    @IBOutlet weak var hCashFourthChildView: UIView!
    @IBOutlet weak var hCashFourthChildNsView: NSLayoutConstraint!
    @IBOutlet weak var hCashFourthChildPerBtn: UIButton!
    @IBOutlet weak var hCashFourthChildDetailLbl: UILabel!
    @IBOutlet weak var hCashfourthSelectLbl: UILabel!
    @IBOutlet weak var hCashSpousesspineImg  : UIImageView!
    @IBOutlet weak var hCashFirstChildspineImg : UIImageView!
    @IBOutlet weak var hCashSecondChildspineImg : UIImageView!
    @IBOutlet weak var hCashThirdChildspineImg : UIImageView!
    @IBOutlet weak var hCashFourthChildspineImg : UIImageView!
    
    @IBOutlet weak var hCashSpouseNs_View: NSLayoutConstraint!
    @IBOutlet weak var hCashSelfNs_View  : NSLayoutConstraint!
    @IBOutlet weak var hCashFirstNs_View : NSLayoutConstraint!
    @IBOutlet weak var hCashSecondNs_View: NSLayoutConstraint!
    @IBOutlet weak var hCashThirdNs_View : NSLayoutConstraint!
    @IBOutlet weak var hCAshFourthNs_View: NSLayoutConstraint!
   
    
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
    var coverageprice = String()
    var hospitalCash = String()
    var pAccidentCash = String()
    var secondAdCriticalVal = String()
    var secondAdPaVal = String()
    var secondAdHospitalVal = String()

    var firstChildCriticalVal = String()
    var firstChildPaVal = String()
    var firstChildHospitalVal = String()
    
    var secondChildCriticalVal = String()
    var secondChildPaVal = String()
    var secondChildHospitalVal = String()
    
    var thirdChildCriticalVal = String()
    var thirdChildPaVal = String()
    var thirdChildHospitalVal = String()
    
    var fourthChildCriticalVal = String()
    var fourthChildPaVal = String()
    var fourthChildHospitalVal = String()
    var empty = "0.00"
    
    var BIStatus  = String()
    var BIStatus1 = String()
    var BIStatus2 = String()
    var BIStatus3 = String()
    var BIStatus4 = String()
    var BIStatus5 = String()
    var paStatus = String()
    var ciStatus = String()
    var dhcStatus = String()
    var paStatus1 = String()
    var ciStatus1 = String()
    var dhcStatus1 = String()
    var paStatus2 = String()
    var ciStatus2 = String()
    var dhcStatus2 = String()
    var paStatus3 = String()
    var ciStatus3 = String()
    var dhcStatus3 = String()
    var paStatus4 = String()
    var ciStatus4 = String()
    var dhcStatus4 = String()
    var paStatus5 = String()
    var ciStatus5 = String()
    var dhcStatus5 = String()
    var Esale_Status = String()
    var Life_Status = String()
    var PD_Status = String()
    var Sub_Status = String()
    var Sub_Type = String()
    var Tiered_Status = String()
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
    var firstTotal = Double();var secAdTotal = Double();var firChildTotal = Double();var secChildTotal = Double(); var thirdChildTotal = Double();var fourthChildTotal = Double();var sublimitDiscount = String(); var tiredDiscount = String(); var criticalTotal = Double(); var personalAccidentTotal = Double(); var hospitalCashTotal = Double();var lifestyleDiscount = String();var validTime = String()

    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.insuredDetails()
        self.criticalSpinnerDesable()
        self.hospitalCashSpinnerDesable()
        self.personalAccidentSpinnerDesable()
        self.paStatus = "False"
        self.ciStatus = "False"
        self.dhcStatus = "False"
        self.paStatus1 = "False"
        self.ciStatus1 = "False"
        self.dhcStatus1 = "False"
        
        self.policyTypeTxt.text  = UserDefaults.standard.string(forKey: "policytype")!
        self.familyTypeTxt.text  = UserDefaults.standard.string(forKey: "familytype")!
        self.sumInsuredTxt.text  = UserDefaults.standard.string(forKey: "suminsured")!
        self.suminsured  = UserDefaults.standard.string(forKey: "suminsured")!
        self.policyTenurTxt.text = UserDefaults.standard.string(forKey: "selectyear")!
        self.validTime =  UserDefaults.standard.string(forKey: "policytenure")!
        self.premiumm = UserDefaults.standard.string(forKey: "totalAmount")!
        self.quatationId.text = UserDefaults.standard.string(forKey: "quotationid")!

       // self.totalAmountTxt.text =  self.premium
        self.todayDate = UserDefaults.standard.string(forKey: "today")!
        self.tommarow = UserDefaults.standard.string(forKey: "tommorow")!
        self.yearlater = UserDefaults.standard.string(forKey: "yearlater")!
        self.newage = UserDefaults.standard.string(forKey: "newage")!
        self.BIStatus  = UserDefaults.standard.string(forKey: "BIStatus ")!
        self.BIStatus1 = UserDefaults.standard.string(forKey: "BIStatus1")!
        self.BIStatus2 = UserDefaults.standard.string(forKey: "BIStatus2")!
        self.BIStatus3 = UserDefaults.standard.string(forKey: "BIStatus3")!
        self.BIStatus4 = UserDefaults.standard.string(forKey: "BIStatus4")!
        self.BIStatus5 = UserDefaults.standard.string(forKey: "BIStatus5")!
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
        self.fChild = UserDefaults.standard.integer( forKey: "fChild")
        self.sChild = UserDefaults.standard.integer(forKey: "sChild")
        self.tChild = UserDefaults.standard.integer( forKey: "tChild")
        self.frChild = UserDefaults.standard.integer(forKey:"frChild")
//        self.policyQuat()
        self.fetchData()
       // self.childAge()
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
    //MARK: - func for the desabel spinner for the Hospital Cash
    func hospitalCashSpinnerDesable(){
        self.hCashSpousesspineImg.isHidden = true
        self.hCashFirstChildspineImg.isHidden = true
        self.hCashSecondChildspineImg.isHidden = true
        self.hCashThirdChildspineImg.isHidden = true
        self.hCashFourthChildspineImg.isHidden = true
        self.hCashSpousesPerBtn.isEnabled = false
        self.hCashFirstChildPerBtn.isEnabled = false
        self.hCashSecondChildPerBtn.isEnabled = false
        self.hCashThirdChildPerBtn.isEnabled = false
        self.hCashFourthChildPerBtn.isEnabled = false
    }
    //MARK: - func for the desabel spinner for the Personal Accident
    func hospitalCashSpinnerEnable(){
        self.hCashSpousesspineImg.isHidden = false
        self.hCashFirstChildspineImg.isHidden = false
        self.hCashSecondChildspineImg.isHidden = false
        self.hCashThirdChildspineImg.isHidden = false
        self.hCashFourthChildspineImg.isHidden = false
        self.hCashSpousesPerBtn.isEnabled = true
        self.hCashFirstChildPerBtn.isEnabled = true
        self.hCashSecondChildPerBtn.isEnabled = true
        self.hCashThirdChildPerBtn.isEnabled = true
        self.hCashFourthChildPerBtn.isEnabled = true
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
        self.extraDiscountView.layer.cornerRadius = 20
        self.sublimitView.layer.cornerRadius = 20
        self.medicalPermissionView.layer.cornerRadius = 20
        self.hCashtotalAmount.layer.cornerRadius = 20
        self.hCashTotalAmountLbl.layer.cornerRadius = 20
        self.hCashSpousesPerBtn.layer.cornerRadius = 20
        self.hCashFirstChildPerBtn.layer.cornerRadius = 20
        self.hCashSecondChildPerBtn.layer.cornerRadius = 20
        self.hCashThirdChildPerBtn.layer.cornerRadius = 20
        self.hCashFourthChildPerBtn.layer.cornerRadius = 20
        self.pAccdnttotalAmount.layer.cornerRadius = 20
        self.pAccdntTotalAmountLbl.layer.cornerRadius = 20
        self.pAccdntSelfperBtn.layer.cornerRadius = 20
        self.pAccdntSpousesPerBtn.layer.cornerRadius = 20
        self.pAccdntFirstChildPerBtn.layer.cornerRadius = 20
        self.pAccdntSecondChildPerBtn.layer.cornerRadius = 20
        self.pAccdntThirdChildPerBtn.layer.cornerRadius = 20
        self.pAccdntFourthChildPerBtn.layer.cornerRadius = 20
        self.critotalAmount.layer.cornerRadius = 20
        self.criTotalAmountLbl.layer.cornerRadius = 20
        self.criSelfperBtn.layer.cornerRadius = 20
        self.criSpousesPerBtn.layer.cornerRadius = 20
        self.criFirstChildPerBtn.layer.cornerRadius = 20
        self.criSecondChildPerBtn.layer.cornerRadius = 20
        self.criThirdChildPerBtn.layer.cornerRadius = 20
        self.criFourthChildPerBtn.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.discountBtn.layer.cornerRadius = 20
        self.plusBtn.layer.cornerRadius = 20
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.addoncoverBtn.layer.cornerRadius = 20
        self.discountAmountTxt.layer.cornerRadius = 20
        self.discountAmountLbl.layer.cornerRadius = 20
        self.hCashfourthSelectLbl.layer.cornerRadius = 20
        self.hCashTotalAmountLbl.layer.cornerRadius = 20
        self.quatationId.layer.cornerRadius = 20
        self.pAccdntTotalSelectedLbl.layer.cornerRadius = 20
        self.pAccselectedAmountView.layer.cornerRadius = 20
        self.hCashSelectAmountView.layer.cornerRadius = 20
        self.criSelectAmountView.layer.cornerRadius = 20
        self.hCashSelfperBtn.layer.cornerRadius = 20
        self.sublimit_Txt.layer.cornerRadius = 20
        self.sumlimit_Lbl.layer.cornerRadius = 20
        self.sublimit_Txt.setLeftPaddingPoints(15)
        self.quatationId.setLeftPaddingPoints(15)
        self.totalAmountTxt.setLeftPaddingPoints(15)
        self.criSelectAmountTxt.setLeftPaddingPoints(15)
        self.pAccDntSelectedAmountTxt.setLeftPaddingPoints(15)
        self.hCashSelectAmountTxt.setLeftPaddingPoints(15)
        self.policyTypeTxt.setLeftPaddingPoints(15)
        self.familyTypeTxt.setLeftPaddingPoints(15)
        self.sumInsuredTxt.setLeftPaddingPoints(15)
        self.policyTenurTxt.setLeftPaddingPoints(15)
        self.critotalAmount.setLeftPaddingPoints(15)
        self.hCashtotalAmount.setLeftPaddingPoints(15)
        self.pAccdnttotalAmount.setLeftPaddingPoints(15)
        self.discountAmountTxt.setLeftPaddingPoints(15)
        self.borderwidth()
        self.desable()
        }
    //MARK: - func for border width
    func borderwidth(){
        self.hCashtotalAmount.layer.borderWidth = 0.5
        self.hCashTotalAmountLbl.layer.borderWidth = 0.5
        self.hCashSpousesPerBtn.layer.borderWidth = 0.5
        self.hCashFirstChildPerBtn.layer.borderWidth = 0.5
        self.hCashSecondChildPerBtn.layer.borderWidth = 0.5
        self.hCashThirdChildPerBtn.layer.borderWidth = 0.5
        self.hCashFourthChildPerBtn.layer.borderWidth = 0.5
        self.pAccdnttotalAmount.layer.borderWidth = 0.5
        self.pAccdntTotalAmountLbl.layer.borderWidth = 0.5
        self.pAccdntSelfperBtn.layer.borderWidth = 0.5
        self.pAccdntSpousesPerBtn.layer.borderWidth = 0.5
        self.pAccdntFirstChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntSecondChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntThirdChildPerBtn.layer.borderWidth = 0.5
        self.pAccdntFourthChildPerBtn.layer.borderWidth = 0.5
        self.critotalAmount.layer.borderWidth = 0.5
        self.criTotalAmountLbl.layer.borderWidth = 0.5
        self.criSelfperBtn.layer.borderWidth = 0.5
        self.criSpousesPerBtn.layer.borderWidth = 0.5
        self.criFirstChildPerBtn.layer.borderWidth = 0.5
        self.criSecondChildPerBtn.layer.borderWidth = 0.5
        self.criThirdChildPerBtn.layer.borderWidth = 0.5
        self.criFourthChildPerBtn.layer.borderWidth = 0.5
        self.continueBtn.layer.borderWidth = 0.5
        self.discountBtn.layer.borderWidth = 0.5
        self.plusBtn.layer.borderWidth = 0.5
        self.policytypeView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.extraDiscountView.layer.borderWidth = 0.5
        self.sublimitView.layer.borderWidth = 0.5
        self.medicalPermissionView.layer.borderWidth = 0.5
        self.discountAmountTxt.layer.borderWidth = 0.5
        self.discountAmountLbl.layer.borderWidth = 0.5
        self.hCashfourthSelectLbl.layer.borderWidth = 0.5
        self.hCashTotalAmountLbl.layer.borderWidth = 0.5
        self.quatationId.layer.borderWidth = 0.5
        self.pAccdntTotalSelectedLbl.layer.borderWidth = 0.5
        self.pAccselectedAmountView.layer.borderWidth = 0.5
        self.hCashSelectAmountView.layer.borderWidth = 0.5
        self.criSelectAmountView.layer.borderWidth = 0.5
        self.hCashSelfperBtn.layer.borderWidth = 0.5
        self.sublimit_Txt.layer.borderWidth = 0.5
        self.sumlimit_Lbl.layer.borderWidth = 0.5

    }
    //MARK: -  func foe the save data for
    func savedata(){
        UserDefaults.standard.set(self.paStatus ,forKey: "paStatus")
        UserDefaults.standard.set(self.ciStatus ,forKey: "ciStatus")
        UserDefaults.standard.set(self.dhcStatus ,forKey: "dhcStatus")
        UserDefaults.standard.set(self.paStatus1 ,forKey: "paStatus1")
        UserDefaults.standard.set(self.ciStatus1 ,forKey: "ciStatus1")
        UserDefaults.standard.set(self.dhcStatus1 ,forKey: "dhcStatus1")
        UserDefaults.standard.set(self.paStatus2 ,forKey: "paStatus2")
        UserDefaults.standard.set(self.ciStatus2 ,forKey: "ciStatus2")
        UserDefaults.standard.set(self.dhcStatus2 ,forKey: "dhcStatus2")
        UserDefaults.standard.set(self.paStatus3 ,forKey: "paStatus3")
        UserDefaults.standard.set(self.ciStatus3 ,forKey: "ciStatus3")
        UserDefaults.standard.set(self.dhcStatus3 ,forKey: "dhcStatus3")
        UserDefaults.standard.set(self.paStatus4 ,forKey: "paStatus4")
        UserDefaults.standard.set(self.ciStatus4 ,forKey: "ciStatus4")
        UserDefaults.standard.set(self.dhcStatus4 ,forKey: "dhcStatus4")
        UserDefaults.standard.set(self.paStatus5 ,forKey: "paStatus5")
        UserDefaults.standard.set(self.ciStatus5 ,forKey: "ciStatus5")
        UserDefaults.standard.set(self.dhcStatus5 ,forKey: "dhcStatus5")
        UserDefaults.standard.set(self.Sub_Type ,forKey: "Sub_Type")
        UserDefaults.standard.set(self.Sub_Status ,forKey: "Sub_Status")
        UserDefaults.standard.set(self.sublimit ,forKey: "sublimit")
        UserDefaults.standard.set(self.totallPremium, forKey: "totallPremium")
        UserDefaults.standard.set(self.quotationid, forKey: "quotationid")
        UserDefaults.standard.set(self.sublimitDiscount, forKey: "sublimitDiscount")
        UserDefaults.standard.set(self.tiredDiscount, forKey: "tiredDiscount")
       UserDefaults.standard.set(self.criticalTotal, forKey: "criticalTotal")
        UserDefaults.standard.set(self.personalAccidentTotal, forKey: "personalAccidentTotal")
        UserDefaults.standard.set(self.firChildTotal, forKey: "firChildTotal")
        UserDefaults.standard.set(self.lifestyleDiscount, forKey: "lifestyleDiscount")
        UserDefaults.standard.set(self.Esale_Status,  forKey: "Esale_Status")
        UserDefaults.standard.set(self.Life_Status,  forKey: "Life_Status")
        UserDefaults.standard.set(self.PD_Status,  forKey: "PD_Status")
        UserDefaults.standard.set(self.Tiered_Status,  forKey: "Tiered_Status")
        
        
        
        
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
        self.criSelfDetailLbl.text = "\(self.fAName + "  " + "is covered under Critical Illness for Rs." + "" + empty)"
        self.criSpousesDetailLbl.text = "\(self.sAName + " " + "is covered under Critical Illness for Rs." + "" + empty)"
        self.criFirstChildDetailLbl.text = "\(self.fCName + "  " + "is covered under Critical Illness for Rs." + "" + empty)"
        self.criSecondChildDetailLbl.text = "\(self.sCName + "  " + "is covered under Critical Illness for Rs." + "" + empty)"
        self.criThirdChildDetailLbl.text = "\(self.tCName + "  " + "is covered under Critical Illness for Rs." + "" + empty)"
        self.criFourthChildDetailLbl.text = "\(self.frCName + "  " + "is covered under Critical Illness for Rs." + "" + empty)"
    }
    //MARK: - func for save back save data
    func retriveData(){
        //MARK: - count the amount for the critical innless if age 18 years
        let caa = Double(premiumm) ?? 0.0
        let criticalInless = String(caa)
         let totalAmountCount = criticalInless
        self.criticalTotal = Double(totalAmountCount)!
        self.criAmountOverage = criticalInless
        let check = String(self.criAmountOverage)
        self.spouse = criticalInless
     //   print(self.criAmountOverage)
        //MARK: - Count the amount for the critical innless if age 18 years
        let firstPaValue = Double(self.pAccidentCash) ?? 0.0
        let hospitalValue = Double(self.secondAdHospitalVal) ?? 0.0
//        let totalAmountUnderAge = underAgeCalculateAmount
//        self.criAmountUnderage =  Double(totalAmountUnderAge)!
        //MARK: - Count the personal accident amount
        let personal = (caa * 0.4)/1000
        let totalPersonal =  String(personal)
        let personalAcc = totalPersonal
        self.personalAccident = Double(personalAcc)!
        //MARK: - count the amount for the Health issue cash
        let health = (caa * 0.504)/1000
        let healthCount = String(health)
        let healthCash = healthCount
        self.hospitalCashOverAge = Double(healthCash)!
        //MARK: - count the amount for the under health cash
        let underAgehealth = (caa * 0.364)/1000
        let underAgehealthCount = String(underAgehealth)
        let underAgeHealth = underAgehealthCount
        self.hospitalCashUnderAge = Double(underAgeHealth)!
        //MARK: - show details for the critical calculation
        self.criSelectAmountTxt.text =  self.suminsured
        if self.firstAdult == true{
            self.firstAdultValu = Int(self.criAmountOverage) ?? 0
            self.criSelfDetailLbl.text = "\(self.fAName + " " + "is covered under critical illness for Rs." + "" + totalAmountCount) "
            self.critotalAmount.text = "\(self.criAmountOverage)"
        }else if self.secAdult == true{
            self.criSpousesDetailLbl.text = "\(self.sAName + " " + "is covered under critical illness for Rs." + "" + self.secondAdCriticalVal)"
            self.firstTotal = Double(self.premiumm)!
            self.criticalTotal =   self.firstTotal + Double(self.secondAdCriticalVal)!
            self.critotalAmount.text = "\(self.criticalTotal)"
        }else if self.firstChild == true{
            self.criFirstChildDetailLbl.text = "\(self.fCName + " " + "is covered under critical illness for Rs." + "" + self.firstChildCriticalVal)"
            self.criticalTotal =   self.firstTotal + Double(self.secondAdCriticalVal)! + Double(self.firstChildCriticalVal)!
            self.critotalAmount.text = "\(self.criticalTotal)"
        }else if self.secChail == true{
            self.criSecondChildDetailLbl.text = "\(self.sCName + " " + "is covered under critical illness for Rs." + " " + self.secondChildCriticalVal)"
            self.criticalTotal =   self.firstTotal + Double(self.secondAdCriticalVal)! + Double(self.firstChildCriticalVal)! + Double( self.secondChildCriticalVal)!
            self.critotalAmount.text = "\(self.criticalTotal)"
        }else if self.thardChild == true{
            self.criThirdChildDetailLbl.text = "\(self.tCName + " " + "is covered under critical illness for Rs." + " " + self.thirdChildCriticalVal)"
            self.criticalTotal =   self.firstTotal + Double(self.secondAdCriticalVal)! + Double(self.firstChildCriticalVal)! + Double(self.secondChildCriticalVal)! + Double(self.thirdChildCriticalVal)!
            self.critotalAmount.text = "\(self.criticalTotal)"
        }else if self.fourthChaild == true{
            self.criFourthChildDetailLbl.text = "\(self.frCName + " " + "is covered under critical illness for Rs." + " " + self.fourthChildCriticalVal)"
            self.criticalTotal =   self.firstTotal + Double(self.secondAdCriticalVal)! + Double(self.firstChildCriticalVal)! + Double(self.secondChildCriticalVal)! + Double(self.thirdChildCriticalVal)! + Double(self.fourthChildCriticalVal)!
            self.critotalAmount.text = "\(self.criticalTotal)"
        }else {
            self.firstAdultValu = Int(self.criAmountOverage) ?? 0
            self.criSelfDetailLbl.text = "\(self.fAName + "" + "is covered under critical illness for Rs." + "" + totalAmountCount) "
            self.criSpousesDetailLbl.text = "\(self.sAName + "" + "is covered under critical illness for Rs." + "" + empty)"
            self.criFirstChildDetailLbl.text = "\(self.fCName + "" + "is covered under critical illness for Rs." + "" + empty)"
            self.criSecondChildDetailLbl.text = "\(self.sCName + "" + "is covered under critical illness for Rs." + "" + empty)"
            self.criThirdChildDetailLbl.text = "\(self.tCName + "" + "is covered under critical illness for Rs." + "" + empty)"
            self.criFourthChildDetailLbl.text = "\(self.frCName + "" + "is covered under critical illness for Rs." + "" + totalAmountCount)"
            self.critotalAmount.text = "\(self.criAmountOverage)"
        }

//MARK: - show Details for the personal accident
        self.pAccDntSelectedAmountTxt.text =  self.suminsured
        if self.firstAdult == true{
            self.pAccdntSelfDetailLbl.text = "\(fAName + "" + "is covered under personal accident for Rs." + "" + self.pAccidentCash)"
            self.pAccdnttotalAmount.text   = "\(self.pAccidentCash)"
            self.personalAccidentTotal =  Double(self.pAccidentCash)!
        }else if self.secAdult == true{
            self.pAccdntSpousesDetailLbl.text = "\(sAName + "" + "is covered under personal accident for Rs." + "" + self.secondAdPaVal) "
            self.personalAccidentTotal = firstPaValue + Double(self.secondAdPaVal)!
            self.pAccdnttotalAmount.text   = "\( self.personalAccidentTotal)"
        }else if self.firstChild == true{
            self.pAccdntFirstChildDetailLbl.text = "\(fCName + "" + "is covered under personal accident for Rs." + "" + self.firstChildPaVal) "
            self.personalAccidentTotal = firstPaValue + Double(self.secondAdPaVal)! + Double(self.firstChildPaVal)!
            self.pAccdnttotalAmount.text   = "\(self.personalAccidentTotal)"
          
        }else if self.secChail == true{
            self.pAccdntSecondChildDetailLbl.text = "\(sCName + "" + "is covered under personal accident for Rs." + "" + self.secondChildPaVal) "
            self.personalAccidentTotal = firstPaValue + Double(self.secondAdPaVal)! + Double(self.firstChildPaVal)! + Double(self.secondChildPaVal)!
            self.pAccdnttotalAmount.text   = "\(self.personalAccidentTotal)"
        }else if self.thardChild == true{
            self.pAccdntThirdChildDetailLbl.text = "\(tCName + "" + "is covered under personal accident for Rs." + "" + self.thirdChildPaVal) "
            self.personalAccidentTotal = firstPaValue + Double(self.secondAdPaVal)! + Double(self.firstChildPaVal)! + Double(self.secondChildPaVal)! + Double(self.thirdChildPaVal)!
            self.pAccdnttotalAmount.text   = "\(self.personalAccidentTotal)"
        }else if self.fourthChaild == true{
            self.pAccdntFourthChildDetailLbl.text = "\(frCName + "" + "is covered under personal accident for Rs." + "" + self.fourthChildPaVal) "
            self.personalAccidentTotal  = firstPaValue + Double(self.secondAdPaVal)! + Double(self.firstChildPaVal)! + Double(self.secondChildPaVal)! + Double(self.thirdChildPaVal)! + Double(self.fourthChildPaVal)!
            self.pAccdnttotalAmount.text   = "\(self.personalAccidentTotal)"
         } else if self.firstAdult == false{
            self.pAccdntSelfDetailLbl.text = "\(fAName + "" + "is covered under personal accident for Rs." + "" + empty)"
             self.pAccdntSpousesDetailLbl.text = "\(sAName + "" + "is covered under personal accident for Rs." + "" + empty) "
             self.pAccdntFirstChildDetailLbl.text = "\(fCName + "" + "is covered under personal accident for Rs." + "" + empty) "
             self.pAccdntSecondChildDetailLbl.text = "\(sCName + "" + "is covered under personal accident for Rs." + "" + empty) "
             self.pAccdntThirdChildDetailLbl.text = "\(tCName + "" + "is covered under personal accident for Rs." + "" + empty) "
             self.pAccdntFourthChildDetailLbl.text = "\(frCName + "" + "is covered under personal accident for Rs." + "" + empty) "
            // self.pAccdnttotalAmount.text   = "\(self.pAccidentCash)"

         }
        
        
//        if  self.getChild <= 5{
//
//        }else if self.getSChild <= 5{
//
//        }else if self.getTChild <= 5{
//
//        }else if self.getFrChild <= 5{
//
//        }else{
//            self.pAccdntFirstChildDetailLbl.text = "\(firstAdultPerAccident + "" + "is covered under personal accident for Rs." + "" + totalPersonal) "
//            self.pAccdntSecondChildDetailLbl.text = "\(firstAdultPerAccident + "" + "is covered under personal accident for Rs." + "" + totalPersonal) "
//           self.pAccdntThirdChildDetailLbl.text = "\(firstAdultPerAccident + "" + "is covered under personal accident for Rs." + "" + totalPersonal) "
//            self.pAccdntFourthChildDetailLbl.text = "\(firstAdultPerAccident + "" + "is covered under personal accident for Rs." + "" + totalPersonal) "
//        }
//        if TitleBtn == "Self"{
//            self.pAccdnttotalAmount.text   = String(personalAccident)
//        }else if TitleBtn == "1 Adult + 1 Child"{
//            let personAc = personalAccident + personalAccident
//            self.pAccdnttotalAmount.text   = String(personAc)
//            if self.getChild <= 5{
//                let personAc = personalAccident
//                self.pAccdnttotalAmount.text   = String(personAc)
//                 }
//            }else if TitleBtn == "1 Adult + 2 Child"{
//             if self.getSChild <= 5 && self.getChild <= 5 {
//                    let adult = personalAccident
//                    self.pAccdnttotalAmount.text   = String(adult)
//            }else if self.getChild > 5 && self.getSChild > 5{
//                let personAcc = personalAccident + personalAccident +  personalAccident
//                self.pAccdnttotalAmount.text   = String(personAcc)
//            }else if self.getChild > 5 && self.getSChild <= 5 {
//                    let adOChild = personalAccident + personalAccident
//                    self.pAccdnttotalAmount.text   = String(adOChild)
//            }else if self.getChild <= 5 && self.getSChild > 5 {
//                    let adSChild = personalAccident + personalAccident
//                    self.pAccdnttotalAmount.text   = String(adSChild)
//            }
//
//        }else if TitleBtn == "1 Adult + 3 Child"{
//
//            if self.getSChild <= 5 && self.getChild <= 5  && self.getTChild <= 5{
//                   let adult = personalAccident
//                   self.pAccdnttotalAmount.text   = String(adult)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild > 5{
//               let personAccc = personalAccident + personalAccident +  personalAccident +  personalAccident
//               self.pAccdnttotalAmount.text   = String(personAccc)
//           }else if self.getChild > 5 && self.getSChild <= 5 && self.getTChild <= 5 {
//                   let adOChild = personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adOChild)
//           }else if self.getChild <= 5 && self.getSChild > 5 && self.getTChild <= 5{
//                   let adSChild = personalAccident +  personalAccident
//                   self.pAccdnttotalAmount.text   = String(adSChild)
//           }else if self.getChild <= 5 && self.getSChild <= 5 && self.getTChild > 5{
//               let adSChildd = personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChildd)
//           }else if self.getChild <= 5 && self.getSChild > 5 && self.getTChild > 5{
//               let adSChhildd = personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChhildd)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild <= 5{
//               let addSChhildd = personalAccident + personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(addSChhildd)
//           }
//
//        }else if TitleBtn == "2 Adult + 1 Child"{
//            let personAcd = personalAccident
//            self.pAccdnttotalAmount.text   = String(personAcd)
//            if self.getSChild <= 5 {
//                   let adult = personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adult)
//           }else if self.getChild > 5{
//               let personAcc = personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(personAcc)
//           }
//        }else if TitleBtn == "2 Adult + 2 Child"{
//            let personAccd = personalAccident + personalAccident + personalAccident + personalAccident
//            self.pAccdnttotalAmount.text   = String(personAccd)
//            if self.getSChild <= 5 && self.getChild <= 5 {
//                   let adult = personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adult)
//           }else if self.getChild > 5 && self.getSChild > 5{
//               let personAcc = personalAccident + personalAccident +  personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(personAcc)
//           }else if self.getChild > 5 && self.getSChild <= 5 {
//                   let adOChild = personalAccident + personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adOChild)
//           }else if self.getChild <= 5 && self.getSChild > 5 {
//                   let adSChild = personalAccident + personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adSChild)
//           }
//        }else if TitleBtn == "2 Adult + 3 Child"{
//            let personAcdt = personalAccident + personalAccident +  personalAccident + personalAccident + personalAccident
//            self.pAccdnttotalAmount.text   = String(personAcdt)
//            if self.getSChild <= 5 && self.getChild <= 5  && self.getTChild <= 5{
//                   let adult = personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adult)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild > 5{
//               let personAccc = personalAccident + personalAccident +  personalAccident +  personalAccident +  personalAccident
//               self.pAccdnttotalAmount.text   = String(personAccc)
//           }else if self.getChild > 5 && self.getSChild <= 5 && self.getTChild <= 5 {
//                   let adOChild = personalAccident + personalAccident +  personalAccident
//                   self.pAccdnttotalAmount.text   = String(adOChild)
//           }else if self.getChild <= 5 && self.getSChild > 5 && self.getTChild <= 5{
//                   let adSChild = personalAccident +  personalAccident +  personalAccident
//                   self.pAccdnttotalAmount.text   = String(adSChild)
//           }else if self.getChild <= 5 && self.getSChild <= 5 && self.getTChild > 5{
//               let adSChildd = personalAccident + personalAccident +  personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChildd)
//           }else if self.getChild <= 5 && self.getSChild > 5 && self.getTChild > 5{
//               let adSChhildd = personalAccident + personalAccident + personalAccident +  personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChhildd)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild <= 5{
//               let addSChhildd = personalAccident + personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(addSChhildd)
//           }
//        }else if TitleBtn == "2 Adult + 4 Child"{
//
//            let personAcdnt = personalAccident + personalAccident + personalAccident + personalAccident + personalAccident + personalAccident
//            self.pAccdnttotalAmount.text   = String(personAcdnt)
//
//            if self.getSChild <= 5 && self.getChild <= 5  && self.getTChild <= 5  && self.getFrChild <= 5{
//                   let adult = personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adult)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild > 5 && self.getFrChild > 5{
//               let personAccc = personalAccident + personalAccident +  personalAccident +  personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(personAccc)
//           }else if self.getChild > 5 && self.getSChild <= 5 && self.getTChild <= 5  && self.getFrChild <= 5{
//                   let adOChild = personalAccident + personalAccident + personalAccident
//                   self.pAccdnttotalAmount.text   = String(adOChild)
//           }else if self.getChild <= 5 && self.getSChild > 5 && self.getTChild <= 5 && self.getFrChild <= 5{
//                   let adSChild = personalAccident +  personalAccident +  personalAccident
//                   self.pAccdnttotalAmount.text   = String(adSChild)
//           }else if self.getChild <= 5 && self.getSChild <= 5 && self.getTChild > 5 && self.getFrChild <= 5 {
//               let adSChildd = personalAccident + personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChildd)
//           }else if self.getChild <= 5 && self.getSChild <= 5 && self.getTChild <= 5 && self.getFrChild > 5{
//               let adSChhildd = personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(adSChhildd)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild <= 5 && self.getFrChild <= 5  {
//               let addSChhildd = personalAccident + personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(addSChhildd)
//           }else if self.getChild > 5 && self.getSChild > 5 && self.getTChild > 5 && self.getFrChild <= 5{
//               let addSChhiildd = personalAccident + personalAccident + personalAccident + personalAccident + personalAccident
//               self.pAccdnttotalAmount.text   = String(addSChhiildd)
//
//           }
//        }else{
//            self.pAccdnttotalAmount.text   = "0000"
//
//        }
        //MARK: - show details for the Health cash
        self.hCashSelectAmountTxt.text =  self.suminsured
        if self.firstAdult == true{
            self.hCashSelfDetailLbl.text = "\(fAName + "" + "is covered under Health cash for Rs." + "" + self.hospitalCash) "
            self.firChildTotal = Double(self.hospitalCash)!
            self.hCashtotalAmount.text = "\(self.hospitalCash)"
        }else if self.secAdult == true{
            self.hCashSpousesDetailLbl.text = "\(sAName + "" + "is covered under Health cash for Rs." + "" + self.secondAdHospitalVal) "
            self.firChildTotal =   hospitalValue + Double(self.secondAdHospitalVal)!
            self.hCashtotalAmount.text = "\(self.firChildTotal)"
        }else if self.firstChild == true{
            self.hCashFirstChildDetailLbl.text = "\(fCName + "" + "is covered under Health cash for Rs." + "" + self.firstChildHospitalVal) "
            self.firChildTotal =   hospitalValue + Double(self.secondAdHospitalVal)! + Double(self.firstChildHospitalVal)!
            self.hCashtotalAmount.text = "\(self.firChildTotal)"
        }else if self.secChail == true{
            self.hCashSecondChildDetailLbl.text = "\(sCName + "" + "is covered under Health cash for Rs." + "" + self.secondChildHospitalVal) "
            self.firChildTotal =   hospitalValue + Double(self.secondAdHospitalVal)! + Double(self.firstChildHospitalVal)! + Double(self.secondChildHospitalVal)!
            self.hCashtotalAmount.text = "\(self.firChildTotal)"
        }else if self.thardChild == true{
             self.hCashThirdChildDetailLbl.text = "\(tCName + "" + "is covered under Health cash for Rs." + "" + self.thirdChildHospitalVal) "
            self.firChildTotal =   hospitalValue + Double(self.secondAdHospitalVal)! + Double(self.firstChildHospitalVal)! + Double(self.secondChildHospitalVal)! + Double(self.thirdChildHospitalVal)!
            self.hCashtotalAmount.text = "\(self.firChildTotal)"
        }else if self.fourthChaild == true{
            self.hCashFourthChildDetailLbl.text = "\(frCName + "" + "is covered under Health cash for Rs." + "" + self.fourthChildHospitalVal) "
            self.firChildTotal =   hospitalValue + Double(self.secondAdHospitalVal)! + Double(self.firstChildHospitalVal)! + Double(self.secondChildHospitalVal)! + Double(self.thirdChildHospitalVal)! + Double(self.fourthChildHospitalVal)!
            self.hCashtotalAmount.text = "\(self.firChildTotal)"
        }else  if self.firstAdult == false{
            self.hCashSelfDetailLbl.text = "\(fAName + "" + "is covered under Health cash for Rs." + "" + self.hospitalCash) "
            self.hCashSpousesDetailLbl.text = "\(sAName + "" + "is covered under Health cash for Rs." + "" + empty) "
            self.hCashFirstChildDetailLbl.text = "\(fCName + "" + "is covered under Health cash for Rs." + "" + empty) "
            self.hCashSecondChildDetailLbl.text = "\(sCName + "" + "is covered under Health cash for Rs." + "" + empty) "
            self.hCashThirdChildDetailLbl.text = "\(tCName + "" + "is covered under Health cash for Rs." + "" + empty) "
            self.hCashFourthChildDetailLbl.text = "\(frCName + "" + "is covered under Health cash for Rs." + "" + empty) "
//            self.firChildTotal = Double(self.hospitalCash) as ?? 0.0
            self.hCashtotalAmount.text = "\(self.hospitalCash)"
        }
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
        self.hideShowView.isHidden = true
        self.hideShowNsView.constant = 0
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
        self.hCashSpousesView.isHidden = true
        self.hCashSpousesNsView.constant = 0
        self.hCashFirstChildView.isHidden = true
        self.hCashFirstChildNsView.constant = 0
        self.hCashSecondChildView.isHidden = true
        self.hCashSecondChildNsView.constant = 0
        self.hCashThirdChildView.isHidden = true
        self.hCashThirdChildNsView.constant = 0
        self.hCashFourthChildView.isHidden = true
        self.hCashFourthChildNsView.constant = 0
        self.criSelfDouble_NsView.constant = 0
        self.spouseDouble_NsView.constant = 0
        self.crifirst_NsView.constant = 0
        self.criSecond_NsView.constant = 0
        self.criThird_NsView.constant = 0
        self.criFourthDouble_NsView.constant = 0
        self.paSelfDouble_NsView.constant = 0
        self.paSpouseDouble_NsView.constant = 0
        self.paFirstDouble_NsView.constant = 0
        self.paSecondDouble_NsView.constant = 0
        self.paThirdDouble_NsView.constant = 0
        self.paFourthDouble_NsView.constant = 0
        self.hCashSpouseNs_View.constant = 0
        self.hCashSelfNs_View.constant = 0
        self.hCashFirstNs_View.constant = 0
        self.hCashSecondNs_View.constant = 0
        self.hCashThirdNs_View.constant = 0
        self.hCAshFourthNs_View.constant = 0
    }
    //MARK: - func for all hide show details
    func insuredDetails(){
        if TitleBtn == "1 Adult"{
            self.adjustinView.frame.size.height = 2000
            self.pAccdntFirstView.isHidden = false
            self.pAccdntFirstNsView.constant = 110
            self.criFirstView.isHidden = false
            self.criFirstNsView.constant = 110
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
            self.hCashFirstChildView.isHidden = true
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashSpousesNsView.constant = 0
            self.hCashSpousesView.isHidden = true
            self.hCashSpousesNsView.constant = 0
            self.hCashFirstChildView.isHidden = true
            self.hCashFirstChildNsView.constant = 0
            self.hCashSecondChildView.isHidden = true
            self.hCashSecondChildNsView.constant = 0
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            self.criSelfDouble_NsView.constant = 0
            self.spouseDouble_NsView.constant = 0
            self.crifirst_NsView.constant = 0
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 0
            self.paSpouseDouble_NsView.constant = 0
            self.paFirstDouble_NsView.constant = 0
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 0
            self.hCashSelfNs_View.constant = 0
            self.hCashFirstNs_View.constant = 0
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if self.TitleBtn == "2 Adult"{
            self.adjustinView.frame.size.height = 2500
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
            self.hCashFirstChildView.isHidden = true
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashSpousesView.isHidden = false
            self.hCashSpousesNsView.constant = 110
            self.hCashFirstChildView.isHidden = true
            self.hCashFirstChildNsView.constant = 0
            self.hCashSecondChildView.isHidden = true
            self.hCashSecondChildNsView.constant = 0
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 8
            self.crifirst_NsView.constant = 0
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 8
            self.paFirstDouble_NsView.constant = 0
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 0
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if self.TitleBtn == "1 Adult + 1 Child"{
            self.adjustinView.frame.size.height = 2500
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
            self.hCashSpousesView.isHidden = true
            self.hCashSpousesNsView.constant = 0
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = true
            self.hCashSecondChildNsView.constant = 0
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 0
            self.crifirst_NsView.constant = 0
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 0
            self.paFirstDouble_NsView.constant = 0
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 0
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 0
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "1 Adult + 2 Child"{
            self.adjustinView.frame.size.height = 2800
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
            self.hCashSpousesView.isHidden = true
            self.hCashSpousesNsView.constant = 0
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = false
            self.hCashSecondChildNsView.constant = 110
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 0
            self.crifirst_NsView.constant = 8
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 0
            self.paFirstDouble_NsView.constant = 8
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 0
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 8
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "1 Adult + 3 Child"{
            self.adjustinView.frame.size.height = 3100
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
            self.hCashSpousesView.isHidden = true
            self.hCashSpousesNsView.constant = 0
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = false
            self.hCashSecondChildNsView.constant = 110
            self.hCashThirdChildView.isHidden = false
            self.hCashThirdChildNsView.constant = 110
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 0
            self.crifirst_NsView.constant = 8
            self.criSecond_NsView.constant = 8
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 0
            self.paFirstDouble_NsView.constant = 8
            self.paSecondDouble_NsView.constant = 8
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 0
            self.hCashFirstNs_View.constant = 8
            self.hCashSecondNs_View.constant = 8
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 1 Child"{
            self.adjustinView.frame.size.height = 2800
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
            self.hCashSpousesView.isHidden = false
            self.hCashSpousesNsView.constant = 110
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = true
            self.hCashSecondChildNsView.constant = 0
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 8
            self.crifirst_NsView.constant = 0
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 8
            self.paFirstDouble_NsView.constant = 0
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 0
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 2 Child"{
            self.adjustinView.frame.size.height = 3150
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
            self.hCashSpousesView.isHidden = false
            self.hCashSpousesNsView.constant = 110
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = false
            self.hCashSecondChildNsView.constant = 110
            self.hCashThirdChildView.isHidden = true
            self.hCashThirdChildNsView.constant = 0
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 8
            self.crifirst_NsView.constant = 8
            self.criSecond_NsView.constant = 0
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 8
            self.paFirstDouble_NsView.constant = 8
            self.paSecondDouble_NsView.constant = 0
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 8
            self.hCashSecondNs_View.constant = 0
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 3 Child"{
            self.adjustinView.frame.size.height = 3500
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
            self.hCashSpousesView.isHidden = false
            self.hCashSpousesNsView.constant = 110
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = false
            self.hCashSecondChildNsView.constant = 110
            self.hCashThirdChildView.isHidden = false
            self.hCashThirdChildNsView.constant = 110
            self.hCashFourthChildView.isHidden = true
            self.hCashFourthChildNsView.constant = 0
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 8
            self.crifirst_NsView.constant = 8
            self.criSecond_NsView.constant = 8
            self.criThird_NsView.constant = 0
            self.criFourthDouble_NsView.constant = 0
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 8
            self.paFirstDouble_NsView.constant = 8
            self.paSecondDouble_NsView.constant = 8
            self.paThirdDouble_NsView.constant = 0
            self.paFourthDouble_NsView.constant = 0
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 8
            self.hCashSecondNs_View.constant = 8
            self.hCashThirdNs_View.constant = 0
            self.hCAshFourthNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 4 Child"{
            self.adjustinView.frame.size.height = 3800
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
            self.hCashSpousesView.isHidden = false
            self.hCashSpousesNsView.constant = 110
            self.hCashFirstView.isHidden = false
            self.hCashFirstNsView.constant = 110
            self.hCashFirstChildView.isHidden = false
            self.hCashFirstChildNsView.constant = 110
            self.hCashSecondChildView.isHidden = false
            self.hCashSecondChildNsView.constant = 110
            self.hCashThirdChildView.isHidden = false
            self.hCashThirdChildNsView.constant = 110
            self.hCashFourthChildView.isHidden = false
            self.hCashFourthChildNsView.constant = 110
            
            self.criSelfDouble_NsView.constant = 8
            self.spouseDouble_NsView.constant = 8
            self.crifirst_NsView.constant = 8
            self.criSecond_NsView.constant = 8
            self.criThird_NsView.constant = 8
            self.criFourthDouble_NsView.constant = 8
            self.paSelfDouble_NsView.constant = 8
            self.paSpouseDouble_NsView.constant = 8
            self.paFirstDouble_NsView.constant = 8
            self.paSecondDouble_NsView.constant = 8
            self.paThirdDouble_NsView.constant = 8
            self.paFourthDouble_NsView.constant = 8
            self.hCashSpouseNs_View.constant = 8
            self.hCashSelfNs_View.constant = 8
            self.hCashFirstNs_View.constant = 8
            self.hCashSecondNs_View.constant = 8
            self.hCashThirdNs_View.constant = 8
            self.hCAshFourthNs_View.constant = 8
        }
        }
    //MARK: - plus minus action button
    @IBAction func plusMinusAction(_ sender:UIButton){
        if plusBtn.isSelected {
            plusBtn.setBackgroundImage(UIImage(named: "minus"), for: .normal)
            self.hideShowView.isHidden = false
            self.hideShowNsView.constant = 390
        }else{
            plusBtn.setBackgroundImage(UIImage(named: "plus"), for:.normal)
            self.hideShowView.isHidden = true
            self.hideShowNsView.constant = 0
        }
        plusBtn.isSelected = !plusBtn.isSelected
    }
    //MARK: - medical Detail percent button action
    @IBAction func medicalDetailPer(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let medicalBtn = item
            if medicalBtn == "Yes"{
                self.Life_Status = "False"
                showWarning("Error", AlertMessage.completeHealthcare.rawValue)
//                self.policyQuat()
                self.continueBtn.isHidden == true
            }else{
                self.Life_Status = "True"
                self.policyQuat()
                self.continueBtn.isHidden == false
            }
            self.medicalPermissionBtn.setTitle(item, for: .normal)
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
                self.ciStatus = "True"
                self.policyQuat()
                self.criticalSpinnerEnable()
                 }else{
                self.ciStatus = "False"
                self.ciStatus1 = "False"
                self.ciStatus2 = "False"
                self.ciStatus3 = "False"
                self.ciStatus4 = "False"
                self.ciStatus5 = "False"
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
                self.policyQuat()
                self.criticalSpinnerDesable()
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
                self.ciStatus1 = "True"
                self.policyQuat()
                 }else{
                self.ciStatus1 = "False"
                self.policyQuat()
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
                self.ciStatus2 = "True"
                self.policyQuat()
            }else{
                self.ciStatus2 = "False"
                self.policyQuat()
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
                self.ciStatus3 = "True"
                self.policyQuat()
                 }else{
                self.ciStatus2 = "False"
                self.policyQuat()
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
                self.ciStatus4 = "True"
                self.policyQuat()
                //MARK: - v
//                if firstAdult == false{
//                self.criThirdChildPerBtn.setTitle("No", for: .normal)
//                self.ciStatus4 = "False"
//                self.policyQuat()
//                }
            }else{
                self.ciStatus4 = "False"
                self.policyQuat()
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
                self.ciStatus5 = "True"
                self.policyQuat()
//                if firstAdult == false{
//                self.criFourthChildPerBtn.setTitle("No", for: .normal)
//                self.ciStatus5 = "False"
//                self.policyQuat()
//                }
            }else{
                self.ciStatus5 = "False"
                self.policyQuat()
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
                self.paStatus = "True"
                self.firstAdult = true
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
                self.personalAccidentSpinnerEnable()
                self.childAge()
                self.secondChild()
                self.thirdChild()
                self.fourthChild()
                 }else{
                self.paStatus  = "False"
                self.paStatus1 = "False"
                self.paStatus2 = "False"
                self.paStatus3 = "False"
                self.paStatus4 = "False"
                self.paStatus5 = "False"
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
                self.policyQuat()
                self.personalAccidentSpinnerDesable()
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
                self.paStatus1 = "True"
                self.firstAdult = false
                self.secAdult = true
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
            }else{
                self.paStatus1 = "False"
                self.policyQuat()
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
                self.paStatus2 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = true
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
            }else{
                self.paStatus2 = "False"
                self.policyQuat()
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
                self.paStatus3 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = true
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
            }else{
                self.paStatus3 = "False"
                self.policyQuat()
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
                self.paStatus4 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = true
                self.fourthChaild = false
                self.policyQuat()
            }else{
                self.paStatus4 = "False"
                self.policyQuat()
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
                self.paStatus5 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = true
                self.policyQuat()
            }else{
                self.paStatus5 = "False"
                self.policyQuat()
            }
            self.pAccdntFourthChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //////////**********************************////////
    //MARK: - Hospital Cash permsion button action
    //////////**********************************////////
    
    @IBAction func hospitalCashSelfPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
                self.dhcStatus = "True"
                self.firstAdult = true
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
                self.hospitalCashSpinnerEnable()
                }else{
                self.dhcStatus = "False"
                self.dhcStatus1 = "False"
                self.dhcStatus2 = "False"
                self.dhcStatus3 = "False"
                self.dhcStatus4 = "False"
                self.dhcStatus5 = "False"
                self.hCashSpousesPerBtn.setTitle("No", for: .normal)
                self.hCashFirstChildPerBtn.setTitle("No", for: .normal)
                self.hCashSecondChildPerBtn.setTitle("No", for: .normal)
                self.hCashThirdChildPerBtn.setTitle("No", for: .normal)
                self.hCashFourthChildPerBtn.setTitle("No", for: .normal)
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
                self.hospitalCashSpinnerDesable()
            }
            self.hCashSelfperBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func hospitalCashSpousesPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
                self.dhcStatus1 = "True"
                self.firstAdult = false
                self.secAdult = true
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
             }else{
                self.dhcStatus1 = "False"
                self.policyQuat()
            }
            self.hCashSpousesPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func hospitalCashFirstChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
                self.dhcStatus2 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = true
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
            }else{
                self.dhcStatus2 = "False"
                self.policyQuat()
            }
            self.hCashFirstChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func hospitalCashsecondChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
               
                self.dhcStatus3 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = true
                self.thardChild = false
                self.fourthChaild = false
                self.policyQuat()
             }else{
                self.dhcStatus3 = "False"
                self.policyQuat()
            }
            self.hCashSecondChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func hospitalCashThirdChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
                self.dhcStatus4 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = true
                self.fourthChaild = false
                self.policyQuat()
             }else{
                self.dhcStatus4 = "False"
                self.policyQuat()
            }
            self.hCashThirdChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func hospitalCashFourthChildPerAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.hospitalCashDetail = item
            if hospitalCashDetail == "Yes"{
                self.dhcStatus5 = "True"
                self.firstAdult = false
                self.secAdult = false
                self.firstChild = false
                self.secChail = false
                self.thardChild = false
                self.fourthChaild = true
                self.policyQuat()
             }else{
                self.dhcStatus5 = "False"
                self.policyQuat()
            }
            self.hCashFourthChildPerBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    //////////**********************************////////
    //MARK: - Hospital Cash permsion button action
    //////////**********************************////////
    @IBAction func extradiscountAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Yes","No"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.extradiscount = item
            if extradiscount == "Yes"{
                self.Tiered_Status = "True"
                self.policyQuat()
            }else{
                self.Tiered_Status = "False"
                self.policyQuat()
            }
            self.extraDiscountBtn.setTitle(item, for: .normal)
            
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
       }
    //MARK: - sub limit Btn Action for go to next page
    @IBAction func sublimitAction(_ sender:UIButton){
        let dropDown = DropDown()
        dropDown.anchorView = (sender as AnchorView)
        dropDown.dataSource = ["Sub Limit-A","Sub Limit-B","Sub Limit-C"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.sublimit = item
            if sublimit == "Sub Limit-A"{
                self.Sub_Status = "True"
                self.Sub_Type = "A"
                self.policyQuat()
               self.sublimitDisCount_Lbl.text = "(What is the Sub-Limit (upto 10% Discount))"
            }else if sublimit == "Sub Limit-B" {
                self.Sub_Status = "True"
                self.Sub_Type = "B"
                self.policyQuat()
                self.sublimitDisCount_Lbl.text = "(What is the Sub-Limit (upto 5% Discount))"
            }else if sublimit == "Sub Limit-C"{
                self.Sub_Status = "True"
                self.Sub_Type = "C"
                self.policyQuat()
                self.sublimitDisCount_Lbl.text = "(What is the Sub-Limit (upto 5% Discount))"
            }else{
                self.Sub_Status = "False"
                self.Sub_Status = "False"
                self.Sub_Type = "False"
                self.policyQuat()
            }
            self.sublimitSelectBtn.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.savedata()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        self.present(nextVc, animated: true, completion: nil)
    }
    
    
    //MARK: - continue Btn Action for go to next page
    @IBAction func continiue(){
        self.savedata()
        if medicalPermissionBtn.title(for: .normal) == "Select"{
            alert(message: "Please Select Any Details",title: "Message")
        }else if medicalPermissionBtn.title(for: .normal) == "No"{
            let nextVc = UIStoryboard.init(name: "Health", bundle:  nil).instantiateViewController(withIdentifier: "AddressAndCommunication_Vc") as! AddressAndCommunication_Vc
            self.navigationController?.pushViewController(nextVc, animated: true)        }else if medicalPermissionBtn.title(for: .normal) == "Yes"{
                //self.continueBtn.isHidden == true

        }
    }
}

//MARK: - extension for the policyquat Api
extension MedicalRetriveDetail_Vc {
    

    private func policyQuat(){
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "Plan_Type":self.policyTypeTxt.text ?? "",
                       "Floater_Type":self.familyTypeTxt.text ?? "",
                       "Sum_Insured":  self.sumInsuredTxt.text ?? "",
                       "Policy_Duration": self.validTime,
                       "Proposal_Date": self.todayDate,
                       "From_Date":self.tommarow,
                       "To_Date":self.yearlater,
                       "DOB":  self.newage,
                       "PA_Status":paStatus ,
                       "CI_Status":ciStatus ,
                       "DHC_Status":dhcStatus,
                       "Esale_Status":self.Esale_Status,
                       "Life_Status":self.Life_Status,
                       "PD_Status":self.PD_Status,
                       "Sub_Status":self.Sub_Status,
                       "Sub_Type":self.Sub_Type,
                       "Tiered_Status":self.Tiered_Status,
                       "DOB1":self.newage,
                       "DOB2":self.newage,
                       "DOB3":self.newage,
                       "DOB4":self.newage,
                       "DOB5":self.newage,
                       "PA_Status1":paStatus1,
                       "CI_Status1":ciStatus1,
                       "DHC_Status1":dhcStatus1,
                       "PA_Status2":paStatus2,
                       "CI_Status2":ciStatus2,
                       "DHC_Status2":dhcStatus2,
                       "PA_Status3":paStatus3,
                       "CI_Status3":ciStatus3,
                       "DHC_Status3":dhcStatus3,
                       "PA_Status4":paStatus3,
                       "CI_Status4":ciStatus4,
                       "DHC_Status4":dhcStatus4,
                       "PA_Status5":paStatus5,
                       "CI_Status5":ciStatus5,
                       "DHC_Status5":dhcStatus5,
                       "Policy_Type":"Essential",
                       "BI_Status" :self.BIStatus,
                       "BI_Status1":self.BIStatus1,
                       "BI_Status2":self.BIStatus2,
                       "BI_Status3":self.BIStatus3,
                       "BI_Status4":self.BIStatus4,
                       "BI_Status5":self.BIStatus5
               ]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.buyHealthPolicy.url)
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
                        let total = Premium?["TotalPremium"] as? [String:Any]
                        let value = total?["Value"]
                        self.totallPremium = (value  as! String)
                        self.totalAmountTxt.text = (value  as! String)
                        let netPremium = Premium?["NetPremium"] as? [String:Any]
                        let val = netPremium?["Value"]
                        // self.netPremium.text = (val as! String)
                        //MARK: - coverage data fetching
                        let cover = data["Risks"] as? [String:Any]
                        let coverr = cover?["Risk"] as? [String:Any]
                        let dd = coverr?["RisksData"] as? [String:Any]
                        let ddr = dd?["InsuredDetails"] as? [String:Any]
                        let insured = ddr?["InsuredDetailsGroup"] as? [String:Any]
                        let insuredd = insured?["InsuredDetailsGroupData"] as? [[String:Any]]
                        //MARK: - for first adult
                        let paDetail = insuredd?[0]["CoverDetails"] as? [String:Any]
                        let subIndexxx = paDetail?["Covers"] as? [String:Any]
                        let subbb = subIndexxx?["CoverData"] as? [[String:Any]]
                        let coverDataaa = subbb?[1]["CoverPremium"] as? [String:Any]
                        let Valueee = coverDataaa?["Value"] as? String
                        self.pAccidentCash = Valueee!
                        self.pAccdnttotalAmount.text = self.pAccidentCash
                        let index = insuredd?[0]["CoverDetails"] as? [String:Any]
                        let subIndex = index?["Covers"] as? [String:Any]
                        let sub = subIndex?["CoverData"] as? [[String:Any]]
                        let coverData = sub?[2]["CoverPremium"] as? [String:Any]
                        let Value = coverData?["Value"] as? String
                        self.premiumm = Value!
                        let cvrDetail = insuredd?[0]["CoverDetails"] as? [String:Any]
                        let subIndexx = cvrDetail?["Covers"] as? [String:Any]
                        let subb = subIndexx?["CoverData"] as? [[String:Any]]
                        let coverDataa = subb?[3]["CoverPremium"] as? [String:Any]
                        let Valuee = coverDataa?["Value"] as? String
                        self.hospitalCash = Valuee!
                        self.hCashtotalAmount.text =  self.hospitalCash
                        //MARK: - seocnd adult value
                        let secondAdPaCoverDetail = insuredd?[1]["CoverDetails"] as? [String:Any]
                        let secondAdPACover = secondAdPaCoverDetail?["Covers"] as? [String:Any]
                        let secondAdPaCoverData = secondAdPACover?["CoverData"] as? [[String:Any]]
                        let secondAdPaCoverPremium = secondAdPaCoverData?[1]["CoverPremium"] as? [String:Any]
                        let secondAdPaValue = secondAdPaCoverPremium?["Value"] as? String
                        self.secondAdPaVal = secondAdPaValue!
//                        print(self.secondAdPaVal)
                        let secondAdCriticalCoverPremium = secondAdPaCoverData?[2]["CoverPremium"] as? [String:Any]
                        let secondAdCriticalValue  = secondAdCriticalCoverPremium?["Value"] as? String
                        self.secondAdCriticalVal = secondAdCriticalValue!
//                        print( self.secondAdCriticalVal)
                        let secondAdHospitalCoverPremium = secondAdPaCoverData?[3]["CoverPremium"] as? [String:Any]
                        let secondAdHospitalPaValue = secondAdHospitalCoverPremium?["Value"] as? String
                        self.secondAdHospitalVal = secondAdHospitalPaValue!
//                        print(self.secondAdHospitalVal)
                        //MARK: - First Child value
                        let firstChPaCoverDetail = insuredd?[2]["CoverDetails"] as? [String:Any]
                        let firstChPACover = firstChPaCoverDetail?["Covers"] as? [String:Any]
                        let firstChPaCoverData = firstChPACover?["CoverData"] as? [[String:Any]]
                        let firstChPaCoverPremium = firstChPaCoverData?[1]["CoverPremium"] as? [String:Any]
                        let firstChPaValue = firstChPaCoverPremium?["Value"] as? String
                        self.firstChildPaVal = firstChPaValue!
//                        print(self.firstChildPaVal)
                        let firstChCriticalCoverPremium = secondAdPaCoverData?[2]["CoverPremium"] as? [String:Any]
                        if let firstChCriticalValue  = firstChCriticalCoverPremium?["Value"] as? String {
                            self.firstChildCriticalVal = firstChCriticalValue
                        }
                        print( self.firstChildCriticalVal)
                        let firstChildCriticalValHospitalCoverPremium = secondAdPaCoverData?[3]["CoverPremium"] as? [String:Any]
                        let firstChildCriticalValHospitalPaValue = firstChildCriticalValHospitalCoverPremium?["Value"] as? String
                        self.firstChildHospitalVal = firstChildCriticalValHospitalPaValue!
//                        print(self.firstChildHospitalVal)
                        //MARK: - second child value
                        let secondChPaCoverDetail = insuredd?[3]["CoverDetails"] as? [String:Any]
                        let secondChPACover = secondChPaCoverDetail?["Covers"] as? [String:Any]
                        let secondChPaCoverData = secondChPACover?["CoverData"] as? [[String:Any]]
                        let secondChPaCoverPremium = secondChPaCoverData?[1]["CoverPremium"] as? [String:Any]
                        let secondChPaValue = secondChPaCoverPremium?["Value"] as? String
                        self.secondChildPaVal = secondChPaValue!
//                        print(self.secondChildPaVal)
                        let secondChCriticalCoverPremium = secondAdPaCoverData?[2]["CoverPremium"] as? [String:Any]
                        let secondChCriticalValue  = secondChCriticalCoverPremium?["Value"] as? String
                        self.secondChildCriticalVal = secondChCriticalValue!
//                        print( self.secondChildCriticalVal)
                        let secondChildHospitalCoverPremium = secondAdPaCoverData?[3]["CoverPremium"] as? [String:Any]
                        let secondChildCriticalValHospitalPaValue = secondChildHospitalCoverPremium?["Value"] as? String
                        self.secondChildHospitalVal = secondChildCriticalValHospitalPaValue!
//                        print(self.secondChildHospitalVal)
                        //MARK: - third child value
                        let thirdChPaCoverDetail = insuredd?[4]["CoverDetails"] as? [String:Any]
                        let thirdChPACover = thirdChPaCoverDetail?["Covers"] as? [String:Any]
                        let thirdChPaCoverData = thirdChPACover?["CoverData"] as? [[String:Any]]
                        let thirdChPaCoverPremium = thirdChPaCoverData?[1]["CoverPremium"] as? [String:Any]
                        let thirdChPaValue = thirdChPaCoverPremium?["Value"] as? String
                        self.thirdChildPaVal = thirdChPaValue!
//                        print(self.thirdChildPaVal)
                        let thirdChCriticalCoverPremium = secondAdPaCoverData?[2]["CoverPremium"] as? [String:Any]
                        let thirdChCriticalValue  = thirdChCriticalCoverPremium?["Value"] as? String
                        self.thirdChildCriticalVal = thirdChCriticalValue!
//                        print( self.thirdChildCriticalVal)
                        let thirdChildHospitalCoverPremium = secondAdPaCoverData?[3]["CoverPremium"] as? [String:Any]
                        let thirdChildCriticalValHospitalPaValue = thirdChildHospitalCoverPremium?["Value"] as? String
                        self.thirdChildHospitalVal = thirdChildCriticalValHospitalPaValue!
//                        print(self.thirdChildHospitalVal)
                        //MARK: -  fourth child value
                        let fourthChPaCoverDetail = insuredd?[5]["CoverDetails"] as? [String:Any]
                        let fourthChPACover = fourthChPaCoverDetail?["Covers"] as? [String:Any]
                        let fourthChPaCoverData = fourthChPACover?["CoverData"] as? [[String:Any]]
                        let fourthChPaCoverPremium = fourthChPaCoverData?[1]["CoverPremium"] as? [String:Any]
                        let fourthChPaValue = fourthChPaCoverPremium?["Value"] as? String
                        self.fourthChildPaVal = fourthChPaValue!
//                        print(self.fourthChildPaVal)
                        let fourthChCriticalCoverPremium = secondAdPaCoverData?[2]["CoverPremium"] as? [String:Any]
                        let fourthChCriticalValue  = fourthChCriticalCoverPremium?["Value"] as? String
                        self.fourthChildCriticalVal = fourthChCriticalValue!
//                        print( self.fourthChildCriticalVal)
                        let fourthChildHospitalCoverPremium = secondAdPaCoverData?[3]["CoverPremium"] as? [String:Any]
                        let fourthChildCriticalValHospitalPaValue = fourthChildHospitalCoverPremium?["Value"] as? String
                        self.fourthChildHospitalVal = fourthChildCriticalValHospitalPaValue!
//                        print(self.fourthChildHospitalVal)
                        self.retriveData()
                        //MARK: -  data for the other discount
                        let otherdiscount = dd?["OtherDiscounts"] as? [String:Any]
                        let otherdiscountGroup = otherdiscount?["OtherDiscountGroup"] as? [String:Any]
                        let otherdiscGroupData = otherdiscountGroup?["OtherDiscountGroupData"] as? [[String:Any]]
                        let sublimitDiscount = otherdiscGroupData?[4]["Premium"] as? [String:Any]
                        let sublimit = sublimitDiscount?["Value"] as? String
                        self.sublimitDis = sublimit!
//                        print(otherdiscGroupData)
                        let otherPremium = otherdiscGroupData?[5]["Description"] as? [String:Any]
                        let extraar = otherPremium?["Value"] as? String
                        self.extraa = extraar!
                        if self.extraa == "Sub Category Discount"{
                            let otherPremDes = otherdiscGroupData?[5]["Premium"] as? [String:Any]
//                            print(otherPremDes)
                            let extraarr = otherPremDes?["Value"] as? String
                            self.sublimit_Txt.text = extraarr
                            self.sublimitDiscount = extraarr!
                        }else if self.extraa == "Tiered Hospital Discount"{
                            let otherPremDes = otherdiscGroupData?[5]["Premium"] as? [String:Any]
//                            print(otherPremDes)
                            let extraarr = otherPremDes?["Value"] as? String
                            self.discountAmountTxt.text = extraarr
                            self.tiredDiscount = extraarr!
                        }else if self.extraa == "Life Style Discount"{
                            let otherPremDes = otherdiscGroupData?[5]["Premium"] as? [String:Any]
//                            print(otherPremDes)
                            let extraarr = otherPremDes?["Value"] as? String
                            //self.discountAmountTxt.text = extraarr
                            self.lifestyleDiscount = extraarr!
                        }
//                      print(otherdiscGroupData)
                      // print(otherdiscountVal)
                       }
                    if let idd = response["Customer"] as? [String:Any]{
                       var quotid = idd["PosPolicyNo"] as? String
                        self.quotationid = quotid!
                        ProjectUtils.saveQuotationId(quotId: NSNumber(value: JSONResponse["PosPolicyNo"].intValue))
        

//                    print(self.quotationid)
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
