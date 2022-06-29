//
//  SuperHealthMemberInfo_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//


import UIKit

class SuperHealthMemberInfo_Vc: UIViewController {

    @IBOutlet weak var name_View: UIView!
    @IBOutlet weak var name_Txt: UITextField!
    @IBOutlet weak var dob_View: UIView!
    @IBOutlet weak var dob_Lbl: UILabel!
    @IBOutlet weak var gender_View: UIView!
    @IBOutlet weak var gender_Lbl: UILabel!
    @IBOutlet weak var occupation_VIew: UIView!
    @IBOutlet weak var occupation_Lbl: UILabel!
    @IBOutlet weak var continue_btn: UIView!
    
    @IBOutlet weak var namesec_View: UIView!
    @IBOutlet weak var namee_Txt: UITextField!
    
    @IBOutlet weak var dobSec_View: UIView!
    @IBOutlet weak var dobb_Lbl: UILabel!
    
    @IBOutlet weak var genderSec_View: UIView!
    @IBOutlet weak var genderr_Lbl: UILabel!
    
    @IBOutlet weak var occupationSec_view: UIView!
    @IBOutlet weak var occupationn_Lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()

        // Do any additional setup after loading the view.
    }
    
    func cornerRadious(){
        self.name_View.layer.cornerRadius = 10
        self.dob_View.layer.cornerRadius = 10
        self.gender_View.layer.cornerRadius = 10
        self.occupation_VIew.layer.cornerRadius = 10
        self.namesec_View.layer.cornerRadius = 10
        self.dobSec_View.layer.cornerRadius = 10
        self.genderSec_View.layer.cornerRadius = 10
        self.occupationSec_view.layer.cornerRadius = 10
        self.continue_btn.layer.cornerRadius = 25

    }
    
    
    @IBAction func buyNowAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthMemberInfo_Vc") as! SuperHealthMemberInfo_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }

}
