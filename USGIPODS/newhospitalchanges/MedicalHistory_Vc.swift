//
//  MedicalHistory_Vc.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/02/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import UIKit

//protocol CustomTableViewCellDelegate {
//    func didToggleRadioButton(_ indexPath: IndexPath)
//}
//
//class medicalHistoryCell : UITableViewCell{
//
//
//
//    //    override func awakeFromNib() {
//    //           super.awakeFromNib()
//    //        self.detail_Lbl.
//    //       }
//
//
//}

class MedicalHistory_Vc: BaseViewController {
    @IBOutlet weak var tableview : UITableView!
    @IBOutlet var policytypeView: UIView!
    @IBOutlet var familyTypeView: UIView!
    @IBOutlet var suminsuredView: UIView!
    @IBOutlet var policytenurView: UIView!
    @IBOutlet var familyBtn: UIButton!
    @IBOutlet var totalAmountTxt: UITextField!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var suminsuredLbl: UILabel!
    @IBOutlet var showBrekupBtn: UIButton!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var check_Btn: UIButton!
    @IBOutlet var policyTyep_Txt: UITextField!
    @IBOutlet var familyType_Txt: UITextField!
    @IBOutlet var suminsured_Txt: UITextField!
    @IBOutlet var policytenure_Txt: UITextField!
    @IBOutlet var quotationId_Txt: UITextField!
    @IBOutlet weak var fAbloodSugar_Txt         : UITextField!
    @IBOutlet weak var fAbloodpressure_Txt      : UITextField!
    @IBOutlet weak var fAbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var fAcholostral_Txt         : UITextField!
    @IBOutlet weak var fA_View : UIView!
    
    @IBOutlet weak var sANs_View: NSLayoutConstraint!
    @IBOutlet weak var sAbloodSugar_Txt         : UITextField!
    @IBOutlet weak var sAbloodpressure_Txt      : UITextField!
    @IBOutlet weak var sAbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var sAcholostral_Txt         : UITextField!
    @IBOutlet weak var sA_View : UIView!
    @IBOutlet weak var fCNs_View: NSLayoutConstraint!
    
    @IBOutlet weak var fCbloodSugar_Txt         : UITextField!
    @IBOutlet weak var fCbloodpressure_Txt      : UITextField!
    @IBOutlet weak var fCbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var fCcholostral_Txt         : UITextField!
    @IBOutlet weak var fC_View : UIView!
    @IBOutlet weak var sCbloodSugar_Txt         : UITextField!
    @IBOutlet weak var sCbloodpressure_Txt      : UITextField!
    @IBOutlet weak var sCbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var sCcholostral_Txt         : UITextField!
    @IBOutlet weak var sC_View : UIView!
    @IBOutlet weak var scNs_View: NSLayoutConstraint!
    @IBOutlet weak var tCbloodSugar_Txt         : UITextField!
    @IBOutlet weak var tCbloodpressure_Txt      : UITextField!
    @IBOutlet weak var tCbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var tCcholostral_Txt         : UITextField!
    @IBOutlet weak var tC_View : UIView!
    @IBOutlet weak var tcNs_View: NSLayoutConstraint!
    @IBOutlet weak var frCbloodSugar_Txt         : UITextField!
    @IBOutlet weak var frCbloodpressure_Txt      : UITextField!
    @IBOutlet weak var frCbloodsugarPressure_Txt : UITextField!
    @IBOutlet weak var frCcholostral_Txt         : UITextField!
    @IBOutlet weak var frCNs_View: NSLayoutConstraint!
    @IBOutlet weak var frC_View : UIView!
    @IBOutlet weak var  adjustable_View    :UIView!
    
    
    var TitleBtn = String()
    var bloodSugar = String()
    var bloodpressure = String()
    var bloodsugarPressure = String()
    var cholostral  = String()
    
    var fAbloodSugar         = String()
    var fAbloodpressure      = String()
    var fAbloodsugarPressure = String()
    var fAcholostral         = String()
    var sAbloodSugar         = String()
    var sAbloodpressure      = String()
    var sAbloodsugarPressure = String()
    var sAcholostral         = String()
    var fCbloodSugar         = String()
    var fCbloodpressure      = String()
    var fCbloodsugarPressure = String()
    var fCcholostral         = String()
    var sCbloodSugar         = String()
    var sCbloodpressure      = String()
    var sCbloodsugarPressure = String()
    var sCcholostral         = String()
    var tCbloodSugar         = String()
    var tCbloodpressure      = String()
    var tCbloodsugarPressure = String()
    var tCcholostral         = String()
    var frCbloodSugar         = String()
    var frCbloodpressure      = String()
    var frCbloodsugarPressure = String()
    var frCcholostral         = String()
    
    var count = String()
    var selectedIndex = 0
    var alertMsgArr = ["Adult","Child"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornderRadious()
        //  self.hideView()
        self.policyTyep_Txt.text  = UserDefaults.standard.string(forKey: "policytype")!
        self.familyType_Txt.text  = UserDefaults.standard.string(forKey: "familytype")!
        self.suminsured_Txt.text  = UserDefaults.standard.string(forKey: "suminsured")!
        self.policytenure_Txt.text = UserDefaults.standard.string(forKey: "selectyear")!
        self.totalAmountTxt.text = UserDefaults.standard.string(forKey: "totallPremium")!
//        self.quotationId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")!
        self.TitleBtn            = UserDefaults.standard.string( forKey: "familytype")!
        //Bool
        self.quotationId_Txt.text = UserDefaults.standard.string(forKey: "quotationid")!

        self.familyFloater()

        
        //
        //        self.totalAmountTxt = UserDefaults.standard.string(forKey: "totalamount") as? UITextField
        // Do any additional setup after loading the view.
    }
    func saveData(){
        self.fAbloodSugar          = self.fAbloodSugar_Txt.text ?? ""
//        self.count    =     self.fAbloodSugar_Txt.text ?? ""
        self.fAbloodpressure       = self.fAbloodpressure_Txt.text ?? ""
        self.fAbloodsugarPressure  = self.fAbloodsugarPressure_Txt .text ?? ""
        self.fAcholostral          = self.fAcholostral_Txt.text ?? ""
        self.sAbloodSugar          = self.sAbloodSugar_Txt.text ?? ""
        self.sAbloodpressure       = self.sAbloodpressure_Txt.text ?? ""
        self.sAbloodsugarPressure  = self.sAbloodsugarPressure_Txt.text ?? ""
        self.sAcholostral          = self.sAcholostral_Txt.text ?? ""
        self.fCbloodSugar          = self.fCbloodSugar_Txt .text ?? ""
        self.fCbloodpressure       = self.fCbloodpressure_Txt.text ?? ""
        self.fCbloodsugarPressure  = self.fCbloodsugarPressure_Txt .text ?? ""
        self.fCcholostral          = self.fCcholostral_Txt.text ?? ""
        self.sCbloodSugar          = self.sCbloodSugar_Txt.text ?? ""
        self.sCbloodpressure       = self.sCbloodpressure_Txt.text ?? ""
        self.sCbloodsugarPressure  = self.sCbloodsugarPressure_Txt.text ?? ""
        self.sCcholostral          = self.sCcholostral_Txt.text ?? ""
        self.tCbloodSugar          = self.tCbloodSugar_Txt.text ?? ""
        self.tCbloodpressure       = self.tCbloodpressure_Txt.text ?? ""
        self.tCbloodsugarPressure  = self.tCbloodsugarPressure_Txt .text ?? ""
        self.tCcholostral          = self.tCcholostral_Txt.text ?? ""
        self.frCbloodSugar         = self.frCbloodSugar_Txt.text ?? ""
        self.frCbloodpressure      = self.frCbloodpressure_Txt.text ?? ""
        self.frCbloodsugarPressure = self.frCbloodsugarPressure_Txt.text ?? ""
        self.frCcholostral         = self.frCcholostral_Txt.text ?? ""
     UserDefaults.standard.set(self.fAbloodSugar, forKey: "fAbloodSugar")
     UserDefaults.standard.set(self.fAbloodpressure      , forKey: "fAbloodpressure")
     UserDefaults.standard.set(self.fAbloodsugarPressure , forKey: "fAbloodsugarPressure")
     UserDefaults.standard.set(self.fAcholostral         , forKey: "fAcholostral")
     UserDefaults.standard.set(self.sAbloodSugar         , forKey: "sAbloodSugar")
     UserDefaults.standard.set(self.sAbloodpressure      , forKey: "sAbloodpressure")
     UserDefaults.standard.set(self.sAbloodsugarPressure , forKey: "sAbloodsugarPressure")
     UserDefaults.standard.set(self.sAcholostral         , forKey: "sAcholostral")
     UserDefaults.standard.set(self.fCbloodSugar         , forKey: "fCbloodSugar")
     UserDefaults.standard.set(self.fCbloodpressure      , forKey: "fCbloodpressure")
     UserDefaults.standard.set(self.fCbloodsugarPressure , forKey: "fCbloodsugarPressure")
     UserDefaults.standard.set(self.fCcholostral         , forKey: "fCcholostral")
     UserDefaults.standard.set(self.sCbloodSugar         , forKey: "sCbloodSugar")
     UserDefaults.standard.set(self.sCbloodpressure      , forKey: "sCbloodpressure")
     UserDefaults.standard.set(self.sCbloodsugarPressure , forKey: "sCbloodsugarPressure")
     UserDefaults.standard.set(self.sCcholostral         , forKey: "sCcholostral")
     UserDefaults.standard.set(self.tCbloodSugar         , forKey: "tCbloodSugar")
     UserDefaults.standard.set(self.tCbloodpressure      , forKey: "tCbloodpressure")
     UserDefaults.standard.set(self.tCbloodsugarPressure , forKey: "tCbloodsugarPressure")
     UserDefaults.standard.set(self.tCcholostral         , forKey: "tCcholostral")
     UserDefaults.standard.set(self.frCbloodSugar        , forKey: "frCbloodSugar")
     UserDefaults.standard.set(self.frCbloodpressure     , forKey: "frCbloodpressure")
     UserDefaults.standard.set(self.frCbloodsugarPressure, forKey: "frCbloodsugarPressure")
     UserDefaults.standard.set(self.frCcholostral        , forKey: "frCcholostral")
    }
    func hideView(){
        //        self.fA_View.isHidden  = true
        self.sA_View.isHidden  = true
        self.sANs_View.constant = 0
        self.fC_View.isHidden  = true
        self.fCNs_View.constant = 0
        self.sC_View.isHidden  = true
        self.scNs_View.constant = 0
        self.tC_View.isHidden  = true
        self.tcNs_View.constant = 0
        self.frC_View.isHidden = true
        self.frCNs_View.constant = 0
    }
    //MARK: - func for the cornerRadious
    func cornderRadious(){
        self.policytypeView.layer.cornerRadius = 20
        self.familyTypeView.layer.cornerRadius = 20
        self.suminsuredView.layer.cornerRadius = 20
        self.policytenurView.layer.cornerRadius = 20
        self.totalAmountTxt.layer.cornerRadius = 20
        self.totalLbl.layer.cornerRadius = 20
        self.suminsuredLbl.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.policytenure_Txt.layer.cornerRadius = 20
        self.policyTyep_Txt.layer.cornerRadius = 20
        self.familyType_Txt.layer.cornerRadius = 20
        self.suminsured_Txt.layer.cornerRadius = 20
        self.quotationId_Txt.layer.cornerRadius = 20
        self.fAbloodSugar_Txt         .layer.cornerRadius = 20
        self.fAbloodpressure_Txt      .layer.cornerRadius = 20
        self.fAbloodsugarPressure_Txt .layer.cornerRadius = 20
        self.fAcholostral_Txt         .layer.cornerRadius = 20
        self.sAbloodSugar_Txt         .layer.cornerRadius = 20
        self.sAbloodpressure_Txt      .layer.cornerRadius = 20
        self.sAbloodsugarPressure_Txt .layer.cornerRadius = 20
        self.sAcholostral_Txt         .layer.cornerRadius = 20
        self.fCbloodSugar_Txt         .layer.cornerRadius = 20
        self.fCbloodpressure_Txt      .layer.cornerRadius = 20
        self.fCbloodsugarPressure_Txt .layer.cornerRadius = 20
        self.fCcholostral_Txt         .layer.cornerRadius = 20
        self.sCbloodSugar_Txt         .layer.cornerRadius = 20
        self.sCbloodpressure_Txt      .layer.cornerRadius = 20
        self.sCbloodsugarPressure_Txt .layer.cornerRadius = 20
        self.sCcholostral_Txt         .layer.cornerRadius = 20
        self.tCbloodSugar_Txt         .layer.cornerRadius = 20
        self.tCbloodpressure_Txt      .layer.cornerRadius = 20
        self.tCbloodsugarPressure_Txt .layer.cornerRadius = 20
        self.tCcholostral_Txt         .layer.cornerRadius = 20
        self.frCbloodSugar_Txt        .layer.cornerRadius = 20
        self.frCbloodpressure_Txt     .layer.cornerRadius = 20
        self.frCbloodsugarPressure_Txt.layer.cornerRadius = 20
        self.frCcholostral_Txt        .layer.cornerRadius = 20
        self.fAbloodSugar_Txt         .layer.cornerRadius = 20
        self.fAbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.fAbloodpressure_Txt      .setLeftPaddingPoints(15)
        self.fAbloodsugarPressure_Txt .setLeftPaddingPoints(15)
        self.fAcholostral_Txt         .setLeftPaddingPoints(15)
        self.sAbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.sAbloodpressure_Txt      .setLeftPaddingPoints(15)
        self.sAbloodsugarPressure_Txt .setLeftPaddingPoints(15)
        self.sAcholostral_Txt         .setLeftPaddingPoints(15)
        self.fCbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.fCbloodpressure_Txt      .setLeftPaddingPoints(15)
        self.fCbloodsugarPressure_Txt .setLeftPaddingPoints(15)
        self.fCcholostral_Txt         .setLeftPaddingPoints(15)
        self.sCbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.sCbloodpressure_Txt      .setLeftPaddingPoints(15)
        self.sCbloodsugarPressure_Txt .setLeftPaddingPoints(15)
        self.sCcholostral_Txt         .setLeftPaddingPoints(15)
        self.tCbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.tCbloodpressure_Txt      .setLeftPaddingPoints(15)
        self.tCbloodsugarPressure_Txt .setLeftPaddingPoints(15)
        self.tCcholostral_Txt         .setLeftPaddingPoints(15)
        self.frCbloodSugar_Txt        .setLeftPaddingPoints(15)
        self.frCbloodpressure_Txt     .setLeftPaddingPoints(15)
        self.frCbloodsugarPressure_Txt.setLeftPaddingPoints(15)
        self.frCcholostral_Txt        .setLeftPaddingPoints(15)
        self.fAbloodSugar_Txt         .setLeftPaddingPoints(15)
        self.quotationId_Txt.setLeftPaddingPoints(15)
        self.totalAmountTxt.setLeftPaddingPoints(15)
        self.policytenure_Txt.setLeftPaddingPoints(15)
        self.policyTyep_Txt.setLeftPaddingPoints(15)
        self.familyType_Txt.setLeftPaddingPoints(15)
        self.suminsured_Txt.setLeftPaddingPoints(15)
        self.policyTyep_Txt.isUserInteractionEnabled = false
        self.familyType_Txt.isUserInteractionEnabled = false
        self.suminsured_Txt.isUserInteractionEnabled = false
        self.suminsured_Txt.isUserInteractionEnabled = false
        self.policytenure_Txt.isUserInteractionEnabled = false
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
        self.continueBtn.layer.borderWidth = 0.5
        self.quotationId_Txt.layer.borderWidth = 0.5
        self.fAbloodSugar_Txt.layer.borderWidth = 0.5
        self.fAbloodpressure_Txt.layer.borderWidth = 0.5
        self.fAbloodsugarPressure_Txt.layer.borderWidth = 0.5
        self.fAcholostral_Txt.layer.borderWidth = 0.5
        self.sAbloodSugar_Txt.layer.borderWidth = 0.5
        self.sAbloodpressure_Txt.layer.borderWidth = 0.5
        self.sAbloodsugarPressure_Txt.layer.borderWidth = 0.5
        self.sAcholostral_Txt.layer.borderWidth = 0.5
        self.fCbloodSugar_Txt.layer.borderWidth = 0.5
        self.fCbloodpressure_Txt.layer.borderWidth = 0.5
        self.fCbloodsugarPressure_Txt .layer.borderWidth = 0.5
        self.fCcholostral_Txt.layer.borderWidth = 0.5
        self.sCbloodSugar_Txt.layer.borderWidth = 0.5
        self.sCbloodpressure_Txt.layer.borderWidth = 0.5
        self.sCbloodsugarPressure_Txt.layer.borderWidth = 0.5
        self.sCcholostral_Txt.layer.borderWidth = 0.5
        self.tCbloodSugar_Txt.layer.borderWidth = 0.5
        self.tCbloodpressure_Txt.layer.borderWidth = 0.5
        self.tCbloodsugarPressure_Txt .layer.borderWidth = 0.5
        self.tCcholostral_Txt.layer.borderWidth = 0.5
        self.frCbloodSugar_Txt.layer.borderWidth = 0.5
        self.frCbloodpressure_Txt.layer.borderWidth = 0.5
        self.frCbloodsugarPressure_Txt.layer.borderWidth = 0.5
        self.frCcholostral_Txt.layer.borderWidth = 0.5
        self.fAbloodSugar_Txt.layer.borderWidth = 0.5
    }
    @IBAction func continueAction(_ sender:UIButton){
        self.saveData()
        self.validation()
        if check_Btn.isSelected == false{
            self.nextVc()
            self.celldata()
        }else if check_Btn.isSelected == true{
        }
    }
    @IBAction func checkBtnClicked(_ sender: UIButton){
        if check_Btn.isSelected {
            check_Btn.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            //            self.nextVc()
        } else {
            check_Btn.setBackgroundImage(UIImage(named: "checked"), for:.normal)
            alert(message: "Due to pre existing dieseases You can't proceed further", title: "Messase")
        }
        check_Btn.isSelected = !check_Btn.isSelected
    }
    //MARK: - func foe the next Vc
    func nextVc (){
        let nextvc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PersonalHabits_Vc") as! PersonalHabits_Vc
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    //MARK: - save data
    func celldata(){
        UserDefaults.standard.set(self.bloodSugar, forKey: "bloodSugar")
        UserDefaults.standard.set(self.bloodpressure, forKey: "bloodpressure")
        UserDefaults.standard.set(self.bloodsugarPressure, forKey: "bloodsugarPressure")
        UserDefaults.standard.set(self.cholostral, forKey: "cholostral")
        
    }
    //MARK: - family type button action
    func familyFloater(){
        if TitleBtn == "1 Adult"{
            self.adjustable_View.frame.size.height = 1200
            self.sA_View.isHidden  = true
            self.sANs_View.constant = 0
            self.fC_View.isHidden  = true
            self.fCNs_View.constant = 0
            self.sC_View.isHidden  = true
            self.scNs_View.constant = 0
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "2 Adult"{
            self.adjustable_View.frame.size.height = 1700
            // self.fA_View.isHidden  = false
  //            self.sA_View.isHidden  = false
//            self.sANs_View.constant = 509
            self.fC_View.isHidden  = true
            self.fCNs_View.constant = 0
            self.sC_View.isHidden  = true
            self.scNs_View.constant = 0
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else  if TitleBtn == "1 Adult + 1 Child"{
            self.adjustable_View.frame.size.height = 1700
//            self.fA_View.isHidden  = true
            self.sA_View.isHidden  = true
            self.sANs_View.constant = 0
//            self.fC_View.isHidden  = true
//            self.fCNs_View.constant = 0
            self.sC_View.isHidden  = true
            self.scNs_View.constant = 0
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "1 Adult + 2 Child"{
            self.adjustable_View.frame.size.height = 2200
//            self.fA_View.isHidden  = true
            self.sA_View.isHidden  = true
            self.sANs_View.constant = 0
//            self.fC_View.isHidden  = true
//            self.fCNs_View.constant = 0
//            self.sC_View.isHidden  = true
//            self.scNs_View.constant = 0
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "1 Adult + 3 Child" {
            self.adjustable_View.frame.size.height = 2700
//            self.fA_View.isHidden  = true
            self.sA_View.isHidden  = true
            self.sANs_View.constant = 0
//            self.fC_View.isHidden  = true
//            self.fCNs_View.constant = 0
//            self.sC_View.isHidden  = true
//            self.scNs_View.constant = 0
//            self.tC_View.isHidden  = true
//            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 1 Child"{
            self.adjustable_View.frame.size.height = 2200
//            self.fA_View.isHidden  = true
//            self.sA_View.isHidden  = true
//            self.sANs_View.constant = 509
//            self.fC_View.isHidden  = false
//            self.fCNs_View.constant = 506
            self.sC_View.isHidden  = true
            self.scNs_View.constant = 0
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 2 Child"{
            self.adjustable_View.frame.size.height = 2700
            //                self.fA_View.isHidden  = true
//            self.sA_View.isHidden  = false
//            self.sANs_View.constant = 509
//            self.fC_View.isHidden  = false
//            self.fCNs_View.constant = 506
//            self.sC_View.isHidden  = false
//            self.scNs_View.constant = 506
            self.tC_View.isHidden  = true
            self.tcNs_View.constant = 0
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 0
        }else if TitleBtn == "2 Adult + 3 Child" {
            self.adjustable_View.frame.size.height = 3200
            //                self.fA_View.isHidden  = false
//            self.sA_View.isHidden  = false
//            self.sANs_View.constant = 509
//            self.fC_View.isHidden  = false
//            self.fCNs_View.constant = 506
//            self.sC_View.isHidden  = false
//            self.scNs_View.constant = 506
//            self.tC_View.isHidden  = false
           // self.tcNs_View.constant = 506
            self.frC_View.isHidden = true
            self.frCNs_View.constant = 506
        }else if TitleBtn == "2 Adult + 4 Child" {
            self.adjustable_View.frame.size.height = 3800
//            self.fA_View.isHidden  = true
//            self.sA_View.isHidden  = false
//            self.sANs_View.constant = 509
//            self.fC_View.isHidden  = false
//            self.fCNs_View.constant = 506
//            self.sC_View.isHidden  = false
//            self.scNs_View.constant = 506
//            self.tC_View.isHidden  = false
//            self.tcNs_View.constant = 506
//            self.frC_View.isHidden = false
//            self.frCNs_View.constant = 506
        }
    }
    
func firstAdultPressureValidation(){
    if Int(self.fAbloodSugar)!  <= 70 &&  Int(self.fAbloodSugar)! <= 99 {
        alert(message: "please enter first Adult valid blood sugar", title: "Message")
    }else if Int(self.fAbloodpressure)! <= 90 && Int(self.fAbloodpressure)! <= 129 {
        alert(message: "please enter first Adult valid blood Pressure", title: "Message")
    }else if Int(self.fAbloodsugarPressure)! <= 60 && Int(self.fAbloodsugarPressure)! <= 79 {
        alert(message: "please enter first Adult valid blood Pressure Sugar", title: "Message")
    }else if Int(self.fAcholostral)! <= 150 && Int(self.fAcholostral)! <= 199 {
        alert(message: "please enter first Adult valid Cholestrol", title: "Message")
    }else{
        print("Check all calculation")
    }
    }
//MARK: - second Adult pressure  validation
    func secondAdultPressureValidation(){
        if Int(self.sAbloodSugar)!  <= 70 &&  Int(self.sAbloodSugar)! <= 99 {
            alert(message: "please enter Second Adult valid blood sugar", title: "Message")
        }else if Int(self.sAbloodpressure)! <= 90 && Int(self.sAbloodpressure)! <= 129 {
            alert(message: "please enter Second Adult valid blood Pressure", title: "Message")
        }else if Int(self.sAbloodsugarPressure)! <= 60 && Int(self.sAbloodsugarPressure)! <= 79 {
            alert(message: "please enter Second Adult valid blood Pressure Sugar", title: "Message")
        }else if Int(self.sAcholostral)! <= 150 && Int(self.sAcholostral)! <= 199 {
            alert(message: "please enter Second Adult valid Cholestrol", title: "Message")
        }else{
            print("Check all calculation")
        }
    }
    //MARK: - irst Child pressure validation
    func firstChildPressureValidation(){
        if Int(self.fCbloodSugar)!  <= 70 &&  Int(self.fCbloodSugar)! <= 99 {
            alert(message: "please enter First Child valid blood sugar", title: "Message")
        }else if Int(self.fCbloodpressure)! <= 90 && Int(self.fCbloodpressure)! <= 129 {
            alert(message: "please enter First Child valid blood Pressure", title: "Message")
        }else if Int(self.fCbloodsugarPressure)! <= 60 && Int(self.fCbloodsugarPressure)! <= 79 {
            alert(message: "please enter First Child valid blood Pressure Sugar", title: "Message")
        }else if Int(self.fCcholostral)! <= 150 && Int(self.fCcholostral)! <= 199 {
            alert(message: "please enter First Child valid Cholestrol", title: "Message")
        }else{
            print("Check all calculation")
        }
    }
    //MARK: - second child pressure validation
    func seconChildPressureValidation(){
        if Int(self.sCbloodSugar)!  <= 70 &&  Int(self.sCbloodSugar)! <= 99 {
            alert(message: "please enter Second Child valid blood sugar", title: "Message")
        }else if Int(self.sCbloodpressure)! <= 90 && Int(self.sCbloodpressure)! <= 129 {
            alert(message: "please enter Second Child valid blood Pressure", title: "Message")
        }else if Int(self.sCbloodsugarPressure)! <= 60 && Int(self.sCbloodsugarPressure)! <= 79 {
            alert(message: "please enter Second Child valid blood Pressure Sugar", title: "Message")
        }else if Int(self.sCcholostral)! <= 150 && Int(self.sCcholostral)! <= 199 {
            alert(message: "please enter Second Child valid Cholestrol", title: "Message")
        }else{
            print("Check all calculation")
        }
    }
    //MARK: - third child pressure validation
    func thirdChildPressureValidation(){
        if Int(self.tCbloodSugar)!  <= 70 &&  Int(self.tCbloodSugar)! <= 99 {
            alert(message: "please enter Third Child valid blood sugar", title: "Message")
        }else if Int(self.tCbloodpressure)! <= 90 && Int(self.tCbloodpressure)! <= 129 {
            alert(message: "please enter Third Child valid blood Pressure", title: "Message")
        }else if Int(self.tCbloodsugarPressure)! <= 60 && Int(self.tCbloodsugarPressure)! <= 79 {
            alert(message: "please enter Third Child valid blood Pressure Sugar", title: "Message")
        }else if Int(self.tCcholostral)! <= 150 && Int(self.tCcholostral)! <= 199 {
            alert(message: "please enter Third Child valid Cholestrol", title: "Message")
        }else{
            print("Check all calculation")
        }
    }
    //MARK: - func fourth child pressure validation
    func fourthChildPressureValidation(){
        if Int(self.frCbloodSugar)!  <= 70 &&  Int(self.frCbloodSugar)! <= 99 {
            alert(message: "please enter Third Child valid blood sugar", title: "Message")
        }else if Int(self.frCbloodpressure)! <= 90 && Int(self.frCbloodpressure)! <= 129 {
            alert(message: "please enter Third Child valid blood Pressure", title: "Message")
        }else if Int(self.frCbloodsugarPressure)! <= 60 && Int(self.frCbloodsugarPressure)! <= 79 {
            alert(message: "please enter Third Child valid blood Pressure Sugar", title: "Message")
        }else if Int(self.frCcholostral)! <= 150 && Int(self.frCcholostral)! <= 199 {
            alert(message: "please enter Third Child valid Cholestrol", title: "Message")
        }else{
            print("Check all calculation")
        }
    }
    
    
    //MARK: - validati0on for the first Adultdetails
    func validationFirstAdult (){
        if fAbloodSugar_Txt.text?.count == 0{
            alert(message: "Please Enter First Adult Blood Sugar",title: "Message")
        }else if fAbloodpressure_Txt.text?.count == 0{
            alert(message: "Please Enter First Adult Blood Pressure",title: "Message")
        }else if fAbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please Enter First Adult Blood Sugar Pressure",title: "Message")
        }else if fAcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter First Adult cholostral", title: "Message")
        }else{
            self.firstAdultPressureValidation()
        
        }
        }
 //MARK: - validati0on for the spouses details
    func validationSpouses(){
        if sAbloodSugar_Txt.text?.count == 0{
            alert(message: "Please Enter Second Adult Blood Sugar",title: "Message")
        }else if sAbloodpressure_Txt.text?.count == 0{
         alert(message: "Please Enter Second Adult Blood Pressure",title: "Message")
        }else if sAbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please Enter Second Adult Blood Sugar Pressure",title: "Message")
        } else if sAcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter Second Adult cholostral", title: "Message")
        }else{
            self.secondAdultPressureValidation()
        }
    }
    //MARK: - validati0on for the first Child details
    func validationFirstChild (){
        if fCbloodSugar_Txt.text?.count == 0{
            alert(message: "Please Enter First Child Blood Sugar",title: "Message")
        }else if fCbloodpressure_Txt.text?.count == 0{
            alert(message: "Please Enter First Child Blood Pressure",title: "Message")
        }else if fCbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please Enter First Child Blood Sugar Pressure",title: "Message")
        }else if fCcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter First Child cholostral", title: "Message")
        }else{
            self.firstChildPressureValidation()
        }
        }
    //MARK: - validati0on for the second Child details
    func validationSecondChild (){
        if sCbloodSugar_Txt.text?.count == 0{
            alert(message: "Please enter second Child Blood Sugar",title: "Message")
        }else if sCbloodpressure_Txt.text?.count == 0{
            alert(message: "Please enter Second Child Blood Pressure",title: "Message")
        }else if sCbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please enter Second Child Blood Sugar Pressure",title: "Message")
        } else if sCcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter Second Child cholostral", title: "Message")
        }else{
            self.seconChildPressureValidation()
        }
        }
    //MARK: - validati0on for the third Child details
    func validationthirdChild (){
        if tCbloodSugar_Txt.text?.count == 0{
            alert(message: "Please enter Third Child Blood Sugar",title: "Message")
        }else if tCbloodpressure_Txt.text?.count == 0{
            alert(message: "Please enter Third Child Blood Pressure",title: "Message")
        }else if tCbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please enter Third Child Blood Sugar Pressure",title: "Message")
        } else if tCcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter Third Child cholostral", title: "Message")
        }else{
            self.thirdChildPressureValidation()
        }
        }
    //MARK: - validati0on for the four Child details
    func validationFourthChild (){
        if frCbloodSugar_Txt.text?.count == 0{
            alert(message: "Please enter Fourth Child Blood Sugar",title: "Message")
        }else if frCbloodpressure_Txt.text?.count == 0{
            alert(message: "Please enter Fourth Child Blood Pressure",title: "Message")
        }else if frCbloodsugarPressure_Txt.text?.count == 0{
            alert(message: "Please enter Fourth Child Blood Sugar Pressure",title: "Message")
        } else if frCcholostral_Txt.text?.count == 0{
            alert(message: "Please Enter Fourth Child cholostral", title: "Message")
        }else{
            self.fourthChildPressureValidation()
        }
        }
    //MARK: - success validation
    func validation(){
        if TitleBtn == "1 Adult"{
            self.validationFirstAdult()
        }else if TitleBtn == "2 Adult"{
            self.validationFirstAdult()
            self.validationSpouses()
           // self.cal()
        }else if TitleBtn == "1 Adult + 1 Child"{
            self.validationFirstAdult()
            self.validationFirstChild()
            
        }else if TitleBtn == "1 Adult + 2  Child" {
            self.validationFirstAdult()
            self.validationFirstChild()
            self.validationSecondChild()
           
        }else if TitleBtn == "1 Adult + 3 Child"{
            self.validationFirstAdult()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()
           
        }else if TitleBtn == "2 Adult + 1 Child"{
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
           
        }else if TitleBtn == "2 Adult + 2 Child"{
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()
           
        }else if TitleBtn == "2 Adult + 3 Child"{
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()
           
        }else if TitleBtn == "2 Adult + 4 Child"{
            self.validationFirstAdult()
            self.validationSpouses()
            self.validationFirstChild()
            self.validationSecondChild()
            self.validationthirdChild()
            self.validationFourthChild()
            
        }else{
            self.validationFirstAdult()
        }
    }
}
