//
//  IBDesignable.swift
//  UniversalSompo
//
//  Created by yogesh patel on 22/09/21.
//  Copyright © 2021 Inmorteltech. All rights reserved.
//

import Foundation
//import UIKit
//enum viewBorder: String {
//    case Left = "borderLeft"
//    case Right = "borderRight"
//    case Top = "borderTop"
//    case Bottom = "borderBottom"
//}
//
//@IBDesignable extension UIButton {
//
//    @IBInspectable var borderWidths: CGFloat {
//        set {
//            layer.borderWidth = newValue
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
//
//    @IBInspectable var cornerRadiuss: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//
//    @IBInspectable var borderColors: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//}
//@IBDesignable extension UIView {
//
//    @IBInspectable var borderWidth: CGFloat {
//        set {
//            layer.borderWidth = newValue
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
//
//    @IBInspectable var cornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//
//    @IBInspectable var borderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//   /* @IBInspectable var bottomLineColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//    @IBInspectable var bottomCornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//    @IBInspectable var bottomBorderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//    @IBInspectable var bottomLineWidth: CGFloat {
//        get {
//            return self.bottomLineWidth
//        }
//        set {
//            DispatchQueue.main.async {
////                self.addBottomBorderWithColor(color: self.bottomLineColor!, width: newValue,cornerRadis: self.bottomCornerRadius.nextDown, cornerColor: self.bottomBorderColor!)
////                self.addBorder(vBorder: viewBorder(rawValue: "borderBottom")!, color: self.bottomBorderColor!, width: newValue)
//
//            }
//        }
//    }
//
//    @IBInspectable var topLineColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//
//
//    }
//    @IBInspectable var topCornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//    @IBInspectable var topBorderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//    @IBInspectable var topLineWidth: CGFloat {
//        get {
//            return self.topLineWidth
//        }
//        set {
//            DispatchQueue.main.async {
////                self.addTopBorderWithColor(color: self.topLineColor!, width: newValue,cornerRadis: self.topCornerRadius.nextDown, cornerColor: self.topBorderColor!)
////                self.addBorder(vBorder: viewBorder(rawValue: "borderTop")!, color: self.topBorderColor!, width: newValue)
////                self.roundCorners([.topRight], radius: 10)
//                self.roundCorners([.layerMinXMinYCorner], radius: 20.0, borderColor: UIColor.green, borderWidth: 1)
//
//            }
//        }
//    }
//
//    @IBInspectable var rightLineColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//    @IBInspectable var rightCornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//    @IBInspectable var rightBorderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//    @IBInspectable var rightLineWidth: CGFloat {
//        get {
//            return self.rightLineWidth
//        }
//        set {
//            DispatchQueue.main.async {
////                self.addRightBorderWithColor(color: self.rightLineColor!, width: newValue,cornerRadis: self.rightCornerRadius.nextDown, cornerColor: self.rightBorderColor!)
////                self.addBorder(vBorder: viewBorder(rawValue: "borderRight")!, color: self.rightBorderColor!, width: newValue)
////                self.roundCorners([.topRight], radius: newValue, borderColor: self.rightBorderColor!, borderWidth: 2)
//                self.roundCorners([.layerMinXMinYCorner], radius: 20.0, borderColor: UIColor.green, borderWidth: 1)
//            }
//        }
//    }
//    @IBInspectable var leftLineColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//    @IBInspectable var leftCornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//    @IBInspectable var leftBorderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//
//    @IBInspectable var leftLineWidth: CGFloat {
//        get {
//            return self.leftLineWidth
//        }
//        set {
//            DispatchQueue.main.async {
////                self.addLeftBorderWithColor(color: self.leftLineColor!, width: newValue,cornerRadis: self.leftCornerRadius.nextDown, cornerColor: self.leftBorderColor!)
////                self.addBorder(vBorder: viewBorder(rawValue: "borderLeft")!, color: self.leftBorderColor!, width: newValue)
//            }
//        }
//    }
//    func addBorder(vBorder: viewBorder, color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        removePreviouslyAddedLayer(name: border.name ?? "")
//        border.backgroundColor = color.cgColor
//        border.borderColor = color.cgColor
//        border.cornerRadius = 4
//        border.name = vBorder.rawValue
//        switch vBorder {
//        case .Left:
//            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
//        case .Right:
//            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
//
//        case .Top:
//            border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
//        case .Bottom:
//            border.frame = CGRect(x:0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
//        }
//        self.layer.addSublayer(border)
//    }
////    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
////        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
////        let mask = CAShapeLayer()
////        mask.path = path.cgPath
////        self.layer.mask = mask
////    }
//    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
//        self.layer.maskedCorners = corners
//        self.layer.cornerRadius = radius
//        self.layer.borderWidth = borderWidth
//        self.layer.borderColor = borderColor.cgColor
//    }
//
////    func addTopBorderWithColor(color: UIColor, width: CGFloat, cornerRadis: CGFloat, cornerColor: UIColor) {
////        let border = CALayer()
////        border.name = "topBorderLayer"
////        removePreviouslyAddedLayer(name: border.name ?? "")
////        border.frame = CGRect(x: 0, y : 0,width: self.frame.size.width, height: width)
////        border.backgroundColor = color.cgColor
////        border.borderColor = cornerColor.cgColor
////        border.cornerRadius = cornerRadis
////        self.layer.addSublayer(border)
////    }
////    func addRightBorderWithColor(color: UIColor, width: CGFloat, cornerRadis: CGFloat, cornerColor: UIColor) {
////        let border = CALayer()
////        border.name = "rightBorderLayer"
////        removePreviouslyAddedLayer(name: border.name ?? "")
////        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width : width, height :self.frame.size.height)
////        border.backgroundColor = color.cgColor
////        border.borderColor = cornerColor.cgColor
////        border.cornerRadius = cornerRadis
////        self.layer.addSublayer(border)
////    }
////
////    func addBottomBorderWithColor(color: UIColor, width: CGFloat, cornerRadis: CGFloat, cornerColor: UIColor) {
////        let border = CALayer()
////        border.name = "bottomBorderLayer"
////        removePreviouslyAddedLayer(name: border.name ?? "")
////        border.frame = CGRect(x: 0, y: self.frame.size.height - width,width : self.frame.size.width,height: width)
////        border.backgroundColor = color.cgColor
////        border.borderColor = cornerColor.cgColor
////        border.cornerRadius = cornerRadis
////        self.layer.addSublayer(border)
////    }
////    func addLeftBorderWithColor(color: UIColor, width: CGFloat, cornerRadis: CGFloat, cornerColor: UIColor) {
////        let border = CALayer()
////        border.name = "leftBorderLayer"
////        removePreviouslyAddedLayer(name: border.name ?? "")
////        border.frame = CGRect(x:0, y:0,width : width, height : self.frame.size.height)
////        border.backgroundColor = color.cgColor
////        border.borderColor = cornerColor.cgColor
////        border.cornerRadius = cornerRadis
////        self.layer.addSublayer(border)
////    }
//    func removePreviouslyAddedLayer(name : String) {
//        if self.layer.sublayers?.count ?? 0 > 0 {
//            self.layer.sublayers?.forEach {
//                if $0.name == name {
//                    $0.removeFromSuperlayer()
//                }
//            }
//        }
//    }*/
//
//}
//
//extension UIColor {
//    func getColorFrom(hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }
//
//        var rgbValue:UInt32 = 0
//        Scanner(string: cString).scanHexInt32(&rgbValue)
//
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
//}
//extension UIColor {
//    convenience init(hex: String) {
//        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 0
//
//        var rgbValue: UInt64 = 0
//
//        scanner.scanHexInt64(&rgbValue)
//
//        let r = (rgbValue & 0xff0000) >> 16
//        let g = (rgbValue & 0xff00) >> 8
//        let b = rgbValue & 0xff
//
//        self.init(
//            red: CGFloat(r) / 0xff,
//            green: CGFloat(g) / 0xff,
//            blue: CGFloat(b) / 0xff, alpha: 1
//        )
//    }
//}
//
//extension UIView {
//
//    func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
//        if let sublayers = layer.sublayers {
//            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
//        }
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = colorArray.map({ $0.cgColor })
//        if isTopBottom {
//            //leftRight
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.4)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.6)
//        } else {
//            //bottomTop
////            gradientLayer.startPoint = CGPoint(x: 0.3, y: 0.0)
////            gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.0)
//        }
//
//        gradientLayer.cornerRadius = layer.cornerRadius
//        gradientLayer.masksToBounds = true
//        backgroundColor = .clear
//        gradientLayer.frame = bounds
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
////    func setGradient(colors: [CGColor], angle: Float) {
//////        let gradientLayerView: UIView = UIView(frame: CGRect(x:0, y: 0, width: bounds.width, height: bounds.height))
////        let gradient: CAGradientLayer = CAGradientLayer()
//////        gradient.frame = gradientLayerView.bounds
////        gradient.colors = colors
////
////        let alpha: Float = 360 / angle
////        let startPointX = powf(
////            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
////            2
////        )
////        let startPointY = powf(
////            sinf(2 * Float.pi * ((alpha + 0) / 2)),
////            2
////        )
////        let endPointX = powf(
////            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
////            2
////        )
////        let endPointY = powf(
////            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
////            2
////        )
////
////        gradient.endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
////        gradient.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
////        backgroundColor = .clear
////        gradient.frame = bounds
////
//////        gradientLayerView.layer.insertSublayer(gradient, at: 0)
////        layer.insertSublayer(gradient, at: 0)
////    }
//
//}
