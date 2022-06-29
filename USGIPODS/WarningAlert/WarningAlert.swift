//
//  WarningAlert.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 23/12/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit

class WarningAlert: UIView {
    
    static let instance = WarningAlert()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var imgOuterView: UIView!
    @IBOutlet weak var imgInnerView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var okBtnView: UIView!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var alertViewH: NSLayoutConstraint!
    
    var clickAction: ((_ isOk: Bool) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("WarningAlert", owner: self, options: nil)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setFontColor() {
        titleLbl.textColor = textFieldColor
    }
    
    private func setUpView() {
        setFontColor()
        alertView.layer.cornerRadius = 15
        imgInnerView.layer.cornerRadius =  imgInnerView.frame.size.height / 2
        imgOuterView.layer.cornerRadius =  imgOuterView.frame.size.height / 2
        imgOuterView.layer.masksToBounds = true
        okBtnView.layer.cornerRadius = 20
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert(title: String, message: String, imageStr: String, color :UIColor) {
        self.clickAction = nil
        self.titleLbl.text = title
        self.messageLbl.text = message
        manageViewHeight(titleStr: title, messageStr: message)
        img.image = img.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        img.tintColor = whiteColor
        imgInnerView.backgroundColor = color
        img.image = UIImage(named: imageStr)
        self.okBtnView.backgroundColor = color
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    func showAlertWithAction(title: String, message: String, imageStr: String, color :UIColor , clickAction: @escaping (Bool) -> Void) {
        titleLbl.text = title
        messageLbl.text = message
        self.clickAction = clickAction
        manageViewHeight(titleStr: title, messageStr: message)
        img.image = img.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        img.tintColor = whiteColor
        imgInnerView.backgroundColor = color
        img.image = UIImage(named: imageStr)
        self.okBtnView.backgroundColor = color
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    
    private func manageViewHeight(titleStr: String, messageStr: String) {
        if titleStr == "" {
            titleLbl.isHidden = true
            let lableHeight = messageLbl.heightForLabel(text: messageStr, width: messageLbl.frame.size.width)
            print("lableHeight : \(lableHeight)")
            print("totalHeight : \(130 + lableHeight)")
            alertViewH.constant = 130 + lableHeight
        }else{
            let lableHeight = messageLbl.heightForLabel(text: messageStr, width: messageLbl.frame.size.width)
            print("lableHeight : \(lableHeight)")
            print("totalHeight : \(160 + lableHeight)")
            alertViewH.constant = 160 + lableHeight
        }
        self.alertView.layoutIfNeeded()
    }
    
    @IBAction func okButtonAction(_ sender: UIButton) {
        parentView.removeFromSuperview()
        clickAction?(true)
    }
    
}

extension UILabel {
    
    func heightForLabel(text:String, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
}
