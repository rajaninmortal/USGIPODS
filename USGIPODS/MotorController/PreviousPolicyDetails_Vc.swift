//
//  PreviousPolicyDetails_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 05/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import SVProgressHUD
import SwiftyJSON

class PreviousPolicyDetails_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet weak var title_Lbl: UILabel?
    @IBOutlet weak var policyNbr_Txt   :UITextField!
    @IBOutlet weak var policyName_Txt  :UITextField!
    @IBOutlet weak var previousPolicyEnd_Txt  :UITextField!
    @IBOutlet weak var confirmBtn     :UIButton!
    @IBOutlet weak var percentageBtn1 :UIButton!
    @IBOutlet weak var percentageBtn2 :UIButton!
    @IBOutlet weak var percentageBtn3 :UIButton!
    @IBOutlet weak var percentageBtn4 :UIButton!
    @IBOutlet weak var percentageBtn5 :UIButton!
    @IBOutlet weak var percentageBtn6 :UIButton!
    @IBOutlet weak var companyNameBtn :UIButton!
    @IBOutlet weak var yesBtn :UIButton!
    @IBOutlet weak var noBtn :UIButton!
    @IBOutlet weak var compnyBtn :UIButton!
    @IBOutlet weak var preDate_View :UIView!
    @IBOutlet weak var hiddenView :UIView!
    @IBOutlet weak var hiddenViewNs : NSLayoutConstraint!

var twoWheeler = String()
    let datePicker  = UIDatePicker()
    let formatter   = DateFormatter()
    var companyNameArray = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadiuos()
        self.previousPolicyEnd_Txt.delegate = self
        self.createdatePickerView()
        self.VehicleManufacturerMaster()
        // Do any additional setup after loading the view.
    }
    
    func createdatePickerView() {
        var dateFormatter = DateFormatter()

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        previousPolicyEnd_Txt.inputView = datePicker

       }
    @objc func donePressed() {
        self.previousPolicyEnd_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
       }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == self.previousPolicyEnd_Txt{
            self.previousPolicyEnd_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        let selectDateeeeee = datePicker.date.dateInYyyyMmDdSs()
        let formetter = DateFormatter()
        formetter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/YYYY"
        let date = formatter.date(from: selectDateeeeee)
        let datee =   date
       }
       }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
      }
    func validation(){
        if self.policyNbr_Txt.text?.count == 0{
            alert(message: "Please Enter Your Policy Number", title: "Message")
        }else if policyName_Txt.text?.count == 0{
            alert(message: "Please Select Your Insurance Company Name", title: "Message")
        }else if self.previousPolicyEnd_Txt.text?.count == 0{
            alert(message: "Please Enter Your Policy End Date", title: "Message")
//        }else if self.percentageBtn1.isSelected == false || self.percentageBtn2.isSelected == false || self.percentageBtn3.isSelected == false || self.percentageBtn4.isSelected == false || self.percentageBtn5.isSelected == false || self.percentageBtn6.isSelected == false{
//            alert(message: "Please Select Any Claim Bonus", title: "Message")
        }else{
            print("yogesh")
        }
    }
    
    //MARK: - func for the corner radious
    func cornerRadiuos(){
        self.policyNbr_Txt.layer.cornerRadius = 20
        self.companyNameBtn.layer.cornerRadius = 20
        self.confirmBtn.layer.cornerRadius = 20
        self.percentageBtn1.layer.cornerRadius = 20
        self.percentageBtn2.layer.cornerRadius = 20
        self.percentageBtn3.layer.cornerRadius = 20
        self.percentageBtn4.layer.cornerRadius = 20
        self.percentageBtn5.layer.cornerRadius = 20
        self.percentageBtn6.layer.cornerRadius = 20
        self.preDate_View.layer.cornerRadius = 20
        self.borderWidth()
    }
    //MARK: - func for the border width
    func borderWidth(){
        self.policyNbr_Txt.layer.borderWidth = 0.5
        self.companyNameBtn.layer.borderWidth = 0.5
        self.confirmBtn.layer.borderWidth = 0.5
        self.preDate_View.layer.borderWidth = 0.5
        self.percentageBtn1.layer.borderWidth = 1
        self.percentageBtn2.layer.borderWidth = 1
        self.percentageBtn3.layer.borderWidth = 1
        self.percentageBtn4.layer.borderWidth = 1
        self.percentageBtn5.layer.borderWidth = 1
        self.percentageBtn6.layer.borderWidth = 1
        self.policyNbr_Txt.setLeftPaddingPoints(15)
        self.policyName_Txt.setLeftPaddingPoints(15)
        self.previousPolicyEnd_Txt.setLeftPaddingPoints(15)
        self.retrieveData()
    }
    //MARK: -  func for fetch data
    func retrieveData(){
        self.twoWheeler = UserDefaults.standard.string(forKey: "TwoWheeler")!
        if self.twoWheeler == "twoWheeler"{
            self.title_Lbl?.text = "Two Wheeler Insurance"
        }else{
            self.title_Lbl?.text = "Four Wheeler Insurance"
        }
        
    }
    
    @IBAction func backAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true
        )
    }
    @IBAction func policyCompanyNameAction(_ sender:UIButton){
        if companyNameArray.count != 0 {
            var companyName =  [String]()
            for item in companyNameArray {
                companyName.append(item["COMPANYNAME"] as! String)
            }
            
            ActionSheetStringPicker.show(withTitle: "Company Name", rows: companyName, initialSelection: 0, doneBlock: {
                picker, indexes, values in
                print("values = \(String(describing: values))")
                print("indexes = \(String(describing: indexes))")
                print("picker = \(String(describing: picker))")
//                self.citylbl?.text = "-City-"
                self.policyName_Txt?.text = companyName[indexes]
//                self.modelCode = self.companyNameArray[indexes]["VEHICLEMODELCODE"] as! String
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
    
    //MARK: - button actin for the terms and condition
    @IBAction func policyYesAction(_ sender: UIButton){
        if yesBtn?.isSelected == true{
            
            yesBtn?.setImage(#imageLiteral(resourceName: "seeeeeeeeeleeeeee"), for: .normal)
            noBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.hiddenView.isHidden = false
            self.hiddenViewNs.constant = 460
        }
    }
    //MARK: - button actin for the terms and condition
    @IBAction func policyNoAction(_ sender: UIButton){
        if noBtn?.isSelected == true{
           
            noBtn?.setImage(#imageLiteral(resourceName: "seeeeeeeeeleeeeee"), for: .normal)
            yesBtn?.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            self.hiddenView.isHidden = true
            self.hiddenViewNs.constant = 0
        }
    }
    
    
    
    @IBAction func zoroPrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.red.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func twentyPrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.red.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func twFivePrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.red.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func thFivePrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.red.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func fourtyPrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.red.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func fiftyPrecentageAction(_ sender:UIButton){
        self.percentageBtn1.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn2.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn3.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn4.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn5.layer.borderColor = UIColor.clear.cgColor
        self.percentageBtn6.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func confirmAction(_ sender:UIButton){
        let height = "Increases"
        self.validation()
        UserDefaults.standard.set(height, forKey: "height")
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "OldVehicleAddons_Vc") as! OldVehicleAddons_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension PreviousPolicyDetails_Vc {
    private func VehicleManufacturerMaster() {
        let params =  ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                       "Uid": "QuylZjh9tBAutCzXpDjkTw==",
                        ]
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.VehicleAllCompanyMaster.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    guard response["Status"] != nil else {
                        return
                 }
                    
                    self.companyNameArray =  response["ALLCOMPANY"] as! [[String:Any]]
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
