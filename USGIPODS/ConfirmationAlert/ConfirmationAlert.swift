//
//  CallAlert.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 09/12/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit

class ConfirmationAlert: UIView {

    static let instance = ConfirmationAlert()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgOuterView: UIView!
    @IBOutlet weak var imgInnerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var cancelBtnView: UIView!
    @IBOutlet weak var okBtnView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var alertViewH: NSLayoutConstraint!

    var clickAction: ((_ isCall: Bool) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("ConfirmationAlert", owner: self, options: nil)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setFontColor() {
        titleLbl.textColor = textFieldColor
        messageLbl.textColor = textFieldColor
    }
    
    private func setUpView() {
        setFontColor()
        alertView.layer.cornerRadius = 15
        img.layer.cornerRadius = img.frame.size.height / 2
        imgInnerView.layer.cornerRadius =  imgInnerView.frame.size.height / 2
        imgOuterView.layer.cornerRadius =  imgOuterView.frame.size.height / 2
        imgOuterView.layer.masksToBounds = true
        cancelBtnView.layer.cornerRadius = 20
        okBtnView.layer.cornerRadius = 20
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    func showAlert(title: String, message: String, imageStr: String, color :UIColor, okBtnTitle: String, cancelBtnTitle: String, clickAction: @escaping (Bool) -> Void) {
         self.titleLbl.text = title
         self.messageLbl.text = message
         manageViewHeight(message)
         img.image = img.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
         img.tintColor = whiteColor
         img.image = UIImage(named: imageStr)
         self.clickAction = clickAction
         self.okBtnView.backgroundColor = color
        imgInnerView.backgroundColor = color
         self.cancelBtn.setTitle(cancelBtnTitle, for: .normal)
         self.okBtn.setTitle(okBtnTitle, for: .normal)
         UIApplication.shared.keyWindow?.addSubview(parentView)
     }
    
    private func manageViewHeight(_ messageStr: String) {
        let lableHeight = messageLbl.heightForLabel(text: messageStr, width: messageLbl.frame.size.width)
        print("lableHeight : \(lableHeight)")
        print("totalHeight : \(180 + lableHeight)")
        alertViewH.constant = 180 + lableHeight
        self.alertView.layoutIfNeeded()
    }
    
    @IBAction func okBtnAction(_ sender: UIButton) {
         parentView.removeFromSuperview()
         clickAction?(true)
     }
     
     @IBAction func cancelButtonAction(_ sender: UIButton) {
         parentView.removeFromSuperview()
         clickAction?(false)
     }

}
