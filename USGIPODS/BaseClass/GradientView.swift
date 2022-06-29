//
//  GradientView.swift
//  Fidah
//
//  Created by Inmorteltech on 24/06/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let gradientLayer = layer as! CAGradientLayer
        // gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        let lightcolor = UIColor.white.cgColor
        let Darkcolor = UIColor.black.cgColor
        gradientLayer.colors = [lightcolor, Darkcolor]
//        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.1)
        gradientLayer.locations = [0.0, 1.0]
    }
}
