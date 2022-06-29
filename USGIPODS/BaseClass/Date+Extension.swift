//
//  Date+Extension.swift
//  UniversalSompo
//
//  Created by Inmorteltech on 31/12/19.
//  Copyright © 2019 Inmorteltech. All rights reserved.
//

import Foundation

extension Date {
    
    func getCurrentDateStr() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentMonthStr() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentYearStr() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYY"
        return dateFormatter.string(from: Date())
    }
    
    func getNextDateStr() -> String? {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .year, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: newDate)
    }
    
    func getNextMonthStr() -> String? {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .year, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: newDate)
    }

    func getNextYearStr() -> String? {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .year, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: newDate)
    }
    
    func getCurrentFullDate() -> String? {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .year, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        return dateFormatter.string(from: newDate)
    }

    func getCurrentDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let stringfromdate = dateFormatter.string(from: Date())
        return stringfromdate
    }
    
    func getCurrentTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let stringfromdate = dateFormatter.string(from: Date())
        return stringfromdate
    }

}

extension Date {
    
    func dateInYyyyMmDd() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-YYYY"
        return df.string(from: self)
    }
    func dateInYyyyMmDdSs() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY"
        return df.string(from: self)
    }
    func timeInHHMM() -> String {
        let df = DateFormatter()
        df.dateFormat = "H:mm"
        return df.string(from: self)
    }
    
    func fullTime() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY H:mm:ss"
        return df.string(from: self)
    }
}



