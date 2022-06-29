//
//  PrivateCar_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 21/09/21.
//  Copyright © 2021 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON
import SVProgressHUD


class RenewalVehicleCell : UITableViewCell{
    @IBOutlet weak  var vehicleNbr_Lbl : UILabel!
    @IBOutlet weak  var vehicleBrand_Lbl : UILabel!
    @IBOutlet weak  var vehicleName_Lbl : UILabel!
    @IBOutlet weak  var premiumLbl : UILabel!
    @IBOutlet weak  var expiryDate_Lbl : UILabel!
    @IBOutlet weak  var bg_View : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
}

class PrivateCar_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet weak var registrasion_Txt :UITextField?
    @IBOutlet weak var mobile_Txt :UITextField?
    @IBOutlet weak var email_Txt :UITextField?
    @IBOutlet weak var name_Txt :UITextField?
    @IBOutlet weak var next_Btn :UIButton?
    @IBOutlet weak var mobile_View :UIView?
    @IBOutlet weak var termCondition_Btn: UIButton!
    @IBOutlet weak var email_View :UIView?
    @IBOutlet weak var VehicleReg_View :UIView?
    @IBOutlet weak var name_View :UIView?
    @IBOutlet weak var newPolicy_Btn: UIButton!
    @IBOutlet weak var renewalPolicy_Btn: UIButton!
    @IBOutlet weak var twoWheeler_Btn: UIButton!
    @IBOutlet weak var fourWheeler_Btn: UIButton!
    @IBOutlet weak var newVehicle_Btn: UIButton!
    @IBOutlet weak var oldVehicle_Btn: UIButton!
    @IBOutlet weak  var tbl_View : UITableView!
    @IBOutlet weak  var main_View : UIView!
    
    let cellSpacingHeight: CGFloat = 10
//    var otherPolicyList = [OtherPolicyModel]()
//    var policyListArray = [policyListModel]()
    var newPolicy = String()
    var renewalPolicy = String()
    var twoWheeler = String(); var productName =  String(); var productCode = String()
    var fourWheeler = String(); var numberofWheel = String()
    var newVehicle = String()
    var oldVehicle = String()
    var countString = String()
//MARK: -  view life cycle view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
        self.registrasion_Txt?.delegate  = self
        self.registrasion_Txt?.text = "MH04HQ8035"
        self.navigationController?.navigationBar.isHidden = true
//        self.tbl_View.delegate  = self
//        self.tbl_View.dataSource = self
//        self.tbl_View.separatorStyle = .none
//        self.main_View.roundCorners([.topLeft, .topRight], radius: 20.0)
//        self.main_View.setShadow(shadowRadius: 10)
//        self.main_View.isHidden = true
    }
    //MARK: -  view life cycle view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.email_Txt?.text  = "yogeshinmortal@gmail.com"
        self.mobile_Txt?.text = String(describing:ProjectUtils.getMobileNo()!)
        self.name_Txt?.text = "yogesh patel"
       // self.getpolicy(params: ["TokenNo":tokenNo,"UserID":String(ProjectUtils.getUserID())])
    }
    //MARK: -  func for the corner radiuos
    func cornerRadius(){
        self.mobile_View?.layer.cornerRadius      = 25
        self.next_Btn?.layer.cornerRadius         = 25
        self.VehicleReg_View?.layer.cornerRadius = 25
        self.email_View?.layer.cornerRadius = 25
        self.name_View?.layer.cornerRadius = 25
        self.borderWidth()
        self.padding()
    }
    //MARK: -  func for the border width
    func borderWidth(){
        self.mobile_View?.layer.borderWidth = 0.5
        self.next_Btn?.layer.borderWidth  = 0.5
        self.VehicleReg_View?.layer.borderWidth = 0.5
        self.email_View?.layer.borderWidth = 0.5
        self.name_View?.layer.borderWidth = 0.5
    }
    //MARK: - func for the padding
    func padding(){
        self.registrasion_Txt?.setLeftPaddingPoints(15)
        self.registrasion_Txt?.setRightPaddingPoints(15)
        self.mobile_Txt?.setLeftPaddingPoints(15)
        self.mobile_Txt?.setRightPaddingPoints(15)
        self.email_Txt?.setLeftPaddingPoints(15)
        self.email_Txt?.setRightPaddingPoints(15)
    }
    //MARK: - func for the validation
    private func loginValidation() -> Bool {
        if  registrasion_Txt?.text == ""{
            showWarning("Error", AlertMessage.registrasiolnnumbr.rawValue)
            return false
            
        }else if name_Txt?.text == ""{
            showWarning("Error", AlertMessage.enterUserName.rawValue)
            return false
        }else if mobile_Txt?.text == ""{
            showWarning("Error", AlertMessage.enterMobileNo.rawValue)
            return false

        }else if email_Txt?.text == ""{
            showWarning("Error", AlertMessage.enterEmail.rawValue)
            return false

        }else if termCondition_Btn.isSelected == true{
            showWarning("Error", AlertMessage.termconditioncheckmark.rawValue)
            return false
        }
        return true
    }
    //MARK: -  validation for the number reg
    private func vehicleNbrValidation() -> Bool {
        if registrasion_Txt?.text?.count == 0 {
           alert(message: "Please Enter your Vehicle Registration Number", title: "Message")
            return false
        }else if(!CommonMethods.isValidVehicleRegistarionNbr(registrationNumber: (registrasion_Txt?.text!)!)) {
            showWarning("Error", AlertMessage.invalidRegistraionNbr.rawValue)
            return false
        }
        return true
    }
    @IBAction func dismissAction(_ sender: UIButton){
//        self.main_View.isHidden = true

        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func backAction(_ sender: UIButton){
//        self.main_View.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - button actin for the terms and condition
    @IBAction func termConditonAction(_ sender:UIButton){
        if termCondition_Btn.isSelected {
            termCondition_Btn.setBackgroundImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
             } else {
                termCondition_Btn.setBackgroundImage(#imageLiteral(resourceName: "checked"), for:.normal)
             }
        termCondition_Btn.isSelected = !termCondition_Btn.isSelected
    }
    //MARK: - button actin for the terms and condition
    @IBAction func newPolicyAction(_ sender: UIButton){
        if newPolicy_Btn.isSelected == true{
            self.newPolicy = "New"
            newPolicy_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            renewalPolicy_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
                }
    }
    //MARK: - button actin for the terms and condition
    @IBAction func renewalAction(_ sender: UIButton){
        
        if renewalPolicy_Btn.isSelected == true{
            self.newVehicle = "New"
            renewalPolicy_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            newPolicy_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
            let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "RenewalPopup_Vc") as! RenewalPopup_Vc
            self.navigationController?.pushViewController(nextVc, animated: true)
            
                }
        
        

//            else {
//                 renewalPolicy_Btn.setBackgroundImage(UIImage(named: "unSelected"), for:.normal)
//             }
//        renewalPolicy_Btn.isSelected = !renewalPolicy_Btn.isSelected
        }
    //MARK: - button actin for the terms and condition
    @IBAction func twoWheelerAction(_ sender: UIButton){
        if twoWheeler_Btn.isSelected == true{
            self.twoWheeler = "twoWheeler"
            self.productName = "TWO WHEELER PACKAGE POLICY"
            self.productCode = "2369"
            self.numberofWheel = "2"
            twoWheeler_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            fourWheeler_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
                }
        }
    //MARK: - button actin for the terms and condition
    @IBAction func fourWheelerAction(_ sender: UIButton){
        if fourWheeler_Btn.isSelected == true{
            self.twoWheeler = "fourWheeler"
            self.productName = "PRIVATE CAR PACKAGE POLICY"
            self.productCode = "2311"
            self.numberofWheel = "4"
            fourWheeler_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            twoWheeler_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
                }
    }
    //MARK: - button actin for the terms and condition
    @IBAction func newVehicleAction(_ sender: UIButton){
        if newVehicle_Btn.isSelected == true{
            self.newVehicle = "New"
            newVehicle_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            oldVehicle_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
                }
    }
    //MARK: - button actin for the terms and condition
    @IBAction func oldVechicleAciton(_ sender: UIButton){
        if oldVehicle_Btn.isSelected == true{
            self.oldVehicle = "Old Vehicle"
            self.newVehicle = "Old"
            oldVehicle_Btn.setImage(#imageLiteral(resourceName: "RadioButton"), for: .normal)
            newVehicle_Btn.setImage(#imageLiteral(resourceName: "unSelected"), for: .normal)
                }
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = self.registrasion_Txt?.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
          }
        let newLength = currentCharacterCount + string.count - range.length
        print(newLength)
        return newLength <= 10
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func validation(){
        self.countString = (self.registrasion_Txt?.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        if self.registrasion_Txt?.text?.count == 0{
            alert(message: "Enter Vehicle Number ", title: "Error")

        }else if (registrasion_Txt?.text?.count ?? 0 < 10) {
       alert(message: "Please enter 10 digit registration number", title: "Error")
    }else if (registrasion_Txt?.text?.count ?? 0 > 10) {
        alert(message: "Please enter valid digit registration number", title: "Error")
    }
    }
    //MARK: - func for the userdefaults
    func saveData(){
        let registrationNbr = self.registrasion_Txt?.text ?? ""
        UserDefaults.standard.set(self.newPolicy, forKey: "NewPolicy")
        UserDefaults.standard.set(self.twoWheeler, forKey: "TwoWheeler")
        UserDefaults.standard.set(self.newVehicle, forKey: "newVehicle")
        UserDefaults.standard.set(self.oldVehicle, forKey: "Vehicle")
        UserDefaults.standard.set(self.productName,forKey: "productName")
        UserDefaults.standard.set(self.productCode,forKey: "productCode")
        UserDefaults.standard.set(self.numberofWheel , forKey: "NumberofWheel")
        UserDefaults.standard.set(registrationNbr , forKey: "RegistrationNbr")
    }
    //MARK: - button actin for the terms and condition
    @IBAction func nextAction(_ sender:UIButton){
        self.saveData()
       if self.oldVehicle == "Old Vehicle"{
           self.validation()
                let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "PreviousPolicyDetails_Vc") as! PreviousPolicyDetails_Vc
                      self.navigationController?.pushViewController(nextVc, animated: true)
               }else{
              let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "RTOFrom_Vc") as! RTOFrom_Vc
                       self.navigationController?.pushViewController(nextVc, animated: true)
         
        }
    }
}

//MARK: - extension for the tableview
//extension PrivateCar_Vc:UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return policyListArray.count
//       }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RenewalVehicleCell") as! RenewalVehicleCell
//        cell.vehicleNbr_Lbl.text = policyListArray[indexPath.row].registration
//        cell.vehicleBrand_Lbl.text = policyListArray[indexPath.row].brand
//        cell.vehicleName_Lbl.text = policyListArray[indexPath.row].model
//        cell.premiumLbl.text = policyListArray[indexPath.row].totalPremium
//        cell.expiryDate_Lbl.text = policyListArray[indexPath.row].expiryDate
//        cell.bg_View.layer.cornerRadius = 10
//        cell.bg_View.layer.borderWidth = 0.5
//        cell.bg_View.setShadow(shadowRadius: 5)
//        return cell
//       }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let name              = policyListArray[indexPath.row].name
//        let totalpremium      = policyListArray[indexPath.row].premium
//        let idv               = policyListArray[indexPath.row].idv
//        let manufacturingYear = policyListArray[indexPath.row].manufacturingYear
//        let policyNumber      = policyListArray[indexPath.row].policyNumber
//        let policyType        = policyListArray[indexPath.row].policyType
//        let insCompName       = policyListArray[indexPath.row].insCompName
//        let policyStartDate   = policyListArray[indexPath.row].policyStartDate
//        let variant           = policyListArray[indexPath.row].variant
//        let policyID          = policyListArray[indexPath.row].policyID
//        let clientUserID      = policyListArray[indexPath.row].clientUserID
//        let coverageDetails   = policyListArray[indexPath.row].coverageDetails
//        let engineNo          = policyListArray[indexPath.row].engineNo
//        let chasisNo          = policyListArray[indexPath.row].chasisNo
//        let registration      = policyListArray[indexPath.row].registration
//        let VehicleType       = policyListArray[indexPath.row].vehicleType
//        let make              = policyListArray[indexPath.row].make
//        let model             = policyListArray[indexPath.row].model
//
//
//        UserDefaults.standard.set (name, forKey: "Name")
//        UserDefaults.standard.set(totalpremium, forKey: "totalpremium")
//        UserDefaults.standard.set(idv, forKey: "idv")
//        UserDefaults.standard.set(manufacturingYear, forKey: "manufacturingYear")
//        UserDefaults.standard.set(policyNumber, forKey: "policyNumber")
//        UserDefaults.standard.set(policyType, forKey: "policyType")
//        UserDefaults.standard.set(insCompName, forKey: "insCompName")
//        UserDefaults.standard.set(policyStartDate, forKey: "policyStartDate")
//        UserDefaults.standard.set(variant, forKey: "variant")
//        UserDefaults.standard.set(policyID, forKey: "policyID")
//        UserDefaults.standard.set(clientUserID, forKey: "clientUserID")
//        UserDefaults.standard.set(coverageDetails, forKey: "coverageDetails")
//        UserDefaults.standard.set(engineNo, forKey: "engineNo")
//        UserDefaults.standard.set(chasisNo, forKey: "chasisNo")
//        UserDefaults.standard.set(registration, forKey: "registration")
//        UserDefaults.standard.set(VehicleType, forKey: "VehicleType")
//        UserDefaults.standard.set(make, forKey: "Make")
//        UserDefaults.standard.set(model, forKey: "Model")
//
//        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "RenewalPolicyVehicleDetails_Vc") as! RenewalPolicyVehicleDetails_Vc
//              self.navigationController?.pushViewController(nextVc, animated: true)
//}
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 185
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//           return cellSpacingHeight
//       }
//
//
//}
//extension PrivateCar_Vc {
//    //MARK: - func for the get state api
//    private func getpolicy(params: Dictionary<String, String>) {
//        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
//        print(params)
//        let url = String(format:"%@",SubUrl.getPolicyList.url)
//        print(url)
//        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
//            if ((JSONResponse.dictionaryObject) != nil) {
//                let response = JSONResponse.dictionaryObject!
//                print(response)
//
//                if response["Status"] as! Bool == true || response["Status"] as! Int == 0 {
//
//                    if let data = response["objPolicyList"] as? [[String : Any]]{
//                        print(data)
//
//                        self.policyListArray = data.compactMap({policyListModel(json: JSON(rawValue: $0) ?? 0)})
//                        print(self.policyListArray.count)
//                        print(self.policyListArray)
//                        self.tbl_View.reloadData()
//                    }
//
//                } else {
//                    WarningAlert.instance.showAlert(title: "Error", message: response["Message"] as! String, imageStr: "warning_icon", color: errorColor)
//                }
//                CommonMethods.hideHud(aView: self.view)
//            }
//        }) { (error) in
//            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
//                CommonMethods.hideHud(aView: self.view)
//                WarningAlert.instance.showAlert(title: "Error", message: AlertMessage.noInternet.rawValue, imageStr: "warning_icon", color: errorColor)
//            } else {
//                CommonMethods.hideHud(aView: self.view)
//                WarningAlert.instance.showAlert(title: "Error", message: error.localizedDescription, imageStr: "warning_icon", color: errorColor)
//            }
//        }
//    }
//
//}


//    extension UIView {
//       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//            layer.mask = mask
//        }
//    }


                                         
