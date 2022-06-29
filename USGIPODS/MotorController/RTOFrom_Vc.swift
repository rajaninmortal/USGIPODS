//
//  RTOFrom_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 21/09/21.
//  Copyright © 2021 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import Alamofire
import SVProgressHUD
import ActionSheetPicker_3_0
import SDWebImage

 
class RTOFrom_Vc: BaseViewController{
    @IBOutlet weak var brand_Txt : UITextField!
    @IBOutlet weak var model_Btn : UIButton!
    @IBOutlet weak var state_Txt : UITextField!
    @IBOutlet weak var rto_Btn : UIButton!
    @IBOutlet weak var confirm_Btn : UIButton!
    @IBOutlet weak var dateOfReg_Txt : UITextField!
    @IBOutlet weak var brand_View   : UIView!
    @IBOutlet weak var model_View   : UIView!
    @IBOutlet weak var model_Txt : UITextField!
    @IBOutlet weak var state_View   : UIView!
    @IBOutlet weak var rto_View     : UIView!
    @IBOutlet weak var rto_Txt : UITextField!
    @IBOutlet weak var vehicleImge : UIImageView!
    @IBOutlet weak var regDate_View : UIView!
    let dated = Date();var vehicleImg = String()
    let datePicker  = UIDatePicker()
    let formatter   = DateFormatter()
    var listArray   = [[String:Any]]()
    var modelArray  = [[String: Any]]()
    var stateArray  = [[String: Any]]()
    var rtoArray  = [[String: Any]]()
    var brandname   = [String]()
    var picker = UIPickerView()
    var stateId = String()
    var vehicleCode = String()
    var modelCode = String()
   var rtoCode = String()
    var selectedIndex = 0
    let dateFormatter = DateFormatter()
    var selectYear = String()
    var vehicle = String()
    var vehicleClassCode = String()
    var calculated = Int()
    //MARK: -  view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDate()
        self.cornerRadius()
        self.createdatePickerView()
        self.brand_Txt.delegate = self
        brand_Txt.inputView = picker
        self.dateOfReg_Txt.delegate = self
        formatter.dateFormat = "dd/MM/yyyy"
        self.dateOfReg_Txt.text = formatter.string(from: dated)
        self.retrieveData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.VehicleManufacturerMaster()
        self.getGetStateApi(params: ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                     "Uid": "QuylZjh9tBAutCzXpDjkTw=="])
    }
    
    func cornerRadius(){
        self.brand_View  .layer.cornerRadius = 20
        self.model_View  .layer.cornerRadius = 20
        self.state_View  .layer.cornerRadius = 20
        self.rto_View    .layer.cornerRadius = 20
        self.regDate_View.layer.cornerRadius = 20
        self.brand_View  .layer.cornerRadius = 20
        self.confirm_Btn.layer.cornerRadius = 20
        self.brand_Txt.setLeftPaddingPoints(15)
        self.state_Txt.setLeftPaddingPoints(15)
        self.model_Txt.setLeftPaddingPoints(15)
        self.dateOfReg_Txt.setLeftPaddingPoints(15)
        self.rto_Txt.setLeftPaddingPoints(15)
        self.borderWidth()
    }
    func borderWidth(){
        self.brand_View.layer.borderWidth = 0.5
        self.model_View.layer.borderWidth = 0.5
        self.state_View.layer.borderWidth = 0.5
        self.rto_View .layer.borderWidth = 0.5
        self.regDate_View.layer.borderWidth = 0.5
        self.confirm_Btn.layer.borderWidth = 0.5
        self.dateOfReg_Txt.isUserInteractionEnabled = false
    }
    //MARK: -  func for the retrieve data
    func retrieveData(){
        self.vehicle =   UserDefaults.standard.string(forKey: "TwoWheeler")!
        if self.vehicle == "twoWheeler"{
            self.vehicleClassCode = "37"
            self.vehicleImge.image = UIImage(named: "Activa")
               }else{
            self.vehicleClassCode = "45"
            self.vehicleImge.image = UIImage(named: "Car_Img")
        }

    }
  
    func createdatePickerView() {
        var dateFormatter = DateFormatter()

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        dateOfReg_Txt.inputView = datePicker

       }
    @objc func donePressed() {
        self.dateOfReg_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
       }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == self.dateOfReg_Txt{
            self.dateOfReg_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        let selectDateeeeee = datePicker.date.dateInYyyyMmDdSs()
        let formetter = DateFormatter()
        formetter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/YYYY"
        let date = formatter.date(from: selectDateeeeee)
        let datee =   date
        self.calculated = datee?.age ?? 0
       }
       }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
      }
    //MARK: -  validation for
    func validation(){
        if brand_Txt.text?.count  == 0 {
            alert(message: "Please select vehicle brand", title: "Message")
        }else if model_Txt.text?.count == 0 {
            alert(message: "Please select Model", title: "Message")
        }else if dateOfReg_Txt.text?.count == 0{
            alert(message: "Please select vehicle Registration date", title: "Message")
        }else if state_Txt.text?.count  == 0{
            alert(message: "Please select state", title: "Message")
        }else if rto_Txt.text?.count == 0{
            alert(message: "Please select Rto Location", title: "Message")
        }else{
            print("select")
        }
       }
    //MARK: -  saveData
    func saveData(){
        UserDefaults.standard.set(self.dateOfReg_Txt.text, forKey: "RegDate")
        UserDefaults.standard.set(self.vehicleCode, forKey: "vehicleCode")
        UserDefaults.standard.set(self.modelCode, forKey: "modelCode")
        UserDefaults.standard.set( self.rtoCode, forKey: "RegionCode")
        UserDefaults.standard.set(self.rto_Txt?.text, forKey: "RtoLocation")
        UserDefaults.standard.set( self.brand_Txt?.text, forKey: "VehicleBrand")
        UserDefaults.standard.set(self.model_Txt?.text, forKey: "VehicleModel")
        UserDefaults.standard.set( self.state_Txt?.text, forKey: "VehicleRegStates")
        UserDefaults.standard.set(self.rto_Txt?.text, forKey: "VehicleRto")
        UserDefaults.standard.set(self.selectYear, forKey: "RegYear")
        UserDefaults.standard.set(self.calculated, forKey: "VehicleAge")
        UserDefaults.standard.set(self.vehicleClassCode, forKey: "VehicleClassCode")
        UserDefaults.standard.set(self.vehicleCode, forKey: "vehicleCode")
      }
    //MARK: - all button selection action
    @IBAction func VehicleBrandAction(_ sender:UIButton){
        if listArray.count != 0 {
            var tempppStateArray =  [String]()
            for item in listArray {
                tempppStateArray.append(item["VEHICLEMANUFACTURERNAME"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "State", rows: tempppStateArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
//                print("StateId : \(self.stateArray[indexes]["StateId"] ?? "")")
                self.brand_Txt?.text = tempppStateArray[indexes]
                self.vehicleCode = self.listArray[indexes]["VEHICLEMANUFACTURERCODE"] as! String
                //MARK: -  vehicle model api
                self.getModelDetailsAPi(params:["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                                "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                    "MANUFACTURERNAME": self.brand_Txt?.text ?? "",
                    "ModelType":"All"])
               

//                self.stateStr = tempStateArray[indexes]
//                print(self.statelbl?.text)
//                self.stateId = self.stateArray[indexes]["StateId"] as! String
//                self.getGetCityApi(params: ["TokenNo":tokenNo,"StateId":self.stateId,"Uid":String(ProjectUtils.getUserID())])
                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
        }
    
    @IBAction func modelAction(_ sender:UIButton){
        if modelArray.count != 0 {
            var tempModelArray =  [String]()
            for item in modelArray {
                tempModelArray.append(item["VEHICLEMODEL"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: tempModelArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
//                self.citylbl?.text = "-City-"
                self.model_Txt?.text = tempModelArray[indexes]
                self.modelCode = self.modelArray[indexes]["VEHICLEMODELCODE"] as! String
                self.vehicleImg = self.modelArray[indexes]["IMAGE"] as! String
                self.vehicleImge.sd_setImage(with: URL(string: self.vehicleImg), placeholderImage: UIImage(named: "placeholder.png"))

                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
    }
    @IBAction func stateAction(_ sender:UIButton){
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
                
//                self.stateStr = tempStateArray[indexes]
//                print(self.statelbl?.text)
//                self.getGetCityApi(params: ["TokenNo":tokenNo,"StateId":self.stateId,"Uid":String(ProjectUtils.getUserID())])
                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
        }
    
    @IBAction func rtoAction(_ sender:UIButton){
        if rtoArray.count != 0 {
            var rtoTempArray =  [String]()
            for item in rtoArray {
                rtoTempArray.append(item["RTOLOCDesc"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Vehicle Brand", rows: rtoTempArray, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
                
//            self.stateBtn.setTitle(tempStateArray[indexes], for: .normal)
//                self.citylbl?.text = "-City-"
                self.rtoCode =  self.rtoArray[indexes]["RegionCode"] as! String
                self.rto_Txt?.text = rtoTempArray[indexes]
//                self.stateStr = tempStateArray[indexes]
//                print(self.statelbl?.text)
//                self.stateId = self.stateArray[indexes]["StateId"] as! String
//                self.getGetCityApi(params: ["TokenNo":tokenNo,"StateId":self.stateId,"Uid":String(ProjectUtils.getUserID())])
                
                return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else{
            //            showToastAlert(withMessage: "State not found", owner: self)
        }
        }
    @IBAction func bacAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
   }
    
    @IBAction func nextAction(_ sender:UIButton){
        self.validation()
        self.saveData()
            let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "NewpolicyVehicleAddons_Vc") as! NewpolicyVehicleAddons_Vc
            self.navigationController?.pushViewController(nextVc, animated: true)
   }
}
extension RTOFrom_Vc:UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brandname.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return brandname[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if brandname.count > 0 {
            brand_Txt.text = brandname[row]
            selectedIndex = row
        }
    }
}




extension RTOFrom_Vc {
    private func VehicleManufacturerMaster() {
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                       "VEHICLECLASSCODE": self.vehicleClassCode,// for two wheel 37 and for four wheel 45
                       "Type":"All"
                        ]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleManufacturerMaster.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
                    self.listArray =  response["VehicleMake"] as! [[String:Any]]
                        
//                        self.array = data.compactMap({MotorBrandModel(json: JSON(rawValue: $0) ?? 0)})
//                        print(self.array.count)
//                            for item in self.array {
//                                self.brandname.append("card\(item)")
//                                print(self.brandname)
//                        }

                    
                  
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
    
 
 //MARK: - model api service
    private func getModelDetailsAPi(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleModelMaster.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                  
                     let err = response["Message"] as? String
                    if err == "Data Not Found"{
                        self.alert(message: "Data Not Found", title: "Message")
                    }else{
                    self.modelArray = response["VehicleModel"] as! [[String:Any]]
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
    //MARK: -
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
                    
                    self.rtoArray = response["VehicleMasterRtoLocationZone"] as! [[String:Any]]
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

    func setDate() {
      dateFormatter.dateFormat = "dd"
        let jj = dateFormatter.string(from: datePicker.date)
      dateFormatter.dateFormat = "MM"
        let ff = dateFormatter.string(from: datePicker.date)
      dateFormatter.dateFormat = "yyyy"
        self.selectYear = dateFormatter.string(from: datePicker.date)
    }
}
