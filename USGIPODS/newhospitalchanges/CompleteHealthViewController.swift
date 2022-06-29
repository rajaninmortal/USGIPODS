//
//  CompleteHealthViewController.swift
//  UniversalSompo
//
//  Created by Subesh on 15/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import UIKit
import DropDown

class CompleteHealthViewController: BaseViewController {
    
    @IBOutlet weak var nameTxt     : UITextField!
    @IBOutlet weak var mob_Txt     : UITextField!
    @IBOutlet weak var email_Txt   : UITextField!
    @IBOutlet weak var refId_Txt   : UITextField!
    @IBOutlet weak var age_Btn     :    UIButton!
    @IBOutlet weak var check_Btn   :    UIButton!
    @IBOutlet weak var getquote_Btn:    UIButton!
    @IBOutlet weak var termsConditionBtn:    UIButton!
    
    var agee = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.cornerRadious()
        self.borderWidth()
        self.padding()
        self.userdetails()
        self.attributedLine()
        //        self.pop_View.isHidden = true
    }
    //MARK: - attributed line for terms and conditions
    func attributedLine(){
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
//        termsConditionBtn.setUnderline(ofColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), andSize: 1)
    }
    
    
    //MARK: - user details from userdefaults
    func userdetails(){
//        self.nameTxt.text  = "yogesh",  // String( ProjectUtils.getUserName())
        self.mob_Txt.text  = String(describing:ProjectUtils.getMobileNo()!)
        self.email_Txt.text = String(describing: ProjectUtils.getEmailID())
    }
    //MRK:-  func for corner radious
    func cornerRadious(){
        self.nameTxt.layer.cornerRadius   = 20
        self.email_Txt.layer.cornerRadius = 20
        self.mob_Txt.layer.cornerRadius   = 20
        self.refId_Txt.layer.cornerRadius = 20
        self.age_Btn.layer.cornerRadius   = 20
        self.getquote_Btn.layer.cornerRadius = 25
    }
    func borderWidth(){
        self.nameTxt.layer.borderWidth   = 0.5
        self.mob_Txt.layer.borderWidth   = 0.5
        self.email_Txt.layer.borderWidth = 0.5
        self.refId_Txt.layer.borderWidth = 0.5
        self.age_Btn.layer.borderWidth   = 0.5
    }
    func padding(){
        self.nameTxt.setRightPaddingPoints(15)
        self.nameTxt.setLeftPaddingPoints(15)
        self.mob_Txt.setRightPaddingPoints(15)
        self.mob_Txt.setLeftPaddingPoints(15)
        self.email_Txt.setRightPaddingPoints(15)
        self.email_Txt.setLeftPaddingPoints(15)
        self.refId_Txt.setRightPaddingPoints(15)
        self.refId_Txt.setLeftPaddingPoints(15)
    }
    //MARK:- button action for all functionality
    @IBAction func dropdownbtn(_ sender: UIButton) {
        let dropDown = DropDown()
        dropDown.anchorView = (sender as? AnchorView)
        dropDown.dataSource = ["Select age","18yrs-35yrs","36yrs-35yrs","46yrs-50yrs","51yrs-55yrs"]
        dropDown.selectionAction = {[unowned self] (index: Int , item:String ) in
            self.age_Btn?.setTitle(item, for: .normal)
            self.agee  = String(item)
            print(self.agee)
            self.age_Btn?.setTitle(item, for: .normal)
        }
        dropDown.width = (sender as AnyObject).frame.width
        dropDown.show()
    }
    @IBAction func checkBtnClicked(_ sender: UIButton){
        if check_Btn.isSelected {
            check_Btn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
             } else {
                check_Btn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
             }
        check_Btn.isSelected = !check_Btn.isSelected
    }
    //MARK: - terms and Condition button action
    @IBAction func termsAndCondition(_ sender: UIButton){
        showWarning("Terms and Conditions", AlertMessage.termsCondition.rawValue)
    }
    
    //MARK: - func for the validation
    func validation(){
        if age_Btn.title(for: .normal) == "Select age" {
            alert(message: "Please select age",title: "Message")
        }else if check_Btn.isSelected == false{
            alert(message: "please select terms and conditions",title: "Message")
        }
    }
    @IBAction func getquoteBtnClicked(_ sender: UIButton){
        if age_Btn.title(for: .normal) == "Select Age" {
            alert(message: "Please select age",title: "Message")
        }else if check_Btn.isSelected == false{
            alert(message: "please select terms and conditions",title: "Message")
        }else if check_Btn.isSelected == true{
            let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "CompleteHealthCareQuotation_Vc") as! CompleteHealthCareQuotation_Vc
            
            nextVc.age =   self.agee
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
}



