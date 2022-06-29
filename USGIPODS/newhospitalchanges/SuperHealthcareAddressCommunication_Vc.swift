//
//  SuperHealthcareAddressCommunication_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 28/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD


class SuperHealthcareAddressCommunication_Vc: BaseViewController,UITextFieldDelegate {

  
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var quotationId_Txt: UITextField!
    @IBOutlet weak var policy_Txt: UITextField!
    @IBOutlet weak var family_Txt: UITextField!
    @IBOutlet weak var suminsured_Txt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet weak var policyTenure_Txt: UITextField!
    
    @IBOutlet weak var deductible_Lbl: UILabel!
    @IBOutlet weak var deductibleAmount_Txt: UITextField!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet var addLine1: UITextField!
    @IBOutlet var addLine2: UITextField!
    @IBOutlet var houseNo_Txt: UITextField!
    @IBOutlet var pincode_Txt: UITextField!
    @IBOutlet var cityName_Txt: UITextField!
    @IBOutlet var stateName_Txt: UITextField!
    @IBOutlet var continueBtn: UIButton!

    var pincode = String()
    
    var addressline1 = String()
    var addressline2 = String()
    var houseNumber  = String()
    var state        = String()
    var city        = String()
    var totallPremium = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        self.pincode_Txt.delegate = self
//        self.policy_Txt.text  = UserDefaults.standard.string(forKey: "policytype")!
//        self.family_Txt.text  = UserDefaults.standard.string(forKey: "familytype")!
//        self.suminsured_Txt.text  = UserDefaults.standard.string(forKey: "suminsured")!
//        self.policyTenure_Txt.text = UserDefaults.standard.string(forKey: "policytenure")!
//        self.totalAmountTxt = UserDefaults.standard.string(forKey: "totalamount") as? UITextField
//
//        self.totallPremium = UserDefaults.standard.string(forKey: "totallPremium")!
//       // self.totalAmountTxt.text = "\(self.totallPremium)"
//        self.quotationId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")


        // Do any additional setup after loading the view.
    }
    //MARK: - func for the cornerRadious
     func cornderRadious(){
         self.policytypeView.layer.cornerRadius = 20
         self.familyTypeView.layer.cornerRadius = 20
         self.suminsuredView.layer.cornerRadius = 20
         self.policytenurView.layer.cornerRadius = 20
         self.totalAmountTxt.layer.cornerRadius = 20
         self.totalLbl.layer.cornerRadius = 20
         self.suminsuredLbl.layer.cornerRadius = 20
         self.addLine1.layer.cornerRadius = 20
         self.addLine2.layer.cornerRadius = 20
         self.houseNo_Txt.layer.cornerRadius = 20
         self.pincode_Txt.layer.cornerRadius = 20
         self.cityName_Txt.layer.cornerRadius = 20
         self.stateName_Txt.layer.cornerRadius = 20
         self.continueBtn.layer.cornerRadius = 20
         self.quotationId_Txt.layer.cornerRadius  = 20
         self.deductible_Lbl.layer.cornerRadius = 20
         self.deductibleAmount_Txt.layer.cornerRadius = 20
         self.deductibleAmount_Txt.setLeftPaddingPoints(15)
         self.addLine1.setLeftPaddingPoints(15)
         self.addLine2.setLeftPaddingPoints(15)
         self.houseNo_Txt.setLeftPaddingPoints(15)
         self.pincode_Txt.setLeftPaddingPoints(15)
         self.cityName_Txt.setLeftPaddingPoints(15)
         self.stateName_Txt.setLeftPaddingPoints(15)
         self.quotationId_Txt.setLeftPaddingPoints(15)
         self.policy_Txt.setLeftPaddingPoints(15)
         self.family_Txt.setLeftPaddingPoints(15)
         self.suminsured_Txt.setLeftPaddingPoints(15)
         self.totalAmountTxt.setLeftPaddingPoints(15)
         self.policyTenure_Txt.setLeftPaddingPoints(15)
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
        self.suminsuredLbl.layer.borderWidth = 0.5
        self.addLine1.layer.borderWidth = 0.5
        self.addLine2.layer.borderWidth = 0.5
        self.houseNo_Txt.layer.borderWidth = 0.5
        self.pincode_Txt.layer.borderWidth = 0.5
        self.cityName_Txt.layer.borderWidth = 0.5
        self.stateName_Txt.layer.borderWidth = 0.5
        self.continueBtn.layer.borderWidth = 0.5
         self.quotationId_Txt.layer.borderWidth = 0.5
         self.deductible_Lbl.layer.borderWidth = 0.5
         self.deductibleAmount_Txt.layer.borderWidth = 0.5
     }
    //MARK: - FUNC FOR THE SAVE DATA
    func saveData(){
        self.addressline1 = self.addLine1.text ?? ""
        self.addressline2 = self.addLine2.text ?? ""
        self.houseNumber = self.houseNo_Txt.text ?? ""
        self.state = self.stateName_Txt.text ?? ""
        self.city = self.cityName_Txt.text ?? ""
        self.pincode = self.pincode_Txt.text ?? ""
        UserDefaults.standard.setValue(addressline1, forKey: "addressline1")
        UserDefaults.standard.setValue(addressline2, forKey: "addressline2")
        UserDefaults.standard.setValue(houseNumber, forKey: "houseNumber")
        UserDefaults.standard.setValue(state, forKey: "state")
        UserDefaults.standard.setValue(city, forKey: "city")
        UserDefaults.standard.setValue(pincode, forKey: "pincode")
    }
    //MARK: - text field delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.pincode = self.pincode_Txt.text ?? ""
        self.stateCityApi()

    }
    func validation(){
        if addLine1.text?.count == 0{
         alert(message: "Message", title: "Please enter your first address")
        }else if addLine2.text?.count == 0{
            alert(message: "Message", title: "Please enter your second address")
        }else if houseNo_Txt.text?.count == 0{
            alert(message: "Message", title: "Please enter your House name/Number/Plot")
        }else if pincode_Txt.text?.count == 0{
         alert(message: "Please Enter your postal code", title: "Message")
        }else if (pincode_Txt.text?.count ?? 0 < 6){
            alert(message: "Pin Code should be 6 Digit Only ", title: "Message")
        }else if (pincode_Txt.text?.count ?? 0 > 6){
            alert(message: "Pin Code should be 6 Digit Only", title: "Message")
        }
    }
    @IBAction func continueAction(){
        // self.validation()
        self.saveData()
            let nextvc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthcareNomineeDetail_VC") as! SuperHealthcareNomineeDetail_VC
            self.navigationController?.pushViewController(nextvc, animated: true)
            
        }
       
    }
//MARK: -  func
extension SuperHealthcareAddressCommunication_Vc{
    private func stateCityApi() {
        let params =  ["TokenNo":tokenNo,
                       "Uid":String(ProjectUtils.getUserID()),
                       "pincode" : self.pincode]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.stateCity.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    if let city = response["CityName"] as? String{
                        self.cityName_Txt.text = city
                        UserDefaults.standard.setValue(city, forKey: "city")
                        let state = response["StateName"] as? String
                        self.stateName_Txt.text = state
                        UserDefaults.standard.setValue(state, forKey: "state")
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


