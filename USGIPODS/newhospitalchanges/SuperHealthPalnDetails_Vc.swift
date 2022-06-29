//
//  SuperHealthPalnDetails_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//


import UIKit

class SuperHealthPalnDetails_Vc: UIViewController {
    
    @IBOutlet weak var family_view: UIView!
    @IBOutlet weak var family_Lbl: UILabel!
    
    @IBOutlet weak var dob_View: UIView!
    @IBOutlet weak var adultcount_Lbl: UILabel!
    
    @IBOutlet weak var child_View: UIView!
    @IBOutlet weak var child_lbl: UILabel!
    
    
    @IBOutlet weak var buy_Btn: UIButton!
    @IBOutlet weak var noparent_View: UIView!
    @IBOutlet weak var parentn_lBl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadius()
        self.borderWidth()

        // Do any additional setup after loading the view.
    }
    
    func cornerRadius(){
        self.family_view.layer.cornerRadius = 20
        self.dob_View.layer.cornerRadius = 20
        self.child_View.layer.cornerRadius = 20
        self.noparent_View.layer.cornerRadius = 20
        self.buy_Btn.layer.cornerRadius = 20

    }
    func borderWidth(){
        self.family_view.layer.borderWidth = 0.5
        self.dob_View.layer.borderWidth = 0.5
        self.child_View.layer.borderWidth = 0.5
        self.noparent_View.layer.borderWidth = 0.5
        self.buy_Btn.layer.borderWidth = 0.5

    }
    
    @IBAction func buyNowAction(_ sender: UIButton){
        let nextVc = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "SuperHealthMemberInfo_Vc") as! SuperHealthMemberInfo_Vc
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }

}
