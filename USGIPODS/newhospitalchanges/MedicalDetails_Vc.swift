//
//  MedicalDetails_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//


import UIKit

class MedicalDetails_Vc: UIViewController {
    
    @IBOutlet weak var discount_View: UIView!
    @IBOutlet weak var discount_Lbl: UILabel!
    @IBOutlet weak var discount_Btn: UIButton!
    @IBOutlet weak var rs_View: UIView!
    @IBOutlet weak var rs_Txt: UITextField!
    @IBOutlet weak var rss_View: UIView!
    @IBOutlet weak var rss_Txt: UITextField!
    @IBOutlet weak var glblRs_View: UIView!
    @IBOutlet weak var glbleRs_Txt: UITextField!
    @IBOutlet weak var rsss_View: UIView!
    @IBOutlet weak var rsss_Txt: UITextField!
    @IBOutlet weak var addonCover_Btn: UIView!
    @IBOutlet weak var continue_Btn: UIView!
    
    //MARK:-  view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
    }
    //MARK:- func for corner radious
    func cornerRadius(){
        self.discount_View.layer.cornerRadius = 20
        self.discount_Btn.layer.cornerRadius = 25
        self.rs_View.layer.cornerRadius = 20
        self.rss_Txt.layer.cornerRadius = 20
        self.rss_View.layer.cornerRadius = 20
        self.rs_Txt.layer.cornerRadius = 20
        self.glblRs_View.layer.cornerRadius = 20
        self.glbleRs_Txt.layer.cornerRadius = 20
        self.rsss_View.layer.cornerRadius = 20
        self.rsss_Txt.layer.cornerRadius = 20
        self.addonCover_Btn.layer.cornerRadius = 25
        self.continue_Btn.layer.cornerRadius = 25
        self.padding()
        self.borderWidth()
       }
    //MARK:- func for corner radious
    func borderWidth(){
        self.discount_View.layer.borderWidth = 0.5
        self.rs_View.layer.borderWidth = 0.5
        self.rss_Txt.layer.borderWidth = 0.5
        self.rss_View.layer.borderWidth = 0.5
        self.rs_Txt.layer.borderWidth = 0.5
        self.glblRs_View.layer.borderWidth = 0.5
        self.glbleRs_Txt.layer.borderWidth = 0.5
        self.rsss_View.layer.borderWidth = 0.5
        self.rsss_Txt.layer.borderWidth = 0.5
       }
    //MARK:- func for the padding
    func padding(){
        self.rs_Txt.setLeftPaddingPoints(15)
        self.rss_Txt.setLeftPaddingPoints(15)
        self.glbleRs_Txt.setLeftPaddingPoints(15)
        self.rsss_Txt.setLeftPaddingPoints(15)
    }
    @IBAction func continueAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "PaymentSuperHealthCare_Vc") as! PaymentSuperHealthCare_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }

}

