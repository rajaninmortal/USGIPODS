//
//  PrivateCarDetailWithOwner_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 23/09/21.
//  Copyright © 2021 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import SVProgressHUD
import ActionSheetPicker_3_0


class PrivateCarDetailWithOwner_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet weak var title_Lbl: UILabel?
    @IBOutlet weak var wecomeNAme_Lbl: UILabel?
    @IBOutlet weak var respect_View: UIView?
    @IBOutlet weak var mrMrs_Btn: UIButton?
    @IBOutlet weak var name_Txt: UITextField?
    @IBOutlet weak var email_Txt: UITextField?
    @IBOutlet weak var registrationAddress_Txt : UITextView?
    @IBOutlet weak var pinCode_Txt: UITextField?
    @IBOutlet weak var state_View: UIView?
    @IBOutlet weak var state_Btn: UIButton?
    @IBOutlet weak var state_Txt : UITextField!
    @IBOutlet weak var city_View: UIView?
    @IBOutlet weak var city_Btn: UIButton?
    @IBOutlet weak var city_Txt : UITextField!
    @IBOutlet weak var communication_Txt: UITextView?
    @IBOutlet weak var addressPin_Txt: UITextField?
    @IBOutlet weak var communicationState_View: UIView?
    @IBOutlet weak var communicationState_Btn: UIButton?
    @IBOutlet weak var communicationState_Txt : UITextField!
    @IBOutlet weak var communicationCity_Txt : UITextField!
    @IBOutlet weak var communicationPin_Code: UITextField?
    @IBOutlet weak var communicationCity_View: UIView?
    @IBOutlet weak var communicationCity_Btn: UIButton?
    @IBOutlet weak var communication_txt : UITextField!
    @IBOutlet weak var vehicleNbr_Txt: UITextField?
    @IBOutlet weak var chasisNbr_Txt: UITextField?
    @IBOutlet weak var engineNbr_Txt: UITextField?
    @IBOutlet weak var amount_Lbl: UILabel?
    @IBOutlet weak var termsCondition_Btn: UIButton?
    @IBOutlet weak var continue_Btn: UIButton?
    @IBOutlet weak var viewAll_Btn: UIButton?
    @IBOutlet weak var paymentView: UIView?
    @IBOutlet weak var communicationCheckBtn: UIButton?
    @IBOutlet weak var termsConditionBTn: UIButton?
    @IBOutlet weak var totalPremium: UILabel?

    var vehicleType = String();var chassisNbr = String();var engineNbr = String()
    var stateId = String()
    var stateCommunicationId = String()

    var rightBarDropDown = DropDown()
    var cityAryya = [Any]()
    var stateArray  = [[String: Any]]()
    var cityArray  = [[String: Any]]()
    var communicationStateArray  = [[String: Any]]()
    var commmunicationCityArray  = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
        self.retrieveData()
        self.pinCode_Txt?.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        self.tabBarController?.tabBar.isHidden = true
        self.wecomeNAme_Lbl?.text =   "\("Good Going" + "" + "yogesh")";
        self.getGetStateApi(params: ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                     "Uid": "QuylZjh9tBAutCzXpDjkTw=="])

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
    func cornerRadius(){
        self.respect_View?.layer.cornerRadius = 20
        self.name_Txt?.layer.cornerRadius = 20
        self.email_Txt?.layer.cornerRadius = 20
        self.registrationAddress_Txt?.layer.cornerRadius = 20
        self.pinCode_Txt?.layer.cornerRadius = 20
        self.state_View?.layer.cornerRadius = 20
        self.city_View?.layer.cornerRadius = 20
        self.communication_Txt?.layer.cornerRadius = 20
        self.addressPin_Txt?.layer.cornerRadius = 20
        self.communicationState_View?.layer.cornerRadius = 20
        self.communicationCity_View?.layer.cornerRadius = 20
        self.vehicleNbr_Txt?.layer.cornerRadius = 20
        self.chasisNbr_Txt?.layer.cornerRadius = 20
        self.engineNbr_Txt?.layer.cornerRadius = 20
        self.continue_Btn?.layer.cornerRadius = 20
        self.paymentView?.addTopShadow()
        self.borderWidth()
        self.padding()
        }
    func borderWidth(){
        self.respect_View?.layer.borderWidth = 0.5
        self.name_Txt?.layer.borderWidth = 0.5
        self.email_Txt?.layer.borderWidth = 0.5
        self.registrationAddress_Txt?.layer.borderWidth = 0.5
        self.pinCode_Txt?.layer.borderWidth = 0.5
        self.state_View?.layer.borderWidth = 0.5
        self.city_View?.layer.borderWidth = 0.5
        self.communication_Txt?.layer.borderWidth = 0.5
        self.addressPin_Txt?.layer.borderWidth = 0.5
        self.communicationState_View?.layer.borderWidth = 0.5
        self.communicationCity_View?.layer.borderWidth = 0.5
        self.vehicleNbr_Txt?.layer.borderWidth = 0.5
        self.chasisNbr_Txt?.layer.borderWidth = 0.5
        self.engineNbr_Txt?.layer.borderWidth = 0.5
        self.continue_Btn?.layer.borderWidth = 0.5
        
        //MARK: -  desable the button action
        self.communicationCity_Btn?.isUserInteractionEnabled = false
        self.communicationState_Btn?.isUserInteractionEnabled = false
        self.name_Txt?.isUserInteractionEnabled = false
        self.email_Txt?.isUserInteractionEnabled = false
        self.registrationAddress_Txt?.isUserInteractionEnabled = false
        self.communication_Txt?.isUserInteractionEnabled = false
         }
    func padding(){
        self.name_Txt?.setLeftPaddingPoints(15)
        self.email_Txt?.setLeftPaddingPoints(15)
//        self.registrationAddress_Txt?.setLeftPaddingPoints(15)
        self.pinCode_Txt?.setLeftPaddingPoints(15)
        self.vehicleNbr_Txt?.setLeftPaddingPoints(15)
        self.chasisNbr_Txt?.setLeftPaddingPoints(15)
        self.engineNbr_Txt?.setLeftPaddingPoints(15)
        self.state_Txt?.setLeftPaddingPoints(15)
        self.city_Txt?.setLeftPaddingPoints(15)
        self.communicationState_Txt?.setLeftPaddingPoints(15)
        self.communicationCity_Txt?.setLeftPaddingPoints(15)
        self.communicationPin_Code?.setLeftPaddingPoints(15)

         }
    //MARK: -  reteieve data
    func retrieveData(){
        self.name_Txt?.text =  "yogeshkumarpatel"
        self.email_Txt?.text = "yogeshinmortal@gmail.com"
        
        self.vehicleType = UserDefaults.standard.string(forKey: "TwoWheeler")!
        
        if vehicleType == "twoWheeler"{
            self.title_Lbl?.text = "Two Wheeler Insurance"
        }else{
            self.title_Lbl?.text = "Four Wheeler Insurance"
        }
        self.totalPremium?.text = UserDefaults.standard.string(forKey: "totalPremium")!

    }
    //MARK: -  func for the validation
    func validation(){
        self.chassisNbr = self.chasisNbr_Txt?.text ?? ""
        self.engineNbr = self.engineNbr_Txt?.text ?? ""
        if mrMrs_Btn?.title(for: .normal) == "Mr/Mrs"{
            alert(message: "Please Select Name title", title: "Message")
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
//        rto
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
    
    private func vehicleNbrValidation() -> Bool {
        if !CommonMethods.isInternetAvailable() {
            showWarning("Error", AlertMessage.noInternet.rawValue)
            return false
        }else if(!CommonMethods.isValidVehicleRegistarionNbr(registrationNumber: (vehicleNbr_Txt?.text!)!)) {
            showWarning("Error", AlertMessage.invalidRegistraionNbr.rawValue)
            return false
             }
        return true
             }
    @IBAction func nameTitleAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Select","Mr","Mrs","Miss"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.mrMrs_Btn?.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
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
                self.getRtoDetailsAPi(params:["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                              "Uid": "QuylZjh9tBAutCzXpDjkTw==",
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
    @IBAction func communicationStateAction(_ sender:UIButton){
        if stateArray.count != 0 {
            var communicationTempArray =  [String]()
            for item in stateArray {
                communicationTempArray.append(item["StateName"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: communicationTempArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
                print("StateId : \(self.stateArray[indexes]["StateId"] ?? "")")
//            self.stateBtn.setTitle(tempStateArray[indexes], for: .normal)
                self.communicationState_Txt?.text = communicationTempArray[indexes]
                //     self.citylbl?.text = "-City-"
                self.stateCommunicationId = self.stateArray[indexes]["StateId"] as! String

                self.getRtoDetailsAPi(params:["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                              "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                                                      "StateCode": self.stateCommunicationId])
                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
    
    }
    
    @IBAction func communicationCityAction(_ sender:UIButton){
        if cityArray.count != 0 {
            var communCityTempArray =  [String]()
            for item in cityArray {
                communCityTempArray.append(item["RTOLOCDesc"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: communCityTempArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
                print("StateId : \(self.cityArray[indexes]["StateId"] ?? "")")
//            self.stateBtn.setTitle(tempStateArray[indexes], for: .normal)
                self.communication_txt?.text = communCityTempArray[indexes]
                //     self.citylbl?.text = "-City-"

                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
    
    }
    
    //MARK: - button actin for show Breakup
    @IBAction func viewAllAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewPolicyShowBreakup_Vc") as! NewPolicyShowBreakup_Vc
        self.navigationController?.present(nextVc, animated: true)
//        self.dismiss(animated: true)
    }
    
    @IBAction func pay_BtnAction(_ sender:UIButton){
       self.validation()
//        if self.vehicleNbrValidation(){
        self.saveData()
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "VehicleAllDetails_Vc") as! VehicleAllDetails_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
//        }
    }

    @IBAction func backTo_BtnAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
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
     if termsConditionBTn!.isSelected {
         self.termsConditionBTn?.setBackgroundImage(UIImage(named: "checked"), for: .normal)
          } else {
              self.termsConditionBTn?.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
          }
     termsConditionBTn!.isSelected = !termsConditionBTn!.isSelected
 }
}



//MARK: -  extension for the
extension PrivateCarDetailWithOwner_Vc {
    //MARK: - func for the get state api
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
}

//MARK: - extension for the data
extension PrivateCarDetailWithOwner_Vc{
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
    }
}
