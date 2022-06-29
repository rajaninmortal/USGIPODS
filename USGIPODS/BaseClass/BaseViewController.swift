//
//  BaseViewController.swift
//  MVCSwift
//
//  Created by Kiyara Tomar on 29/03/17.
//  Copyright © 2017 Vcareall. All rights reserved.
//

import UIKit
import SDWebImage
import ActionSheetPicker_3_0

class BaseViewController: UIViewController {
    
//    var tabBarThemeColor: UIColor {
//        if #available(iOS 13.0, *) {
//            return UIColor.label
//        } else {
//            return COLOR.THEME_DARK
//        }
//    }
    
    func tabBarThemeColor() -> UIColor {
            if #available(iOS 13.0, *) {
                return UIColor.label
            } else {
                return COLOR.THEME_DARK
            }
    }
    
    
    
//    let navTitleAttrs = [
//        NSAttributedString.Key.foregroundColor: COLOR.titleBarColor,
//        NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 16)!
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //To show messages in APP
    
    func showMessage(_ titleStr: String ,_ messageStr: String) {
        let alert = UIAlertController(title:titleStr, message:messageStr , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWarning(_ titleStr: String ,_ messageStr: String) {
        WarningAlert.instance.showAlert(title: titleStr, message: messageStr, imageStr: "warning_icon", color: errorColor)
    }
    
   
    
    
    
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Ok",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func addRefreshControl(_ tableView: UITableView, selector: Selector, andTintColor color: UIColor = .darkGray) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            selector, for: .valueChanged)
        refreshControl.tintColor = color
        
        tableView.addSubview(refreshControl)
    }
    
    //   @objc func openPolicySideMenu() {
    //    let storyboard = UIStoryboard(name: "PolicySideMenu", bundle: nil)
    //    let vc = storyboard.instantiateViewController(withIdentifier: "PolicySideMenuVC")
    //    let navigation = SideMenuNavigationController(rootViewController: vc)
    //
    //    navigation.leftSide = true
    //    navigation.menuWidth = UIScreen.main.bounds.width - 90
    //    navigation.presentationStyle = .menuSlideIn
    //    navigation.statusBarEndAlpha = 0
    ////    navigation.presentationStyle.backgroundColor = UIColor.lightGray
    //
    //    SideMenuManager.default.leftMenuNavigationController = navigation
    ////        SideMenuManager.default.menuWidth = UIScreen.main.bounds.width - 90
    ////        SideMenuManager.default.menuFadeStatusBar = false
    ////        SideMenuManager.default.menuPresentMode = .menuSlideIn
    //
    //    present(SideMenuManager.default.leftMenuNavigationController ?? UINavigationController(), animated: true, completion: nil)
    //    }
    
//       @objc func openPolicySideMenu() {
//            let storyboard = UIStoryboard(name: "PolicySideMenu", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "PolicySideMenuVC")
//            let navigation = UISideMenuNavigationController(rootViewController: vc)
//            navigation.leftSide = true
//    //        navigation.navigationBar.barTintColor = UIColor(red: 198.0/255, green: 198.0/255, blue: 200.0/255, alpha: 0.15)
//            SideMenuManager.default.menuLeftNavigationController = navigation
//            SideMenuManager.default.menuWidth = UIScreen.main.bounds.width - 90
//            SideMenuManager.default.menuFadeStatusBar = false
//            SideMenuManager.default.menuPresentMode = .menuSlideIn
//            present(SideMenuManager.default.menuLeftNavigationController ?? UINavigationController(), animated: true, completion: nil)
//        }
    
//    @objc func openHealthSideMenu() {
//        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SideMenu")
//        let navigation = UISideMenuNavigationController(rootViewController: vc)
//        navigation.leftSide = true
//        //        navigation.navigationBar.barTintColor = UIColor(red: 198.0/255, green: 198.0/255, blue: 200.0/255, alpha: 0.15)
//        SideMenuManager.default.menuLeftNavigationController = navigation
//        SideMenuManager.default.menuWidth = UIScreen.main.bounds.width - 90
//        SideMenuManager.default.menuFadeStatusBar = false
//        SideMenuManager.default.menuPresentMode = .menuSlideIn
//        present(SideMenuManager.default.menuLeftNavigationController ?? UINavigationController(), animated: true, completion: nil)
//    }
    
    @IBAction func globalBackBtn(_ sender:UIBarButtonItem){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setBottomLinetoTextFeild( textField:UITextField){
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        if (self.view.frame.size.width==320) {
            border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: 1)
        }
        else{
            border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width+50, height: 1)
        }
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
    }
    
    func makeCallOn(titleStr: String, messageStr: String, number: Double) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel".localizableString(lan: ProjectUtils.getAppLanguage()), style: UIAlertAction.Style.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Call".localizableString(lan: ProjectUtils.getAppLanguage()), style: UIAlertAction.Style.default, handler: { action in
            if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func makeRSACall() {
        let alert = UIAlertController(title: "RoadsideAssistanceNumber".localizableString(lan: ProjectUtils.getAppLanguage()), message: AlertMessage.assistanceNumber.rawValue, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel".localizableString(lan: ProjectUtils.getAppLanguage()), style: UIAlertAction.Style.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Call".localizableString(lan: ProjectUtils.getAppLanguage()), style: UIAlertAction.Style.default, handler: { action in
            if let url = URL(string: "tel://\(rsaNumber)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


