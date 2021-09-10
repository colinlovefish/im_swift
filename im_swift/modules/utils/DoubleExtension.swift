//
//  DoubleExtension.swift
//  coinandcoin
//
//  Created by yinghu on 2020/4/2.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

extension Double {
    func cleanZero() -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    func stampChangeToTime() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
        return dfmatter.string(from: date as Date)
    }
    
    func dateFormat() -> String {
        let t = UserDefaults.standard.object(forKey: TIMEZONESETTINGKEY)
        var timezone = "Asia/Singapore"
        if ( t != nil ) {
            let dict = t as! NSDictionary
            timezone = dict["value"] as! String
        }


        let zone = TimeZone(identifier: timezone )
        let timeSta : TimeInterval = self
        let currentDate = Date(timeIntervalSince1970: timeSta)
        let format = DateFormatter()
        format.timeZone = zone
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let gmt = format.timeZone.abbreviation()
        let dateString = format.string(from: currentDate) + " (\(gmt ?? " "))"
        return dateString
    }
    
    func dateFormatSimple() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy-MM-dd"
        return dfmatter.string(from: date as Date)
    }
    
    
    func dateFormatCustom() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="dd HH : mm : ss"
        return dfmatter.string(from: date as Date)
    }
    
    
    func returnTimeTofammater() -> String {
         if self==0{
             return "00:00"
         }
        var Min = Int(self / 60)
         let second = Int(self.truncatingRemainder(dividingBy: 60));
         var Hour = 0
         if Min>=60 {
             Hour = Int(Min / 60)
             Min = Min - Hour*60
             return String(format: "%02d:%02d:%02d", Hour, Min, second)
         }
         return String(format: "00:%02d:%02d", Min, second)
     }
    
    func returnTiemDistance() -> String {
        if self == 0 {
            return "00 hour 00 min 00 s"
        }
        var Min = Int(self / 60)
        let Second = Int(self.truncatingRemainder(dividingBy: 60))
        var Hour = 0
        if Min >= 60 {
            Hour = Int(Min / 60)
            Min = Min - Hour * 60
            var day = 0
            if Hour >= 24 {
                day = Int(Hour / 24)
                Hour = Hour - day * 24
                return String(format: "%d day %02d hour %02d min %02d s", day,Hour,Min,Second)
            }
            return String(format: "%d hour %02d min %02d s", Hour,Min,Second)
        }
        return String(format: " %02d min %02d s", Min,Second)
    }
    
    func timefammaterMin() -> String {
            if self==0{
                return "00:00"
            }
           var Min = Int(self / 60)
            var Hour = 0
            if Min>=60 {
                Hour = Int(Min / 60)
                Min = Min - Hour*60
                return String(format: "%02d:%02d", Hour, Min)
            }
            return String(format: " %02d", Min)
        }
    
}

extension Float {
    func cleanZero() -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    
}


