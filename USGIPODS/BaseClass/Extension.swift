//
//  Extension.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 19/11/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit
import Foundation
//import UICircularProgressRing

extension UIView {
    
    func setShadow(shadowRadius: CGFloat) {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize.zero
    }
    
    func setSadhowWithBezierPath() {
//        layer.masksToBounds = false
//        layer.shadowRadius = 4
//        layer.shadowOpacity = 1
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0 , height:2)
        
        let shadowWidth: CGFloat = 1.2 // Shadow width, will be the width furthest away from the view, this is equivalent to 120% of the views width
        let shadowHeight: CGFloat = 0.3 // Shadow height, again this is equivalent to 30%
        let shadowRadius: CGFloat = 5
        let width = frame.width
        let height = frame.height // Get width and height of the view

        // Plot the path
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width - shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width * shadowWidth, y: height + (height * shadowHeight)))
        shadowPath.addLine(to: CGPoint(x: width * -(shadowWidth - 1), y: height + (height * shadowHeight)))
        // Add shadow
        layer.shadowPath = shadowPath.cgPath
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addBottomShadow() {
//        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
    }
    func addTopShadow() {
//        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
    }
}


extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

extension String {
    
    func localizableString(lan: String) -> String {
        let path = Bundle.main.path(forResource: lan, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    //Enables replacement of the character at a specified position within a string
    func replace(_ index: Int, _ newChar: Character) -> String {
        var chars = Array(self)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func changeFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = to
        return  dateFormatter.string(from: date!)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func randomColor() -> UIColor {
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension UILabel {
    
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        self.attributedText = attribute
    }
    
    func addBottomBorder(active: Bool)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0) // CGRectMake(0.0, frame.height - 1, frame.width, 1.0)
        bottomLine.backgroundColor = active ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        //borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIButton()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

}

extension UIImage {
    func compressImage() -> UIImage {
//        let actualHeight:CGFloat = size.height
//        let actualWidth:CGFloat = size.width
//        let imgRatio:CGFloat = actualWidth/actualHeight
        let maxWidth:CGFloat = 400.0
        let maxHeight:CGFloat = 400.0
//        let resizedHeight:CGFloat = maxWidth/imgRatio
//        let compressionQuality:CGFloat = 0.5
        let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: maxHeight)
        UIGraphicsBeginImageContext(rect.size)
        draw(in: rect)
//        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData = jpegData(compressionQuality: 0.25)
        UIGraphicsEndImageContext()
        return UIImage(data: imageData!)!
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
    static func asyncDownloadImageWithUrl(url: NSURL, completionBlock: @escaping (_ succeeded: Bool, _ image: UIImage?) -> Void) {
        let request = NSMutableURLRequest(url: url as URL)
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main, completionHandler: { (response, data, error) in
            if error == nil {
                if let image = UIImage(data: data!) {
                    completionBlock(true, image)
                }
            } else {
                completionBlock(false, nil)
            }
        })
    }
}

extension Date {
    
    func getCurrentMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 0, to: self)
    }
    func getLast1Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    func getLast2Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -2, to: self)
    }
    func getLast3Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -3, to: self)
    }
    func getLast4Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -4, to: self)
    }
    func getLast5Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -5, to: self)
    }
    func getLast6Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -6, to: self)
    }
    func getLast7Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -7, to: self)
    }
    func getLast8Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -8, to: self)
    }
    func getLast9Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -9, to: self)
    }
    func getLast10Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -10, to: self)
    }
    func getLast11Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -11, to: self)
    }
    func getLast12Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -12, to: self)
    }
    
    func getYesterday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    func getLast7Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    func getLast30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    // This Month Start
    func getThisMonthStart() -> Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
    
    func getThisMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month Start
    func getLastMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month End
    func getLastMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    var dateBefore5Days: Date {
        return Calendar.current.date(byAdding: .day, value: -5, to: noon)!
    }
    var dateBefore4Days: Date {
        return Calendar.current.date(byAdding: .day, value: -4, to: noon)!
    }
    var dateBefore3Days: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: noon)!
    }
    var dateBefore2Days: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    var dateBefore1Days: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    func offsetFrom(date: Date) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
        
        let seconds = "\(difference.second ?? 0)s"
        let minutes = "\(difference.minute ?? 0)m" + " " + seconds
        let hours = "\(difference.hour ?? 0)h" + " " + minutes
        let days = "\(difference.day ?? 0)d" + " " + hours
        
        if let day = difference.day, day          > 0 { return days }
        if let hour = difference.hour, hour       > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func changeFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: dateFormatter.string(from: self))
        dateFormatter.dateFormat = to
        return  dateFormatter.string(from: date!)
    }
}
 

//extension DGSegmentedControl {
//
//    func setupSegments(items: [String]) {
//        self.items = items
//        font = UIFont(name:"Montserrat-SemiBold", size: 15)
//        borderColor = UIColor.clear
//        backgroundColor = UIColor.white
//        selectedIndex = 0
//        borderSize = 2
//        thumbColor = UIColor(red: 148/255.0, green: 55/255.0, blue: 255/255.0, alpha: 1.00)
//        selectedLabelColor = UIColor(red: 148/255.0, green: 55/255.0, blue: 255/255.0, alpha: 1.00)
//        unselectedLabelColor = UIColor.gray
//        thumUnderLineSize = 3
//    }
//
//}

// MARK: - Tool Bar
extension UIToolbar {
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        return toolBar
    }
    
    func ToolbarPikerCancel(mySelect : Selector , cancel : Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor.black
        
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let cancel = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: cancel)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton,cancel,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
}

extension UIColor {
    func hideNavigationBarBottomLine() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    func asptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
extension UIView {
    /* Usage Example
     * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
     */
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }
    
    func setBorder(color: UIColor, radius: CGFloat) {
        layer.borderWidth = 2
        layer.borderColor = color.cgColor
        layer.cornerRadius = radius
    }
    
    func addShadowToBar(frame: CGRect) -> UIView {
        let shadowView = UIView(frame: frame)
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.4 // your opacity
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2) // your offset
        shadowView.layer.shadowRadius =  4 //your radius
//        vc.view.addSubview(shadowView)
        return shadowView
    }
}

extension IndexPath {
    func generateTag() -> Int {
        let tag = (1000 * (self.section + 1)) + (self.row + 1)
        return tag
    }
}
extension Int {
    func getRowAndSection() -> (row: Int, section: Int) {
        return ((self % 1000)-1, (self / 1000) - 1)
    }
}
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension NSMutableAttributedString {
    func setFontFace(font: UIFont, color: UIColor? = nil) {
        beginEditing()
        self.enumerateAttribute(
            .font,
            in: NSRange(location: 0, length: self.length)
        ) { (value, range, stop) in
            if let f = value as? UIFont,
                let newFontDescriptor = f.fontDescriptor
                    .withFamily(font.familyName)
                    .withSymbolicTraits(f.fontDescriptor.symbolicTraits) {
                let newFont = UIFont(
                    descriptor: newFontDescriptor,
                    size: font.pointSize
                )
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
                if let color = color {
                    removeAttribute(
                        .foregroundColor,
                        range: range
                    )
                    addAttribute(
                        .foregroundColor,
                        value: color,
                        range: range
                    )
                }
            }
        }
        endEditing()
    }
}

extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}

extension UIButton {
    func configureRoundButton(image: String, bgColor: UIColor, fgColor: UIColor) {
        setImage(UIImage(named: image)?.withRenderingMode(.alwaysTemplate), for: .normal)
        setShadow(shadowRadius: 2)
        setBorder(color: bgColor, radius: bounds.width/2)
        backgroundColor = bgColor
        tintColor = fgColor
    }
    
    func configureButton(title: String, bgColor: UIColor, fgColor: UIColor, radius: CGFloat) {
        setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        titleLabel?.font = UIFont(name: FONT.BOLD, size: SIZE.FOURTEEN)
        self.setTitleColor(fgColor, for: .normal)
        self.layer.cornerRadius = radius
    }
    
    func configureButtonWithTextSize(title: String, bgColor: UIColor, fgColor: UIColor, radius: CGFloat, size: CGFloat) {
        setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        titleLabel?.font = UIFont(name: FONT.BOLD, size: size)
        self.setTitleColor(fgColor, for: .normal)
        self.layer.cornerRadius = radius
    }
    
    func shadowWithRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 2, height: 3)
    }
}

extension UILabel {
    func configureLabel(color: UIColor, fontName: String, size: CGFloat) {
        textColor = color
        if #available(iOS 13.0, *) {
            textColor = UIColor.label
        } else {
            // Fallback on earlier versions
            textColor = color
        }
        font = UIFont(name: fontName, size: size)
    }
}

extension UITextField {
    func configureTextField(placeholder: String) {
        self.placeholder = placeholder
        font = UIFont(name: FONT.REGULAR, size: SIZE.FOURTEEN)
//        textColor = COLOR.THEME_DARK
        if #available(iOS 13.0, *) {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.label])
        } else {
            // Fallback on earlier versions
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : COLOR.THEME_DARK])
        }
    }
    
    func setBorder(color: UIColor, width: CGFloat, radius: CGFloat) {
        layer.borderColor = color.cgColor// COLOR.THEME_YELLOW.cgColor
        layer.borderWidth = width// 2.0
        layer.cornerRadius = radius// 2.0
    }
    
    func addBottomBorder(active: Bool) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0) // CGRectMake(0.0, frame.height - 1, frame.width, 1.0)
        bottomLine.backgroundColor = active ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.bounds.size.height - 1, width: self.bounds.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        bottomLine.borderColor = UIColor(red: 33/255, green: 42/255, blue: 58/255, alpha: 1.0).cgColor
        //self.borderStyle = .none
        bottomLine.borderWidth = 1.0
        self.layer.addSublayer(bottomLine)        
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        let t = Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    //    t.frame = UIApplication.shared.keyWindow!.frame
        return t
    }
}

//extension DGSegmentedControl {
//    func decorateSegmentedControl(items: [String]){
//        self.items = items
//        font = UIFont(name:FONT.BOLD, size: SIZE.FOURTEEN)
//        backgroundColor = UIColor.white//(red:155/255, green: 95/255, blue: 185/255, alpha: 1.00)
//        selectedIndex = 0
//        borderSize = 2
//       // thumbColor = UIColor.white //UIColor(red: 137.0/255.0, green: 40.0/255.0, blue: 149.0/255.0, alpha: 1.00)
//        thumbColor = COLOR.PASTEL_PURPLE
//        selectedLabelColor = COLOR.PASTEL_PURPLE
//        unselectedLabelColor = UIColor.gray//(red:225/255, green: 163/255, blue: 255/255, alpha: 1.00)
//        thumUnderLineSize = 3
//        //  customSegment.font = UIFont.systemFont(ofSize: 14)
////        self.clickOnSegmentControl(self.customSegment)
//    }
//}

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func load(url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let data = try? Data(contentsOf: url) {
                   if let image = UIImage(data: data) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
    func downloaded(from url: URL, URLString: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
         contentMode = mode
         URLSession.shared.dataTask(with: url) { data, response, error in
             guard
                 let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                 let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                 let data = data, error == nil,
                 let image = UIImage(data: data)
                 else {
                    self.load(url: url)
                    return }
             DispatchQueue.main.async() {
                imageCache.setObject(image, forKey: URLString as NSString)
                 self.image = image
             }
         }.resume()
     }
    func imageFromURL(from URLString: String, placeHolder: UIImage?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
         guard let url = URL(string: URLString) else {
            self.image = placeHolder
            return }
        if let imageFromCache = imageCache.object(forKey: URLString as NSString) {
            self.image = imageFromCache
            return
        }
        self.image = placeHolder
        
        downloaded(from: url, URLString: URLString, contentMode: mode)
     }
}

extension UIViewController {
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
       if let popoverPresentationController = actionSheet.popoverPresentationController {
         popoverPresentationController.sourceView = self.view
         popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
         popoverPresentationController.permittedArrowDirections = []
       }
     }
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: "", message: message, preferredStyle: .actionSheet)
            
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                self.addActionSheetForiPad(actionSheet: controller)
               }

            self.present(controller, animated: true, completion: nil)
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when) {
              controller.dismiss(animated: true, completion: nil)
            }
        }
    }
    func setDefaultNavigation(title: String) {
        let backItem = UIBarButtonItem(image: UIImage(named: "arrow-left-grey"), style: .plain, target: self, action: #selector(self.goBack))
        let titleItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        titleItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: COLOR.titleBarColor,
                                          NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 16)!], for: .normal)
        self.navigationItem.leftBarButtonItems = [backItem, titleItem]
    }
    
    @objc func goBack() {
        
        if let viewControllers = navigationController?.viewControllers {
            if viewControllers.count > 1 {
                self.navigationController?.popViewController(animated: true)
            }else{
                CommonMethods.createNewRootController(UIStoryboard(name: "Health", bundle: nil), "HealthNavBar")
            }
        }
    }
    
    func setPopToRootNavigation(title: String) {
        let backItem = UIBarButtonItem(image: UIImage(named: "arrow-left-grey"), style: .plain, target: self, action: #selector(self.popToRoot))
        let titleItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        titleItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                                          NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 16)!], for: .normal)
        self.navigationItem.leftBarButtonItems = [backItem, titleItem]
    }
    
    @objc func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setCustomNavigation(title: String) {
        let backItem = UIBarButtonItem(image: UIImage(named: "arrow-left-grey"), style: .plain, target: self, action: #selector(self.gotoVC))
        let titleItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        titleItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                                          NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 16)!], for: .normal)
        self.navigationItem.leftBarButtonItems = [backItem, titleItem]
    }
    @objc func gotoVC() {
        CommonMethods.createNewRootController(UIStoryboard(name: "PolicyTab", bundle: nil), "PolicyTabBarController")
    }
}
//extension UICircularProgressRing {
//    func configureDefault() {
//        innerRingWidth = 4
//        outerRingColor = UIColor.lightGray
//        outerRingWidth = 4
//        startAngle = -90
//        innerRingColor =  COLOR.LIGHT_BLACK
//        style = .ontop
//    }
//}
extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension Float {
    func round(to places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
extension UIDevice {

    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case Unknown
    }
    var screenType: ScreenType {
        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208, 1920:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        default:
            return .Unknown
        }
    }
}
//MARK:- state  list for ther activatyed hospital list
extension UIViewController {
    func getStateName(stateCode:String) -> String {
        var strTxt = ""
        switch stateCode {
        case "AN":
            strTxt = "Andaman and Nicobar Islands"
        case "AP":
            strTxt = "Andhra Pradesh"
        case "AR":
            strTxt = "Arunachal Pradesh"
        case "AS":
            strTxt = "Assam"
        case "BR":
            strTxt = "Bihar"
        case "CH":
            strTxt = "Chandigarh"
        case "CT":
            strTxt = "Chhattisgarh"
        case "DN":
            strTxt = "Dadra and Nagar Haveli"
        case "DD":
            strTxt = "Daman and Diu"
        case "DL":
            strTxt = "Delhi"
        case "GA":
            strTxt = "Goa"
        case "GJ":
            strTxt = "Gujarat"
        case "HR":
            strTxt = "Haryana"
        case "HP":
            strTxt = "Himachal Pradesh"
        case "JK":
            strTxt = "Jammu and Kashmir"
        case "JH":
            strTxt = "Jharkhand"
        case "KA":
            strTxt = "Karnataka"
        case "KL":
            strTxt = "Kerala"
        case "LD":
            strTxt = "Lakshadweep"
        case "MP":
            strTxt = "Madhya Pradesh"
        case "MH":
            strTxt = "Maharashtra"
        case "MN":
            strTxt = "Manipur"
        case "ML":
            strTxt = "Meghalaya"
        case "MZ":
            strTxt = "Mizoram"
        case "NL":
            strTxt = "Nagaland"
        case "OR":
            strTxt = "Odisha"
        case "PY":
            strTxt = "Puducherry"
        case "PB":
            strTxt = "Punjab"
        case "RJ":
            strTxt = "Rajasthan"
        case "SK":
            strTxt = "Sikkim"
        case "TN":
            strTxt = "Tamil Nadu"
        case "TG":
            strTxt = "Telangana"
        case "TR":
            strTxt = "Tripura"
        case "UP":
            strTxt = "Uttar Pradesh"
        case "UT":
            strTxt = "Uttarakhand"
        case "WB":
            strTxt = "West Bengal"
        default:
            break
        }
        return strTxt
    }
}
