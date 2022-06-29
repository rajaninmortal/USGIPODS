//
//  StartJourney_Vc.swift
//  Insurance
//
//  Created by Yogi Bhai Mac on 28/06/22.
//

import UIKit

class StartJourney_Vc: UIViewController {

    @IBOutlet weak var motor_Btn : UIButton!
    @IBOutlet weak var health_Btn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.motor_Btn.layer.cornerRadius = 20
        self.health_Btn.layer.cornerRadius = 20
    }
    
    @IBAction func healthAction(_ sender:UIButton){
        self.health_Btn.layer.backgroundColor = UIColor.systemPink.cgColor
        self.motor_Btn.layer.backgroundColor = UIColor.clear.cgColor
        self.motor_Btn.layer.borderWidth = 1
        self.health_Btn.layer.borderWidth = 0
        self.motor_Btn.setTitleColor(UIColor.red, for: .normal)
        self.health_Btn.setTitleColor(UIColor.white, for: .normal)

        let nextVC = UIStoryboard.init(name: "Health", bundle: nil).instantiateViewController(withIdentifier: "BuyHealthNewPolicy_Vc") as! BuyHealthNewPolicy_Vc
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    @IBAction func motorAction(_ sender:UIButton){
        self.motor_Btn.layer.backgroundColor = UIColor.systemPink.cgColor
        self.health_Btn.layer.backgroundColor = UIColor.clear.cgColor
        self.health_Btn.layer.borderWidth = 1
        self.motor_Btn.layer.borderWidth = 0
        self.health_Btn.setTitleColor(UIColor.red, for: .normal)
        self.motor_Btn.setTitleColor(UIColor.white, for: .normal)
        let nextVC = UIStoryboard.init(name: "PolicySideMenu", bundle: nil).instantiateViewController(withIdentifier: "PrivateCar_Vc") as! PrivateCar_Vc
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
