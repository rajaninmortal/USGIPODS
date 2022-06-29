//
//  MedicalArogyaSanjeevani_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import UIKit

class MedicalArogyaSanjeevani_Vc: UIViewController {
    @IBOutlet var policytypeView : UIView!
    @IBOutlet var familyTypeView : UIView!
    @IBOutlet var suminsuredView : UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var totalAmountTxt : UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet weak var policyTypeTxt: UITextField!
    @IBOutlet var quatationId: UITextField!
    @IBOutlet weak var familyTypeTxt: UITextField!
    @IBOutlet weak var policyTenurTxt: UITextField!
    @IBOutlet weak var sumInsuredTxt: UITextField!
    @IBOutlet weak var select_Lbl: UILabel!
    @IBOutlet weak var selectdetails_View: UIView!
    @IBOutlet weak var continue_Btn: UIButton!
    @IBOutlet weak var plusBtn_view: UIView!
    @IBOutlet weak var selectData_View: UIView!
    @IBOutlet weak var selecttion_Lbl: UILabel!
    @IBOutlet weak var rs_Txt: UITextField!
    @IBOutlet weak var rsDetail_Txt: UITextField!
    @IBOutlet weak var continuee_Btn: UIButton!
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()

        // Do any additional setup after loading the view.
    }
    //MARK: - func for the corner Radious
    func cornerRadious(){
        self.selectdetails_View.layer.cornerRadius = 20
        self.continue_Btn.layer.cornerRadius = 20
        self.plusBtn_view.layer.cornerRadius = 20
        self.selectData_View.layer.cornerRadius = 20
        self.rs_Txt.layer.cornerRadius = 20
        self.rsDetail_Txt.layer.cornerRadius = 20
        self.continuee_Btn.layer.cornerRadius = 20
        self.policytypeView .layer.cornerRadius = 20
        self.familyTypeView .layer.cornerRadius = 20
        self.suminsuredView .layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt .layer.cornerRadius = 20
        self.quatationId.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.borderWidth()
        self.txtPadding()
    }
    //MARK: - func for the border width
    func borderWidth(){
        self.selectdetails_View.layer.borderWidth = 0.5
        self.plusBtn_view.layer.borderWidth = 0.5
        self.selectData_View.layer.borderWidth = 0.5
        self.rs_Txt.layer.borderWidth = 0.5
        self.rsDetail_Txt.layer.borderWidth = 0.5
        self.policytypeView .layer.borderWidth = 0.5
        self.familyTypeView .layer.borderWidth = 0.5
        self.suminsuredView .layer.borderWidth = 0.5
        self.policytenurView.layer.borderWidth = 0.5
        self.totalAmountTxt .layer.borderWidth = 0.5
        self.quatationId.layer.borderWidth = 0.5
        self.totalLbl.layer.borderWidth = 0.5
        self.suminsuredLbl.layer.borderWidth = 0.5
    }
//MARK: - padding for the text field
    func txtPadding(){
        self.policyTypeTxt.setLeftPaddingPoints(15)
        self.familyTypeTxt.setLeftPaddingPoints(15)
        self.sumInsuredTxt.setLeftPaddingPoints(15)
        self.policyTenurTxt.setLeftPaddingPoints(15)
        self.totalAmountTxt.setLeftPaddingPoints(15)
        self.quatationId.setLeftPaddingPoints(15)

    }
//MARK: -  continue button action
    @IBAction func continueAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PaymentlArogyaSanjeevani_Vc") as! PaymentlArogyaSanjeevani_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }

    @IBAction func plusAction(_ sender: Any) {
    }
}
