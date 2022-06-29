//
//  BMIModel.swift
//  UniversalSompo
//
//  Created by Subesh on 24/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//

import Foundation
class BMIModel{
    var height:Double
    var weight :Double
    var pount:Double
    init(height:Double,weight:Double,pount:Double) {
        self.height = height
        self.weight = weight
        self.pount = pount
    }
    func bmi() ->String{
        return String(weight/(height*pount)*10)
    }
}
