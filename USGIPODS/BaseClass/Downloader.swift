//
//  Downloader.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 13/01/20.
//  Copyright © 2020 Inmorteltech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD
import WebKit

class Downloader {
    
    class func downloadPDFFile(urlString: String) {
        
        let url: URL = URL(string: urlString)!
        print(url.lastPathComponent)
        let fileName = url.lastPathComponent
        SVProgressHUD.showProgress(0)

        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let folderUrl = documentsDirectory.appendingPathComponent(documentFolderName)
            let trimmedString = String(fileName.filter { !" \n\t\r  ".contains($0) })
            let filePath = folderUrl.appendingPathComponent("\(trimmedString)")
            
            print("***fileURL: ",filePath)
            return (filePath,[.removePreviousFile, .createIntermediateDirectories])
        }
//        "https://image.shutterstock.com/image-photo/india-gate-new-delhi-260nw-149478392.jpg"
//        "https://carlosicaza.com/swiftbooks/SwiftLanguage.pdf"
//        "https://image.shutterstock.com/image-photo/india-gate-new-delhi-260nw-149478392.jpg"

        Alamofire.download(urlString, to: destination).downloadProgress(closure: { (prog) in
            SVProgressHUD.showProgress(Float(prog.fractionCompleted))
        }).response { response in
            print(response)
            if response.error == nil, let filePath = response.destinationURL?.path {
                print("File Saved",filePath)
                SVProgressHUD.dismiss()
                WarningAlert.instance.showAlert(title: "Sucess", message: "PolicyDownloaded".localizableString(lan: ProjectUtils.getAppLanguage()), imageStr: "warning_icon", color: pastel_yellow)
            }
        }
    }
    
    class func downloadPdf(urlString: String, completionHandler:@escaping(String, Bool)->()) {
        
        let url: URL = URL(string: urlString)!
        print(url.lastPathComponent)
        let fileName = url.lastPathComponent
        SVProgressHUD.showProgress(0)
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let folderUrl = documentsDirectory.appendingPathComponent(documentFolderName)
            let trimmedString = String(fileName.filter { !" \n\t\r  ".contains($0) })
            let filePath = folderUrl.appendingPathComponent("\(trimmedString)")
            
            print("***fileURL: ",filePath)
            return (filePath,[.removePreviousFile, .createIntermediateDirectories])
        }
        print(urlString)
        Alamofire.download(urlString, to: destination)
            .downloadProgress { progress in
                SVProgressHUD.showProgress(Float(progress.fractionCompleted))
        }.responseData { response in
            print("response: \(response)")
            SVProgressHUD.dismiss()
            switch response.result {
            case .success:
                if response.destinationURL != nil, let filePath = response.destinationURL?.absoluteString {
                    completionHandler(filePath, true)
                }
                break
            case .failure:
                completionHandler("", false)
                break
            }
        }
    }
            
        
}

extension WKWebView {
    // Call this function when WKWebView finish loading
    func exportAsPdfFromWebView(fileName: String) -> String {
        let pdfData = createPdfFile(printFormatter: self.viewPrintFormatter())
        return self.saveWebViewPdf(data: pdfData, fileName: fileName)
    }
    
    func createPdfFile(printFormatter: UIViewPrintFormatter) -> NSMutableData {
        let originalBounds = self.bounds
        self.bounds = CGRect(x: originalBounds.origin.x, y: bounds.origin.y, width: self.bounds.size.width, height: self.scrollView.contentSize.height)
        let pdfPageFrame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.scrollView.contentSize.height)
        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        printPageRenderer.setValue(NSValue(cgRect: UIScreen.main.bounds), forKey: "paperRect")
        printPageRenderer.setValue(NSValue(cgRect: pdfPageFrame), forKey: "printableRect")
        self.bounds = originalBounds
        return printPageRenderer.generatePdfData()
    }
    
    // Save pdf file in document directory
    func saveWebViewPdf(data: NSMutableData, fileName: String) -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent(fileName)
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}

extension UIPrintPageRenderer {
    func generatePdfData() -> NSMutableData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSMakeRange(0, self.numberOfPages))
        let printRect = UIGraphicsGetPDFContextBounds()
        for pdfPage in 0..<self.numberOfPages {
            UIGraphicsBeginPDFPage()
            self.drawPage(at: pdfPage, in: printRect)
        }
        UIGraphicsEndPDFContext();
        return pdfData
    }
}
