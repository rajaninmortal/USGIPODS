//
//  NewPolicyOldVehiclePopup_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

class NewPolicyOldVehiclePopup_Vc: UIViewController {
    
    @IBOutlet weak var main_View: UIView!
    @IBOutlet weak var vehicleInspectionDate_Txt: UITextField!
    @IBOutlet weak var vehicleInspectionTime_Txt: UITextField!
    @IBOutlet weak var continue_Btn: UIButton!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var stateBtn: UIButton!
    @IBOutlet weak var state_View: UIView!
    @IBOutlet weak var pinCode_Txt: UITextField!
    @IBOutlet weak var addressDetail_Txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.main_View.roundCorners(corners: [.topLeft,.topRight], radius: 15)
        self.cornerRadious()
        // Do any additional setup after loading the view.
    }
    //MARK: -  func fo the corner radious
    func cornerRadious(){
        self.vehicleInspectionDate_Txt.layer.cornerRadius = 20
        self.vehicleInspectionTime_Txt.layer.cornerRadius = 20
        self.cityView.layer.cornerRadius = 20
        self.state_View.layer.cornerRadius = 20
        self.pinCode_Txt.layer.cornerRadius = 20
        self.addressDetail_Txt.layer.cornerRadius = 20
        self.continue_Btn.layer.cornerRadius = 20
        self.borderWidth()
    }
    //MARK: -  func fo the border width
    func borderWidth(){
        self.vehicleInspectionDate_Txt.layer.borderWidth = 0.5
        self.vehicleInspectionTime_Txt.layer.borderWidth = 0.5
        self.cityView.layer.borderWidth = 0.5
        self.state_View.layer.borderWidth = 0.5
        self.pinCode_Txt.layer.borderWidth = 0.5
        self.addressDetail_Txt.layer.borderWidth = 0.5
        self.continue_Btn.layer.borderWidth = 0.5
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func continueAction(_ sender: Any) {
    }
    

}
