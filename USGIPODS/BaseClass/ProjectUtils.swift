//
//  ProjectUtils.swift
//  QuizAdda
//
//  Created by Inmorteltech on 26/03/18.
//  Copyright © 2018 Yogendra Singh. All rights reserved.
//

import UIKit


class ProjectUtils: NSObject {
    
    class func saveAppLanguage(Value:String) {
        UserDefaults.standard.setValue(Value, forKey: "AppLanguage")
    }
    
    class func getAppLanguage() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let Userval:String! = userdefaults.object(forKey: "AppLanguage") as! String?
        if Userval == nil {
            return "en"
        }else{
            return Userval
        }
    }
    
     // used in verification
    class func saveIsUserLogin(Value:String) {
        UserDefaults.standard.setValue(Value, forKey: "IsUserLoggedIn")
    }
    
    class func getUserLoggedIn() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let Userval:String! = userdefaults.object(forKey: "IsUserLoggedIn") as! String?
        if Userval == nil {
            return "No"
        }else{
            return Userval
        }
    }
    
    class func saveTutorialIsDisplayed(Value:String) {
        UserDefaults.standard.setValue(Value, forKey: "TutorialIsDisplayed")
    }
    
    class func getTutorialIsDisplayed() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let Userval:String! = userdefaults.object(forKey: "TutorialIsDisplayed") as! String?
        if Userval == nil {
            return "No"
        }else{
            return Userval
        }
    }
    
    class func saveUserID(ID: String)  {
        UserDefaults.standard.setValue(ID, forKey: "UserID")
    }
    
    class func getUserID() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.string(forKey: "UserID")
        return userData ?? ""
    }
    
    class func savetotalPremium(ID: String)  {
        UserDefaults.standard.setValue(ID, forKey: "TotalPremium")
    }
    
    class func getTotalPremium() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.string(forKey: "TotalPremium")
        return userData ?? ""
    }
    class func saveDob(ID: String)  {
        UserDefaults.standard.setValue(ID, forKey: "DOB")
    }
    
    class func getDob() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.string(forKey: "DOB")
        return userData ?? ""
    }
    
    class func saveUserToken(token: String)  {
        UserDefaults.standard.setValue(token, forKey: "UserToken")
    }
    
    class func getUserToken() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.string(forKey: "UserToken")
        return userData ?? "abcHkl7900@8Uyhkj1234"
    }
    
    class func saveUserName(userName: String)  {
        UserDefaults.standard.setValue(userName, forKey: "UserName")
    }
    
    class func getUserName(){
        let userdefaults:UserDefaults = UserDefaults.standard
        var userData:String! = userdefaults.object(forKey: "UserName") as! String?
//        if userData.isEmpty {
//            userData = ""
//        }
//        return userData
    }
    
    class func saveUserImage(imageUrl: String)  {
        UserDefaults.standard.setValue(imageUrl, forKey: "UserImage")
    }
    
    class func getUserImage() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        var userData:String! = userdefaults.object(forKey: "UserImage") as! String?
        if userData.isEmpty {
            userData = ""
        }
        return userData
    }

    class func saveMobileNo(mobileNo: NSNumber)  {
        UserDefaults.standard.setValue(mobileNo, forKey: "MobileNo")
    }
    
    class func getMobileNo() -> NSNumber? {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.integer(forKey: "MobileNo")
        return NSNumber(value: userData) 
    }
    //MARK: - new updated
    class func saveQuotationId(quotId: NSNumber)  {
        UserDefaults.standard.setValue(quotId, forKey: "PosPolicyNo")
    }
    
    class func getQuotationId() -> NSNumber? {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData = userdefaults.integer(forKey: "PosPolicyNo")
        return NSNumber(value: userData)
    }
    
    class func saveEmailID(emailID: String)  {
        UserDefaults.standard.setValue(emailID, forKey: "EmailID")
    }
    
    class func getEmailID(){
        let userdefaults:UserDefaults = UserDefaults.standard
        var userData:String! = userdefaults.object(forKey: "EmailID") as! String?
//        if userData.isEmpty{
//            userData = ""
//        }
//        return userData
    }
    
    class func saveUserDict(Username: NSDictionary)  {
        UserDefaults.standard.setValue(Username, forKey: "UserDict")
    }
    
    class func getUserDict() -> NSDictionary {
        let userdefaults:UserDefaults = UserDefaults.standard
        let userData:NSDictionary! = userdefaults.object(forKey:"UserDict") as! NSDictionary?
        return (userData)!
    }
    
    
    class func saveCustomerCareNo(Value:String) {
        UserDefaults.standard.setValue(Value, forKey: "CustomerCareNo")
    }
    
    class func getCustomerCareNo() -> String {
        let userdefaults:UserDefaults = UserDefaults.standard
        let Userval:String! = userdefaults.object(forKey: "CustomerCareNo") as! String?
        if Userval == nil {
            return "011-49288898"
        }else{
            return Userval
        }
    }
    
    //Symptoms HRA
       class func saveSymptomHRAInterviewKey(sessionKey: String)  {
           UserDefaults.standard.setValue(sessionKey, forKey: DEFAULTS.symptomInterviewId)
       }
       
       class func getSymptomHRAInterviewKey() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: DEFAULTS.symptomInterviewId) as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }

       
       // Alliz
       class func saveAllizSessionKey(sessionKey: String)  {
           UserDefaults.standard.setValue(sessionKey, forKey: "AllizSessionKey")
       }
       
       class func getAllizSessionKey() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "AllizSessionKey") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveAllizAccountID(accountID: String)  {
           UserDefaults.standard.setValue(accountID, forKey: "AllizAccountID")
       }
       
       class func getAllizAccountID() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "AllizAccountID") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveAllizPersonID(personID: String)  {
           UserDefaults.standard.setValue(personID, forKey: "AllizPersonID")
       }
       
       class func getAllizPersonID() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "AllizPersonID") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
    
       class func saveAllizTemplateID(templateID: String)  {
           UserDefaults.standard.setValue(templateID, forKey: "AllizTemplateID")
       }
       
       class func getAllizTemplateID() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "AllizTemplateID") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveAllizWellnessScore(WellnessScore: String)  {
           UserDefaults.standard.setValue(WellnessScore, forKey: "AllizWellnessScore")
       }
       
       class func getAllizWellnessScore() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "AllizWellnessScore") as! String?
           return userData ?? ""
       }
       
       class func saveCurrentQuestionNo(QuestionNo: Int)  {
           UserDefaults.standard.setValue(QuestionNo, forKey: "QuestionNo")
       }
       
       class func getCurrentQuestionNo() -> Int {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Int? = userdefaults.object(forKey: "QuestionNo") as! Int?
           return userData ?? 1
       }
       
       // Alliz Question Ans
       // Question one
       class func saveFeet(feet: String)  {
           UserDefaults.standard.setValue(feet, forKey: "Feet")
       }
       
       class func getFeet() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Feet") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveInches(Inches: String)  {
           UserDefaults.standard.setValue(Inches, forKey: "Inches")
       }
       
       class func getInches() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Inches") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveWeight(Weight: String)  {
           UserDefaults.standard.setValue(Weight, forKey: "Weight")
       }
       
       class func getWeight() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Weight") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       //Question two
       
       class func saveWaist(Waist: String)  {
           UserDefaults.standard.setValue(Waist, forKey: "Waist")
       }
       
       class func getWaist() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Waist") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveHip(Hip: String)  {
           UserDefaults.standard.setValue(Hip, forKey: "Hip")
       }
       
       class func getHip() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Hip") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       //Question three
       
       class func saveSystolic(Systolic: String)  {
           UserDefaults.standard.setValue(Systolic, forKey: "Systolic")
       }
       
       class func getSystolic() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Systolic") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       class func saveDiastolic(Diastolic: String)  {
           UserDefaults.standard.setValue(Diastolic, forKey: "Diastolic")
       }
       
       class func getDiastolic() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           var userData:String! = userdefaults.object(forKey: "Diastolic") as! String?
           if userData == "" {
               userData = ""
           }
           return userData ?? ""
       }
       
       //Question Four
       
       class func saveFasting(Fasting: String)  {
           UserDefaults.standard.setValue(Fasting, forKey: "Fasting")
       }
       
       class func getFasting() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "Fasting") as! String?
           return userData ?? "0"
       }
       
       class func savePP(PP: String)  {
           UserDefaults.standard.setValue(PP, forKey: "PP")
       }
       
       class func getPP() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData:String? = userdefaults.object(forKey: "PP") as! String?
           return userData ?? "0"
       }
       
       //Question Five
       class func saveLDL(LDL: String)  {
           UserDefaults.standard.setValue(LDL, forKey: "LDL")
       }
       
       class func getLDL() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "LDL") as! String?
           return userData ?? "0"
       }
       
       class func saveHDL(HDL: String)  {
           UserDefaults.standard.setValue(HDL, forKey: "HDL")
       }
       
       class func getHDL() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "HDL") as! String?
           return userData ?? "0"
       }
       
       class func saveTriglycerides(Triglycerides: String)  {
           UserDefaults.standard.setValue(Triglycerides, forKey: "Triglycerides")
       }
       
       class func getTriglycerides() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "Triglycerides") as! String?
           return userData ?? "0"
       }
       
       class func saveTotalCholestrol(TotalCholestrol: String)  {
           UserDefaults.standard.setValue(TotalCholestrol, forKey: "TotalCholestrol")
       }
       
       class func getTotalCholestrol() -> String {
           let userdefaults:UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey: "TotalCholestrol") as! String?
           return userData ?? "0"
       }
       
       //Question six
       class func saveAnswerSixDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerSixDict")
       }
       
       class func getAnswerSixDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerSixDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question seven
       class func saveAnswerSevenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerSevenDict")
       }
       
       class func getAnswerSevenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerSevenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Eight
       class func saveAnswerEightIsOther(Username: Bool)  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerEightIsOther")
       }
       
       class func getAnswerEightIsOther() -> Bool {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Bool? = userdefaults.object(forKey:"AnswerEightIsOther") as? Bool
           return userData ?? false
       }
       
       class func saveAnswerEightDiseaseName(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerEightDiseaseName")
       }
       
       class func getAnswerEightDiseaseName() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"AnswerEightDiseaseName") as? String
           return userData ?? ""
       }
       
       
       //Question Nine
       class func saveAnswerNineIsOther(Username: Bool)  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerNineIsOther")
       }
       
       class func getAnswerNineIsOther() -> Bool {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Bool? = userdefaults.object(forKey:"AnswerNineIsOther") as? Bool
           return userData ?? false
       }
       
       class func saveAnswerNineDiseaseName(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerNineDiseaseName")
       }
       
       class func getAnswerNineDiseaseName() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"AnswerNineDiseaseName") as? String
           return userData ?? ""
       }
       
       //Question Ten
       class func saveAnswerTenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerTenDict")
       }
       
       class func getAnswerTenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerTenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Eleven
       class func saveAnswerElevenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerElevenDict")
       }
       
       class func getAnswerElevenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerElevenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Twelve
       class func saveAnswerTwelveDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerTwelveDict")
       }
       
       class func getAnswerTwelveDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerTwelveDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Thirteen
       class func saveAnswerThirteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerThirteenDict")
       }
       
       class func getAnswerThirteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerThirteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Fourteen
       class func saveAnswerFourteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerFourteenDict")
       }
       
       class func getAnswerFourteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerFourteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Fifteen
       class func saveAnswerFifteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerFifteenDict")
       }
       
       class func getAnswerFifteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerFifteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Sixteen
       class func saveAnswerSixteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerSixteenDict")
       }
       
       class func getAnswerSixteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerSixteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Seventeen
       class func saveAnswerSeventeenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerSeventeenDict")
       }
       
       class func getAnswerSeventeenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerSeventeenDict") as? [String: Any] ?? [:]
           return userData
       }
     
       //Question Eighteen
       class func saveAnswerEighteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerEighteenDict")
       }
       
       class func getAnswerEighteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerEighteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Nineteen
       class func saveAnswerNineteenDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerNineteenDict")
       }
       
       class func getAnswerNineteenDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerNineteenDict") as? [String: Any] ?? [:]
           return userData
       }
       
       //Question Twenty
       class func saveAnswerTwentyDict(Username: [String: Any])  {
           UserDefaults.standard.setValue(Username, forKey: "AnswerTwentyDict")
       }
       
       class func getAnswerTwentyDict() -> [String: Any] {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: [String: Any] = userdefaults.object(forKey:"AnswerTwentyDict") as? [String: Any] ?? [:]
           return userData
       }
       
       // Delete AllizQuestion Air
       class func deleteAllizQuestionAirSession() {
           let userdefaults: UserDefaults = UserDefaults.standard
           userdefaults.removeObject(forKey: "AllizSessionKey")
           userdefaults.removeObject(forKey: "QuestionNo")
           userdefaults.removeObject(forKey: "Feet")
           userdefaults.removeObject(forKey: "Inches")
           userdefaults.removeObject(forKey: "Weight")
           userdefaults.removeObject(forKey: "Waist")
           userdefaults.removeObject(forKey: "Hip")
           userdefaults.removeObject(forKey: "Systolic")
           userdefaults.removeObject(forKey: "Diastolic")
           userdefaults.removeObject(forKey: "Fasting")
           userdefaults.removeObject(forKey: "PP")
           userdefaults.removeObject(forKey: "LDL")
           userdefaults.removeObject(forKey: "HDL")
           userdefaults.removeObject(forKey: "Triglycerides")
           userdefaults.removeObject(forKey: "TotalCholestrol")
           userdefaults.removeObject(forKey: "AnswerSixDict")
           userdefaults.removeObject(forKey: "AnswerSevenDict")
           userdefaults.removeObject(forKey: "AnswerEightIsOther")
           userdefaults.removeObject(forKey: "AnswerEightDiseaseName")
           userdefaults.removeObject(forKey: "AnswerNineIsOther")
           userdefaults.removeObject(forKey: "AnswerNineDiseaseName")
           userdefaults.removeObject(forKey: "AnswerTenDict")
           userdefaults.removeObject(forKey: "AnswerElevenDict")
           userdefaults.removeObject(forKey: "AnswerTwelveDict")
           userdefaults.removeObject(forKey: "AnswerThirteenDict")
           userdefaults.removeObject(forKey: "AnswerFourteenDict")
           userdefaults.removeObject(forKey: "AnswerFifteenDict")
           userdefaults.removeObject(forKey: "AnswerSixteenDict")
           userdefaults.removeObject(forKey: "AnswerSeventeenDict")
           userdefaults.removeObject(forKey: "AnswerEighteenDict")
           userdefaults.removeObject(forKey: "AnswerNineteenDict")
           userdefaults.removeObject(forKey: "AnswerTwentyDict")
       }
       
       
       //Save HRAJSONData
       class func saveHRAJSONData(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "HRAJSONData")
       }
       
       class func getHRAJSONData() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"HRAJSONData") as? String
           return userData ?? ""
       }
       
       //ListRecommendedTests
       //LabTests
       class func saveListRecommendedTests(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "ListRecommendedTests")
       }
       
       class func getListRecommendedTests() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"ListRecommendedTests") as? String
           return userData ?? ""
       }
       
       // RiskSummary
       class func saveRiskSummary(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "RiskSummary")
       }
       
       class func getRiskSummary() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"RiskSummary") as? String
           return userData ?? ""
       }
       
       class func saveHeartRiskValue(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "HeartRiskValue")
       }
       
       class func getHeartRiskValue() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"HeartRiskValue") as? String
           return userData ?? ""
       }
       
       class func saveHeartRisk(Username: Double)  {
           UserDefaults.standard.setValue(Username, forKey: "HeartRisk")
       }
       
       class func getHeartRisk() -> Double {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Double? = userdefaults.object(forKey:"HeartRisk") as? Double
           return userData ?? 0.0
       }
       
       class func saveDiabetesRiskValue(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "DiabetesRiskValue")
       }
       
       class func getDiabetesRiskValue() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"DiabetesRiskValue") as? String
           return userData ?? ""
       }
       
       class func saveDiabetesRisk(Username: Double)  {
           UserDefaults.standard.setValue(Username, forKey: "DiabetesRisk")
       }
       
       class func getDiabetesRisk() -> Double {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Double? = userdefaults.object(forKey:"DiabetesRisk") as? Double
           return userData ?? 0.0
       }
       
       class func saveStrokeRiskValue(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "StrokeRiskValue")
       }
       
       class func getStrokeRiskValue() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"StrokeRiskValue") as? String
           return userData ?? ""
       }
       
       class func saveStrokeRisk(Username: Double)  {
           UserDefaults.standard.setValue(Username, forKey: "StrokeRisk")
       }
       
       class func getStrokeRisk() -> Double {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Double? = userdefaults.object(forKey:"StrokeRisk") as? Double
           return userData ?? 0.0
       }
       
       class func saveJobStressValue(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "JobStressValue")
       }
       
       class func getJobStressValue() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"JobStressValue") as? String
           return userData ?? ""
       }
       
       class func saveJobStress(Username: Double)  {
           UserDefaults.standard.setValue(Username, forKey: "JobStress")
       }
       
       class func getJobStress() -> Double {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Double? = userdefaults.object(forKey:"JobStress") as? Double
           return userData ?? 0.0
       }
       
       class func saveEmotionalHealthValue(Username: String)  {
           UserDefaults.standard.setValue(Username, forKey: "EmotionalHealthValue")
       }
       
       class func getEmotionalHealthValue() -> String {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: String? = userdefaults.object(forKey:"EmotionalHealthValue") as? String
           return userData ?? ""
       }
       
       class func saveEmotionalHealth(Username: Double)  {
           UserDefaults.standard.setValue(Username, forKey: "EmotionalHealth")
       }
       
       class func getEmotionalHealth() -> Double {
           let userdefaults: UserDefaults = UserDefaults.standard
           let userData: Double? = userdefaults.object(forKey:"EmotionalHealth") as? Double
           return userData ?? 0.0
       }
}
