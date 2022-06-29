//
//  CommonMethods.swift
//  Proteleservices
//
//  Created by Sitesh Kumar on 14/03/18.
//  Copyright © 2018 InmortalTech. All rights reserved.
//
import Foundation
import UIKit
import SVProgressHUD
import CoreLocation
import SystemConfiguration

class CommonMethods: NSObject {
    class func showHudWithMessage(message: String, aView: UIView, userInteractionAllowed: Bool) {
        DispatchQueue.main.async {
            aView.isUserInteractionEnabled = userInteractionAllowed
            SVProgressHUD.show(withStatus: message)
        }
    }
    
    class func showHudWithText(string: String) {
        SVProgressHUD.show(withStatus: string)
        SVProgressHUD.show()
    }
    
    class func showHud(aView: UIView, userInteractionAllowed: Bool) {
        DispatchQueue.main.async {
            aView.isUserInteractionEnabled = userInteractionAllowed
            SVProgressHUD.show()
        }
    }
    
    class func hideHud(aView: UIView) {
        SVProgressHUD.dismiss()
        aView.isUserInteractionEnabled = true
    }
    
    class func createNewRootController(_ storyboardName:UIStoryboard, _ VCname: String) {
        let vc = storyboardName.instantiateViewController(withIdentifier: VCname)
        //        let appDelegate = UIApplication.shared.delegate as! SceneDelegate
        //        appDelegate.window?.rootViewController = vc
        //        appDelegate.window?.makeKeyAndVisible()
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    class func convertDictionaryToString(_ dictionary: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            let str = String(data: jsonData, encoding: .utf8)
            return str
        } catch {
            print("Something went wrong")
        }
        return nil
    }
    
    class func convertStringToDictionary(_ text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                return json
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    class func drawText(text:NSString, inImage:UIImage) -> UIImage? {
        
        let font = UIFont.systemFont(ofSize: 11)
        let size = inImage.size
        UIGraphicsBeginImageContext(size)
        inImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let style : NSMutableParagraphStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        style.alignment = .center
        let attributes:NSDictionary = [ NSAttributedString.Key.font : font, NSAttributedString.Key.paragraphStyle : style, NSAttributedString.Key.foregroundColor : UIColor.red ]
        
        let textSize = text.size(withAttributes: attributes as? [NSAttributedString.Key : Any])
        let rect = CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height)
        let textRect = CGRect(x: (rect.size.width - textSize.width)/2.1, y: (rect.size.height - textSize.height)/2 - 10, width: textSize.width, height: textSize.height)
        //        text.draw(in: textRect.integral, withAttributes: attributes as? [String : Any])
        text.draw(in: textRect.integral, withAttributes: attributes as? [NSAttributedString.Key : Any])
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resultImage
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    class func setCircleImage(image:UIImageView,color:UIColor){
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = color.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    class func setCornerRadius(_ selectedView:UIView, size:NSInteger) {
        selectedView.layer.cornerRadius = CGFloat(size)
        selectedView.layer.masksToBounds = true
    }
    
    //    class func setBackgroundColorforLabelAndView(selectedView:UIView, selectedLabel:UILabel, ViewBackgroundColour:UIColor, labelBackgroundColour:UIColor) {
    //        selectedView.layer.backgroundColor = ViewBackgroundColour.cgColor
    //        selectedLabel.textColor = labelBackgroundColour
    //        selectedView.layer.masksToBounds = true
    //    }
    
    class func setbordertoView(_ selectedView:UIView, ViewBorderColour:UIColor,Viewborderwidth:NSInteger,viewCornorRadius:NSInteger) {
        selectedView.layer.borderWidth=CGFloat(Viewborderwidth)
        selectedView.layer.cornerRadius = CGFloat(viewCornorRadius)
        selectedView.layer.borderColor = ViewBorderColour.cgColor
        selectedView.layer.masksToBounds = true
    }
    
    class func setbackgroundColortoView(_ selectedView:UIView, ViewBackgrooundColour:UIColor) {
        
        selectedView.layer.backgroundColor = ViewBackgrooundColour.cgColor
        selectedView.layer.masksToBounds = true
    }
    
    class func getFormatedDay(newDate: NSString) -> NSString? {
        let dteString = newDate.replacingOccurrences(of: " +0000", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        dateFormatter.locale = Locale.init(identifier: "en_US")
        let dateObj = dateFormatter.date(from: dteString)
        dateFormatter.dateFormat = "dd"
        let date = dateFormatter.string(from: dateObj!)
        return date as NSString
    }
    
    class func getFormatedMonth(newDate: NSString) -> NSString? {
        let dteString = newDate.replacingOccurrences(of: " +0000", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        dateFormatter.locale = Locale.init(identifier: "en_US")
        let dateObj = dateFormatter.date(from: dteString)
        dateFormatter.dateFormat = "MMMM"
        let date = dateFormatter.string(from: dateObj!)
        return date as NSString
    }
    
    class func getFormatedYear(newDate: NSString) -> NSString? {
        let dteString = newDate.replacingOccurrences(of: " +0000", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        dateFormatter.locale = Locale.init(identifier: "en_US")
        let dateObj = dateFormatter.date(from: dteString)
        dateFormatter.dateFormat = "YYYY"
        let date = dateFormatter.string(from: dateObj!)
        return date as NSString
    }
    
    class func convertDateFormat(newDate: NSString) -> NSString? {
        let dteString = newDate.replacingOccurrences(of: " +0000", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        dateFormatter.locale = Locale.init(identifier: "en_US")
        let dateObj = dateFormatter.date(from: dteString)
        dateFormatter.dateFormat = "dd/MM/YYYY" // "1/1/2020"
        let date = dateFormatter.string(from: dateObj!)
        return date as NSString
    }
    
    class func convertTimeFormat(dateStr : NSString) -> NSString {
        let dteString = dateStr.replacingOccurrences(of: " +0000", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        //        dateFormatter.locale = Locale.init(identifier: "en_US")
        dateFormatter.locale = Locale(identifier: "UTC")
        
        let dateObj = dateFormatter.date(from: dteString as String)
        dateFormatter.dateFormat = "HH:mm a" //"dd"
        //print("Dateobj: \(dateFormatter.string(from: dateObj!))")
        let date = dateFormatter.string(from: dateObj!)
        return date as NSString
    }
    
    class func setLeftIcon(textField:UITextField,image:String) {
        textField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(named: image)
        imageView.image = image
        textField.leftView = imageView
    }
    
    class func setRightIcon(textField:UITextField,image:String) {
        
        textField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: image)
        imageView.image = image
        textField.rightView = imageView
    }
    
    class func setBottomLine(btn:UIButton,color:UIColor)
    {
        let lineView = UIView(frame: CGRect(x:0, y:0, width:btn.frame.size.width, height:1))
        lineView.backgroundColor = color
        btn.addSubview(lineView)
        
    }
    
    
    class func setCardView(view : UIView){
        
        view.layer.cornerRadius = 5.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 5.0
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowRadius = 2.5
        view.layer.shadowOffset = CGSize(width:-1, height: 1)
        view.layer.masksToBounds = false
        //  view.layer.shouldRasterize = true
        
    }
    
    class func setShadowToView(view : UIView,CornerRadius:CGFloat,BorderColor:UIColor,BorderWidth:CGFloat,ShadowOpacity:Float,ShadowColor:UIColor,ShadowRadius:CGFloat,ShadowOffset:CGSize,MasksToBounds:Bool){
        
        view.layer.cornerRadius = CornerRadius
        view.layer.borderColor  =  BorderColor.cgColor
        view.layer.borderWidth = BorderWidth
        view.layer.shadowOpacity = ShadowOpacity
        view.layer.shadowColor = ShadowColor.cgColor
        view.layer.shadowRadius = ShadowRadius
        view.layer.shadowOffset = ShadowOffset
        view.layer.masksToBounds = MasksToBounds
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    
    class func convertImageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    class func isValidateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    class func isAlphabetStringValid(strings: String) -> Bool{
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: strings, options: [], range: NSMakeRange(0, strings.count)) != nil {
                //                 self.showAlert(message: "Must not contain Number in Name")
                return false
            } else {
                return true
            }
        }
        catch {
            return false
        }
    }
    
    class func isAlphanumericStringValid(strings: String) -> Bool{
        do {
            let regex = try NSRegularExpression(pattern: "[^a-zA-Z0-9]", options: [])
            if regex.firstMatch(in: strings, options: [], range: NSMakeRange(0, strings.count)) != nil {
                //                 self.showAlert(message: "Must not contain Number in Name")
                return false
            } else {
                return true
            }
        }
        catch {
            return false
        }
    }
    
    class func isValidNumericNumber(phoneNumber:String) -> Bool {
        let PhoneFormat = "[0-9]*"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", PhoneFormat)
        return numberPredicate.evaluate(with: phoneNumber)
    }
    class func isValidVehicleRegistarionNbr(registrationNumber:String) -> Bool {
        let PhoneFormat = "[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", PhoneFormat)
        return numberPredicate.evaluate(with: registrationNumber)
    }
    class func isValidMobileNumber(phoneNumber:String) -> Bool {
        
        //        let PhoneFormat = "[0-9]*"
        //        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", PhoneFormat)
        //        return numberPredicate.evaluate(with: phoneNumber)
        
        //        let phoneNumber = "+1 (123) 456-7890" //Replace it with the Phone number you want to validate
        let range = NSRange(location: 0, length: phoneNumber.count)
        let regex = try! NSRegularExpression(pattern: "(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}")
        if regex.firstMatch(in: phoneNumber, options: [], range: range) != nil{
            print("Phone number is valid")
            return true
        }else{
            print("Phone number is not valid")
            return false
        }
        
    }
    
    class func checksMaxLength(textField: UITextField!, maxLength: Int ,minimumLength : Int) -> Bool {
        if ((textField.text?.count)! > maxLength) || ((textField.text?.count)! < minimumLength) {
            return false
        }
        return true
    }
    
    
    class func calculateDistance(currentlat: CLLocationDegrees, currentlong: CLLocationDegrees, lat: CLLocationDegrees, long: CLLocationDegrees) -> [String: String] {
        
        let Loc1 = CLLocation(latitude: currentlat, longitude: currentlong)
        let Loc2 = CLLocation(latitude:  lat, longitude: long)
        
        let dis = Loc1.distance(from: Loc2)
        print((dis/1000).rounded(),"Km")
        let disStr = (dis/1000).rounded()
        //        self.distance = "\(disStr)Km"
        let time = (dis/1000).rounded()*3
        print("\(time) Min")
        //        self.distanceTime = "\(time) Min"
        
        //        let dict:[String:String] = ["distance":"\(disStr) Kilometres", "time":"\(time) Min"]
        let dict:[String:String] = ["distance":"\(disStr)", "time":"\(time)"]
        
        return dict
    }
    
    
    // MARK:- Check Internet
    class func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        //        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        //            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        //        }
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
}
