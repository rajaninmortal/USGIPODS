//
//  NomineeAndOtherDetails_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 07/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit
import DropDown

class NomineeAndOtherDetails_Vc: BaseViewController,UITextFieldDelegate {
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var relation_BTn: UIButton!
    @IBOutlet var dob_Txt: UITextField!
    @IBOutlet var relation_View: UIView!
    @IBOutlet var dob_View: UIView!
    @IBOutlet var nomineeName_Txt: UITextField!
    @IBOutlet var nomineeContact_Nbr: UITextField!
    @IBOutlet var continue_Btn: UIButton!
    @IBOutlet weak var quotationId_Txt : UITextField!
    @IBOutlet weak var policy_Txt : UITextField!
    @IBOutlet weak var family_Txt : UITextField!
    @IBOutlet weak var suminsure_Txt : UITextField!
    @IBOutlet weak var policytenure_Txt : UITextField!

    let datePicker  = UIDatePicker()
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        self.createdatePickerView()
        self.dob_Txt.delegate = self
        self.policy_Txt.text  = UserDefaults.standard.string(forKey: "policytype")!
        self.family_Txt.text  = UserDefaults.standard.string(forKey: "familytype")!
        self.suminsure_Txt.text  = UserDefaults.standard.string(forKey: "suminsured")!
        self.policytenure_Txt.text = UserDefaults.standard.string(forKey: "selectyear")!
        self.totalAmountTxt.text = UserDefaults.standard.string(forKey: "totallPremium")!
        self.quotationId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")

    }
    //MARK: - func for the validation
    func validation(){
        if nomineeName_Txt.text?.count == 0{
            alert(message: "Please Enter Nominee Name", title: "Message")
        }else if dob_Txt.text?.count == 0{
            alert(message: "Please enter Nominee Date of Birth", title: "Message")
        }else if nomineeContact_Nbr.text?.count == 0{
            alert(message: "Please enter Nominee Mobile number ", title: "Message")
        }else if (nomineeContact_Nbr.text?.count ?? 0 < 10){
            alert(message: "Mobile Number Should be 10 Digit Only", title: "Message")
        }else if (nomineeContact_Nbr.text?.count ?? 0 > 10){
            alert(message: "Mobile Number Should be 10 Digit Only", title: "Message")
        }
    }
    //MARK: - func for the cornerRadious
     func cornderRadious(){
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
         self.relation_View.layer.cornerRadius = 20
         self.dob_View.layer.cornerRadius = 20
         self.nomineeName_Txt.layer.cornerRadius = 20
         self.nomineeContact_Nbr.layer.cornerRadius = 20
         self.continue_Btn.layer.cornerRadius = 20
         self.suminsuredLbl.layer.cornerRadius = 20
         self.quotationId_Txt.layer.cornerRadius = 20
         self.quotationId_Txt.setLeftPaddingPoints(15)
         self.nomineeName_Txt.setLeftPaddingPoints(15)
         self.nomineeContact_Nbr.setLeftPaddingPoints(15)
         self.family_Txt.setLeftPaddingPoints(15)
         self.policy_Txt.setLeftPaddingPoints(15)
         self.policytenure_Txt.setLeftPaddingPoints(15)
         self.suminsure_Txt.setLeftPaddingPoints(15)
         self.totalAmountTxt.setLeftPaddingPoints(15)

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
         self.relation_View.layer.borderWidth = 0.5
         self.dob_View.layer.borderWidth = 0.5
         self.nomineeName_Txt.layer.borderWidth = 0.5
         self.nomineeContact_Nbr.layer.borderWidth = 0.5
         self.suminsuredLbl.layer.borderWidth = 0.5
         self.quotationId_Txt.layer.borderWidth = 0.5
     }
    func createdatePickerView() {
        var dateFormatter = DateFormatter()

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        dob_Txt.inputView = datePicker

       }
    @objc func donePressed() {
       
        self.dob_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
       }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == self.dob_Txt{
            self.dob_Txt.text = "\(datePicker.date.dateInYyyyMmDdSs())"
        let selectDateeeeee = datePicker.date.dateInYyyyMmDdSs()
        let formetter = DateFormatter()
        formetter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/YYYY"
        let date = formatter.date(from: selectDateeeeee)
        let datee =   date
       }
       }
    //MARK: - show breakup Action
    @IBAction func showBreakupAction(_ sender:UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PopUp_ViewController") as! PopUp_ViewController
        self.present(nextVc, animated: true, completion: nil)
    }
    //MARK: - policy time  type button action
    @IBAction func relationAction(_ sender: Any) {
          let dropDown = DropDown()
        dropDown.anchorView = (sender as! AnchorView)
        dropDown.direction = .bottom
          dropDown.dataSource = ["Spouse","Son","Daughter in law","Son in law","Mother","Father","Father in law","Brother","Sister","Daughter","Grand Father","Grand Mother","Grand Son","Grand Daughter","Legal Heir"]
          dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              self.relation_BTn.setTitle(item, for: .normal)
          }
          dropDown.width = (sender as AnyObject).frame.width
          dropDown.show()
          }
    @IBAction func continueAction(){
        self.validation()
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PaymentSuperHealthCare_Vc") as! PaymentSuperHealthCare_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
    }

}
