//
//  MotorModel.swift
//  UniversalSompo
//
//  Created by yogesh patel on 06/04/22.
//  Copyright © 2022 Inmorteltech. All rights reserved.
//

import Foundation
import SwiftyJSON

class policyListModel{
    var registration:String?
    var brand:String?
    var totalPremium:String?
    var model:String?
    var name:String?
    var expiryDate:String?
    var idv:String?
    var premium:String?
    var manufacturingYear:String?
    var policyNumber   :String?
    var policyType     :String?
    var insCompName    :String?
    var policyStartDate:String?
    var variant         :String?
    var policyID        :String?
    var clientUserID    :String?
    var coverageDetails:String?
    var engineNo        :String?
    var chasisNo        :String?
    var vehicleType    : String?
    var make    : String?
    var Model    : String?

    //    var created_at:String?
    
    init(json:JSON) {
        registration = json["RegistrationNumber"].stringValue
        brand = json["Make"].stringValue
        totalPremium = json ["Premium"].stringValue
        model = json["Model"].stringValue
        name = json["PolicyHolderName"].stringValue
        expiryDate = json["PolicyToDate"].stringValue
        idv = json["IDV"].stringValue
        premium = json["Premium"].stringValue
        manufacturingYear = json["ManufacturingYear"].stringValue
        policyNumber      = json["PolicyNumber"].stringValue
        policyType        = json["PolicyType"].stringValue
        insCompName       = json["InsCompName"].stringValue
        policyStartDate   = json["PolicyStartDate"].stringValue
        variant           = json["Variant"].stringValue
        policyID          = json["PolicyID"].stringValue
        clientUserID      = json["ClientUserID"].stringValue
        coverageDetails   = json["CoverageDetails"].stringValue
        engineNo          = json["EngineNo"].stringValue
        chasisNo          = json["ChasisNo"].stringValue
        vehicleType        = json["VehicleType"].stringValue
        expiryDate          = json["VehicleType"].stringValue
        make          = json["Make"].stringValue
        model          = json["Model"].stringValue

        
        //        amount = json["amount"].stringValue
    }
}

class AddonModel{
    var addonNames:String?
    var addonPremium:String?
    var AddonRate:String?
//    var model:String?
//    var name:String?
//    var expiryDate:String?
//    var idv:String?
//    var premium:String?
//    var manufacturingYear:String?
//    var policyNumber   :String?
//    var policyType     :String?
//    var insCompName    :String?
//    var policyStartDate:String?
//    var variant         :String?
//    var policyID        :String?
//    var clientUserID    :String?
//    var coverageDetails:String?
//    var engineNo        :String?
//    var chasisNo        :String?
//    var vehicleType    : String?
//    var make    : String?
//    var Model    : String?

    //    var created_at:String?
    
    init(json:JSON) {
        addonNames   = json["dataArray"].stringValue
//        addonPremium = json["RegistrationNumber"].stringValue
//        AddonRate    = json["RegistrationNumber"].stringValue


        
        //        amount = json["amount"].stringValue
    }
}

