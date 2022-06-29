//
//  CompleteHealthCareQuotation_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 01/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import Alamofire
import SVProgressHUD

class CompleteHealthCareQuotation_Vc: BaseViewController {

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
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet var nextView: UIView!
    @IBOutlet var netPremium: UILabel!
    @IBOutlet var typeLbl: UILabel!

    @IBOutlet weak var popup_View: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    var policy = String(); var family = String();var suminsured = String();var policytenur  = String();var totalAmount  = String(); var netPremiumm = String();var gstValue = String(); var extraDiscount = String();var epolicyDis = String();var longtermDis = String()
//    var policytype = String(); var familytype = String(); var suminsured = String(); var policytenure = String()
    
    let datePicker  = UIDatePicker()
    var afterday  = String()
    var today  = String()
    var yearlater  = String()
    var secondYear = String()
    var quotationid = String()
    var BIStatus = String()
    var BIStatus1 = String()
    var BIStatus2 = String()
    var BIStatus3 = String()
    var BIStatus4 = String()
    var BIStatus5 = String()
    var selectyear = String()
    var pdStatus = String()
    var age = String()
    var newAge = String()
    var amount = String()
    //MARK: - view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        self.tabBarController?.tabBar.isHidden = true
        self.popup_View.isHidden = true
        self.totalAmountTxt.setLeftPaddingPoints(15)
        let dgdgd = age
        self.BIStatus = "True"
        self.BIStatus1 = "True"
        self.BIStatus2 = "False"
        self.BIStatus3 = "False"
        self.BIStatus4 = "False"
        self.BIStatus5 = "False"
        self.selectyear = "1"
        self.pdStatus = "False"
        self.policyTypeBtn.setTitle("Family Floater", for: .normal)
        self.familyBtn.setTitle("2 Adult", for: .normal)
        self.policyyearBtn.setTitle("1 Year", for: .normal)
        self.selectyear = "1"
        self.suminsuredBtn.setTitle("500000", for: .normal)
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.afterday = dateFormatter.string(from: Date.tomorrow) // Date.tomorrow
        self.today = dateFormatter.string(from: Date()) //Date()
        self.yearlater = dateFormatter.string(from: Date().yearafter) //
        self.secondYear = dateFormatter.string(from: Date().yearafterr)
        self.policyQuat()
          }

    //MARK: - save data in userdefault
    func saveUserData(){
        self.family = self.familyBtn.title(for: .normal) ?? ""
        self.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        self.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        self.policytenur = self.policyyearBtn.title(for: .normal) ?? ""
        self.totalAmount = self.totalAmountTxt.text ?? ""


        UserDefaults.standard.set(self.family, forKey: "familytype") //Bool
        UserDefaults.standard.set(self.policy, forKey: "policytype") //Bool
        UserDefaults.standard.set(self.suminsured, forKey: "suminsured") //Bool
        UserDefaults.standard.set(self.policytenur, forKey: "selectyear") //Bool
        UserDefaults.standard.set(self.totalAmount, forKey: "totalAmount")
        UserDefaults.standard.set(self.selectyear, forKey: "policytenure") //Bool

        UserDefaults.standard.set(self.today, forKey: "today") //Bool
        UserDefaults.standard.set(self.afterday, forKey: "tommorow") //Bool
        UserDefaults.standard.set(self.yearlater, forKey: "yearlater")
        UserDefaults.standard.set(self.newAge, forKey: "newage")

        UserDefaults.standard.set(self.BIStatus , forKey: "BIStatus ")
        UserDefaults.standard.set(self.BIStatus1, forKey: "BIStatus1")
        UserDefaults.standard.set(self.BIStatus2, forKey: "BIStatus2")
        UserDefaults.standard.set(self.BIStatus3, forKey: "BIStatus3")
        UserDefaults.standard.set(self.BIStatus4, forKey: "BIStatus4")
        UserDefaults.standard.set(self.BIStatus5, forKey: "BIStatus5")
        UserDefaults.standard.set(self.pdStatus, forKey: "pdStatus")
        UserDefaults.standard.set(self.newAge, forKey: "newAge")

        UserDefaults.standard.set(self.netPremiumm, forKey: "netPremiumm")
        UserDefaults.standard.set(self.totalAmount, forKey: "totalAmount")
        UserDefaults.standard.set(self.gstValue, forKey: "gstValue")
        UserDefaults.standard.set(self.epolicyDis, forKey: "epolicyDis")
        UserDefaults.standard.set(self.longtermDis, forKey: "longtermDis")
        UserDefaults.standard.set(self.family, forKey: "family")
        UserDefaults.standard.set( self.quotationid, forKey: "quotationid")
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
         self.nextBtn.layer.cornerRadius = 20
         self.popup_View.layer.cornerRadius = 10
         self.popup_View.setShadow(shadowRadius: 5)
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
          }
//MARK: - go ahead Action
     @IBAction func goAheadAction(){
       
         self.popup_View.isHidden = false
        
        }
    @IBAction func continueAction(_ sender: Any) {
        self.saveUserData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "HealthMemberInfo_Vc") as! HealthMemberInfo_Vc
        self.popup_View.isHidden = true
        nextVc.family = self.family
        nextVc.policy = self.policyTypeBtn.title(for: .normal) ?? ""
        nextVc.suminsured = self.suminsuredBtn.title(for: .normal) ?? ""
        nextVc.tenure = self.policyyearBtn.title(for: .normal) ?? ""
        nextVc.quotationid = self.quotationid
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        self.saveUserData()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
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
                       self.familyBtn?.setTitle("1 Adult", for: .normal)
                       self.BIStatus = "True"
                       self.BIStatus1 = "False"
                       self.BIStatus2 = "False"
                       self.BIStatus3 = "False"
                       self.BIStatus4 = "False"
                       self.BIStatus5 = "False"
                       self.policyQuat()
                       self.familyBtn.isUserInteractionEnabled = false                  
                        }else{
                       self.familyBtn.isUserInteractionEnabled = true
                       self.BIStatus = "True"
                       self.BIStatus1 = "True"
                       self.BIStatus2 = "False"
                       self.BIStatus3 = "False"
                       self.BIStatus4 = "False"
                       self.BIStatus5 = "False"
                       self.policyQuat()
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
                  self.BIStatus = "True"
                  self.BIStatus1 = "True"
                  self.BIStatus2 = "False"
                  self.BIStatus3 = "False"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "1 Adult + 1 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "False"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "False"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "1 Adult + 2 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "False"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "True"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "1 Adult + 3 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "False"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "True"
                  self.BIStatus4 = "True"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "2 Adult + 1 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "True"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "False"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "2 Adult + 2 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "True"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "True"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "2 Adult + 3 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "True"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "True"
                  self.BIStatus4 = "True"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }else if family == "2 Adult + 4 Child"{
                  self.BIStatus = "True"
                  self.BIStatus1 = "True"
                  self.BIStatus2 = "True"
                  self.BIStatus3 = "True"
                  self.BIStatus4 = "True"
                  self.BIStatus5 = "True"
                  self.policyQuat()
              }else{
                  self.BIStatus = "True"
                  self.BIStatus1 = "False"
                  self.BIStatus2 = "False"
                  self.BIStatus3 = "False"
                  self.BIStatus4 = "False"
                  self.BIStatus5 = "False"
                  self.policyQuat()
              }
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
      }
    //MARK: - suminsured button Action
    @IBAction func suminsuredAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.direction = .bottom
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.dataSource = ["400000","500000","600000","700000","800000","900000","1000000"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.amount = String(item)
              self.suminsuredBtn.setTitle(item, for: .normal)
              if amount == "400000"{
                  self.typeLbl.text = "Essential"
                  self.policyQuat()
              }else if amount == "500000"{
                  self.typeLbl.text = "Essential"
                  self.policyQuat()
              }else if amount == "600000"{
                  self.typeLbl.text = "Privilege"
                  self.policyQuat()
              }else if amount == "700000"{
                  self.typeLbl.text = "Privilege"
                  self.policyQuat()
              }else if amount == "800000"{
                  self.typeLbl.text = "Privilege"
                  self.policyQuat()
              }else if amount == "900000"{
                  self.typeLbl.text = "Privilege"
                  self.policyQuat()
              }else if amount == "1000000"{
                  self.typeLbl.text = "Privilege"
                  self.policyQuat()
              }
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
                  self.yearlater = dateFormatter.string(from: Date().yearafter)
                  self.policyQuat()
              }else if self.policytenur == "2 Year"{
                  self.selectyear = "2"
                  self.pdStatus = "True"
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "dd/MM/yyyy"
                  self.yearlater = dateFormatter.string(from: Date().yearafterr)
                  self.policyQuat()
              }else if self.policytenur == "3 Year"{
                  self.selectyear = "3"
                  self.pdStatus = "True"
                  self.policyQuat()
              }else{
                  self.selectyear = "0"
              }
              self.policyyearBtn.setTitle(item, for: .normal)
              }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    //MARK: - recalculate button action
    @IBAction func reCalculateAction(_ sender: Any) {
        self.policyQuat()
    }
}
//MARK: - extension for the policyquat Api
extension CompleteHealthCareQuotation_Vc {
    private func policyQuat() {
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid"  : "QuylZjh9tBAutCzXpDjkTw==",       //String(ProjectUtils.getUserID()),
                       "Plan_Type": self.policyTypeBtn.title(for: .normal) ?? "",
                       "Floater_Type":self.familyBtn.title(for: .normal) ?? "",
                       "Sum_Insured":self.suminsuredBtn.title(for: .normal) ?? "",
                       "Policy_Duration": self.selectyear,
                       "Proposal_Date": self.today,
                       "From_Date":self.afterday,
                       "To_Date":self.yearlater,
                       "DOB": self.newAge,
                       "PA_Status":"False",
                       "CI_Status":"False",
                       "DHC_Status":"False",
                       "Esale_Status":"True",
                       "Life_Status":"False",
                       "PD_Status":self.pdStatus,
                       "Sub_Status":"False",
                       "Tiered_Status":"False",
                       "Sub_Type":"",
                       "DOB1":"",
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
                        self.netPremium.text = (val as! String)
                        
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
                            self.longtermDis = epolicyVal as! String
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

