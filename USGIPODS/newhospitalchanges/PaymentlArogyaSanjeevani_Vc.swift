//
//  PaymentlArogyaSanjeevani_Vc.swift
//  UniversalSompo
//
//  Created by Subesh on 30/09/1400 AP.
//  Copyright © 1400 AP Inmorteltech. All rights reserved.
//



import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD


class PaymentlArogyaSanjeevani_Vc: BaseViewController {

    @IBOutlet weak var totalPremium_View: UIView!
    @IBOutlet weak var preAmount_Lbl: UILabel!
    @IBOutlet weak var instalment_View: UIView!
    @IBOutlet weak var installment_TXT: UITextField!
    @IBOutlet weak var quotaion_Txt: UITextField!
    @IBOutlet weak var continue_Btn: UIButton!
    var customerdetails = [String:Any]()
    var nomineedetails = [String:Any]()
    var authenticate =  [String:Any]()
    var quoteId = String()
    var addressline1 = String();var addressline2 = String();var houseNumber = String();var state = String();var city = String();var pincode = String();var totalpremium = String();var proposalNbr = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cornerRadious()
        self.borderWidth()
       
        
        self.quotaion_Txt.text = UserDefaults.standard.string(forKey: "quotationid")!
        self.quoteId = UserDefaults.standard.string(forKey: "quotationid")!
        self.installment_TXT.text =   UserDefaults.standard.string(forKey: "installment")
        self.addressline1 = UserDefaults.standard.string(forKey: "addressline1")!
        self.addressline2 = UserDefaults.standard.string(forKey: "addressline2")!
        self.houseNumber = UserDefaults.standard.string(forKey: "houseNumber")!
        self.state = UserDefaults.standard.string(forKey: "state")!
        self.city = UserDefaults.standard.string(forKey: "city")!
        self.pincode = UserDefaults.standard.string(forKey: "pincode")!
        self.buPolicy()
        // Do any additional setup after loading the view.
    }
    func cornerRadious(){
        self.totalPremium_View.layer.cornerRadius = 20
        self.quotaion_Txt.layer.cornerRadius = 20
        self.instalment_View.layer.cornerRadius = 20
        self.continue_Btn.layer.cornerRadius = 25
        
        self.quotaion_Txt.setLeftPaddingPoints(15)
        self.installment_TXT.setLeftPaddingPoints(15)
//        self.preAmount_Lbl.setLeftPaddingPoints(15)
    }
    func borderWidth(){
        self.totalPremium_View.layer.borderWidth = 0.5
        self.quotaion_Txt.layer.borderWidth = 0.5
        self.instalment_View.layer.borderWidth = 0.5
        self.continue_Btn.layer.borderWidth = 0.5
    }

    @IBAction func continueBtnAction(_ sender: Any) {
        let story = UIStoryboard(name: "PolicySideMenu", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "CommonWebViewVC") as! CommonWebViewVC
        vc.webUrl =
        "http://124.124.15.42/PaymentGatewayUAT/ExtIntityCallPage.aspx?PosPolicyNo=" + self.proposalNbr + "&FinalPremium=" + self.totalpremium + "&Src=WA&SubSrc=" + "20000001"
        vc.websiteNameStr = "Policydeal"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - extension for the apis service
extension PaymentlArogyaSanjeevani_Vc {
    private func buPolicy() {
//        let username =  "yogesh",    //String( ProjectUtils.getUserName())
//        let   email =  "yogeshinmortal@gmail.com",         //String(describing: ProjectUtils.getEmailID())
//        let  mobileNumber = String(describing:ProjectUtils.getMobileNo()!)
        self.customerdetails = ["customerid":"","customername":"yogesh","mobileno":"9685325191","emailid":"yogeshinmortal@gmail.com","Gender":"Male","DOB":"03/03/1997","Occupation":"Lawyers","AddressLine1":self.addressline1,"AddressLine2": self.addressline2,"AddressLine3":"navi mumbai","Landmark":"","StateName":self.state,"NumStateCd":"0","CityName":self.city,"numCityCD":"2851","CountryName":"2851","numCountrycd":"0","Pincode":self.pincode,"QuoteId": self.quoteId,"InsertUpdateFlag":"","WebArggCode":"","WebArggAppCode":"","AgeBand":"18yrs-35yrs"]
        
        self.nomineedetails = ["QuoteId": self.quoteId,"NomineeName":"","NomineeDOB":"","NomineeRelation":"","NomineeStatus":""]
        self.authenticate = ["WebAggregatorCode":"20000001","WAApplicationCode":"30000011","WAUserID":"USER01","WAUserPassword":"pass@123","WAType":"0"]
        
        //MARK: - parameter for the request
        let params   =   ["customerdetails":self.customerdetails,
                          "nomineedetails": self.nomineedetails,
                          "authenticate":self.authenticate,
                          "ProposalNo":"",
                          "QuoteNo": self.quoteId,
                          "PolicyNumber":"",
                          "TotalPremium":"",
                          "ErrorMessage":""] as [String : Any]
        
       // CommonMethods.showHud(aView: view, userInteractionAllowed: false)
        print(params)
        let url = "http://124.124.15.42/QuotationAPIUAT/api/HealthASI/SaveProposalWA"                                 //String(format:"%@",SubUrl.buyPolicy.url)
        print(url)
        CommonApi.requestPostRawDataCall(strUrl: url, parameter: params, success:{ (JSONResponse) in
            print(JSONResponse)
            if ((JSONResponse.dictionaryObject) != nil) {
                DispatchQueue.main.async {
                    let response = JSONResponse.dictionaryObject!
                    let totalpremium = response["TotalPremium"]
                    self.totalpremium = "\(totalpremium!)"
                    self.preAmount_Lbl.text = self.totalpremium
                    let proposalNbr = response["ProposalNo"]
                    self.proposalNbr = "\(proposalNbr!)"
                    

//                    CommonMethods.hideHud(aView: self.view)
                }
            }
        }) { (error) in
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {                //CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", AlertMessage.noInternet.rawValue)
            } else {
//                CommonMethods.hideHud(aView: self.view)
                self.showWarning("Error", error.localizedDescription)
            }
        }
    }
}


