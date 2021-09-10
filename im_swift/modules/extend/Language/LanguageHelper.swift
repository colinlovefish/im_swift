//
//  LanguageHelper.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/23.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class LanguageHelper: NSObject {
    static let shareInstance = LanguageHelper()
    
    class func localizedString(key: String) -> String {
        return Bundle.localizedString(forKey: key)
    }

}
