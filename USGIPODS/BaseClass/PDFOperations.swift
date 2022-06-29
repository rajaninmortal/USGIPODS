//
//  PDFOperations.swift
//  UniversalSompo
//
//  Created by Rahul Bawane on 01/04/20.
//  Copyright © 2020 Inmorteltech. All rights reserved.
//
import UIKit
import Foundation

class PDFOperations {
    static let shared = PDFOperations()
    func savePdf(urlString:String, fileName:String,completion:@escaping ((_ success : Bool) -> Void)) -> Void {
        DispatchQueue.main.async {
            let url = URL(string: urlString)
            let pdfData = try? Data.init(contentsOf: url!)
            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
            let pdfNameFromUrl = "\(Bundle.main.infoDictionary!["CFBundleName"] as? String ?? "META")-\(fileName).pdf"
            let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
            do {
                try pdfData?.write(to: actualPath, options: .atomic)
                completion(true)
                print("pdf successfully saved!")
            } catch {
                completion(false)
                print("Pdf could not be saved")
            }
        }
    }
    
    func showSavedPdf(url:String, fileName:String) {
        if #available(iOS 10.0, *) {
            do {
                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                for url in contents {
                    if url.description.contains("\(fileName).pdf") {
                        // its your file! do what you want with it!
                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
    }
    
    // check to avoid saving a file multiple times
    func pdfFileAlreadySaved(url:String, fileName:String)-> Bool {
        var status = false
        if #available(iOS 10.0, *) {
            do {
                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                for url in contents {
                    if url.description.contains("\(Bundle.main.infoDictionary!["CFBundleName"] as? String ?? "META")-\(fileName).pdf") {
                        status = true
                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
        return status
    }
}


func saveImage(fileName: String, url: URL, completion:@escaping ((_ success : Bool) -> Void)) {
    // get the documents directory url
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // create the destination file url to save your image
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    // get your UIImage jpeg data representation and check if the destination file url already exists
    
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                if let data = image.jpegData(compressionQuality:  1.0),
                                    !FileManager.default.fileExists(atPath: fileURL.path) {
                                    do {
                                        // writes the image data to disk
                                        try data.write(to: fileURL)
                                        print("file saved")
                                        completion(true)
                                    } catch {
                                        print("error saving file:", error)
                                        completion(false)
                                    }
                                }
                            }
                        }
                    }
                }
                return }
        DispatchQueue.main.async() {
            if let data = image.jpegData(compressionQuality:  1.0),
                !FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    // writes the image data to disk
                    try data.write(to: fileURL)
                    print("file saved")
                    completion(true)
                } catch {
                    print("error saving file:", error)
                    completion(false)
                }
            }
        }
    }.resume()
}
