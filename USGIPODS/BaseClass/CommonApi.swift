//
//  CommonApi.swift
//  QuizAdda
//
//  Created by Yogendra Singh on 15/03/18.
//  Copyright © 2018 Yogendra Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CryptoSwift

class CommonApi: NSObject {
        
    //To request get URL
    class  func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        //            CommonMethods.showHud()
        Alamofire.request(strURL,headers:nil).responseJSON { (responseObject) -> Void in
            switch(responseObject.result)
            {
            case .success(_):
                //                    CommonMethods.hideHud()
                let resJson = JSON(responseObject.result.value!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    success(resJson)
                }
                break
                
            case .failure(_):
                //                    CommonMethods.hideHud()
                let error : Error = responseObject.result.error!
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    failure(error)
                }
                break
            }
        }
        
    }
    
    class  func requestGETURLWithAcessToken(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        //        let Acesstoken = ProjectUtils.getAcesstoken()
        
        //        let Auth = String(format:"%@ %@","Bearer",Acesstoken as CVarArg)
        //        print(Auth)
        let headers = ["Authorization":"Auth","type":""]
        //        CommonMethods.showHud()
        Alamofire.request(strURL,headers:headers).responseJSON { (responseObject) -> Void in
            switch(responseObject.result)
            {
            case .success(_):
                //                CommonMethods.hideHud()
                let resJson = JSON(responseObject.result.value!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    success(resJson)
                }
                break
                
            case .failure(_):
                //                CommonMethods.hideHud()
                let error : Error = responseObject.result.error!
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    failure(error)
                }
                break
            }
        }
    }
    
    
    //To request POST URL
    class func requestPostCall(_ strUrl:String, method:HTTPMethod,parameter:Parameters,encoding:JSONEncoding , success:@escaping(JSON) -> Void, failure:@escaping(Error) -> Void) -> Void
    {
        //            CommonMethods.showHud()
        Alamofire.request(strUrl, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            switch(response.result)
            {
            case .success(_):
                //                    CommonMethods.hideHud()
                let resJson = JSON(response.result.value!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    success(resJson)
                }
                break
                
            case .failure(_):
                //                    CommonMethods.hideHud()
                let error : Error = response.result.error!
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    failure(error)
                }
                break
            }
        }
    }

    //AllizHealth POST URL
    
//    class func serverPostAESCall(strUrl: String, headersParams: NSDictionary, bodyparams: [String: Any], receivedResponse:@escaping (_ succeeded:Bool, _ response:[String:Any]) -> ()) {
//        print(strUrl)
//    
//        print("headersParams : \(headersParams)")
//        print("bodyparams:  \(bodyparams)")
//    
//        let key  = "A1HS8CUR1TY@9812"
//        var dict : [String: AnyObject] = [:]
//        dict["JSONData"] = CommonMethods.convertDictionaryToString(bodyparams) as AnyObject?
//        dict["Header"] = headersParams as AnyObject
//        print("dict=========\(dict)")
//        
//        if NetworkReachability.isConnectedToNetwork() == true {
//            guard let serviceUrl = URL(string: strUrl) else { return }
//            var request = URLRequest(url: serviceUrl)
//            request.httpMethod = "POST"
//            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//            
//            guard let httpBody = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
//                       return
//                   }
//                   let  convertedString = NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue)! as String
//                   print("convertedStringLogin=======\(String(describing: convertedString))")
//                   // get AES-256 CBC encrypted string
//                   let encrypted = AES256CBC.encryptString(convertedString, password: key)
//                   let encryptedData = encrypted?.data(using: .utf8)
//                   print("encrypted: \(encrypted ?? "")")
//                   print("encryptedData: \(String(describing: encryptedData))")
//                   request.httpBody = encryptedData
//            
//            let task = URLSession.shared.dataTask(with: request) {data, response, error in
//                if(response != nil && data != nil) {
//                    
//                    let  jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
//                    let decrypted = AES256CBC.decryptString(jsonString, password: key)
//                    print("DecryptLogin============\(String(describing: decrypted))")
//                    
//                    let responseData =  decrypted?.data(using: .utf8)
//                    let  responseString = NSString(data: responseData!, encoding: String.Encoding.utf8.rawValue)! as String
//                    print(responseString)
//                    
//                    let dict = CommonMethods.convertStringToDictionary(responseString)
//                    print(dict)
//                    
//                    let JsonData = dict!["JSONData"]
//                    let hearderData = dict!["Header"]
//
////                    print(arrayJsonData)
//                    let jsonData = CommonMethods.convertStringToDictionary(JsonData as! String)
////                    let headerData = CommonMethods.convertStringToDictionary(hearderData as! String)
//                    let finalDict = ["JSONData":jsonData,
//                                     "Header":hearderData]
////                    print("final Dict: \(String(describing: dicForJsonData))")
//                    receivedResponse(true, finalDict as [String : Any])
//                    
//                } else {
//                    receivedResponse(false, ["message":"Something went wrong"])
//                }
//            }
//            task.resume()
//        } else {
//            //        loaderView.removeFromSuperview()
//            receivedResponse(false, ["message":"No internet connection"])
//        }
//    }
    
    
    class func requestPostRawDataCall(strUrl:String, parameter:[String: Any], success:@escaping(JSON) -> Void, failure:@escaping(Error) -> Void) -> Void {
        
        
        let jsonNewString: String? = CommonMethods.convertDictionaryToString(parameter)
//        let encoder = JSONEncoder()
//        if let jsonData = try? encoder.encode(parameter) {
//            if let jsonString = String(data: jsonData, encoding: .utf8) {
//                print(">>>>>>" + jsonString)
//                jsonNewString = jsonString
//            }
//        }
        
        let jsonDataa = jsonNewString?.data(using: .utf8, allowLossyConversion: false)!
        
        let url = URL(string: strUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonDataa
        
        Alamofire.request(request).responseJSON { response in
            print("<<<<<<<response")
            switch(response.result){
            case .success(_):
                let resJson = JSON(response.result.value!)
                success(resJson)
                break
                
            case .failure(_):
                let error : Error = response.result.error!
                failure(error)
                break
            }
        }
    }
    
    
   
    
    class func requestPostCallWithAcessToken(_ strUrl:String, method:HTTPMethod,parameter:Parameters,encoding:JSONEncoding , success:@escaping(JSON) -> Void, failure:@escaping(Error) -> Void) -> Void
    {
        //        CommonMethods.showHud()
        //        let Acesstoken = ProjectUtils.getAcesstoken()
        //
        //        let Auth = String(format:"%@ %@","Bearer",Acesstoken as CVarArg)
        //        print(Auth)
        let headers = ["Authorization":"Auth",
                       "type":""]
        
        Alamofire.request(strUrl, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            switch(response.result)
            {
            case .success(_):
                //                CommonMethods.hideHud()
                let resJson = JSON(response.result.value!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    success(resJson)
                }
                break
                
            case .failure(_):
                //                CommonMethods.hideHud()
                let error : Error = response.result.error!
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    failure(error)
                }
                break
            }
        }
    }
    
    
    //To request MultiPart URL
    class func requestMultipart(uploadImage: UIImage!, strUrl: String, parameters: Parameters , progressOfImage: @escaping(Double) -> Void, success: @escaping(JSON) -> Void, failure: @escaping(Error) -> Void) {
        print("Param: \(parameters)")
        //        CommonMethods.showHud()
        //        let Acesstoken = ProjectUtils.getAcesstoken()
        //        let Auth = String(format:"%@ %@","Bearer",Acesstoken as CVarArg)
        let headers = ["Authorization":"Auth"]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            multipartFormData.append(uploadImage.jpegData(compressionQuality:1)!, withName: "image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            
            for (key, value) in parameters {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                
            }
            
        }
            , to: strUrl, method: .post, headers : headers,
              encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload,_ ,_ ):
                    print(upload.progress)
                    
                    upload.responseJSON { response in
                        print(response.result)
                        if (response.result.isSuccess) {
                            switch(response.result) {
                            case .success(_):
                                //                                CommonMethods.hideHud()
                                let resJson = JSON(response.result.value!)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                                    success(resJson)
                                }
                                break
                                
                            case .failure(_):
                                //                                CommonMethods.hideHud()
                                let error : Error = response.result.error!
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                                    failure(error)
                                }
                                break
                            }
                        }
                        
                        if (response.result.isFailure) {
                            //                            CommonMethods.hideHud()
                            let error : Error = response.result.error!
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                                failure(error)
                            }
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError.localizedDescription)
                    //                    CommonMethods.hideHud()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                        failure(encodingError.localizedDescription as! Error)
                        
                    }
                }
        })
    }
    
}


class APIManager {
    static let request = APIManager()
    
    func serverCall(baseURL:String = BASEURL, apiName:String, params: [String : Any], httpMethod:String, receivedResponse:@escaping (_ succeeded:Bool, _ response:[String:Any]) -> ()) {
        print(baseURL + apiName)
        print(params ?? "")
        //    let loaderView = LoaderView.getLoader()
        //    UIApplication.shared.keyWindow?.addSubview(loaderView)
        if NetworkReachability.isConnectedToNetwork() == true {
            if let vc = UIApplication.shared.keyWindow?.rootViewController?.children.last {
                CommonMethods.showHud(aView: vc.view, userInteractionAllowed: false)
                DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                    CommonMethods.hideHud(aView: vc.view)
                }
            }

            let urlString = apiName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            var request = URLRequest(url: URL(string: (baseURL) + urlString!)!)
            if(httpMethod == "POST" || httpMethod == "PUT") {
                
                request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
                //                   if isZipped == false {
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                //                   } else {
                //                       request.addValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
                //                       request.addValue("application/octet-stream", forHTTPHeaderField: "Content-Encoding: gzip")
                //                   }
                request.addValue("application/json", forHTTPHeaderField: "Accept")
            } else if(httpMethod == "GET") {
                if params.count > 0 {
                    var paramString = ""
                    for (key,value) in params {
                        if key == params.first?.key {
                            paramString += "?"
                        } else {
                            paramString += "&"
                        }
                        paramString += "\(key)=\(value)"
                    }
                    request = URLRequest(url: URL(string: (baseURL) + urlString! + paramString)!)
                }
            }
            //               if let token = UserDefaults.standard.value(forKey: USER_DEFAULT.accessToken) {
            //                   request.setValue("bearer \(token)", forHTTPHeaderField: "authorization")
            //               }
            request.httpMethod = httpMethod as String
            request.timeoutInterval = 20
            print(request)
            
            let task = URLSession.shared.dataTask(with: request) {data, response, error in
                DispatchQueue.main.async {
                    if let vc = UIApplication.shared.keyWindow?.rootViewController?.children.last {
                        CommonMethods.hideHud(aView: vc.view)
                    }
                }
                if(response != nil && data != nil) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                            receivedResponse(true, json)
                        } else {
                            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                            let error = "Unable to show json" as NSString
                            print("Error could not parse JSON: '\(jsonStr ?? error)'")
                            receivedResponse(false, [:])
                        }
                    } catch let parseError {
                        print(parseError)
                        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        let error = "Unable to show json" as NSString
                        print("Error could not parse JSON: '\(jsonStr ?? error)'")
                        receivedResponse(false, [:])
                    }
                } else {
                    receivedResponse(false, [:])
                }
            }
            task.resume()
        } else {
            //        loaderView.removeFromSuperview()
            receivedResponse(false, ["message":"No internet connection"])
        }
    }
    
    func symptomCheckerCall(apiName:String, params: [String : Any], httpMethod:String, receivedResponse:@escaping (_ succeeded:Bool, _ response:[[String:Any]]) -> ()) {
        let baseURL = "https://api.infermedica.com/v2/"
        print(baseURL + apiName)
        print(params)
        //    let loaderView = LoaderView.getLoader()
        //    UIApplication.shared.keyWindow?.addSubview(loaderView)
        if NetworkReachability.isConnectedToNetwork() == true {
            //            CommonMethods.showHud()
            let urlString = apiName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            var request = URLRequest(url: URL(string: (baseURL) + urlString!)!)
            if(httpMethod == "POST" || httpMethod == "PUT") {
                request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } else if(httpMethod == "GET") {
                if params.count > 0 {
                    var paramString = ""
                    for (key,value) in params {
                        if key == params.first?.key {
                            paramString += "?"
                        } else {
                            paramString += "&"
                        }
                        paramString += "\(key)=\(value)"
                    }
                    request = URLRequest(url: URL(string: (baseURL) + urlString! + paramString)!)
                }
            }
            request.setValue("4eb1d3a2", forHTTPHeaderField: "app-id")
            request.setValue("0032394801c5c304ddc208f9761b46ff", forHTTPHeaderField: "app-key")
            //               if let token = UserDefaults.standard.value(forKey: USER_DEFAULT.accessToken) {
            //                   request.setValue("bearer \(token)", forHTTPHeaderField: "authorization")
            //               }
            request.httpMethod = httpMethod as String
            request.timeoutInterval = 35
            print(request)
            
            let task = URLSession.shared.dataTask(with: request) {data, response, error in
                //                CommonMethods.hideHud()
                if(response != nil && data != nil) {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            receivedResponse(true, jsonArray)
                        } else {
                            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                            let error = "Unable to show json" as NSString
                            print("Error could not parse JSON: '\(jsonStr ?? error)'")
                            receivedResponse(false, [[:]])
                        }
                    } catch let parseError {
                        print(parseError)
                        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        let error = "Unable to show json" as NSString
                        print("Error could not parse JSON: '\(jsonStr ?? error)'")
                        receivedResponse(false, [[:]])
                    }
                } else {
                    receivedResponse(false, [[:]])
                }
            }
            task.resume()
        } else {
            //        loaderView.removeFromSuperview()
            receivedResponse(false, [["message":"No internet connection"]])
        }
    }
    
    func symptomCheckerObjectCall(apiName:String, params: [String : Any], httpMethod:String, receivedResponse:@escaping (_ succeeded:Bool, _ response:[String:Any]) -> ()) {
        let baseURL = "https://api.infermedica.com/v2/"
        print(baseURL + apiName)
        print(params)
        //    let loaderView = LoaderView.getLoader()
        //    UIApplication.shared.keyWindow?.addSubview(loaderView)
        if NetworkReachability.isConnectedToNetwork() == true {
            //            CommonMethods.showHud()
            let urlString = apiName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            var request = URLRequest(url: URL(string: (baseURL) + urlString!)!)
            if(httpMethod == "POST" || httpMethod == "PUT") {
                request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } else if(httpMethod == "GET") {
                if params.count > 0 {
                    var paramString = ""
                    for (key,value) in params {
                        if key == params.first?.key {
                            paramString += "?"
                        } else {
                            paramString += "&"
                        }
                        paramString += "\(key)=\(value)"
                    }
                    request = URLRequest(url: URL(string: (baseURL) + urlString! + paramString)!)
                }
            }
            request.setValue("4eb1d3a2", forHTTPHeaderField: "app-id")
            request.setValue("0032394801c5c304ddc208f9761b46ff", forHTTPHeaderField: "app-key")
            //               if let token = UserDefaults.standard.value(forKey: USER_DEFAULT.accessToken) {
            //                   request.setValue("bearer \(token)", forHTTPHeaderField: "authorization")
            //               }
            request.httpMethod = httpMethod as String
            request.timeoutInterval = 35
            print(request)
            
            let task = URLSession.shared.dataTask(with: request) {data, response, error in
                //                CommonMethods.hideHud()
                if(response != nil && data != nil) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                            receivedResponse(true, json)
                        } else {
                            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                            let error = "Unable to show json" as NSString
                            print("Error could not parse JSON: '\(jsonStr ?? error)'")
                            receivedResponse(false, [:])
                        }
                    } catch let parseError {
                        print(parseError)
                        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        let error = "Unable to show json" as NSString
                        print("Error could not parse JSON: '\(jsonStr ?? error)'")
                        receivedResponse(false, [:])
                    }
                } else {
                    receivedResponse(false, [:])
                }
            }
            task.resume()
        } else {
            //        loaderView.removeFromSuperview()
            receivedResponse(false, ["message":"No internet connection"])
        }
    }
}


public extension Collection {
    
    func jsonFormat() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            guard let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) else {
                print("Can't create string with data.")
                return "{}"
            }
            return jsonString
        } catch let parseError {
            print("json serialization error: \(parseError)")
            return "{}"
        }
    }
    
}
