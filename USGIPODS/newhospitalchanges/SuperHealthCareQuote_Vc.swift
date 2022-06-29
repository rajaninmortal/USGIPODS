//
//  SuperHealthCareQuote_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 27/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD
import DropDown

class SuperHealthCareQuote_Vc: BaseViewController {
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var policyTypeBtn: UIButton!
    @IBOutlet var familyBtn: UIButton!
    @IBOutlet var suminsuredBtn: UIButton!
    @IBOutlet var policyyearBtn: UIButton!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var calcutae_View: UIView!
    @IBOutlet var reCalculatedBtn: UIButton!
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet var nextView: UIView!
    @IBOutlet var netPremium: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var planType_View: UIView!
    @IBOutlet var planType_NsView: NSLayoutConstraint!
    @IBOutlet var selectPlantype_View: UIView!
    @IBOutlet var planTypeBtn: UIButton!
    @IBOutlet weak var deductibleTenure_Btn : UIButton!
    @IBOutlet weak var deductibleAmount_Lbl : UILabel!
    @IBOutlet weak var deductibleTenure_View: UIView!
    @IBOutlet var adjustible_View: UIView!
    @IBOutlet var adjustible_NsView: NSLayoutConstraint!
    @IBOutlet weak var popup_View: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    
    var policy = String();var planType = String(); var family = String();var suminsured = String();var policytenur  = String();var totalAmount  = String(); var netPremiumm = String();var gstValue = String(); var extraDiscount = String();var epolicyDis = String();var longtermDis = String(); var quoteId = String();var basicPRemium = String();var totalPRemium = String(); var suminsuredd = String()
    let datePicker  = UIDatePicker() ; var fAdult = [String:Any]()
    var afterday  = String() ;         var sAdult = [String:Any]()
    var today  = String() ;            var fChild = [String:Any]()
    var yearlater  = String() ;        var sChild = [String:Any]()
    var secondYear = String() ;        var tChild = [String:Any]()
    var quotationid = String() ;       var frChild = [String:Any]()
    var selectyear = String(); var suminsss = String()
    var pdStatus = String()
    var age = String()
    var newAge = String()
    var amount = String();var deductible = String(); var Authenticate = [String:Any]();var QuotationDtls = [String:Any]();var Riskdtls = [[String:Any]]();var selectedPlanType = String()
    //MARK: - view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        self.popup_View.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.totalAmountTxt.setLeftPaddingPoints(15)
        let dgdgd = age
       
        self.selectyear = "1"
        self.pdStatus = "False"
        self.policyTypeBtn.setTitle("Family Floater", for: .normal)
        self.familyBtn.setTitle("2 Adult", for: .normal)
        self.policyyearBtn.setTitle("1 Year", for: .normal)
        self.suminsuredBtn.setTitle("500000", for: .normal)
        self.suminsured = "500000"
        self.deductible = "500000"
        self.typeLbl.text = "Gold"
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
    //MARK: - date calculator for the next year and next date
        self.planType_View.isHidden = true
        self.planType_NsView.constant = 0
//        self.adjustible_View.frame.size.height = 500
        self.adjustible_NsView.constant = 500
//        self.Riskdtls.removeAll()
        self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
        self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
        self.Riskdtls.append(self.fAdult)
        self.Riskdtls.append(self.sAdult)
        self.superHealthpolicyQuat()
          }
    //MARK: - save data in userdefault
    func saveUserData(){
        self.family = self.familyBtn.title(for: .normal) ?? ""
        self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        self.policytenur = self.policyyearBtn.title(for: .normal) ?? ""
        self.totalAmount = self.totalAmountTxt.text ?? ""
        self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
        self.selectedPlanType = self.planTypeBtn?.title(for: .normal) ?? ""

        UserDefaults.standard.set(self.suminsured, forKey: "suminsured")
        UserDefaults.standard.set(self.deductible, forKey: "deductible")
        UserDefaults.standard.set(self.totalPRemium, forKey: "totalPRemium")
        UserDefaults.standard.set(self.basicPRemium, forKey: "basicPRemium")
        UserDefaults.standard.set(self.quoteId, forKey: "quoteId")
        UserDefaults.standard.set(self.gstValue, forKey: "gstValue")
        UserDefaults.standard.set(self.selectyear, forKey: "selectyear")
        UserDefaults.standard.set(self.typeLbl.text, forKey: "typeLabel")
        UserDefaults.standard.set(self.basicPRemium, forKey: "basicPRemium")
        UserDefaults.standard.set(self.selectyear, forKey: "selectyear")
        
    }
    //MARK: - func for the cornerRadious
     func cornderRadious(){
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.calcutae_View.layer.cornerRadius = 20
         self.suminsuredLbl.layer.cornerRadius = 20
         self.nextView.layer.cornerRadius = 10
         self.selectPlantype_View.layer.cornerRadius = 20
         self.deductibleAmount_Lbl .layer.cornerRadius = 20
         self.deductibleTenure_View .layer.cornerRadius = 20
         self.continueBtn.layer.cornerRadius = 20
         self.popup_View.layer.cornerRadius = 20
         self.popup_View.setShadow(shadowRadius: 5)
//         self.installmentAmount_Lbl .layer.cornerRadius = 20
//         self.installmentTenure_View.layer.cornerRadius = 20
         
         
        self.borderRadious()
           }
    //MARK: - func for the borderRadious
     func borderRadious(){
        self.policytypeView.layer.borderWidth = 0.5
        self.familyTypeView.layer.borderWidth = 0.5
        self.suminsuredView.layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.calcutae_View.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.nextView.layer.borderWidth = 0.5
        self.deductibleAmount_Lbl.layer.borderWidth = 0.5
        self.deductibleTenure_View.layer.borderWidth = 0.5
        self.selectPlantype_View.layer.borderWidth = 0.5

//         self.installmentAmount_Lbl .layer.borderWidth = 0.5
//         self.installmentTenure_View.layer.borderWidth = 0.5
        
          }
    
    @IBAction func continueAction(_ sender: Any) {
        self.saveUserData()
       let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthCareMemberInfo_Vc") as! SuperHealthCareMemberInfo_Vc
        nextVc.family = self.family
        nextVc.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        nextVc.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        nextVc.tenure = self.policyyearBtn.title(for: .normal) ?? ""
        nextVc.quotationid = self.quotationid
        self.popup_View.isHidden = true
       self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    
//MARK: - go ahead Action
     @IBAction func goAheadAction(){
         self.popup_View.isHidden = false
        }
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.saveUserData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthCareShowBreakup_Vc") as! SuperHealthCareShowBreakup_Vc
        self.present(nextVc, animated: true, completion: nil)
    }
    //MARK: - policy type button action
    @IBAction func policytypeBtnAction(_ sender:UIButton){
        let dropDown = DropDown()
               dropDown.anchorView = (sender as? AnchorView)
               dropDown.dataSource = ["Family Floater","Individual"]
               dropDown.selectionAction = {[unowned self] (index: Int , item:String ) in
                   self.policy = String(item)
                   self.policyTypeBtn?.setTitle(item, for: .normal)
                   if policy == "Individual"{
                       self.Riskdtls.removeAll()
                       self.deductible = "500000"
                       self.familyBtn?.setTitle("1 Adult", for: .normal)
                       self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                       self.Riskdtls.append(self.fAdult)
                       self.superHealthpolicyQuat()
                       self.Riskdtls.removeAll()
                       self.familyBtn.isUserInteractionEnabled = false
                        }else{
                            self.familyBtn?.setTitle("2 Adult", for: .normal)
                            self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                            self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                            self.Riskdtls.append(self.fAdult)
                            self.Riskdtls.append(self.sAdult)
                            self.superHealthpolicyQuat()
                        self.Riskdtls.removeAll()

                       self.familyBtn.isUserInteractionEnabled = true
                      
                       self.superHealthpolicyQuat()
                   }
               }
               dropDown.width = (sender as AnyObject).frame.width
               dropDown.show()
              }
    //MARK: - family floater Action
    @IBAction func familyfloaterAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["2 Adult","1 Adult + 1 Child","1 Adult + 2 Child","1 Adult + 3 Child","2 Adult + 1 Child","2 Adult + 2 Child","2 Adult + 3 Child","2 Adult + 4 Child"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.familyBtn.setTitle(item, for: .normal)
              self.family = String(item)
              if family == "2 Adult"{
                  self.Riskdtls.removeAll()
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.superHealthpolicyQuat()
//                  self.Riskdtls.removeAll()
              }else if family == "1 Adult + 1 Child"{
                  
                  self.Riskdtls.removeAll()
//                  self.suminsured = "500000"
//                  self.deductible = "500000"
                  self.fAdult =   ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"Child","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.fChild)
                  self.superHealthpolicyQuat()
                  self.Riskdtls.removeAll()
              }else if family == "1 Adult + 2 Child"{
                  self.Riskdtls.removeAll()
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sChild =    ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.fChild)
                  self.Riskdtls.append(self.sChild)
                  self.superHealthpolicyQuat()
//                  self.Riskdtls.removeAll()
              }else if family == "1 Adult + 3 Child"{
                  self.Riskdtls.removeAll()
                  self.fAdult =    ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sChild =      ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.tChild =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.fChild)
                  self.Riskdtls.append(self.sChild)
                  self.Riskdtls.append(self.tChild)
                  self.superHealthpolicyQuat()
//                  self.Riskdtls.removeAll()
              }else if family == "2 Adult + 1 Child"{
                  self.Riskdtls.removeAll()
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult = ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.Riskdtls.append(self.fChild)
                  self.superHealthpolicyQuat()
                  self.Riskdtls.removeAll()
              }else if family == "2 Adult + 2 Child"{
                  self.Riskdtls.removeAll()
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult = ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sChild =      ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.Riskdtls.append(self.fChild)
                  self.Riskdtls.append(self.sChild)
                  self.superHealthpolicyQuat()
                  self.Riskdtls.removeAll()
              }else if family == "2 Adult + 3 Child"{
                  self.Riskdtls.removeAll()

                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =   ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sChild =      ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.tChild =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.Riskdtls.append(self.fChild)
                  self.Riskdtls.append(self.sChild)
                  self.Riskdtls.append(self.tChild)
                  self.superHealthpolicyQuat()
                  self.Riskdtls.removeAll()
              }else if family == "2 Adult + 4 Child"{
                  self.Riskdtls.removeAll()

                  self.fAdult =   ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =    ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.fChild =     ["InsuredName":"shivani","DateOfBirth":"27-01-2005","Gender":"Male","Occupation":"Doctors","Relation":"child1","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sChild =      ["InsuredName":"shivani","DateOfBirth":"25-02-2007","Gender":"Male","Occupation":"Doctors","Relation":"child2","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.tChild =    ["InsuredName":"shivani","DateOfBirth":"27-03-2008","Gender":"Male","Occupation":"Doctors","Relation":"child3","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.frChild =      ["InsuredName":"shivani","DateOfBirth":"25-02-2009","Gender":"Male","Occupation":"Doctors","Relation":"child4","SumInsured":self.suminsured,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.Riskdtls.append(self.fChild)
                  self.Riskdtls.append(self.sChild)
                  self.Riskdtls.append(self.tChild)
                  self.Riskdtls.append(self.frChild)
                  self.superHealthpolicyQuat()
                  self.Riskdtls.removeAll()
              }else{
                  
                  self.superHealthpolicyQuat()
              }
              self.family = self.familyBtn.title(for: .normal) ?? ""
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - suminsured button Action
    @IBAction func suminsuredAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["300000","500000","700000","1000000"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.amount = String(item)
               self.suminsuredBtn.setTitle(item, for: .normal)
              if amount == "300000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.suminsss = self.suminsuredBtn.title(for: .normal) ?? ""
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.superHealthpolicyQuat()
              }else if amount == "500000"{
//                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.suminsss = self.suminsuredBtn.title(for: .normal) ?? ""
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.superHealthpolicyQuat()
              }else if amount == "700000"{
//                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.suminsss = self.suminsuredBtn.title(for: .normal) ?? ""
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.superHealthpolicyQuat()
              }else if amount == "1000000"{
                  self.Riskdtls.removeAll()
                  if amount == deductible{
                      self.planType_View.isHidden = false
                      self.planType_NsView.constant = 80
                      self.adjustible_NsView.constant = 580
                  }else{
                      self.planType_View.isHidden = true
                      self.planType_NsView.constant = 0
                      self.adjustible_NsView.constant = 500
                  }
        
                  self.typeLbl.text = "Gold"
                  self.suminsss = self.suminsuredBtn.title(for: .normal) ?? ""
                  self.fAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1995","Gender":"Male","Occupation":"Doctors","Relation":"Self","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.sAdult =  ["InsuredName":"shivani","DateOfBirth":"27-01-1996","Gender":"Male","Occupation":"Doctors","Relation":"Adult1","SumInsured":self.suminsss,"deductible": self.deductible,"MedicalCase":"No","IsWellnessProgram":"N","GlobalCoverApplicable":"N","NomineeName":"","NomineeRelation":""]
                  self.Riskdtls.append(self.fAdult)
                  self.Riskdtls.append(self.sAdult)
                  self.superHealthpolicyQuat()
              }
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - Deductible button Action
    @IBAction func deductibleAmountBtnAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["300000","400000","500000","600000","700000","800000","900000","1000000","1500000","2000000","3000000","4000000"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.deductible = String(item)
              self.deductibleTenure_Btn.setTitle(item, for: .normal)
              if deductible == "300000"{
                  self.Riskdtls.removeAll()
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "400000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "500000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "600000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "700000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "800000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "900000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = true
                  self.planType_NsView.constant = 0
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "1000000"{
                  self.Riskdtls.removeAll()
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              }else if deductible == "1500000" && amount == "1500000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = false
                  self.planType_NsView.constant = 80
                 self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
              } else if deductible == "2000000" && amount == "2000000"{
                  self.Riskdtls.removeAll()
                  self.planType_View.isHidden = false
                  self.planType_NsView.constant = 80
                  self.typeLbl.text = "Gold"
                  self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                  self.suminsuredBtn.setTitle("Select", for: .normal)
                  self.superHealthpolicyQuat()
             }else if deductible == "3000000" && amount == "3000000"{
                 self.planType_View.isHidden = false
                 self.planType_NsView.constant = 80
                self.typeLbl.text = "Gold"
                 self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                 self.suminsuredBtn.setTitle("Select", for: .normal)
                self.superHealthpolicyQuat()
            }else if deductible == "4000000" && amount == "4000000"{
                self.Riskdtls.removeAll()
                self.planType_View.isHidden = false
                self.planType_NsView.constant = 80
               self.typeLbl.text = "Gold"
                self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
                self.suminsuredBtn.setTitle("Select", for: .normal)
                self.superHealthpolicyQuat()
                 }
                 }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - plan type button action
    @IBAction func plantypeBtnAction(_ sender:UIButton){
        let dropDown = DropDown()
               dropDown.anchorView = (sender as? AnchorView)
               dropDown.dataSource = ["Platinum","Diamond"]
               dropDown.selectionAction = {[unowned self] (index: Int , item:String ) in
                   self.planType = String(item)
                   if planType == "Platinum"{
                       self.typeLbl.text = "Platinum"
                       self.superHealthpolicyQuat()
                       self.familyBtn.isUserInteractionEnabled = false
                        }else if planType == "Diamond" {
                            self.typeLbl.text = "Diamond"
                            self.familyBtn.isUserInteractionEnabled = true
                            self.superHealthpolicyQuat()
                        }else{
                            self.typeLbl.text = "Platinum"
                            self.superHealthpolicyQuat()
                        }
                    self.planTypeBtn?.setTitle(item, for: .normal)
               }
               dropDown.width = (sender as AnyObject).frame.width
               dropDown.show()
              }
    
    //MARK: - policy time  type button action
    @IBAction func policytimeAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select Year","1 Year","2 Year","3 Year"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.policytenur = String(item)
              if self.policytenur == "1 Year"{
                  self.selectyear = "1"
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "dd/MM/yyyy"
//                  self.yearlater = dateFormatter.string(from: Date().yearafter)
                  self.superHealthpolicyQuat()
              }else if self.policytenur == "2 Year"{
                  self.selectyear = "2"
                  self.pdStatus = "True"
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "dd/MM/yyyy"
//                  self.yearlater = dateFormatter.string(from: Date().yearafterr)
                  self.superHealthpolicyQuat()
              }else if self.policytenur == "3 Year"{
                  self.selectyear = "3"
                  self.pdStatus = "True"
                  self.superHealthpolicyQuat()
              }else{
                  self.selectyear = "0"
              }
              self.policyyearBtn.setTitle(item, for: .normal)
              }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    

}
//MARK: - extension for the policyquat Api
extension SuperHealthCareQuote_Vc {
       private func superHealthpolicyQuat() {
        self.family = self.familyBtn.title(for: .normal) ?? ""
        self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        self.suminsuredd = self.suminsuredBtn.title(for: .normal) ?? ""
        self.policytenur = self.policyyearBtn.title(for: .normal) ?? ""
        self.deductible = self.deductibleTenure_Btn.title(for: .normal) ?? ""
        self.Authenticate = ["WACode":"20000001","WAAppCode":"30000011"]
       
        self.QuotationDtls = ["strproposerName":"shivani","mobileno":"9837386104","email_id":"shivaniinmortal@gmail.com","ProductType": self.policy,"IsLoyalCustomer":"N","IsEmployee":"N","EmployeeCode":"","ExistingHealthPolicyNo":"","IsWellnessProgram":"N","GlobalCoverApplicable":"N","PolicyTenure":self.selectyear,"PlanType":"Super Top Up","SubPlanType":"Gold","Riskdtls":self.Riskdtls]

        
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
                        if  let GrossPremiumm    = data["GrossPremium"] as? String {
                        self.totalAmountTxt.text = "\(GrossPremiumm)"
                        self.totalPRemium = GrossPremiumm
                            self.netPremium.text = "\(GrossPremiumm)"
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




