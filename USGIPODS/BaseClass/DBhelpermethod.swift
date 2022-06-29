//
//  DBhelpermethod.swift
//  SIPCalculator
//
//  Created by Sitesh Kumar on 02/06/18.
//  Copyright © 2018 Deepak. All rights reserved.
//

import UIKit
import CoreData


//class DBhelpermethod: UIViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//    }
//
//    class func saveAnswerDict(categoryStr: String, questionCodeStr: String, answerCodeStr: String, AnswerStr: String, tableNameStr: String)  {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
////        let context = appDelegate.persistentContainer.viewContext
//      //  let entity = NSEntityDescription.entity(forEntityName: tableNameStr, in: context)
//      //  let newUser = NSManagedObject(entity: entity!, insertInto: context)
//        newUser.setValue(categoryStr, forKey: "category")
//        newUser.setValue(questionCodeStr, forKey: "questionCode")
//        newUser.setValue(answerCodeStr, forKey: "answerCode")
//        newUser.setValue(AnswerStr, forKey: "answer")
//        do {
//           // try context.save()
//        } catch {
//            print("Failed saving")
//
//        }
//    }
//
//    class func getAnswerArray(tableNameStr: String) -> [[String: Any]] {
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableNameStr)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//       // let context = appDelegate.persistentContainer.viewContext
//        request.returnsObjectsAsFaults = false
//        var finalResult = [[String: Any]]()
//        var result = [NSManagedObject]()
//        do {
//
//          //  result = try context.fetch(request) as! [NSManagedObject]
////            print(result)
//
//            for item in result {
//
//                var resulDict = [String: Any]()
//                resulDict["Category"] = item.value(forKey: "category")
//                resulDict["QuestionCode"] = item.value(forKey: "questionCode")
//                resulDict["AnswerCode"] = item.value(forKey: "answerCode")
//                resulDict["Answer"] = item.value(forKey: "answer")
//
//                finalResult.append(resulDict)
//            }
//        } catch {
//            print("Failed")
//        }
//        return finalResult
//
//    }
//
//    class func checkAnswerDictExist(AnswerCode: String, tableNameStr: String) -> Bool {
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableNameStr)
//        let predicate = NSPredicate(format: "answerCode == %@", AnswerCode)
//        request.predicate = predicate
//        request.fetchLimit = 1
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//       // let context = appDelegate.persistentContainer.viewContext
//        do{
//            let count = try context.count(for: request)
//            if(count == 0){
//                // no matching object
//                return false
//            }
//            else{
//                // at least one matching object exists
//                return true
//            }
//        }
//        catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//            //            return true
//        }
//        return false
//    }
//
//    class func deleteAnswerDict(AnswerCode: String, tableNameStr: String) {
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableNameStr)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
////        let context = appDelegate.persistentContainer.viewContext
//
//        var result = [NSManagedObject]()
//        //        if let fetchResults = try!context.fetch(fetchRequest) as? [DownloadedVideo] {
//        //            context.delete(request[IndexValue])
//        //            try!context.save()
//        //        }
//        do {
//
//            result = try context.fetch(request) as! [NSManagedObject]
//
//            for item in result {
//                var dict = NSManagedObject()
//                dict = item
//                if AnswerCode == dict.value(forKey: "answerCode") as? String {
//                    context.delete(item)
//                    try!context.save()
//                    print("Delete Done in AnswerEight table")
////                    return true
//                }
//            }
//        } catch {
//            print("Failed")
////            return false
//        }
////        return false
//    }
//
//    class func deleteAnswerTableAllRecords(tableNameStr: String) {
//            //getting context from your Core Data Manager Class
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableNameStr)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
////        let context = appDelegate.persistentContainer.viewContext
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
//        do {
//            try context.execute(deleteRequest)
//            try context.save()
//        } catch {
//            print ("There is an error in deleting records")
//        }
//    }
//
//}

