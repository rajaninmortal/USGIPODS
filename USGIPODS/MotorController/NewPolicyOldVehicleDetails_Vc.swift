//
//  NewPolicyOldVehicleDetails_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import SVProgressHUD
import ActionSheetPicker_3_0

class NewPolicyOldVehicleDetails_Vc: BaseViewController,UITextFieldDelegate{
    @IBOutlet weak var respect_View: UIView!
    @IBOutlet weak var wecomeNAme_Lbl: UILabel!
    @IBOutlet weak var mrMrs_Btn: UIButton!
    @IBOutlet weak var name_Txt: UITextField!
    @IBOutlet weak var email_Txt: UITextField!
    @IBOutlet weak var registrationAddress_Txt: UITextView!
    @IBOutlet weak var pinCode_Txt: UITextField!
    @IBOutlet weak var state_View: UIView!
    @IBOutlet weak var state_Txt: UITextField!
    @IBOutlet weak var state_Btn: UIButton!
    @IBOutlet weak var city_View: UIView!
    @IBOutlet weak var city_Txt: UITextField!
    @IBOutlet weak var city_Btn: UIButton!
    @IBOutlet weak var communication_Txt: UITextView!
    @IBOutlet weak var addressPin_Txt: UITextField!
    @IBOutlet weak var communicationState_View: UIView!
    @IBOutlet weak var communicationState_Txt: UITextField!
    @IBOutlet weak var communicationState_Btn: UIButton!
    @IBOutlet weak var communicationCity_View: UIView!
    @IBOutlet weak var communicationCity_Txt: UITextField!
    @IBOutlet weak var communicationCity_Btn: UIButton!
    @IBOutlet weak var communicationPin_Code: UITextField?
    @IBOutlet weak var communicationCheckBtn: UIButton!
    @IBOutlet weak var vehicleNbr_Txt: UITextField!
    @IBOutlet weak var chasisNbr_Txt: UITextField!
    @IBOutlet weak var engineNbr_Txt: UITextField!
    @IBOutlet weak var amount_Lbl: UILabel!
    @IBOutlet weak var termsCondition_Btn: UIButton!
    @IBOutlet weak var continue_Btn: UIButton!
    @IBOutlet weak var viewAll_Btn: UIButton!
    
    @IBOutlet weak var previousPolicyNbr_Txt: UITextField!
    @IBOutlet weak var previousPolicyComName_View: UIView!
    @IBOutlet weak var PolicyState_Btn: UIButton!
    @IBOutlet weak var previosPolicyEndDate_View: UIView!
    @IBOutlet weak var previousPolicyEndDate_Txt: UITextField!
    @IBOutlet weak var comprehensive_Btn: UIButton!
    @IBOutlet weak var liability_Btn: UIButton!
    @IBOutlet weak var ncbValue_View: UIView!
    @IBOutlet weak var ncb_View: UIButton!
    
    @IBOutlet weak var oldPlanStartDate_Txt: UITextField!
    @IBOutlet weak var oldPlanEndDate_Txt: UITextField!
    
    @IBOutlet weak var tpPlanStrtDate_Txt: UITextField!
    @IBOutlet weak var tpPlanEndDate_Txt: UITextField!
    
    @IBOutlet weak var tpPlanDate_View: UIView!
    @IBOutlet weak var tpPlanDate_ViewNs: NSLayoutConstraint!
    @IBOutlet weak var odPlanDate_View: UIView!
    @IBOutlet weak var odPlanDate_ViewNs: NSLayoutConstraint!
    @IBOutlet weak var payment_view: UIView!
    let datePicker  = UIDatePicker()
    let formatter   = DateFormatter()
    
    var oldStartDate = String();var oldEndDate = String(); var tpStartDate = String();
    var tpEndDate = String();var CustomerType = String()
    var stateId = String();var chassisNbr = String();var engineNbr = String()
    var stateCommunicationId = String()

    var rightBarDropDown = DropDown()
    var cityAryya = [Any]()
    var stateArray  = [[String: Any]]()
    var cityArray  = [[String: Any]]()
    var communicationStateArray  = [[String: Any]]()
    var commmunicationCityArray  = [[String: Any]]()
    
    //MARK: -  view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
        self.createdatePickerView()
        self.oldPlanStartDate_Txt.delegate = self
        self.oldPlanEndDate_Txt.delegate = self
        self.tpPlanStrtDate_Txt.delegate = self
        self.tpPlanEndDate_Txt.delegate = self
        self.pinCode_Txt.delegate = self
        self.retrieveData()
//        self.textFieldPadding()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        self.wecomeNAme_Lbl?.text = "\("Good Going" + "yogesh" )";
        self.getGetStateApi(params: ["TokenNo":tokenNo,"Uid":String(ProjectUtils.getUserID())])

    }
   //MARK: - func for the corner radious
    func cornerRadius(){
        self.respect_View.layer.cornerRadius = 20
        self.name_Txt.layer.cornerRadius = 20
        self.email_Txt.layer.cornerRadius = 20
        self.registrationAddress_Txt.layer.cornerRadius = 20
        self.pinCode_Txt.layer.cornerRadius = 20
        self.state_View.layer.cornerRadius = 20
        self.city_View.layer.cornerRadius = 20
        self.communication_Txt.layer.cornerRadius = 20
        self.addressPin_Txt.layer.cornerRadius = 20
        self.communicationState_View.layer.cornerRadius = 20
        self.communicationCity_View.layer.cornerRadius = 20
        self.vehicleNbr_Txt.layer.cornerRadius = 20
        self.chasisNbr_Txt.layer.cornerRadius = 20
        self.engineNbr_Txt.layer.cornerRadius = 20
        self.continue_Btn.layer.cornerRadius = 20
        self.previousPolicyNbr_Txt.layer.cornerRadius = 20
        self.previousPolicyComName_View.layer.cornerRadius = 20
        self.previosPolicyEndDate_View.layer.cornerRadius = 20
        self.ncbValue_View.layer.cornerRadius = 20
        self.oldPlanStartDate_Txt.layer.cornerRadius = 20
        self.oldPlanEndDate_Txt.layer.cornerRadius = 20
        self.tpPlanStrtDate_Txt.layer.cornerRadius = 20
        self.tpPlanEndDate_Txt.layer.cornerRadius = 20
        self.borderWidth()
        self.padding()
        self.hideshow()
        }
    //MARK: - func for the border width
    func borderWidth(){
        self.respect_View.layer.borderWidth = 0.5
        self.name_Txt.layer.borderWidth = 0.5
        self.email_Txt.layer.borderWidth = 0.5
        self.registrationAddress_Txt.layer.borderWidth = 0.5
        self.pinCode_Txt.layer.borderWidth = 0.5
        self.state_View.layer.borderWidth = 0.5
        self.city_View.layer.borderWidth = 0.5
        self.communication_Txt.layer.borderWidth = 0.5
        self.addressPin_Txt.layer.borderWidth = 0.5
        self.communicationState_View.layer.borderWidth = 0.5
        self.communicationCity_View.layer.borderWidth = 0.5
        self.vehicleNbr_Txt.layer.borderWidth = 0.5
        self.chasisNbr_Txt.layer.borderWidth = 0.5
        self.engineNbr_Txt.layer.borderWidth = 0.5
        self.continue_Btn.layer.borderWidth = 0.5
        self.previousPolicyNbr_Txt.layer.borderWidth = 0.5
        self.previousPolicyComName_View.layer.borderWidth = 0.5
        self.previosPolicyEndDate_View.layer.borderWidth = 0.5
        self.ncbValue_View.layer.borderWidth = 0.5
        self.oldPlanStartDate_Txt.layer.borderWidth = 0.5
        self.oldPlanEndDate_Txt.layer.borderWidth = 0.5
        self.tpPlanStrtDate_Txt.layer.borderWidth = 0.5
        self.tpPlanEndDate_Txt.layer.borderWidth = 0.5
        self.payment_view.addTopShadow()
    }
    func hideshow(){
        self.tpPlanDate_View.isHidden = true
        self.tpPlanDate_ViewNs.constant = 0
        self.odPlanDate_View.isHidden = true
        self.odPlanDate_ViewNs.constant = 0
    }
//MARK: - padding for the text field
    
    func padding(){
        self.name_Txt.setLeftPaddingPoints(15)
        self.email_Txt.setLeftPaddingPoints(15)
        self.pinCode_Txt.setLeftPaddingPoints(15)
        self.vehicleNbr_Txt.setLeftPaddingPoints(15)
        self.chasisNbr_Txt.setLeftPaddingPoints(15)
        self.engineNbr_Txt.setLeftPaddingPoints(15)
        self.previousPolicyNbr_Txt.setLeftPaddingPoints(15)
        self.previousPolicyEndDate_Txt.setLeftPaddingPoints(15)
        self.oldPlanStartDate_Txt.setLeftPaddingPoints(15)
        self.oldPlanEndDate_Txt.setLeftPaddingPoints(15)
        self.tpPlanStrtDate_Txt.setLeftPaddingPoints(15)
        self.tpPlanEndDate_Txt.setLeftPaddingPoints(15)
        self.communicationCity_Txt?.setLeftPaddingPoints(15)
        self.communicationState_Txt.setLeftPaddingPoints(15)
        self.communicationPin_Code?.setLeftPaddingPoints(15)
        self.city_Txt?.setLeftPaddingPoints(15)
        self.state_Txt?.setLeftPaddingPoints(15)
        self.communicationCity_Txt?.isUserInteractionEnabled = false
        self.communicationState_Txt?.isUserInteractionEnabled = false
        self.communicationPin_Code?.isUserInteractionEnabled = false
        self.name_Txt.isUserInteractionEnabled = false
        self.email_Txt.isUserInteractionEnabled = false
    }
    
    //MARK: -  reteieve data
    func retrieveData(){
        self.name_Txt?.text = "yogesh"
        self.email_Txt?.text = "yogeshinmortal@gmail.com"
    }
    //MARK: -  date picker
    func createdatePickerView() {
        var dateFormatter = DateFormatter()

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        oldPlanStartDate_Txt.inputView = datePicker
        oldPlanEndDate_Txt.inputView = datePicker
       tpPlanStrtDate_Txt.inputView = datePicker
       tpPlanEndDate_Txt.inputView = datePicker

       }
    @objc func donePressed() {
        self.oldPlanStartDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        self.oldPlanEndDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        self.tpPlanStrtDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        self.tpPlanEndDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"

       }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == self.oldPlanStartDate_Txt{
            self.oldPlanStartDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        let selectDateeeeee = datePicker.date.dateInYyyyMmDdSs()
            self.oldStartDate = self.oldPlanStartDate_Txt?.text ?? ""
        let formetter = DateFormatter()
        formetter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/YYYY"
        let date = formatter.date(from: selectDateeeeee)
        let datee =   date
//        self.calculated = datee?.age ?? 0
        }else if textField == self.oldPlanEndDate_Txt{
            self.oldPlanEndDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            self.oldEndDate   =   self.oldPlanEndDate_Txt?.text ?? ""

        }else if textField == self.tpPlanStrtDate_Txt{
            self.tpPlanStrtDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            self.tpStartDate  =   self.tpPlanStrtDate_Txt?.text ?? ""

        }else if textField == self.tpPlanEndDate_Txt{
            self.tpPlanEndDate_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
            self.tpEndDate  =    self.tpPlanEndDate_Txt?.text ?? ""
        }
       }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
      }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = self.pinCode_Txt?.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        print(newLength)
        return newLength <= 6
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //MARK: -  func for the validation
    func validation(){
        self.chassisNbr = self.chasisNbr_Txt?.text ?? ""
        self.engineNbr = self.engineNbr_Txt?.text ?? ""

        if mrMrs_Btn?.title(for: .normal) == ""{
            
        }else if name_Txt?.text?.count == 0{
            alert(message: "Please Enter Your Name", title: "Message")
        }else if email_Txt?.text?.count == 0{
            alert(message: "Please enter Your Email", title: "Message")
        }else if registrationAddress_Txt?.text?.count == 0{
            alert(message: "Please Enter Address From Where You Registered Your Vehicle", title: "Message")
        }else if pinCode_Txt?.text?.count == 0{
            alert(message: "Please Enter Registered Pin Code", title: "Message")
            self.pinCode_Txt?.layer.borderColor = UIColor.red.cgColor
        }else if (pinCode_Txt?.text?.count ?? 0 < 6) {
           alert(message: "Please Enter 6 Digit Registered Pin Code", title: "Message")
       }else if (pinCode_Txt?.text?.count ?? 0 > 6) {
        alert(message: "Please Enter Registered Registered Pin Code", title: "Message")
        }else if state_Txt.text?.count == 0{
            alert(message: "Please Select Your registration State", title: "Message")
        }else if city_Txt.text?.count == 0{
            alert(message: "Please Select Your registration City", title: "Message")
//        }else if communication_Txt?.text?.count == 0{
//            alert(message: "Please Enter Your communication Address ", title: "Message")
//        }else if communicationCity_Txt?.text?.count == 0{
//            alert(message: "Please Select Your communication City", title: "Message")
//        }else if communicationState_Txt?.text?.count == 0{
//            alert(message: "Please Select Your communication State", title: "Message")
//        }else if communicationPin_Code?.text?.count == 0{
//            alert(message: "Please Enter Your communication PinCode", title: "Message")
      }else if chasisNbr_Txt?.text?.count == 0{
          alert(message: "Please enter Chasis Number", title: "Message")
      }else if engineNbr_Txt?.text?.count == 0{
          alert(message: "Please enter  your engine number", title: "Message")
      }else if self.chassisNbr == self.engineNbr {
          alert(message: "chassis number and engine number should not be same", title: "Message")
      }else{
          print("total error")
      }
    }
    
    @IBAction func backAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func comprehensiveAction(_ sender:UIButton){
        if comprehensive_Btn.isSelected == true{
            comprehensive_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            liability_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.tpPlanDate_View.isHidden = false
            self.tpPlanDate_ViewNs.constant = 80
            self.CustomerType = "Comprehensive"
        }else{
            comprehensive_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    
    @IBAction func liabilityAction(_ sender:UIButton){
        if liability_Btn.isSelected == true{
            liability_Btn?.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            comprehensive_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.tpPlanDate_View.isHidden = true
            self.tpPlanDate_ViewNs.constant = 0
            self.CustomerType = "Individual"
        }else{
            liability_Btn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
        }
    }
    @IBAction func ContinueAction(_ sender:UIButton){
       self.previousPolicyType()
        self.saveData()
        self.validation()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "OldVehicleSummary_Vc") as! OldVehicleSummary_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    @IBAction func registrationStateAction(_ sender:UIButton){
        if stateArray.count != 0 {
            var tempStateArray =  [String]()
            for item in stateArray {
                tempStateArray.append(item["StateName"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: tempStateArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
                print("StateId : \(self.stateArray[indexes]["StateId"] ?? "")")
//            self.stateBtn.setTitle(tempStateArray[indexes], for: .normal)
//                self.citylbl?.text = "-City-"
                self.state_Txt?.text = tempStateArray[indexes]
                self.stateId = self.stateArray[indexes]["StateId"] as! String
                self.getRtoDetailsAPi(params:["TokenNo":tokenNo,
                                                      "Uid":String(ProjectUtils.getUserID()),
                                                      "StateCode": self.stateId])
                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }

    }
    @IBAction func registrationCityAction(_ sender:UIButton){
        if cityArray.count != 0 {
            var communicationTempCityArray =  [String]()
            for item in cityArray {
                communicationTempCityArray.append(item["RTOLOCDesc"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: communicationTempCityArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
                print("StateId : \(self.cityArray[indexes]["StateId"] ?? "")")
//            self.stateBtn.setTitle(tempStateArray[indexes], for: .normal)
                self.city_Txt?.text = communicationTempCityArray[indexes]
                //     self.citylbl?.text = "-City-"

                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
    
    }
    //MARK: -  communication check button action
    @IBAction func communicationCheckAction(_ sender:UIButton){
        if communicationCheckBtn!.isSelected {
            communicationCheckBtn?.setBackgroundImage(UIImage(named: "checked"), for: .normal)
            
            self.communicationCity_Txt?.text = self.city_Txt?.text
            self.communicationState_Txt?.text = self.state_Txt?.text
            self.communicationPin_Code?.text = self.pinCode_Txt?.text
             } else {
                 communicationCheckBtn!.setBackgroundImage(UIImage(named: "unchecked"), for:.normal)
                 self.communicationCity_Txt?.text = "communication city same as registration city"
                 self.communicationState_Txt?.text = "communication state same as registration state"
                 self.communicationPin_Code?.text = "communication Pin same as registration Pin"
                 
             }
        communicationCheckBtn!.isSelected = !communicationCheckBtn!.isSelected
}
    @IBAction func termsConditionAction(_ sender:UIButton){
     if termsCondition_Btn!.isSelected {
         self.termsCondition_Btn?.setBackgroundImage(UIImage(named: "checked"), for: .normal)
          } else {
              self.termsCondition_Btn?.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
          }
        termsCondition_Btn!.isSelected = !termsCondition_Btn!.isSelected
 }
}

extension NewPolicyOldVehicleDetails_Vc{
    //MARK: -
    private func getGetStateApi(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleRtoState.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            if ((JSONResponse.dictionaryObject) != nil) {
                let response = JSONResponse.dictionaryObject!
                print(response)
                
                if response["Status"] as! Bool == true || response["Status"] as! Int == 0 {
                    
                    self.stateArray = response["StateDetails"] as! [[String : Any]]
                    print(self.stateArray)
                    
                } else {
                    WarningAlert.instance.showAlert(title: "Error", message: response["Message"] as! String, imageStr: "warning_icon", color: errorColor)
                }
                CommonMethods.hideHud(aView: self.view)
            }
        }) { (error) in
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                CommonMethods.hideHud(aView: self.view)
                WarningAlert.instance.showAlert(title: "Error", message: AlertMessage.noInternet.rawValue, imageStr: "warning_icon", color: errorColor)
            } else {
                CommonMethods.hideHud(aView: self.view)
                WarningAlert.instance.showAlert(title: "Error", message: error.localizedDescription, imageStr: "warning_icon", color: errorColor)
            }
        }
    }
    //MARK: - api service for the city
    private func getRtoDetailsAPi(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleMasterRtoLocationZone.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
                    self.cityArray = response["VehicleMasterRtoLocationZone"] as! [[String:Any]]
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

    //MARK: -  previous policy Api service
    private func previousPolicyType() {
        
        let params = ["TokenNo":tokenNo,
                      "Uid":String(ProjectUtils.getUserID()),
                      "Prev_Policy_Type":"Comprehensive",
                      "NCB_Value":"555",
                      "OD_Plan_FromDateRange":self.oldStartDate,
                      "OD_Plan_ToDateRange"  :self.oldEndDate,
                      "TP_Plan_FromDateRange":self.tpStartDate,
                      "TP_Plan_ToDateRange"  :self.tpEndDate] as! [String:Any]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.PreviousPolicyType.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
//                    self.rtoArray = response["VehicleMasterRtoLocationZone"] as! [[String:Any]]
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
//MARK: - extension for the data
extension NewPolicyOldVehicleDetails_Vc{
            
            func saveData(){
                let title = self.mrMrs_Btn?.title(for: .normal) ?? ""
                let name = self.name_Txt?.text ?? ""
                let email = self.email_Txt?.text ?? ""
                let registerdText = registrationAddress_Txt?.text ?? ""
                let pinCode = self.pinCode_Txt?.text ?? ""
                let state = self.state_Txt.text ?? ""
                let city  =  self.city_Txt.text ?? ""
                let coomunicationAddress = self.communication_Txt?.text ?? ""
                let communiPin = self.communicationPin_Code?.text ?? ""
                let commuState = self.communicationState_Txt.text ?? ""
                let communCity = self.communicationCity_Txt.text ?? ""
                let vehicleNbr = self.vehicleNbr_Txt?.text ?? ""
                let chesisNbr  = self.chasisNbr_Txt?.text ?? ""
                let engineNbr  = self.engineNbr_Txt?.text ?? ""
                
                UserDefaults.standard.set(title, forKey: "title")
                UserDefaults.standard.set(name, forKey: "name")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(registerdText, forKey: "registerdText")
                UserDefaults.standard.set(pinCode, forKey: "pinCode")
                UserDefaults.standard.set(city, forKey: "city")
                UserDefaults.standard.set(state, forKey: "state")
                UserDefaults.standard.set(coomunicationAddress, forKey: "coomunicationAddress")
                UserDefaults.standard.set(communiPin, forKey: "communiPin")
                UserDefaults.standard.set(commuState, forKey: "commuState")
                UserDefaults.standard.set(communCity, forKey: "communCity")
                UserDefaults.standard.set(vehicleNbr, forKey: "vehicleNbr")
                UserDefaults.standard.set(chesisNbr, forKey: "chesisNbr")
                UserDefaults.standard.set(engineNbr, forKey: "engineNbr")
                UserDefaults.standard.set(self.CustomerType, forKey: "CustomerType")

                
            }
            
                }
