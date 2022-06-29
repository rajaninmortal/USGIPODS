//
//  CommonWebViewVC.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 26/11/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit

class CommonWebViewVC: BaseViewController {
    
    @IBOutlet weak var titleBarBtn: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    weak var openingAlert: WebOpenAlert!
    
    var webUrl = "https://www.google.com/"
    var websiteNameStr = "", vehicleTypeStr = "", vendorIdStr = "", vehicleAlertTitle = "", vendorTypeStr = ""
    var isV2 = false
    var differentMessage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaigationTitle()
        callWebWarningAlert()
    }
    
    private func setNaigationTitle() {
       if isV2 {
        setDefaultNavigation(title: "USGI PULZ")
    } else {
//        titleBarBtn.setTitleTextAttributes(navTitleAttrs, for: .normal)
        titleBarBtn.title = "USGI PULZ"
        }
    }
    
    private func callWebWarningAlert() {
        var message = differentMessage
        if differentMessage.isEmpty {
            message = "Purchases made will be fulfilled by \(websiteNameStr) and \(websiteNameStr) is solely responsble for servicing and claims arising out of such transaction."
        }
//        WebWarningAlert.instance.showAlert(title: "You are being redirected to \(websiteNameStr) site.", message: message, urlStr: websiteNameStr, imageStr: "website_line_icon", color: errorColor, isV2: self.isV2) { (isOk) in
//            if isOk {
                //Make Call
                if self.isV2 {
                    self.saveVisitorDetailsV2()
                } else {
                    self.saveVisitorDetailsApi(params: ["TokenNo":tokenNo,
                                                        "VendorId":self.vendorIdStr,
                                                        "VehicleType":self.vehicleTypeStr,
                                                        "UId":String(ProjectUtils.getUserID())])
                }
                self.loadWebView()
                self.loadViewFromNib()
           // }
//    else {
//                if self.isV2 {
//                    self.navigationController?.popViewController(animated: true)
//                }
//            }
        }
   // }
    
    func loadViewFromNib() {
        //        WebOpenAlert.instance.showAlert(title:  "You are being redirected to \(websiteNameStr) site.", message: "Purchases made will be fulfilled by \(websiteNameStr) and \(websiteNameStr) is solely responsble for servicing and claims arising out of such transaction.", urlStr: websiteNameStr, imageStr: "middleCenter")
        var message = differentMessage
        if differentMessage.isEmpty {
            message = "Purchases made will be fulfilled by \(websiteNameStr) and \(websiteNameStr) is solely responsble for servicing and claims arising out of such transaction."
        }
        let bulbAlertView = WebOpenAlert()
        bulbAlertView.titleLbl.text = "You are being redirected to \(websiteNameStr) site."
        bulbAlertView.messageLbl.text = message
        bulbAlertView.urllbl.text = websiteNameStr
        bulbAlertView.imgInnerView.backgroundColor = errorColor
        bulbAlertView.img.image = UIImage(named: "website_line_icon")
        bulbAlertView.img.tintColor = .white
        self.view.addSubview(bulbAlertView)
        bulbAlertView.frame = CGRect(x:0, y: 0, width: view.frame.width, height: view.frame.height)
        self.openingAlert = bulbAlertView
        self.openingAlert.isHidden = false
    }

    
    @IBAction func clickOnMenuBtn(_ sender: Any) {
        if isV2 {
            self.navigationController?.popViewController(animated: true)
            return
        }
//        if PolicyServicesVC.isPolicyServicesVC == true {
//            PolicyServicesVC.isPolicyServicesVC = false
//            CommonMethods.createNewRootController(UIStoryboard(name: "PolicySideMenu", bundle: nil), "PolicyServicesNav")
//        }else{
//            CommonMethods.createNewRootController(UIStoryboard(name: "PolicyTab", bundle: nil), "PolicyTabBarController")
//        }
    }
    
    private func loadWebView() {
         let url = URL(string: webUrl)
         webView.loadRequest(URLRequest(url: url!))
     }
    
}

extension CommonWebViewVC: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(">>>>>>>>>>>>>")
        print(webView.request)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        openingAlert.isHidden = true
        print("<<<<<<<<<<<<<")
        print(webView.request)
        guard let URL = webView.request?.url else {
            return
        }
        if URL.absoluteString.contains("ThankYou") {
            let params = URL.queryParameters
            let result = params?["Status"]
            let customerID = params?["CustomerId"]
            print("+++++++++++")
            print(result)
            print(customerID)
            showStatusPopup(result: result!)
            updateUserClientUserId(params: ["TokenNo":tokenNo,
                                            "Userid":String(ProjectUtils.getUserID()),
                                            "ClientUserId":customerID!,
                                            "Payment_result":result!])
        }
    }
    
    private func showStatusPopup(result: String) {
        var messaage = ""
        if result == "Success" {
            messaage = "Payment done successfully. Go to My Policy section in the app to download policy document."
        } else {
            messaage = "We are sorry to inform you that your transaction has failed. Please contact universal sompo customer support for more details."
        }
        ConfirmationAlert.instance.showAlert(title: result, message: messaage, imageStr: "warning_icon", color: errorColor, okBtnTitle: "Ok", cancelBtnTitle: "Cancel") { (okPressed) in
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func updateUserClientUserId(params: Dictionary<String, String>) {
           //CommonMethods.showHud(aView: view, userInteractionAllowed: false)
           print(params)
           let url = String(format:"%@",SubUrl.UpdateUserClientUserId.url)
           print(url)
           CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
               if ((JSONResponse.dictionaryObject) != nil) {
                   let response = JSONResponse.dictionaryObject!
                   print(response)
                   
                   if response["Status"] as! Bool == true {
                      
                       
                   } else {
                       self.showWarning("Error", response["Message"] as! String)
                   }
                   CommonMethods.hideHud(aView: self.view)
                   
               }
           }) { (error) in
               if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                   CommonMethods.hideHud(aView: self.view)
                   self.showWarning("Error", AlertMessage.noInternet.rawValue)
               } else {
                   CommonMethods.hideHud(aView: self.view)
                   self.showWarning("Error", error.localizedDescription)
               }
           }
       }
    
}
extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}

extension CommonWebViewVC {
    func saveVisitorDetailsV2() {
        let params = ["TokenNo": "abcHkl7900@8Uyhkj1234",
                      "VendorId":self.vendorIdStr,
                      "UId":String(ProjectUtils.getUserID())] as [String : Any]
        APIManager.request.serverCall(apiName: API.saveHealthVisitorDetails, params: params, httpMethod: "POST") {(success, response) in
            print(response)
        }
    }
    
    private func saveVisitorDetailsApi(params: Dictionary<String, String>) {
        CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = String(format:"%@",SubUrl.saveVisitorDetails.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            if ((JSONResponse.dictionaryObject) != nil) {
                let response = JSONResponse.dictionaryObject!
                print(response)
                
                if response["Status"] as! Bool == true || response["Status"] as! Int == 0 {
                    self.appUserLogDataPushApi(params: ["TokenNo":tokenNo,
                                                        "UserId":String(ProjectUtils.getUserID()),
                                                        "ModuleName":"Value added service",
                                                        "PageName":self.vendorTypeStr,
                                                        "ActionName":"Checked \(self.vendorTypeStr) for \(self.vehicleTypeStr)",
                                                        "AppType":"1"])
                } else {
                    self.showWarning("Error", response["Message"] as! String)
                }
                CommonMethods.hideHud(aView: self.view)
            }
        }) { (error) in
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", AlertMessage.noInternet.rawValue)
            } else {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", error.localizedDescription)
            }
        }
    }
    
    
    private func appUserLogDataPushApi(params: Dictionary<String, String>) {
        print(params)
        let url = String(format:"%@",SubUrl.appUserLogDataPush.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            if ((JSONResponse.dictionaryObject) != nil) {
                let response = JSONResponse.dictionaryObject!
                print(response)
                
                if response["Status"] as! Bool == true {
                    
                }else{
                    self.showWarning("Error", response["Message"] as! String)
                }
                CommonMethods.hideHud(aView: self.view)
            }
        }) { (error) in
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", AlertMessage.noInternet.rawValue)
            } else {
                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", error.localizedDescription)
            }
        }
    }
    
}
