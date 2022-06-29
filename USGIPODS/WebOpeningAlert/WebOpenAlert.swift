//
//  WebOpenAlert.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 18/12/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit

class WebOpenAlert: UIView {
    
    static let instance = WebOpenAlert()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgOuterView: UIView!
    @IBOutlet weak var imgInnerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var lodingImg: UIImageView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var urllbl: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("WebOpenAlert", owner: self, options: nil)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        setFontColor()
        loadGIFImage()
        alertView.layer.cornerRadius = 15
        img.layer.cornerRadius = img.frame.size.height / 2
        imgInnerView.layer.cornerRadius =  imgInnerView.frame.size.height / 2
        imgOuterView.layer.cornerRadius =  imgOuterView.frame.size.height / 2
        imgOuterView.layer.masksToBounds = true
        logoView.layer.cornerRadius = logoView.frame.size.height / 2
        logoView.layer.shadowColor = UIColor.black.cgColor
        logoView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        logoView.layer.shadowOpacity = 0.2
        logoView.layer.shadowRadius = 4.0
        addSubview(parentView)
        parentView.frame = self.bounds
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func setFontColor() {
        titleLbl.textColor = textFieldColor
        messageLbl.textColor = textFieldColor
    }
    
    private func loadGIFImage() {
//        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "save_loader", withExtension: "gif")!)
//        let advTimeGif = UIImage.gifImageWithData(imageData!)
//        lodingImg.image = advTimeGif
        
        do {
            let imageData = try Data(contentsOf: Bundle.main.url(forResource: "save_loader", withExtension: "gif")!)
            
            let save_loader = UIImage.gif(data: imageData)
            self.lodingImg.image = save_loader
            self.lodingImg.image = self.lodingImg.image?.withRenderingMode(.alwaysOriginal)
        } catch {
            print(error)
        }
    }
    
    func showAlert(title: String, message: String, urlStr: String, imageStr: String) {
        self.titleLbl.text = title
        self.messageLbl.text = message
        self.img.image = UIImage(named: imageStr)
        self.urllbl.text = urlStr
        img.tintColor = whiteColor
    }
    
    
}
