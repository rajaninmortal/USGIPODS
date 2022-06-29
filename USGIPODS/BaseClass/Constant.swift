//
//  Constant.swift
//  MVCSwift3
//
//  Created by Kiyara Tomar on 30/03/17.
//  Copyright © 2017 IOSTeamVcareall. All rights reserved.
//

import Foundation
import UIKit

let kAPPNAME = "USGI PULZ"

//URL's
//let BASEURL = "http://api.metaapps.in/AL_Mobile_App.svc/"


  // let BASEURL = "http://mobile.universalsompo.in/Mobile_API/AL_Mobile_App.svc/"// let BASEURL let BASEURL "http://apiwtw.metacar.in/AL_Mobile_App.svc/"
 let BASEURL  = "http://14.141.41.50:81/AL_Mobile_App.svc/"
//MARK: - MARK New url for arogyasetu api
//let BASEURLL =  "http://124.124.15.42/QuotationAPIUAT/api/HealthASI/SaveQuotationWA"


//let BASEURL =  "http://mobile.universalsompo.in/Mobile_UAT_API/AL_Mobile_App.svc/"
let HELPURL = "http://api.metaapps.in/AL_Mobile_App.svc/"

//let BASEURL = "http://apiwtw.metacar.in/AL_Mobile_App.svc/"
let LIFEINSURL = "http://api.metacar.in/AL_Mobile_App.svc/"
let AllizHealthBaseURL = "https://core.allizhealthtest.in/"
//let GOOGLEMAPKEY = "AIzaSyA_l3usL_YWHhXuvsdjrO6QlMs-8qSe6tw"
let GOOGLEMAPKEY = "AIzaSyAMiYAw5JRMFjD3H6erGvs-fXPo_WlZR4w"
let FITBITCLIENTID = "22BG9Z"

var tokenNo: String {
    return ProjectUtils.getUserToken()
}

let appVersionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
let deviceType = "1"
let deviceID = UIDevice.current.identifierForVendor!.uuidString
var fcmTokenId = "NoToken"
let deviceName = UIDevice.current.name
let documentFolderName = "Meta"

let requestID = "100999"
let apiAccessToken = "pYu5y07a6eQ="
let partnerCode = "ZOIK"
let applicationCode = "AIH_HRA_PORTAL"

let rsaNumber:Double = 18002096678
let tollFree1:Double = 18002004030
let tollFree2:Double = 02239133700
let ambulanceNumber:Double = 102
let emergencyNumber:Double = 1075
//Colors
let whiteColor:UIColor = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1.0)
let lightGrayColor:UIColor = UIColor(red: 198.0/255, green: 198.0/255, blue: 200.0/255, alpha: 0.15)
let pastel_yellow = UIColor(red: 255.0/255, green: 149.0/255, blue: 0.0/255, alpha: 0.7)
let colorPrimary = UIColor(red: 41.0/255, green: 52.0/255, blue: 72.0/255, alpha: 1)
let textFieldColor = UIColor(red: 100.0/255, green: 100.0/255, blue: 100.0/255, alpha: 1)
let errorColor = UIColor(red: 255.0/255, green: 137.0/255, blue: 131.0/255, alpha: 1)
let greenColor = UIColor(red: 167.0/255, green: 226.0/255, blue: 166.0/255, alpha: 1)
let lightGreenColor = UIColor(red: 167.0/255, green: 226.0/255, blue: 166.0/255, alpha: 0.5)
let buttonColor = UIColor(red: 153.0/255, green: 160.0/255, blue: 225.0/255, alpha: 1)
let purpleColor = UIColor(red: 154.0/255, green: 153.0/255, blue: 229.0/255, alpha: 1)
let answerBgColor = UIColor(red: 204.0/255, green: 223.0/255, blue: 216.0/255, alpha: 0.3)
let buttomViewColor = UIColor(red: (255/255.0), green: (149/255.0), blue: (0/255.0), alpha: 1.0)


enum SubUrl: String {
    // Login
    case login = "LoginApp"
    case signUp = "UserRegistration"
    case userRegistration = "UsgiUserRegistration"
    case getUserActiveStatus = "GetUserActiveStatus"
    case OTPAuthenticate = "OTPAuthenticate"
    case resendOTP = "ResendOTP"
    case checkUserDeviceStatus = "CheckUserDeviceStatus"
    case updateUserDeviceDetails = "UpdateUserDeviceDetails"
    // tab baar
    case saveUserDeviceDetails = "SaveUserDeviceDetails"
    case getCustomerCareNo = "GetCustomerCareNo"
    case appUserLogInsert = "AppUserLogInsert"
    // dashbaord
    case getSliderImage = "GetSliderImage"
    case GetProductManageUrl = "GetProductManageUrl"
    case UpdateUserClientUserId = "UpdateUserClientUserId"
    
    // sidemenu
    case userLogOut = "UserLogOut"
    //Policy
    case getPolicyList = "UnivSompo_GetPolicyList"//"GetPolicyList"
    case getHealthPolicyList = "UnivSompo_GetHealthPolicyList"
    case viewPolicyRenewal = "UnivSompo_ViewPolicy"//ViewPolicyRenewal"
    case viewHealthPolicyRenewal = "UnivSompo_ViewHealthPolicy"//ViewPolicyRenewal"
    case getCoverageDetails = "GetCoverageDetails"
    case getMemberHealthPolicyList = "UnivSompo_GetMemberHealthPolicyList"
    case appUserLogDataPush = "AppUserLogDataPush"
    case deleteOtherPolicy = "DeleteOtherPolicy"
    case mailPolicyDoc = "UnivSompo_MailPolicyDoc"//MailPolicyDoc"
    //Link more
    case getPolicyType = "GetPolicyType"
    case getInsCompany = "GetInsCompany"
    case checkPolicyNo = "CheckPolicyNo"
    case checkRegistrationNo = "CheckRegistrationNo"
    case getMfgYear = "GetMfgYear"
    case univSompo_SaveUpdateOtherPolicy = "UnivSompo_SaveUpdateOtherPolicy"
    case univSompo_LinkHealthPolicy = "UnivSompo_LinkHealthPolicy"    
    //Two wheeler
    case tWGetMake = "TWGetMake"
    case tWGetModel = "TWGetModel"
    case tWGetVarient = "TWGetVarient"
    case tWSaveOtherPolicy = "TWSaveOtherPolicy"
    //Four wheeler
    case getVehicle = "GetVehicle"
    case getVehicleClass = "GetVehicleClass"
    case getVehicleModel = "GetVehicleModel"
    case getVarient = "GetVarient"
    case insertOtherPolicy = "InsertOtherPolicy"
    // Claim
    case getPolicyDetailsOnRegNo = "GetPolicyDetailsOnRegNo"
    case updateRefrenceNo = "UpdateRefrenceNo"
    case getPolicyWriteUp = "GetPolicyWriteUp"
    case claimThroughCall = "ClaimThroughCall"
    case downloadClaimForm = "DownloadClaimForm"
    case getClaimPolicyDetails = "GetClaimPolicyDetails"
    case saveClaimDetails = "SaveClaimDetails"
    case mailClaimForm = "MailClaimForm"
  //  case getGarageLocation = "GetGarageLocation"
    case getGarageLocation = "GetAllGarage"
    case getCityOnStateName = "GetCityOnStateName"

    //Profile
    case getUserDetail = "GetUserDetail"
    case GetState = "GetState"
    case GetCity = "GetCity"
    case allHospitalList = "GetAllHospital"
    case UpdateUser = "UpdateUser"
    //ClaimStatus
    case claimCount = "ClaimCount"
    case getRegNoForClaimStatus = "GetRegNoForClaimStatus"
    case getTrackingStatus = "GetTrackingStatus"
    case UnivSompo_UserListofPolicy = "UnivSompo_UserListofPolicy"
    case UnivSompo_UserClaimStatus = "UnivSompo_UserClaimStatus"
    case UnivSompo_HealthUserListofPolicy = "UnivSompo_HealthUserListofPolicy"
    case UnivSompo_HealthUserClaimStatus = "UnivSompo_HealthUserClaimStatus"
    case UnivSompo_HealthClaimIntimation = "UnivSompo_HealthClaimIntimation"
    //Renewal
    case getRenewalPolicyDetails = "GetRenewalPolicyDetails"
    case getRenewURL = "GetRenewURL"
    case tWUpdateRenewalPolicy = "TWUpdateRenewalPolicy"
    //Archives
    case getExpiredPolicyDetails = "GetExpiredPolicyDetails"
    case getSettledClaimPolicy = "GetSettledClaimPolicy"
    //Bulb
    //Tips of the day
    case getRssFeed = "GetRssFeed"
    //Content Section
    case getVideoContentDetails = "GetVideoContentDetails"
    //Service Schedule
    case getRegNoList = "UnivSompo_GetRegistration" //"GetRegNoList"
    case getVehicleDetailsOnRegNo = "GetVehicleDetailsOnRegNo"
    case getServiceDetails = "GetServiceDetails"
    //About us
    case getEditorContent = "GetEditorContent"
    //FuelPrice
    case getFuelPriceCity = "GetFuelPriceCity"
    case getFuelPrice = "GetFuelPrice"
    //Documents
    case getELockerFiles = "GetELockerFiles"
    case getDocCategory = "GetDocCategory"
    case getRegNoOnUserAndPolicy = "GetRegNoOnUserAndPolicy"
    case saveLockerData = "SaveLockerData"
    case deleteELockerFile = "DeleteELockerFile"
    //Value added service
    case getAlmondzVendors = "GetAlmondzVendors"
    case saveVisitorDetails = "SaveVisitorDetails"
    //Service Appointment
    case getOEMMultibrand = "UnivSompo_GetOEMMultibrand"//"GetOEMMultibrand"
    case getOEMDetails = "UnivSompo_GetOEMDetails"//"GetOEMDetails"
    case getVendorsOnCity = "GetVendorsOnCity"
    case getVendorsDetails = "GetVendorsDetails"
    case getCityOnVendorType = "GetCityOnVendorType"
    //Help
    case help_MotorGetCategory1List = "Help_MotorGetCategory1List"
    case help_MotorGetCategory2List = "Help_MotorGetCategory2List"
    case help_MotorGetCategory3List = "Help_MotorGetCategory3List"
    case help_MotorGetCategory4List = "Help_MotorGetCategory4List"
    case help_MotorSaveUsersDetails = "Help_MotorSaveUsersDetails"
    //My Issues
    case getissueLists = "GetissueLists"
    case getIssueDetails = "GetIssueDetails"
    //RSA
    case getRSAStatus = "GetRSAStatus"
    case checkIsRSAPurchase = "CheckIsRSAPurchase"
    case saveServiceProviderDetails = "SaveServiceProviderDetails"
    case getOemPolicyOtherDetails = "GetOemPolicyOtherDetails"
    
    case master_GetInsuranceCompany = "Master_GetInsuranceCompany"
    case ownPolicy_GetInsCompProductList = "OwnPolicy_GetInsCompProductList"
    case ownPolicy_GetCompositionList = "OwnPolicy_GetCompositionList"
    case ownPolicy_Save = "OwnPolicy_Save"
    case ownPolicy_GetOwnPolicyList = "OwnPolicy_GetOwnPolicyList"
    case ownPolicy_View = "OwnPolicy_View"
    case ownPolicy_DeletePolicy = "OwnPolicy_DeletePolicy"
    case ownPolicy_MailPolicyDoc = "OwnPolicy_MailPolicyDoc"
    case ownPolicy_GetNetworkHospitalList = "OwnPolicy_GetNetworkHospitalList"
    case ownPolicy_GetClaimIntimationBasicData = "OwnPolicy_GetClaimIntimationBasicData"
    case ownPolicy_ClaimIntimation = "OwnPolicy_ClaimIntimation"
    case help_GetCategory1List = "Help_GetCategory1List"
    case help_GetCategory2List = "Help_GetCategory2List"
    case help_GetCategory3List = "Help_GetCategory3List"
    case help_GetCategory4List = "Help_GetCategory4List"
    case help_SaveUsersDetails = "Help_SaveUsersDetails"
    
    case hra_CheckStatus = "HRA_CheckStatus"
    case hra_SaveUserDetails = "HRA_SaveUserDetails"
    case hraSaveRequest = "HRASaveRequest"
    case hra_SaveUsersHRA = "HRA_SaveUsersHRA"
    case hra_UserPDFList = "GetUsersHRAPDFList"

    case hra_moodTracker = "HRA_SubmitMoodHRA"
    case hra_moodList = "HRA_MoodHRAList"
    case buyHealthPolicy = "Policy_Quat"
    case buyPolicy = "Buy_policy"
    case stateCity = "GetStateCity"
    case sanjeevaniQuate =  "SaveQuotationWA"
    case VehicleManufacturerMaster =  "VehicleMake_Master"
    case VehicleModelMaster = "VehicleModel_Master"
    case VehicleRtoState = "VehicleRtoState"
    case VehicleMasterRtoLocationZone = "VehicleMasterRtoLocationZone"
    case VehicleMotorQuotation = "VehicleMotorQuotation"
    case VehicleMotorProposal = "VehicleMotorProposal"
    case VehicleAllCompanyMaster = "VehicleAllCompany_Master"
    case PreviousPolicyType = "PreviousPolicyType"
    case SaveQuotationDetails = "SaveQuotationDetails"
    var url: String {
        return "\(BASEURL)\(self.rawValue)"
    }
    
    var helpUrl: String {
        return "\(HELPURL)\(self.rawValue)"
    }
}

struct CoreDateTableName {
    static let answer8 = "AnswerEight"
    static let answer9 = "AnswerNine"
}

enum AllizHealthSubUrl: String {
    // Check
    case checkIfLoginExist = "Security/apis/Account/CheckIfLoginNameExists"
    case createAccount = "Security/api/Account/CreatePersonAccount"
    case addPerson = "PHR/api/Person/Add"
    case login = "Security/api/Security/Login/"
    case getByAccountID = "PHR/api/Person/GetByAccountID"
    case startHRA = "PHR/api/PrimaryHRA/Start"
    case saveHRA = "PHR/api/PrimaryHRA/SaveHRA"
    case submitHRA = "PHR/api/PrimaryHRA/Submit"
    case riskSummary = "PHR/api/MedicalProfile/ListRiskSummary"
    case listRecommendedLabTest = "PHR/api/MedicalProfile/ListRecommendedTests"
    //List Lab Parameters
    case listLabParameters = "PHR/api/LabRecord/ListCurrent"
    
    
    var url: String {
        return "\(AllizHealthBaseURL)\(self.rawValue)"
    }
}

//Health
struct API {
    static let ownPolicy_ClaimIntimation = "OwnPolicy_ClaimIntimation"
    //Challenges
    static let getChallenges = "Dashboard_GetChellangesList"
    static let saveChallengeGroup = "SaveChallengeGroup"
    static let saveChallengeGroupUsers = "SaveChallengeGroupUsers"
    static let getChallengeGroupUserList = "GetChallengeGroupUserList"
    static let getChallengeGroupWiseList = "GetChallengeGroupWiseList"
    static let getChallengeTopUserList = "GetChallengeTopUserList"
    static let getChallengeUserList = "GetChallengeUserList"
    static let challengeInviteMembers = "ChallengeInviteMembers"
    //Profile
    static let getUserDetail = "GetUserDetail"
    static let getBasicProfileUserDetail = "UserProfile_GetUserBasicDetails"
    static let getBloodGroup = "Master_GetBloodGroup"
    static let updateBloodGroupAndHeight = "Users_UpdateBloodGroupAndHeight"
    static let updateUserImage = "UpdateUserImageWTW"
    //Stats
    static let getUsersHealthDetails = "HRA_GetUsersHealthDetails"
    static let healthDataUpdateBloodPresure = "HealthData_UpdateBloodPresure"
    static let healthDataUpdateBloodSuger = "HealthData_UpdateBloodSuger"
    static let healthDataUpdateHb1Ac = "HealthData_UpdateHb1Ac"
    static let healthDataUpdateLipidProfile = "HealthData_UpdateLipidProfile"
    static let healthDataUpdateThyroid = "HealthData_UpdateThyroid"
    //Allergies
    static let getUsersHealthDataList = "Users_GetUsersHealthDataList"
    static let getType = "Master_GetType"
    static let getAllergies = "Master_GetAllergies"
    static let saveUpdateAllergies = "Users_SaveUpdateAllergies"
    static let deleteAllergies = "Users_DeleteAllergies"
    //Medical/Family History
    static let insertMedicalHistory = "Users_InsertMedicalHistory"
    static let getMedicalHistory = "Users_GetUsersMedicalHistory"
    static let saveMedicalHistory = "Users_SaveMedicalHistory"
    //Records
    static let savePrescription = "UserPrescription_Save"
    static let saveReport = "UserReport_Save"
    static let saveOtherDoc = "UserReport_SaveOtherDoc"
    static let getPrescriptionList = "UserPrescription_GetList"
    static let getReportList = "UserReport_GetList"
    static let getOtherDocList = "UserReport_GetOtherDocList"
    static let deletePrescription = "UserPrescription_Delete"
    static let deleteReport = "LabReport_Delete"
    static let deleteOtherDoc = "MedicalRecord_DeleteOtherDoc"
    //Home
    static let getUsersDashboardData = "GetUsersDashboardData"
    static let getMarketPlace = "GetMarketPlace"
    static let getBlogsList = "Blogs_GetList"
    static let appUserLogInsert = "AppUserLogInsert"
    static let getActivityMaster = "GetActivityMaster"
    static let getSOSDetails = "SOS_GetDetails"
    static let getUserActiveStatus = "GetUserActiveStatus"
    static let getAppPopUpImage = "GetAppPopUpImage"
    //Marketplace
    static let getWellnessCenterList = "Marketplace_WellnessCenterList"
    static let getDoctorConsultationList = "Marketplace_DoctorConsultationList"
    static let getHealthPackeageList = "Marketplace_HealthPackeageList"
    static let getLabTestingList = "Marketplace_LabTestingList"
    static let getMedicineOrderList = "Marketplace_MedicineOrderList"

    //Exercise
    static let getExerciseLog = "GetExerciseLog"
    static let saveExerciseLog = "SaveExerciseLog"
    static let activityUncloked = "ActivityUncloked"
    static let runningLogActivity = "ManageRunningLogActivity"
    static let cyclingLogActivity = "ManageCyclingLogActivity"
    static let swimmingLogActivity = "ManageSwimmingLogActivity"
    static let yogaLogActivity = "ManageYogaLogActivity"
    static let workoutLogActivity = "ManageWorkoutLogActivity"
    //Food
    static let getUsersFoodLog = "GetUsersFoodLog"
    static let saveUserFoodLog = "SaveUserFoodLog"
    static let deleteUsersFoodLog = "Dashboard_DeleteUsersFoodLog"
    
    //Water
    static let setWaterTarget = "Dashboard_SetWaterTarget"
    static let getWaterDailyActivity = "Dashboard_GetWaterDailyActivity"
    static let saveWaterDailyActivity = "Dashboard_SaveWaterDailyActivity"
    static let getUsersWaterActivityChart = "Dashboard_GetUsersWaterActivityChart"
    static let updateUsersTarget = "Dashboard_UpdateUsersTarget"

    //Weight
    static let getUsersWeightList = "Dashboard_GetUsersWeightList"
    static let saveUsersWeightLog = "Dashboard_SaveUsersWeightLog"
    static let setUsersWeightTarget = "Dashboard_SetUsersWeightTarget"

    //Exercise
    static let getExerciseList = "Diary_GetExerciseList"

    //Diet
    static let getDietList = "Diary_GetDietList"
    
    //HandWash
    static let setHandWashTarget = "Dashboard_SetHandWashTarget"
    static let saveHandWashDailyActivity = "Dashboard_SaveHandwashDailyActivity"
    static let getUsersHandWashChart = "Dashboard_GetUsersHandwashChart"
    static let getHandWashDailyActivity = "Dashboard_GetHandwashDailyActivity"

    //Health Register
    static let getBloodPressureList = "HealthReg_GetBloodPressureList"
    static let getBloodSugerList = "HealthReg_GetBloodSugerList"
    static let saveBloodPressure = "HealthReg_SaveBloodPressure"
    static let saveBloodSuger = "HealthReg_SaveBloodSuger"

    //Calculator
    static let Calculator_CalculateBMI = "Calculator_CalculateBMI"
    static let Calculator_CalculateWaistToHip = "Calculator_CalculateWaistToHip"
    static let Calculator_SaveBMR = "Calculator_SaveBMR"
    static let Calculator_SaveBodyFatPercentage = "Calculator_SaveBodyFatPercentage"
    static let Calculator_SaveHeartRisk = "Calculator_SaveHeartRisk"
    static let Calculator_SaveCholesterol = "Calculator_SaveCholesterol"
    static let Calculator_SaveHypertension = "Calculator_SaveHypertension"
    static let Calculator_SaveDiabetes = "Calculator_SaveDiabetes"
    static let Calculator_SaveBloodAlcohol = "Calculator_SaveBloodAlcohol"
    static let Calculator_SaveSmokingRisk = "Calculator_SaveSmokingRisk"
    static let Calculator_SaveHealthyWeight = "Calculator_SaveHealthyWeight"
    static let Calculator_SavePregnancyDeliveryDate = "Calculator_SavePregnancyDeliveryDate"
    
    //Life
    static let getLifeMasterData = "GetLifeMasterData"
    static let getLifeCompanyProduct = "GetLifeCompanyProduct"
    static let lifeInsertPolicy = "LifeInsertPolicy"
    static let lifeGetPolicyList = "LifeGetPolicyList"
    static let lifeGetPolicyDetail = "LifeGetPolicyDetail"
    static let getState = "GetState"
    static let getCity = "GetCity"
    static let lifeGetClaimProcess = "LifeGetClaimProcess"
    static let lifeGetCompanyBranch = "LifeGetCompanyBranch"
    static let lifeGetClaimCall = "LifeGetClaimCall"
    static let lifeGetClaimForms = "LifeGetClaimForms"
    static let lifeMailPolicyDoc = "LifeMailPolicyDoc"
    static let lifeDeletePolicy = "LifeDeletePolicy"
    static let lifeRelationshipMaster = "LifeRelationshipMaster"

    //Other
    static let getOtherDoc = "LifeGetOtherDoc"
    static let getOtherCompanyProductType = "LifeOtherCompanyProductType"
    static let otherInsertPolicy = "LifeInsuranceOthersDoc"
    static let otherMailPolicyDoc = "LifeOtherMailPolicyDoc"
    static let otherDeletePolicy = "LifeDeleteOtherPolicy"
    static let lifeEMailClaimDoc = "LifeEMailClaimDoc"

    //Symptoms HRA
    static let saveInterviewId = "StartSymptomHRA"
    static let searchSymptoms = "search"
    static let suggestSymptoms = "suggest"
    static let diagnosisSymptoms = "diagnosis"
    static let triageSymptoms = "triage"
    static let generateSymptom = "PDF_GenerateSymptom"
    static let getSymptomList = "PDF_GetUsersSymptomPDF"

    //Notification
    static let getNotificationList = "GetNotificationList"
    static let clearNotification = "ClearNotification"
    
    //RSS
    static let healthRssCategory = "HealthRssCategory"
    static let healthRssFeed = "HealthRssFeed"
    
    //Marketplace
    static let getMotorMarketPlace = "GetMotorMarketPlace"
    static let getMotorMarketplaceVendorList = "GetMotorMarketplaceVendorList"
    static let saveVisitorDetails = "SaveVisitorDetails"
//    static let getMarketPlace = "GetMarketPlace"
    static let getMarketplaceVendorList = "GetMarketplaceVendorList"
    static let saveHealthVisitorDetails = "SaveHealthVisitorDetails"
    static let getHomeCareMarketPlace = "GetMarketplaceHomecareTypeList"//"GetHomeCareMarketPlace"
    static let getMarketplaceHomeCareVendorList = "GetMarketplaceHomeCareVendorList"
}

struct PUSH_API {
    static let invitationPush = "InvitationPushNotification"
    static let challengePush = "ChallengePushNotification"
    
}

struct COLOR {
    static let THEME_LIGHT = UIColor(red: 155/255, green: 154/255, blue: 230/255, alpha: 1.0)
    static let THEME_DARK = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    static let THEME_YELLOW = UIColor(red: 255/255, green: 181/255, blue: 77/255, alpha: 1.0)
    static let THEME_ACCENT = UIColor(red: 11/255, green: 188/255, blue: 176/255, alpha: 1.0)
    static let THEME_RED = UIColor.red// (red: 255/255, green: 181/255, blue: 77/255, alpha: 1.0)
    static let LIGHT_BLACK = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
    static let WHITE = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    static let LIGHT_GRAY = UIColor(red: 198.0/255, green: 198.0/255, blue: 200.0/255, alpha: 0.5)
    static let LIGHT_PURPLE = UIColor(red: 154.0/255, green: 153.0/255, blue: 229.0/255, alpha: 1)
    static let LIGHT_PINK = UIColor(red: 253.0/255, green: 128.0/255, blue: 152.0/255, alpha: 1)
    static let LIGHT_GREEN = UIColor(red: 141.0/255, green: 222.0/255, blue: 155.0/255, alpha: 1)
    static let LIGHT_YELLOW = UIColor(red: 255.0/255, green: 191.0/255, blue: 102.0/255, alpha: 1)
    static let LIGHT_BLUE = UIColor(red: 164.0/255, green: 205.0/255, blue: 250.0/255, alpha: 1)
    static let GRAPH_BLUE = UIColor(red: 197.0/255, green: 234.0/255, blue: 242.0/255, alpha: 0.5)
    static let PASTEL_RED = UIColor(red: 255/255, green: 58/255, blue: 48/255, alpha: 1.0)
    static let PASTEL_YELLOW = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0)
    static let PASTEL_GREEN = UIColor(red: 76/255, green: 217/255, blue: 99/255, alpha: 1.0)
    static let PASTEL_BLUE = UIColor(red: 0/255, green: 123/255, blue: 255/255, alpha: 1.0)
    static let PASTEL_PURPLE = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1.0)
    static let PASTEL_PINK = UIColor(red: 255/255, green: 45/255, blue: 84/255, alpha: 1.0)
    
    static var titleBarColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            return COLOR.THEME_DARK
        }
    }
}

struct FONT {
    static let BOLD    = "Montserrat-SemiBold"
    static let REGULAR = "Montserrat-Regular"
    static let LIGHT   = "Montserrat-Light"
}

struct SIZE {
    static let EIGHT: CGFloat = 8.0
    static let TEN: CGFloat = 10.0
    static let TWELVE: CGFloat = 12.0
    static let FOURTEEN: CGFloat = 14.0
    static let SIXTEEN: CGFloat = 16.0
    static let TWENTY: CGFloat = 20.0
    static let TWENTYTWO: CGFloat = 22.0
}

enum AlertMessage: String {
    
    // Mobile No
    case enterMobileNo = "Please Enter Mobile Number"
    case invalidMobileNoFormat = "Entered Mobile Is not correct format"
    case invalidmobileNoCount = "Entered Mobile No Should be of 10 digit"
    //Email ID
    case enterEmail = "Please Enter Email"
    case invalidEmail = "Invalid Email Address"
    // OTP
    case enterOtp = "Please Enter OTP"
    case enterPinCode = "Please Enter Pin Code"

    case invalidOTPFormat = "Entered OTP Is not correct format"
    case invalidOtpCount = "Entered OTP No Should be of 6 digit"
    case invalidPinCount = "Entered Pin Code No Should be of 6 digit"
    case arogyaSanjeevaniMedical = "Oops!!! As we need to onboard Medical Underwrite here, who is not available at the moment. We have noted down your Quotation Number and our Customer Care team will be calling you soon.See you!."
    case completeHealthcare = "Oops!! As we need to onboard Medical Underwrite here, who is not available at the moment. We have noted down your Quotation Number and our Customer Care team will be calling you soon.See you!."
    
    case superhealthcare = "Oops!!!! As we need to onboard Medical Underwrite here, who is not available at the moment. We have noted down your Quotation Number and our Customer Care team will be calling you soon.See you!."
    case termsCondition = "By submitting this form, i agree to USGI and its respectives calling/contacting me. I also agree that i have read and understood the Privacy Policy and agree to abide by the same. i wish to Receive policy on WhatApp "

    case resendOtp = "OTP send sucessfully"
    case invalidPinCodeFormat = "Entered Pin Code Is not correct format"
    case enterPassword = "Please Enter Your Password"
    case enterUserName = "Please Enter UserName"
    case enterUniqueId = "Please Enter Unique ID"
    case enterCity = "Please Enter City"
    case enterState = "Please Enter State"
    case enterZipCode = "Please Enter ZipCode"
    case invalidZipCode = "ZipCode Should be Numeric"
    case areYouSure = "Are you Sure !"
    case cancel = "Cancel"
    case ok = "Ok"
    case pay = "Pay"
    case noInternet = "Internet connection appears to be offline !"
    case someThingWentWorng = "Something Went wrong!"
    case roadAssistanceNumberStr = "Roadside Assistance Number"
    case assistanceNumber = "1800 209 6678"
    case tollFreeNo = "Toll Free Number"
    case directNo = "Direct Number"
    case deactivateAccount = "Your account has been deactivated"
    case noDateFound = "No Date Found"
    case noPolicyFound = "There is no policy added"
    case registrasiolnnumbr = "plesae enter registrasion number "
    case termconditioncheckmark  = "please select checkmark"
    case manufactureName  = "please enter manufacturename "
    case modelName        = "please enter modelName"
    case rtoLocation      = "please enter rtoLocation"
    case ExshowRoomPrice  = "plese enter ShowRoomPrice"
    case InsureDecValue   = "plese enter InsuredDeclaredValue"
    case datepolicy       = "please enter selectPolicyDate"
    case selectDate       = "please select Date"
    case selectName       = "please select Name"
    case referanceId       = "please enter referqnce Id"
    case invalidRegistraionNbr = "Entered correct formate of vehicle Number"
    
}

struct DEFAULTS {
    static let corporateID = "CorporateID"
    static let customerID = "CustomerID"
    static let clientUserID = "ClientUserID"
    static let motorDashboard = "MotorDashboard"

    static let targetExerciseCalories = "TargetExerciseCalories"
    static let targetExercise = "TargetExercise"
    static let takenExercise = "TakenExercise"
    static let leftExercise = "leftExercise"
    static let targetDiet = "targetDiet"
    static let takenDiet = "takenDiet"
    static let leftDiet = "leftDiet"
    static let targetWater = "targetWater"
    static let takenWater = "takenWater"
    static let leftWater = "leftWater"
    static let targetWeight = "targetWeight"
    static let currentWeight = "currentWeight"
    static let loseGainComponent = "loseGainComponent"
    static let loseGainType = "loseGainType"
    static let loseGainBy = "loseGainBy"
    static let emergencyContactNumber = "emergencyContactNumber"
    static let emergencyContactName = "emergencyContactName"
    static let feet = "feet"
    static let inches = "inches"
    static let age = "age"
    static let gender = "gender"
    static let dailyActivity = "dailyActivity"
    static let connectionMedium = "connectionMedium"
    static let fitBitAccessToken = "fitBitAccessToken"
    static let fitBitRefreshToken = "fitBitRefreshToken"
    static let notificationIdentifier = "notificationIdentifier"
    static let usgi_User = "Usgi_User"
    static let policy_type = "policy_type"


    
    //Reminder
    static let foodCount = "Food.Count"
    static let waterAllDay = "Water.AllDay"
    static let walkMorning = "Walk.Morning"
    static let walkEvening = "Walk.Evening"
    static let workoutMorning = "Workout.Morning"
    static let workoutEvening = "Workout.Evening"
    static let weightWeekly = "Weight.Weekly"
    static let weightMonthly = "Weight.Monthly"
    static let medicineReminder = "Medicine.Reminder"
    static let consultationReminder = "Consultation.Reminder"
    static let labTestReminder = "LabTest.Reminder"
    static let handWashAllDay = "HandWash.AllDay"
    
    //Symptoms
    static let symptomInterviewId = "symptomInterviewId"
    static let symptomHRAStarted = "symptomHRAStarted"
    static let symptomHRADate = "symptomHRADate"
    static let controllerType = "controllerType"
    static let diagnosisIndex = "diagnosisIndex"
    
    static let shouldAddNotifications = "shouldAddNotifications"
    
    static let ansIndex = "diagnosisIndex"

}
