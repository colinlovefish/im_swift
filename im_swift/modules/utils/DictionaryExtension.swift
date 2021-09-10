//
//  DictionaryExtension.swift
//  coinandcoin
//
//  Created by yinghu on 11/6/20.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

extension NSMutableDictionary {
    func convertToString() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: data, encoding: String.Encoding.utf8)!
            
        } catch let error as NSError {
            return ""
        }
        
    }
}
