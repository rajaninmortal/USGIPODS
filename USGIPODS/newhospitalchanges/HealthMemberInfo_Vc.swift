//
//  HealthMemberInfo_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//



import UIKit
import Foundation
import DropDown
import Alamofire
import SwiftyJSON
import SVProgressHUD

class HealthMemberInfo_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet var adjustable_View: UIView!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var policy_Txt: UITextField!
    @IBOutlet var family_Txt: UITextField!
    @IBOutlet var suminsured_Txt: UITextField!
    @IBOutlet var policyTenurTxt: UITextField!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var reCalculatedBtn: UIButton!
    @IBOutlet var quoteId_Txt: UITextField!

    //MARK: - member infor for 1st adult
    
    @IBOutlet var firstAdultView: UIView!
    @IBOutlet var firstAdNsView: NSLayoutConstraint!
    @IBOutlet var firstAdultnameView: UIView!
    @IBOutlet var firstAdultNAmeTxt: UITextField!
    @IBOutlet var firstDobView: UIView!
    @IBOutlet var firstDobTxt: UITextField!
    @IBOutlet var firstGenderView: UIView!
    @IBOutlet var firstGenderbtn: UIButton!
    @IBOutlet var firstOccupationView: UIView!
    @IBOutlet var firstOccupationBtn: UIButton!
    @IBOutlet var firstAdultInchesBtn: UIButton!
    @IBOutlet var firstAdultFitBtn: UIButton!
    @IBOutlet var firstAdultLengthView: UIView!
    @IBOutlet var firstweightView: UIView!
    @IBOutlet var firstWeightTxt: UITextField!
    @IBOutlet var firstAdultbmi_Txt: UITextField!
    @IBOutlet var firstAdultrelationTxt: UITextField!

    //MARK: - spouses details
    @IBOutlet var spousesNsLbl: NSLayoutConstraint!
    @IBOutlet var spouseLbl: UILabel!
    @IBOutlet var spousesAdultView: UIView!
    @IBOutlet var spousesAdNsView:NSLayoutConstraint!
    @IBOutlet var spousesAdultnameView: UIView!
    @IBOutlet var spousesAdultNAmeTxt: UITextField!
    @IBOutlet var spousesDobView: UIView!
    @IBOutlet var spousesDobTxt: UITextField!
    @IBOutlet var spousesGenderView: UIView!
    @IBOutlet var spousesGenderbtn: UIButton!
    @IBOutlet var spousesOccupationView: UIView!
    @IBOutlet var spousesOccupationBtn: UIButton!
    @IBOutlet var spousesAdultInchesBtn: UIButton!
    @IBOutlet var spousesAdultFitBtn: UIButton!
    @IBOutlet var spousesAdultLengthView: UIView!
    @IBOutlet var spousesweightView: UIView!
    @IBOutlet var spousesWeightTxt: UITextField!
    @IBOutlet var spousesAdultbmi_Txt: UITextField!
    @IBOutlet var spousesAdultRelation_View: UIView!
    @IBOutlet var spousesAdultRelationBtn: UIButton!

    //MARK: - FirstChild details
    @IBOutlet var firstChildNsLbl: NSLayoutConstraint!
    @IBOutlet var firstchildLbl: UILabel!
    @IBOutlet var firstChildAdultView:UIView!
    @IBOutlet var firstChildAdNsView:NSLayoutConstraint!
    @IBOutlet var firstChildAdultnameView: UIView!
    @IBOutlet var firstChildAdultNAmeTxt: UITextField!
    @IBOutlet var firstChildDobView: UIView!
    @IBOutlet var firstChildDobTxt: UITextField!
    @IBOutlet var firstChildGenderView: UIView!
    @IBOutlet var firstChildGenderbtn: UIButton!
    @IBOutlet var firstChildOccupationView: UIView!
    @IBOutlet var firstChildOccupationBtn: UIButton!
    @IBOutlet var firstChildAdultInchesBtn: UIButton!
    @IBOutlet var firstChildAdultFitBtn: UIButton!
    @IBOutlet var firstChildAdultLengthView: UIView!
    @IBOutlet var firstChildweightView: UIView!
    @IBOutlet var firstChildWeightTxt: UITextField!
    @IBOutlet var firstChildbmi_Txt: UITextField!
    @IBOutlet var firstChildRelation_View: UIView!
    @IBOutlet var firstChildRelationBtn: UIButton!

    //MARK: - second child details
    @IBOutlet var secondChildsAdultkView: UIView!
    @IBOutlet var secondChildsAdNsView:NSLayoutConstraint!
    @IBOutlet var secondChildsAdultnameView: UIView!
    @IBOutlet var secondChildsAdultNAmeTxt: UITextField!
    @IBOutlet var secondChildsDobView: UIView!
    @IBOutlet var secondChildsDobTxt: UITextField!
    @IBOutlet var secondChildsGenderView: UIView!
    @IBOutlet var secondChildsGenderbtn: UIButton!
    @IBOutlet var secondChildsOccupationView: UIView!
    @IBOutlet var secondChildsOccupationBtn: UIButton!
    @IBOutlet var secondChildsAdultInchesBtn: UIButton!
    @IBOutlet var secondChildsAdultFitBtn: UIButton!
    @IBOutlet var secondChildsAdultLengthView: UIView!
    @IBOutlet var secondChildsweightView: UIView!
    @IBOutlet var secondChildsWeightTxt: UITextField!
    @IBOutlet var secondChildsbmi_Txt: UITextField!
    @IBOutlet var secondChildRelation_View: UIView!
    @IBOutlet var secondChildRelationBtn: UIButton!

    //MARK: - thirdChild details
    @IBOutlet var thirdChildLbl: UILabel!
    @IBOutlet var thirdChildNsLbl: NSLayoutConstraint!
    @IBOutlet var thirdChildAdultView:UIView!
    @IBOutlet var thirdChildAdNsView:NSLayoutConstraint!
    @IBOutlet var thirdChildAdultnameView: UIView!
    @IBOutlet var thirdChildAdultNAmeTxt: UITextField!
    @IBOutlet var thirdChildDobView: UIView!
    @IBOutlet var thirdChildDobTxt: UITextField!
    @IBOutlet var thirdChildGenderView: UIView!
    @IBOutlet var thirdChildGenderbtn: UIButton!
    @IBOutlet var thirdChildOccupationView: UIView!
    @IBOutlet var thirdChildOccupationBtn: UIButton!
    @IBOutlet var thirdChildAdultInchesBtn: UIButton!
    @IBOutlet var thirdChildAdultFitBtn: UIButton!
    @IBOutlet var thirdChildAdultLengthView: UIView!
    @IBOutlet var thirdChildweightView: UIView!
    @IBOutlet var thirdChildWeightTxt: UITextField!
    @IBOutlet var thirdChildbmi_Txt: UITextField!
    @IBOutlet var thirdChildRelation_View: UIView!
    @IBOutlet var thirdChildRelationBtn: UIButton!
    //MARK: - fourth Child details
    @IBOutlet var fourthChildNsLbl: NSLayoutConstraint!
    @IBOutlet var fourthChildLbl: UILabel!
    @IBOutlet var fourthChildAdultView: UIView!
    @IBOutlet var fourthChildAdNsView:NSLayoutConstraint!
    @IBOutlet var fourthChildAdultnameView: UIView!
    @IBOutlet var fourthChildAdultNAmeTxt: UITextField!
    @IBOutlet var fourthChildDobView: UIView!
    @IBOutlet var fourthChildDobTxt: UITextField!
    @IBOutlet var fourthChildGenderView: UIView!
    @IBOutlet var fourthChildGenderbtn: UIButton!
    @IBOutlet var fourthChildOccupationView: UIView!
    @IBOutlet var fourthChildOccupationBtn: UIButton!
    @IBOutlet var fourthChildAdultInchesBtn: UIButton!
    @IBOutlet var fourthChildAdultFitBtn: UIButton!
    @IBOutlet var fourthChildAdultLengthView: UIView!
    @IBOutlet var fourthChildweightView: UIView!
    @IBOutlet var fourthChildWeightTxt: UITextField!
    @IBOutlet var fourthChildbmi_Txt: UITextField!
    @IBOutlet var fourthChildRelation_View: UIView!
    @IBOutlet var fourthChildRelationBtn: UIButton!

    //MARK: - pre declare string or var
    var permission  = String()
    var suminsured = String()
    var policy = String()
    var family = String()
    var tenure = String()
    var bmical = String()
    var inches  = String()
    var  h = Double()
    var  w = Double()
    var  p = Double()
    var fit  = String()
    let datePicker  = UIDatePicker()
    var afterday  = String()
    var today  = String()
    var yearlater  = String()
    var data = [[String: Any]]()
    var data1 = [[String: Any]]()
    var data2 = [[String: Any]]()
    var split = String()
    var testdate = String()
    var ch     = [Any]()
    var result = String()
    var result1 = String()
    var result2 = Int()
    var dateData = Date()
    let dated = Date()
    let formatter = DateFormatter()
    var dateSelect = Double()
    var calculated = Int();var sAdult = Int();var fChild = Int();var sChild = Int();var tChild = Int();var frChild = Int()
    var adultName = String();var adultDob = String();var adultGender = String();var adultOccupation = String();var adultInch = Int();var adultFit = Int();var adultWeaight = Int()
    var spousesName = String();var spousesDob = String();var spousesGender = String();var spousesOccupation = String();var spousesInch = Int();var spousesFit = Int();var spousesWeaight = Int()
    var date =  String()
    var quotationid = String()
    
    var fAName = String();var sAName = String();var fCName = String();var sCName = String();var tCName = String();var frCName = String()
    var fADob = String();var sADob = String();var fCDob = String();var sCDob = String();var tCDob = String();var frCDob = String()
    var fAOccpation = String();var sAOccpation = String();var fCOccpation = String();var sCOccpation = String();var tCOccpation = String();var frOccpation = String()
    var fAGender = String();var sAGender = String();var fCGender = String();var sCGender = String();var tCGender = String();var frGender = String()
    var fARelation = String();var sARelation = String();var fCRelation = String();var sCRelation = String();var tCRelation = String();var frRelation = String()
    var fABmi = String();var sABmi = String();var fCBmi = String();var sCBmi = String();var tCBmi = String();var frBmi = String()
    var firstAdultWeight = String();var spouseAdultWeight = String(); var firstChildWeight = String(); var secondChildWeight = String(); var thirdChildWeight = String(); var fourthChildWeight = String(); var totalAmount = String(); var gstValue = String(); var netPremiumm = String(); var extraDiscount = String(); var epolicyDis = String()
    var  nameArray = [""]
    
    var BIStatus = String(); var newAge = String()

    var BIStatus1 = String()
    var BIStatus2 = String()
    var BIStatus3 = String()
    var BIStatus4 = String()
    var BIStatus5 = String()
    var selectyear = String()
    var pdStatus = String()
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.familyFloater()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: dated)
        print(result)
        dateData = formatter.date(from: result)!
        print(dateData)
        self.cornerRadious()
        self.borderwidth()
        self.createdatePickerView()
        self.firstDobTxt.delegate = self
        self.spousesDobTxt.delegate = self
        self.firstChildDobTxt.delegate = self
        self.secondChildsDobTxt.delegate = self
        self.thirdChildDobTxt.delegate = self
        self.fourthChildDobTxt.delegate = self
        self.firstDobTxt.delegate = self
        self.spousesAdultNAmeTxt.delegate = self
        self.spousesDobTxt.delegate = self
        self.firstWeightTxt.delegate = self
        self.spousesWeightTxt.delegate = self
        self.firstChildWeightTxt.delegate = self
        self.secondChildsWeightTxt.delegate = self
        self.thirdChildWeightTxt.delegate = self
        self.fourthChildWeightTxt.delegate = self

        let fff = family
        self.fetchData()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.afterday = dateFormatter.string(from: Date.tomorrow) // Date.tomorrow
        self.today = dateFormatter.string(from: Date()) //Date()
        self.yearlater = dateFormatter.string(from: Date().yearafter) //
        self.firstAdultrelationTxt.text = "Self"
          }
    //MARK: - func for hide and show function
    func fetchData(){
        self.policy_Txt.text   = self.policy
        self.family_Txt.text =   self.family
        self.suminsured_Txt.text = self.suminsured
        self.policyTenurTxt.text = self.tenure
        self.quoteId_Txt.text = self.quotationid
        self.totalAmountTxt.text = UserDefaults.standard.string(forKey: "totalAmount")!
        self.quoteId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")!
        self.BIStatus   = UserDefaults.standard.string(forKey: "BIStatus ")!
        self.BIStatus1  = UserDefaults.standard.string(forKey: "BIStatus1")!
        self.BIStatus2  = UserDefaults.standard.string(forKey: "BIStatus2")!
        self.BIStatus3  = UserDefaults.standard.string(forKey: "BIStatus3")!
        self.BIStatus4  = UserDefaults.standard.string(forKey: "BIStatus4")!
        self.BIStatus5  = UserDefaults.standard.string(forKey: "BIStatus5")!
        self.pdStatus   = UserDefaults.standard.string(forKey: "pdStatus")!
        self.newAge    = UserDefaults.standard.string(forKey: "newAge")!

      }
    //MARK: - func for corner radious
    func cornerRadious(){
        self.firstAdultnameView.layer.cornerRadius = 20
        self.firstDobView.layer.cornerRadius = 20
        self.firstGenderView.layer.cornerRadius = 20
        self.firstOccupationView.layer.cornerRadius = 20
        self.firstAdultLengthView.layer.cornerRadius = 20
        self.firstweightView.layer.cornerRadius = 20
        self.spousesAdultnameView.layer.cornerRadius = 20
        self.spousesDobView.layer.cornerRadius = 20
        self.spousesGenderView.layer.cornerRadius = 20
        self.spousesOccupationView.layer.cornerRadius = 20
        self.spousesAdultLengthView.layer.cornerRadius = 20
        self.spousesweightView.layer.cornerRadius = 20
        self.policytypeView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.firstChildAdultnameView.layer.cornerRadius = 20
        self.firstChildDobView.layer.cornerRadius = 20
        self.firstChildGenderView.layer.cornerRadius = 20
        self.firstChildOccupationView.layer.cornerRadius = 20
        self.firstChildAdultLengthView.layer.cornerRadius = 20
        self.firstChildweightView.layer.cornerRadius = 20
        self.secondChildsAdultnameView.layer.cornerRadius = 20
        self.secondChildsDobView.layer.cornerRadius = 20
        self.secondChildsGenderView.layer.cornerRadius = 20
        self.secondChildsOccupationView.layer.cornerRadius = 20
        self.secondChildsAdultLengthView.layer.cornerRadius = 20
        self.secondChildsweightView.layer.cornerRadius = 20
        self.thirdChildAdultnameView.layer.cornerRadius = 20
        self.thirdChildDobView.layer.cornerRadius = 20
        self.thirdChildGenderView.layer.cornerRadius = 20
        self.thirdChildOccupationView.layer.cornerRadius = 20
        self.thirdChildAdultLengthView.layer.cornerRadius = 20
        self.thirdChildweightView.layer.cornerRadius = 20
        self.fourthChildAdultnameView.layer.cornerRadius = 20
        self.fourthChildDobView.layer.cornerRadius = 20
        self.fourthChildGenderView.layer.cornerRadius = 20
        self.fourthChildOccupationView.layer.cornerRadius = 20
        self.fourthChildAdultLengthView.layer.cornerRadius = 20
        self.fourthChildweightView.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.reCalculatedBtn.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.quoteId_Txt.layer.cornerRadius = 20
        self.firstAdultrelationTxt.layer.cornerRadius = 20
        self.spousesAdultRelationBtn.layer.cornerRadius = 20
        self.firstChildRelationBtn.layer.cornerRadius = 20
        self.secondChildRelationBtn.layer.cornerRadius = 20
        self.thirdChildRelationBtn.layer.cornerRadius = 20
        self.fourthChildRelationBtn.layer.cornerRadius = 20
        self.firstAdultbmi_Txt.layer.cornerRadius = 20
        self.spousesAdultbmi_Txt.layer.cornerRadius = 20
        self.firstChildbmi_Txt.layer.cornerRadius = 20
        self.secondChildsbmi_Txt.layer.cornerRadius = 20
        self.thirdChildbmi_Txt.layer.cornerRadius = 20
        self.fourthChildbmi_Txt.layer.cornerRadius = 20
        self.quoteId_Txt.setLeftPaddingPoints(15)
        self.policy_Txt.setLeftPaddingPoints(15)
        self.family_Txt.setLeftPaddingPoints(15)
        self.suminsured_Txt.setLeftPaddingPoints(15)
        self.policyTenurTxt.setLeftPaddingPoints(15)
        self.firstWeightTxt.setLeftPaddingPoints(15)
        self.spousesWeightTxt.setLeftPaddingPoints(15)
        self.firstChildWeightTxt.setLeftPaddingPoints(15)
        self.secondChildsWeightTxt.setLeftPaddingPoints(15)
        self.thirdChildWeightTxt.setLeftPaddingPoints(15)
        self.fourthChildWeightTxt.setLeftPaddingPoints(15)
        self.firstAdultbmi_Txt.setLeftPaddingPoints(15)
        self.spousesAdultbmi_Txt.setLeftPaddingPoints(15)
        self.firstChildbmi_Txt.setLeftPaddingPoints(15)
        self.secondChildsbmi_Txt.setLeftPaddingPoints(15)
        self.thirdChildbmi_Txt.setLeftPaddingPoints(15)
        self.fourthChildbmi_Txt.setLeftPaddingPoints(15)
        self.firstAdultrelationTxt.setLeftPaddingPoints(15)
        
        self.policyTenurTxt.isUserInteractionEnabled = false
        self.totalAmountTxt.isUserInteractionEnabled = false
        self.suminsured_Txt.isUserInteractionEnabled = false
        self.family_Txt.isUserInteractionEnabled = false
        self.policy_Txt.isUserInteractionEnabled = false
        self.quoteId_Txt.isUserInteractionEnabled = false
       }
    //MARK: - border width
    func borderwidth(){
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.firstAdultnameView.layer.borderWidth = 0.5
        self.firstDobView.layer.borderWidth = 0.5
        self.firstGenderView.layer.borderWidth = 0.5
        self.firstOccupationView.layer.borderWidth = 0.5
        self.firstAdultLengthView.layer.borderWidth = 0.5
        self.firstweightView.layer.borderWidth = 0.5
        self.spousesAdultnameView.layer.borderWidth = 0.5
        self.spousesDobView.layer.borderWidth = 0.5
        self.spousesGenderView.layer.borderWidth = 0.5
        self.spousesOccupationView.layer.borderWidth = 0.5
        self.spousesAdultLengthView.layer.borderWidth = 0.5
        self.spousesweightView.layer.borderWidth = 0.5
        self.policytypeView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.totalAmountTxt.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.firstChildAdultnameView.layer.borderWidth = 0.5
        self.firstChildDobView.layer.borderWidth = 0.5
        self.firstChildGenderView.layer.borderWidth = 0.5
        self.firstChildOccupationView.layer.borderWidth = 0.5
        self.firstChildAdultLengthView.layer.borderWidth = 0.5
        self.firstChildweightView.layer.borderWidth = 0.5
        self.secondChildsAdultnameView.layer.borderWidth = 0.5
        self.secondChildsDobView.layer.borderWidth = 0.5
        self.secondChildsGenderView.layer.borderWidth = 0.5
        self.secondChildsOccupationView.layer.borderWidth = 0.5
        self.secondChildsAdultLengthView.layer.borderWidth = 0.5
        self.secondChildsweightView.layer.borderWidth = 0.5
        self.thirdChildAdultnameView.layer.borderWidth = 0.5
        self.thirdChildDobView.layer.borderWidth = 0.5
        self.thirdChildGenderView.layer.borderWidth = 0.5
        self.thirdChildOccupationView.layer.borderWidth = 0.5
        self.thirdChildAdultLengthView.layer.borderWidth = 0.5
        self.thirdChildweightView.layer.borderWidth = 0.5
        self.fourthChildAdultnameView.layer.borderWidth = 0.5
        self.fourthChildDobView.layer.borderWidth = 0.5
        self.fourthChildGenderView.layer.borderWidth = 0.5
        self.fourthChildOccupationView.layer.borderWidth = 0.5
        self.fourthChildAdultLengthView.layer.borderWidth = 0.5
        self.fourthChildweightView.layer.borderWidth = 0.5
        self.quoteId_Txt.layer.borderWidth = 0.5
        self.spousesAdultRelationBtn.layer.borderWidth = 0.5
        self.firstChildRelationBtn.layer.borderWidth = 0.5
        self.secondChildRelationBtn.layer.borderWidth = 0.5
        self.thirdChildRelationBtn.layer.borderWidth = 0.5
        self.fourthChildRelationBtn.layer.borderWidth = 0.5
        self.firstAdultrelationTxt.layer.borderWidth = 0.5
        self.firstAdultbmi_Txt.layer.borderWidth = 0.5
        self.spousesAdultbmi_Txt.layer.borderWidth = 0.5
        self.firstChildbmi_Txt.layer.borderWidth = 0.5
        self.secondChildsbmi_Txt.layer.borderWidth = 0.5
        self.thirdChildbmi_Txt.layer.borderWidth = 0.5
        self.fourthChildbmi_Txt.layer.borderWidth = 0.5
        self.totalAmountTxt.setLeftPaddingPoints(15)
    }
    //MARK: - func for Retrieve data
   
    func retrieveData(){
        nameArr.removeAll()
        self.fAName  = self.firstAdultNAmeTxt.text ?? ""
        self.sAName  = self.spousesAdultNAmeTxt.text ?? ""
        self.fCName  = self.firstChildAdultNAmeTxt.text ?? ""
        self.sCName  = self.secondChildsAdultNAmeTxt.text ?? ""
        self.tCName  = self.thirdChildAdultNAmeTxt.text ?? ""
        self.frCName = self.fourthChildAdultNAmeTxt.text ?? ""
       
        self.fADob   = self.firstDobTxt.text ?? ""
        self.sADob   = self.spousesDobTxt.text ?? ""
        self.fCDob   = self.firstChildDobTxt.text ?? ""
        self.sCDob   = self.secondChildsDobTxt.text ?? ""
        self.tCDob   = self.thirdChildDobTxt.text ?? ""
        self.frCDob  = self.fourthChildDobTxt.text ?? ""
        self.fAOccpation = self.firstOccupationBtn.title(for: .normal) ?? ""
        self.sAOccpation = self.spousesOccupationBtn.title(for: .normal) ?? ""
        self.fCOccpation = self.firstChildOccupationBtn.title(for: .normal) ?? ""
        self.sCOccpation = self.secondChildsOccupationBtn.title(for: .normal) ?? ""
        self.tCOccpation = self.thirdChildOccupationBtn.title(for: .normal) ?? ""
        self.frOccpation = self.fourthChildOccupationBtn.title(for: .normal) ?? ""
        self.fAGender    = self.firstGenderbtn.title(for: .normal) ?? ""
        self.sAGender    = self.spousesGenderbtn.title(for: .normal) ?? ""
        self.fCGender    = self.firstChildGenderbtn.title(for: .normal) ?? ""
        self.sCGender    = self.secondChildsGenderbtn.title(for: .normal) ?? ""
        self.tCGender    = self.thirdChildGenderbtn.title(for: .normal) ?? ""
        self.frGender    = self.fourthChildGenderbtn.title(for: .normal) ?? ""
        self.fARelation    = self.firstAdultrelationTxt.text ?? ""
        self.sARelation    = self.spousesAdultRelationBtn.title(for: .normal) ?? ""
        self.fCRelation    = self.firstChildRelationBtn.title(for: .normal) ?? ""
        self.sCRelation    = self.secondChildRelationBtn.title(for: .normal) ?? ""
        self.tCRelation    = self.thirdChildRelationBtn.title(for: .normal) ?? ""
        self.frRelation    = self.fourthChildRelationBtn.title(for: .normal) ?? ""
        self.fABmi         = self.firstAdultbmi_Txt.text ?? ""
        self.sABmi         = self.spousesAdultbmi_Txt.text ?? ""
        self.fCBmi         = self.firstChildbmi_Txt.text ?? ""
        self.sCBmi         = self.secondChildsbmi_Txt.text ?? ""
        self.tCBmi         = self.thirdChildbmi_Txt.text ?? ""
        self.frBmi         = self.fourthChildbmi_Txt.text ?? ""
        
        UserDefaults.standard.set(self.fAName , forKey: "fAName")
        UserDefaults.standard.set(self.sAName , forKey: "sAName")
        UserDefaults.standard.set(self.fCName , forKey: "fCName")
        UserDefaults.standard.set(self.sCName , forKey: "sCName")
        UserDefaults.standard.set(self.tCName , forKey: "tCName")
        UserDefaults.standard.set(self.frCName, forKey: "frCName")
        UserDefaults.standard.set(self.fADob  , forKey: "fADob")
        UserDefaults.standard.set(self.sADob  , forKey: "sADob")
        UserDefaults.standard.set(self.fCDob  , forKey: "fCDob")
        UserDefaults.standard.set(self.sCDob  , forKey: "sCDob")
        UserDefaults.standard.set(self.tCDob  , forKey: "tCDob")
        UserDefaults.standard.set(self.frCDob , forKey: "frCDob")
        UserDefaults.standard.set(self.fAName , forKey: "fAName")
        UserDefaults.standard.set(self.fAOccpation, forKey: "fAOccpation")
        UserDefaults.standard.set(self.sAOccpation, forKey: "sAOccpation")
        UserDefaults.standard.set(self.fCOccpation, forKey: "fCOccpation")
        UserDefaults.standard.set(self.sCOccpation, forKey: "sCOccpation")
        UserDefaults.standard.set(self.tCOccpation, forKey: "tCOccpation")
        UserDefaults.standard.set(self.frOccpation, forKey: "frOccpation")
        UserDefaults.standard.set(self.fAGender   , forKey: "fAGender")
        UserDefaults.standard.set(self.sAGender   , forKey: "sAGender")
        UserDefaults.standard.set(self.fCGender   , forKey: "fCGender")
        UserDefaults.standard.set(self.sCGender   , forKey: "sCGender")
        UserDefaults.standard.set(self.tCGender   , forKey: "tCGender")
        UserDefaults.standard.set(self.frGender   , forKey: "frGender")
        UserDefaults.standard.set(self.fAOccpation, forKey: "fAOccpation")
        UserDefaults.standard.set(self.fARelation, forKey: "fARelation")
        UserDefaults.standard.set(self.sARelation, forKey: "sARelation")
        UserDefaults.standard.set(self.fCRelation, forKey: "fCRelation")
        UserDefaults.standard.set(self.sCRelation, forKey: "sCRelation")
        UserDefaults.standard.set(self.tCRelation, forKey: "tCRelation")
        UserDefaults.standard.set(self.frRelation, forKey: "frRelation")
        UserDefaults.standard.set(self.fARelation, forKey: "fARelation")
        UserDefaults.standard.set(self.fABmi, forKey: "fABmi")
        UserDefaults.standard.set(self.sABmi, forKey: "sABmi")
        UserDefaults.standard.set(self.fCBmi, forKey: "fCBmi")
        UserDefaults.standard.set(self.sCBmi, forKey: "sCBmi")
        UserDefaults.standard.set(self.tCBmi, forKey: "tCBmi")
        UserDefaults.standard.set(self.frBmi, forKey: "frBmi")
        UserDefaults.standard.set(self.fChild, forKey: "fChild")
        UserDefaults.standard.set(self.sChild, forKey: "sChild")
        UserDefaults.standard.set(self.tChild, forKey: "tChild")
        UserDefaults.standard.set(self.frChild, forKey:"frChild")
        UserDefaults.standard.set(self.netPremiumm, forKey: "netPremiumm")
        UserDefaults.standard.set(self.gstValue, forKey: "gstValue")
        UserDefaults.standard.set(self.totalAmount, forKey: "totalAmount")

print(nameArr,"Healthmember_Info")

    }


    //MARK: - func for date picker
        func createdatePickerView() {
            var dateFormatter = DateFormatter()
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
           // var age:Int {Calendar.current.dateComponents([.year], from: String(firstDobTxt.text!), to: Date()).year!}
            
            datePicker.datePickerMode = .date
            firstDobTxt.inputView = datePicker
            spousesDobTxt.inputView = datePicker
            firstChildDobTxt.inputView = datePicker
            secondChildsDobTxt.inputView = datePicker
            thirdChildDobTxt.inputView = datePicker
            fourthChildDobTxt.inputView = datePicker
           }
        @objc func donePressed() {
            firstDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            spousesDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            firstChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            secondChildsDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            thirdChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            fourthChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
           
           }
        func textFieldDidEndEditing(_ textField: UITextField) {
            
           if textField == firstDobTxt {
            firstDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDate = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDate)
            let datee =   date
            self.calculated = datee?.age ?? 0
               self.newAge = firstDobTxt.text ?? ""
               self.policyQuoate()
           }else if textField == spousesDobTxt{
            spousesDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDatee = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDatee)
            let datee =   date
            self.sAdult = datee!.age
               self.policyQuoate()
           }else if textField == firstChildDobTxt{
            firstChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDateee = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDateee)
            let datee =   date
            self.fChild = datee!.age
           }else if textField == secondChildsDobTxt{
            secondChildsDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDateeee = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDateeee)
            let datee =   date
            self.sChild = datee!.age
           }else if textField == thirdChildDobTxt{
            thirdChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDateeeee = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDateeeee)
            let datee =   date
            self.tChild = datee!.age
           }else if textField == fourthChildDobTxt{
            fourthChildDobTxt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            let selectDateeeeee = datePicker.date.dateInYyyyMmDdSs()
            let formetter = DateFormatter()
            formetter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd/MM/YYYY"
            let date = formatter.date(from: selectDateeeeee)
            let datee =   date
            self.frChild = datee!.age
           }else if textField == firstWeightTxt{
               self.firstAdultWeight  = self.firstWeightTxt.text ?? ""
               self.firstAdult()
           }else if textField == spousesWeightTxt{
               self.spouseAdultWeight = self.spousesWeightTxt.text ?? ""
               self.spousesBmi()
           }else if textField == firstChildWeightTxt{
               self.firstChildWeight = self.firstChildWeightTxt.text ?? ""
               self.firstChildBmi()
           }else if textField == secondChildsWeightTxt{
               self.secondChildWeight = self.secondChildsWeightTxt.text ?? ""
               self.secondChildBmi()
           }else if textField == thirdChildWeightTxt {
               self.thirdChildWeight = self.thirdChildWeightTxt.text ?? ""
               self.thirdChildBmi()
           }else if textField == fourthChildWeightTxt{
               self.fourthChildWeight = self.fourthChildWeightTxt.text ?? ""
               self.fourthChildBmi()
           }
            let fAname = self.firstAdultNAmeTxt.text ?? ""
            nameArray.append(fAname)
            let sAname = self.spousesAdultNAmeTxt.text ?? ""
            nameArray.append(sAname)
            let fCname = self.firstChildAdultNAmeTxt.text ?? ""
            nameArray.append(fCname)
            let sCname = self.secondChildsAdultNAmeTxt.text ?? ""
            nameArray.append(sCname)
            let tCname = self.thirdChildAdultNAmeTxt.text ?? ""
            nameArray.append(tCname)
            let frCname = self.fourthChildAdultNAmeTxt.text ?? ""
            nameArray.append(frCname)
           }
   
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.retrieveData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        self.present(nextVc, animated: true, completion: nil)
    }
   
    //MARK: - family type button action
       func familyFloater(){
              if family == "1 Adult"{
                  self.adjustable_View.frame.size.height = 1300
                  self.firstAdultView.isHidden = false
                  self.firstAdNsView.constant = 550
                  self.spousesAdultView.isHidden = true
                  self.spousesAdNsView.constant = 0
                  self.firstChildAdultView.isHidden = true
                  self.firstChildAdNsView.constant = 0
                  self.secondChildsAdultkView.isHidden = true
                  self.secondChildsAdNsView.constant = 0
                  self.thirdChildAdultView.isHidden = true
                  self.thirdChildAdNsView.constant = 0
                  self.fourthChildAdultView.isHidden = true
                  self.fourthChildAdNsView.constant = 0
            }else if family == "2 Adult"{
                self.adjustable_View.frame.size.height = 1900
                //self.firstAdultView.isHidden = false
                //self.firstAdNsView.constant = 0
                //self.spousesAdultView.isHidden = false
                //self.spousesAdNsView.constant = 0
               self.firstChildAdultView.isHidden = true
               self.firstChildAdNsView.constant = 0
                self.secondChildsAdultkView.isHidden = true
                self.secondChildsAdNsView.constant = 0
                self.thirdChildAdultView.isHidden = true
                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else  if family == "1 Adult + 1 Child"{
                self.adjustable_View.frame.size.height = 1800
               // self.firstAdultView.isHidden = false
               // self.firstAdNsView.constant = 500
                self.spousesAdultView.isHidden = true
                self.spousesAdNsView.constant = 0
               // self.firstChildAdultView.isHidden = false
               // self.firstChildAdNsView.constant = 550
                self.secondChildsAdultkView.isHidden = true
                self.secondChildsAdNsView.constant = 0
                self.thirdChildAdultView.isHidden = true
                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "1 Adult + 2 Child"{
                self.adjustable_View.frame.size.height = 2400
                //self.firstAdultView.isHidden = false
                //self.firstAdNsView.constant = 0
                self.spousesAdultView.isHidden = true
                self.spousesAdNsView.constant = 0
               //self.firstChildAdultView.isHidden = false
               //self.firstChildAdNsView.constant = 0
               //self.secondChildsAdultkView.isHidden = false
               //self.secondChildsAdNsView.constant = 0
                self.thirdChildAdultView.isHidden = true
                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "1 Adult + 3 Child" {
                self.adjustable_View.frame.size.height = 2800
//                self.firstAdultView.isHidden = false
//                self.firstAdNsView.constant = 0
                self.spousesAdultView.isHidden = true
                self.spousesAdNsView.constant = 0
//                self.firstChildAdultView.isHidden = false
//                self.firstChildAdNsView.constant = 0
//                self.secondChildsAdultkView.isHidden = false
//                self.secondChildsAdNsView.constant = 0
//                self.thirdChildAdultView.isHidden = false
//                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "2 Adult + 1 Child"{
                self.adjustable_View.frame.size.height = 2400
                //self.firstAdultView.isHidden = false
                //self.firstAdNsView.constant = 0
                //self.spousesAdultView.isHidden = false
                //self.spousesAdNsView.constant = 0
                //self.firstChildAdultView.isHidden = false
                //self.firstChildAdNsView.constant = 0
                self.secondChildsAdultkView.isHidden = true
                self.secondChildsAdNsView.constant = 0
                self.thirdChildAdultView.isHidden = true
                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "2 Adult + 2 Child"{
                self.adjustable_View.frame.size.height = 2950
               //self.firstAdultView.isHidden = false
               //self.firstAdNsView.constant = 0
               //self.spousesAdultView.isHidden = false
               //self.spousesAdNsView.constant = 0
               //self.firstChildAdultView.isHidden = false
               //self.firstChildAdNsView.constant = 0
               //self.secondChildsAdultkView.isHidden = false
               //self.secondChildsAdNsView.constant = 0
                self.thirdChildAdultView.isHidden = true
                self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "2 Adult + 3 Child" {
                self.adjustable_View.frame.size.height = 3550
               //self.firstAdultView.isHidden = false
               //self.firstAdNsView.constant = 0
               //self.spousesAdultView.isHidden = false
               //self.spousesAdNsView.constant = 0
               //self.firstChildAdultView.isHidden = false
               //self.firstChildAdNsView.constant = 0
               //self.secondChildsAdultkView.isHidden = false
               //self.secondChildsAdNsView.constant = 0
               //self.thirdChildAdultView.isHidden = false
               //self.thirdChildAdNsView.constant = 0
                self.fourthChildAdultView.isHidden = true
                self.fourthChildAdNsView.constant = 0
            }else if family == "2 Adult + 4 Child" {
                self.adjustable_View.frame.size.height = 4050
                //self.firstAdultView.isHidden = false
                //self.firstAdNsView.constant = 0
                //self.spousesAdultView.isHidden = false
                //self.spousesAdNsView.constant = 0
                //self.firstChildAdultView.isHidden = false
                //self.firstChildAdNsView.constant = 0
                //self.secondChildsAdultkView.isHidden = false
                //self.secondChildsAdNsView.constant = 0
                //self.thirdChildAdultView.isHidden = false
                //self.thirdChildAdNsView.constant = 0
                //self.fourthChildAdultView.isHidden = false
                //self.fourthChildAdNsView.constant = 0
            }
          }
          
  
    //MARK:- spouses details action Gender
    @IBAction func firstAdultGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- spouses details Occupation action
    @IBAction func firstAdultOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- spouses details inches action

    @IBAction func firstAdultfitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- spouses details fit acti
    @IBAction func firstAdultInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK:- spouses details action Gender
    @IBAction func spouseGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.spousesGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- spouses details Occupation action
    @IBAction func spousesOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.spousesOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - spouses details inches action

    @IBAction func spousesfitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.spousesAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - spouses details fit action

    @IBAction func spousesInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.spousesAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK: - spouses details Occupation action
    @IBAction func spousesRelation(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.spousesAdultRelationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - first child details action Gender
    @IBAction func firstChildGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstChildGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - first child details Occupation action
    @IBAction func firstChildOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstChildOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - first child details inches action
    @IBAction func firstChildFitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstChildAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - first child details fit action
    @IBAction func firstChildInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstChildAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK: - spouses details Occupation action
    @IBAction func firstChildRelation(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.firstChildRelationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- second child button action
    //MARK: - second child details action Gender
    @IBAction func secondGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.secondChildsGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - second child details Occupation action
    @IBAction func seocndChildOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.secondChildsOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - second child details inches action
    @IBAction func secondFitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.secondChildsAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - second child details fit action
    @IBAction func secondInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
          dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.secondChildsAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK: - spouses details Occupation action
    @IBAction func secondChildRelation(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.secondChildRelationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    //MARK:- third child button action
    //MARK: - third child details action Gender
    @IBAction func thirdGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.thirdChildGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - second child details Occupation action
    @IBAction func thirdChildOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.thirdChildOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - third child details inches action
    @IBAction func thirdFitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.thirdChildAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - third child details fit action
    @IBAction func thirdInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ",".8",".9",".10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.thirdChildAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK: - third child relation  action
    @IBAction func thirdChildRelation(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.thirdChildRelationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    //MARK:- fourth child button action
    //MARK: - fourth child details action Gender
    @IBAction func fourthGenderAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
          dropDown.dataSource = ["Select Gender","Male","Female"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.fourthChildGenderbtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - second child details Occupation action
    @IBAction func fourthChildOccupationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.fourthChildOccupationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - third child details inches action
    @IBAction func fourthFitAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select inches","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.fourthChildAdultFitBtn.setTitle(item, for: .normal)
            self.fit = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK:- third child details fit action
    @IBAction func fourthInchesAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Fit","1","2","3","4","5","6","7 ","8","9","10"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.fourthChildAdultInchesBtn.setTitle(item, for: .normal)
            self.inches = item
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
        }
    //MARK: - fourth child relation  action
    @IBAction func fourthChildRelation(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Select Occupation","Doctor","Accounts","Students","Bankers","Lawyer","Architects","Counting Enginners","Teachers","Housewifes","Self Employed","Salaried","consulting engineers","persons Primarily engaged","Person engaged in clerid","Bureaucrats","Shopkeeper","Writer","Fashion Designer","Desk"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.fourthChildRelationBtn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    //MARK: - func for bmi Calculation
    func firstAdult(){
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(firstAdultWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.firstAdultbmi_Txt.text = self.bmical
        print(self.bmical)
        self.firstAdultValidation()
       }
    func firstAdultValidation(){
      if String(bmical.count) < "18" {
            alert(message: "First Adult under weight", title: "Messae")
      }else if String(bmical.count) < "25"{
       alert(message: "First Adults are heavy weight",title: "Message")
        }else{
        String(bmical.count) >= "18.5" && String(bmical) < "25"
        }
        }
    //MARK: - func for bmi Calculation
    func spousesBmi (){
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(spouseAdultWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.spousesAdultbmi_Txt.text = self.bmical
        print(self.bmical)
        self.spousesBmiValidation()
       }
    func spousesBmiValidation(){
        if String(bmical.count) < "18" {
              alert(message: "Spouses are under weight", title: "Messae")
        }else if String(bmical.count) < "25"{
         alert(message: "Spouses are are heavy weight",title: "Message")
          }else{
          String(bmical.count) >= "18.5" && String(bmical) < "25"
          }
        }
    //MARK: - func for bmi Calculation
    func firstChildBmi (){
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(firstChildWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.firstChildbmi_Txt.text = self.bmical
        self.firstChildBmiValidation()
       }
    func firstChildBmiValidation(){
        if String(bmical.count) < "18" {
              alert(message: "First Child in under weight", title: "Messae")
        }else if String(bmical.count) < "25"{
         alert(message: "First Child are heavy weight",title: "Message")
          }else{
          String(bmical.count) >= "18.5" && String(bmical) < "25"
          }
        }
    //MARK: - func for second child bmi Calculation
    func secondChildBmi (){
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(secondChildWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.secondChildsbmi_Txt.text = self.bmical
//        self.secondChildBmiValidation()
       }
    func secondChildBmiValidation(){
        if String(bmical.count) < "18" {
              alert(message: "Second Child are under weight", title: "Messae")
        }else if String(bmical.count) < "25"{
         alert(message: "Second Child are are heavy weight",title: "Message")
          }else{
          String(bmical.count) >= "18.5" && String(bmical) < "25"
          }
        }
    //MARK: - func for  third child bmi Calculation
    func thirdChildBmi(){
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(thirdChildWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.thirdChildbmi_Txt.text = self.bmical
        self.thirdChildBmiValidation()
       }
    func thirdChildBmiValidation(){
        if String(bmical.count) < "18" {
              alert(message: "third Child are under weight", title: "Messae")
        }else if String(bmical.count) < "25"{
         alert(message: "third Child are are heavy weight",title: "Message")
          }else{
          String(bmical.count) >= "18.5" && String(bmical) < "25"
          }
        }
    //MARK: - func for fourth child bmi Calculation
    func fourthChildBmi (){
        let dd = fourthChildAdultInchesBtn.title(for: .normal)
        if !inches.isEmpty{
         h = Double(inches)!
        }
        if !firstAdultWeight.isEmpty{
            w = Double(fourthChildWeight)!
        }
        if !fit.isEmpty{
            p = Double(fit)!
        }
        let bmiM = BMIModel(height: h, weight: w,pount: p)
        self.bmical = String(bmiM.bmi())
        self.fourthChildbmi_Txt.text = self.bmical
        self.fourthChildBmiValidation()
       }
    func fourthChildBmiValidation(){
        if String(bmical.count) < "18" {
              alert(message: "Fourth Child are under weight", title: "Messae")
        }else if String(bmical.count) < "25"{
         alert(message: "Fourth Child are are heavy weight",title: "Message")
          }else{
          String(bmical.count) >= "18.5" && String(bmical) < "25"
          }
        }
    //MARK: - validati0on for the first Adultdetails
    func validationFirstAdult (){
        if firstAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter First Adult name",title: "Message")
        }else if firstDobTxt.text?.count == 0{
            alert(message: "Please enter First Adult child Dob",title: "Message")
        }else if calculated <= 18{
            alert(message: "Age must be between 18 to 55",title: "Message")
        }else if firstGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select first Adult Gender", title: "Message")
        }else if firstOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select first Adult occupation", title: "Message")
        }else if firstAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select first Adult fit in meter", title: "Message")
        }else if firstAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select first Adult inches",title: "Message")
        }else if firstWeightTxt.text?.count == 0{
            alert(message: "Please Enter first Adult weight",title: "Message")
        }else{
            self.firstAdult()
        }
        }
 //MARK: - validati0on for the spouses details
    func validationSpouses(){
        if spousesAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter Spouses Name",title: "Message")
        }else if spousesDobTxt.text?.count == 0{
         alert(message: "Please enter 2nd Adult child Dob",title: "Message")
        }else if sAdult <= 18{
            alert(message: "2nd Age must be between 18 to 55",title: "Message")
        } else if spousesGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select Spouses Gender", title: "Message")
        }else if spousesOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select Spouses occupation", title: "Message")
        }else if spousesAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select Spouses fit in meter", title: "Message")
        }else if spousesAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select Spouses inches",title: "Message")
        }else if spousesWeightTxt.text?.count == 0{
            alert(message: "Please Enter Spouses weight",title: "Message")
        }else{
            self.spousesBmi()
        }
        }
    //MARK: - validati0on for the first Child details
    func validationFirstChild (){
        if firstChildAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter First child name",title: "Message")
        }else if firstChildDobTxt.text?.count == 0{
            alert(message: "Please enter First child Dob",title: "Message")
        }else if fChild >= 18{
            alert(message: "Age must be below than 18",title: "Message")
        }else if firstChildGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select First Child Gender", title: "Message")
        }else if firstChildOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select  First Child occupation", title: "Message")
        }else if firstChildAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select  First Child fit in meter", title: "Message")
        }else if firstChildAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select  First Child inches",title: "Message")
        }else if firstChildWeightTxt.text?.count == 0{
            alert(message: "Please Enter First Child weight",title: "Message")
        }else{
            self.firstChildBmi()
        }
        }
    //MARK: - validati0on for the second Child details
    func validationSecondChild (){
        if secondChildsAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter second child name",title: "Message")
        }else if secondChildsDobTxt.text?.count == 0{
            alert(message: "Please enter Second child Dob",title: "Message")
        }else if sChild >= 18{
            alert(message: "Age must be below than 18",title: "Message")
        } else if secondChildsGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select second Child Gender", title: "Message")
        }else if secondChildsOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select second Child occupation", title: "Message")
        }else if secondChildsAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select second Child fit in meter", title: "Message")
        }else if secondChildsAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select second Child inches",title: "Message")
        }else if secondChildsWeightTxt.text?.count == 0{
            alert(message: "Please Enter second Child weight",title: "Message")
        }else{
            self.secondChildBmi()
        }
        }
    //MARK: - validati0on for the third Child details
    func validationthirdChild (){
        if thirdChildAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter Third child name",title: "Message")
        }else if thirdChildDobTxt.text?.count == 0{
            alert(message: "Please enter Third child Dob",title: "Message")
        }else if tChild >= 18{
            alert(message: "Age must be below than 18",title: "Message")
        }else if thirdChildGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select Third Child Gender", title: "Message")
        }else if thirdChildOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select Third Child occupation", title: "Message")
        }else if thirdChildAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select Third Child fit in meter", title: "Message")
        }else if thirdChildAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select Third Child inches",title: "Message")
        }else if thirdChildWeightTxt.text?.count == 0{
            alert(message: "Please Enter Third Child weight",title: "Message")
        }else{
            self.thirdChildBmi()
        }
        }
    //MARK: - validati0on for the four Child details
    func validationFourthChild (){
        if fourthChildAdultNAmeTxt.text?.count == 0{
            alert(message: "Please enter Fourth child name",title: "Message")
        }else if fourthChildDobTxt.text?.count == 0{
            alert(message: "Please enter Fourth child Dob",title: "Message")
        }else if frChild >= 18{
            alert(message: "Age must be below than 18",title: "Message")
        }else if fourthChildGenderbtn.title(for: .normal) == "Select Gender"{
            alert(message: "Please Select Fourth Child Gender", title: "Message")
        }else if fourthChildOccupationBtn.title(for: .normal) == "Select Occupation"{
            alert(message: "Please Select Fourth Child occupation", title: "Message")
        }else if fourthChildAdultFitBtn.title(for: .normal) == "Ft."{
            alert(message: "Please Select Fourth Child fit in meter", title: "Message")
        }else if fourthChildAdultInchesBtn.title(for: .normal) == "Inches"{
            alert(message: "Please select Fourth Child inches",title: "Message")
        }else if fourthChildWeightTxt.text?.count == 0{
            alert(message: "Please Enter Fourth Child weight",title: "Message")
        }else{
            self.fourthChildBmi()
        }
        }
    //MARK: - success validation
    func validation(){
        if family == "1 Adult"{
            self.validationFirstAdult()
        }else if family == "2 Adult"{
            self.validationFirstAdult()
            self.validationSpouses()
        }
        else if family == "1 Adult + 1 Child"{
            (self.validationFirstAdult(), and:self.validationFirstChild())

        }else if family == "1 Adult + 2 Child" {
//            (self.validationFirstAdult(), and:self.validationFirstChild(),and: self.validationSecondChild())

            self.validationFirstAdult()
            self.validationFirstChild()
            self.validationSecondChild()

        }else if family == "1 Adult + 3 Child"{
            self.validationFirstAdult()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()

        }else if family == "2 Adult + 1 Child"{

            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()

        }else if family == "2 Adult + 2 Child"{

            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()

        }else if family == "2 Adult + 3 Child"{
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()

        }else if family == "2 Adult + 4 Child"{
            
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()
            self.validationFourthChild()
//
        }else{
            self.validationFirstAdult()
            self.firstAdult()
        }
    }
 
    //MARK:- continue button action
    @IBAction func continueAction(_ sender: Any) {
         self.validation()
        self.retrieveData()
        let nextVc = UIStoryboard.init(name: "Health", bundle:  nil).instantiateViewController(withIdentifier: "MedicalRetriveDetail_Vc") as! MedicalRetriveDetail_Vc
        
        nextVc.totalPremium = self.totalAmountTxt.text  ?? ""
        nextVc.quotationId = self.quotationid
        nextVc.firstAdultCriLLness =  self.firstAdultNAmeTxt.text ?? ""
        nextVc.firstAdultPerAccident =  self.firstAdultNAmeTxt.text ?? ""
        nextVc.firstAdultHCash =  self.firstAdultNAmeTxt.text ?? ""
//        nextVc.premium = self.suminsuredBtn.title(for: .normal) ?? ""
        nextVc.TitleBtn = self.family
        nextVc.totalAge = self.calculated
        nextVc.adultDob = self.adultDob
        nextVc.adultGender = self.adultGender
        nextVc.adultOccupation = self.adultOccupation
        self.navigationController?.pushViewController(nextVc, animated: true)
         }
         }
//MARK: - extension for the policyquat Api
extension HealthMemberInfo_Vc {
    private func policyQuoate() {
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "Plan_Type": self.policy,
                       "Floater_Type":self.family,
                       "Sum_Insured":self.suminsured,
                       "Policy_Duration": "1",           //self.tenure,
                       "Proposal_Date": self.today,
                       "From_Date":self.afterday,
                       "To_Date":self.yearlater,
                       "DOB": self.newAge,       //self.firstDobTxt.text,
                       "PA_Status":"False",
                       "CI_Status":"False",
                       "DHC_Status":"False",
                       "Esale_Status":"True",
                       "Life_Status":"False",
                       "PD_Status":self.pdStatus,
                       "Sub_Status":"False",
                       "Tiered_Status":"False",
                       "Sub_Type":"",
                       "DOB1":spousesDobTxt.text ?? "",
                       "DOB2":"",
                       "DOB3":"",
                       "DOB4":"",
                       "DOB5":"",
                       "PA_Status1":"False",
                       "CI_Status1":"False",
                       "DHC_Status1":"False",
                       "PA_Status2":"False",
                       "CI_Status2":"False",
                       "DHC_Status2":"False",
                       "PA_Status3":"False",
                       "CI_Status3":"False",
                       "DHC_Status3":"False",
                       "PA_Status4":"False",
                       "CI_Status4":"False",
                       "DHC_Status4":"False",
                       "PA_Status5":"False",
                       "CI_Status5":"False",
                       "DHC_Status5":"False",
                       "Policy_Type":"Essential",
                       "BI_Status":self.BIStatus,
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
                      let gst = Premium?["IGST"] as? [String:Any]
                      let gstVal = gst!["Value"] as? String
                      self.gstValue = gstVal as! String
                      let total = Premium?["TotalPremium"] as? [String:Any]
                      let value = total?["Value"]
                      self.totalAmount = value as! String
                      self.totalAmountTxt.text = (value  as! String)
                     let netPremium = Premium?["NetPremium"] as? [String:Any]
                     let val = netPremium?["Value"]
                     self.netPremiumm = val as! String

                     //MARK: - coverage data fetching
                    let cover = data["Risks"] as? [String:Any]
                    let coverr = cover?["Risk"] as? [String:Any]
                    let dd = coverr?["RisksData"] as? [String:Any]
                    //MARK: -  data for the other discount
                    let otherdiscount = dd?["OtherDiscounts"] as? [String:Any]
                    let otherdiscountGroup = otherdiscount?["OtherDiscountGroup"] as? [String:Any]
                    let otherdiscGroupData = otherdiscountGroup?["OtherDiscountGroupData"] as? [[String:Any]]
                        let descritption = otherdiscGroupData?[5]["Description"] as? [String:Any]
                        let epolicyy = descritption?["Value"]
                        self.extraDiscount = epolicyy! as! String

                        if self.extraDiscount == "E-sale Discount"{
                            let epolicyAmountt = otherdiscGroupData?[5]["Premium"] as? [String:Any]
                            let epolicyy = epolicyAmountt?["Value"]
                            self.epolicyDis = epolicyy as! String
                        }else if self.extraDiscount == "Policy Duration Discount"{
                            let sublimitDiscount = otherdiscGroupData?[5]["Premium"] as? [String:Any]
                            let epolicyVal = sublimitDiscount?["Value"]
//                            self.longtermDis = epolicyVal as! String
                        }
                    }
                  if let policyNbr = response["Customer"] as? [String:Any]{
                        if let quoteid = policyNbr["PosPolicyNo"] as? String{
                        self.quotationid = "\(quoteid)"
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



//MARK: - extension for alert
extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
       }
       }
//MARK: - extension for the next date for the apis
    extension Date {
    static var tomorrow:  Date { return Date().dayAfter }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noonn)!
    }
    var noonn: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var yearafter: Date {
        return Calendar.current.date(byAdding: .year, value: 1, to: noonn)!
    }
    var yearafterr: Date {
            return Calendar.current.date(byAdding: .year, value: 2, to: noonn)!
        }
    var yearafterThree: Date {
                return Calendar.current.date(byAdding: .year, value: 3, to: noonn)!
            }
        var yearafterFive: Date {
                    return Calendar.current.date(byAdding: .year, value: 5, to: noonn)!
                }
    var isLastDayOfyear: Bool {
        return dayAfter.yearafter != yearafter
        return dayAfter.yearafterr != yearafterr
        return dayAfter.yearafterThree != yearafterThree
        return dayAfter.yearafterFive != yearafterFive

    }
    }
extension Date {

    //An integer representation of age from the date object (read-only).
    var age: Int {
        get {
            let now = Date()
            let calendar = Calendar.current

            let ageComponents = calendar.dateComponents([.year,.month,.day], from: self, to: now)
            let age = ageComponents.year!
            return age
        }
    }
    init(year: Int, month: Int, day: Int) {
        var dc = DateComponents()
        dc.year = year
        dc.month = month
        dc.day = day

        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        if let date = calendar.date(from: dc) {
            self.init(timeInterval: 0, since: date)
        } else {
            fatalError("Date component values were invalid.")
        }
    }

}

//9632585232
