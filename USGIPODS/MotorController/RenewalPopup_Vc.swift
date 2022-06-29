//
//  RenewalPopup_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 05/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import SwiftyJSON

class renewalVehicleCell : UITableViewCell{
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

class RenewalPopup_Vc: BaseViewController {
    @IBOutlet weak  var tbl_View : UITableView!
    @IBOutlet weak  var main_View : UIView!
    
    let cellSpacingHeight: CGFloat = 10
    var policyListArray = [policyListModel]()

    override func viewDidLoad(){
        super.viewDidLoad()
        self.tbl_View.delegate  = self
        self.tbl_View.dataSource = self
        self.tbl_View.separatorStyle = .none
        self.main_View.roundCorners([.topLeft, .topRight], radius: 20.0)
        self.main_View.setShadow(shadowRadius: 20)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getpolicy(params: ["TokenNo":"D0E24719-101A-49AE-9D61-51305CF517E1",
                                "Uid": "QuylZjh9tBAutCzXpDjkTw=="])
        self.navigationController?.navigationBar.isHidden = true
       }
    @IBAction func dismissAction(_ sender: UIButton){
//        self.main_View.isHidden = true
       // self.dismiss(animated: false, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
  
}

//MARK: - extension for the tableview
extension RenewalPopup_Vc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return policyListArray.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "renewalVehicleCell") as! renewalVehicleCell
        cell.vehicleNbr_Lbl.text = policyListArray[indexPath.row].registration
        cell.vehicleBrand_Lbl.text = policyListArray[indexPath.row].brand
        cell.vehicleName_Lbl.text = policyListArray[indexPath.row].model
        cell.premiumLbl.text = policyListArray[indexPath.row].totalPremium
        cell.expiryDate_Lbl.text = policyListArray[indexPath.row].expiryDate
        cell.bg_View.layer.cornerRadius = 10
        cell.bg_View.layer.borderWidth = 0.5
        cell.bg_View.setShadow(shadowRadius: 5)
        return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name              = policyListArray[indexPath.row].name
        let totalpremium      = policyListArray[indexPath.row].premium
        let idv               = policyListArray[indexPath.row].idv
        let manufacturingYear = policyListArray[indexPath.row].manufacturingYear
        let policyNumber      = policyListArray[indexPath.row].policyNumber
        let policyType        = policyListArray[indexPath.row].policyType
        let insCompName       = policyListArray[indexPath.row].insCompName
        let policyStartDate   = policyListArray[indexPath.row].policyStartDate
        let variant           = policyListArray[indexPath.row].variant
        let policyID          = policyListArray[indexPath.row].policyID
        let clientUserID      = policyListArray[indexPath.row].clientUserID
        let coverageDetails   = policyListArray[indexPath.row].coverageDetails
        let engineNo          = policyListArray[indexPath.row].engineNo
        let chasisNo          = policyListArray[indexPath.row].chasisNo
        let registration      = policyListArray[indexPath.row].registration
        let VehicleType       = policyListArray[indexPath.row].vehicleType
        let make              = policyListArray[indexPath.row].make
        let model             = policyListArray[indexPath.row].model


        UserDefaults.standard.set (name, forKey: "Name")
        UserDefaults.standard.set(totalpremium, forKey: "totalpremium")
        UserDefaults.standard.set(idv, forKey: "idv")
        UserDefaults.standard.set(manufacturingYear, forKey: "manufacturingYear")
        UserDefaults.standard.set(policyNumber, forKey: "policyNumber")
        UserDefaults.standard.set(policyType, forKey: "policyType")
        UserDefaults.standard.set(insCompName, forKey: "insCompName")
        UserDefaults.standard.set(policyStartDate, forKey: "policyStartDate")
        UserDefaults.standard.set(variant, forKey: "variant")
        UserDefaults.standard.set(policyID, forKey: "policyID")
        UserDefaults.standard.set(clientUserID, forKey: "clientUserID")
        UserDefaults.standard.set(coverageDetails, forKey: "coverageDetails")
        UserDefaults.standard.set(engineNo, forKey: "engineNo")
        UserDefaults.standard.set(chasisNo, forKey: "chasisNo")
        UserDefaults.standard.set(registration, forKey: "RegistrationNbr")
        UserDefaults.standard.set(VehicleType, forKey: "VehicleType")
        UserDefaults.standard.set(make, forKey: "Make")
        UserDefaults.standard.set(model, forKey: "Model")

        
        let nextVc = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "RenewalPolicyVehicleDetails_Vc") as! RenewalPolicyVehicleDetails_Vc
              self.navigationController?.pushViewController(nextVc, animated: true)
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return cellSpacingHeight
       }
   

}
extension RenewalPopup_Vc {
    //MARK: - func for the get state api
    private func getpolicy(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.getPolicyList.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            if ((JSONResponse.dictionaryObject) != nil) {
                let response = JSONResponse.dictionaryObject!
                print(response)
                
                if response["Status"] as! Bool == true || response["Status"] as! Int == 0 {
                    
                    if let data = response["objPolicyList"] as? [[String : Any]]{
                        print(data)
                        
                        self.policyListArray = data.compactMap({policyListModel(json: JSON(rawValue: $0) ?? 0)})
                        print(self.policyListArray.count)
                        print(self.policyListArray)
                        self.tbl_View.reloadData()
                    }
                    
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
   
}


    extension UIView {
       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }


                                         
